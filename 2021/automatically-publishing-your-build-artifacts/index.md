public: true
pub_date: 2021-06-18 18:25:52 +01:00
tags: [ci, git, github]
title: Automatically publishing your build artifacts

## Intro

The idea: whenever your CI builds the code from your main branch, do not ditch the build results: publish them instead. This makes it easy to provide QA engineers or bug reporters with new builds to try.

## Jenkins

I first experienced this setup at work, where we use Jenkins. Jenkins is *not* my preferred CI system, but to its credit, it makes it super easy to implement this feature: add a step to archive artifacts, either using the GUI or using the [archiveArtifacts][] pipeline command.

We actually do this for all builds at work, not only master branch builds. It makes the life of our QA engineers much easier. Our workflow looks like this:

1. Git Hub pull requests (PR) trigger builds on the CI;
2. developers review the code;
3. when developers consider it ready to QA, QA engineers download the artifacts produced by the PR build and use them to validate the work.

[archiveArtifacts]: https://www.jenkins.io/doc/pipeline/steps/core/#archiveartifacts-archive-the-artifacts

## Doing the same on GitHub

I thought it would be a good idea to setup something similar for my own projects, which are hosted on GitHub and use GitHub CI.

I expected a feature like this to be readily available, but I could not find exactly what I wanted. GitHub provides a way to download artifacts from a build but it's not ideal:

<!-- break -->

- You must be logged to download the artifacts.
- Artifacts are all bundled together in a big zip, which is inconvenient when building multi-platform apps: no-one wants to download a single archive containing the same application for macOS, Windows and Linux.

Some projects use tags to produce main branch builds, but I don't like this idea. Call me a purist, but using tags that way feels like subverting the concept to compensate for a missing GitHub feature.

Since I host my blog on a VPS, what I ended up doing is setting up a subdomain for builds on the VPS ([builds.agateau.com](https://builds.agateau.com)) and making GitHub upload artifacts to my server over SSH.

### Setting up hosting

The first thing I set up was the HTTP server to serve the files. After adding the subdomain on my registrar, I created a directory on my VPS and configured Nginx so that users visiting  "builds.agateau.com" would be able to browse and download the content of this directory, using the [Nginx Fancy Index][ngx-fancyindex] module.

[ngx-fancyindex]: https://github.com/aperezdc/ngx-fancyindex

The Nginx configuration looks like this:

```
server {
    server_name builds.agateau.com;
    root /srv/builds.agateau.com/html;

    error_log /srv/builds.agateau.com/log/error.log warn;
    access_log /srv/builds.agateau.com/log/access.log combined;

    fancyindex on;
}
```

I then created a `build` user on the VPS, created one directory per project in `/srv/builds.agateau.com/html` and made the `build` user the owner of these directories so that it can write to them.

Finally I created an SSH key for this user, so that the GitHub builder can connect to it.

### The upload script

I looked into existing GitHub actions for SSH uploads but it all felt overkill for just an `scp` call. Instead I decided to keep it simple: my build is going to call a shell script to do the upload. I prefer keeping dependencies with the CI to a minimum anyway, it makes it easier to test build scripts locally instead of using the commit-push-and-pray "workflow".

For each project, I added this `upload-build` script to the repository:

```bash
#!/bin/bash
set -euo pipefail

PROGNAME=$(basename $0)

die() {
    echo "$PROGNAME: $*" >&2
    exit 1
}

# Check $1 is defined and not empty
check_var() {
    local name=$1
    if ! env | grep -q "^$name=..*" ; then
        die "Environment variable $name is not set or is empty"
    fi
}

usage() {
    if [ "$*" != "" ] ; then
        echo "Error: $*"
        echo
    fi

    cat << EOF
Usage: $PROGNAME [OPTION ...] <project> <build_file> [build_file...]

Uploads build artifacts to a server using scp.

Files are upload to builds/<project>/.

Expects the following environment variables to be set:
- UPLOAD_USERNAME
- UPLOAD_PRIVATE_KEY
- UPLOAD_HOSTNAME

Options:
  -h, --help          display this usage message and exit
EOF

    exit 1
}

project=""
build_files=""
while [ $# -gt 0 ] ; do
    case "$1" in
    -h|--help)
        usage
        ;;
    -*)
        usage "Unknown option '$1'"
        ;;
    *)
        if [ -z "$project" ] ; then
            project="$1"
        else
            build_files="$build_files $1"
        fi
        ;;
    esac
    shift
done

if [ -z "$build_files" ] ; then
    usage "Not enough arguments"
fi

check_var UPLOAD_USERNAME
check_var UPLOAD_PRIVATE_KEY
check_var UPLOAD_HOSTNAME

echo "Uploading"
eval $(ssh-agent)
echo "$UPLOAD_PRIVATE_KEY" | ssh-add -
scp -o "StrictHostKeyChecking off" $build_files "$UPLOAD_USERNAME@$UPLOAD_HOSTNAME:builds/$project/"
```

Admittedly, it's a bit long for a simple `scp` call, but that's because I prefer adding at least a minimum amount of doc, argument parsing and error handling to such scripts. I find that it helps when revisiting them 6 months later (I wrote about my [shell script template][shtmpl] some time ago if you are interested).

[shtmpl]: /2014/template-for-shell-based-command-line-scripts

This script takes the name of the project, which matches the directory created on the server for it, and the files to upload. Sensitive information (username, host name and private key) is provided through environment variables.

Note: I had to disable host-key checking (the `-o "StrictHostKeyChecking off"` option in the `scp` call) because I could not figure out how to pass the host key as an argument or environment variable. I believe in that case it won't be too bad, the worse that could happen is someone managing to steal the account public key and uploading builds to their server instead of mine. Still I'd prefer to be able to pass the host key. If you know how to do this, I would love to hear from you!

### Putting all the parts together

I connected to the project GitHub admin page and declared the username, host name and private keys as [GitHub encrypted secrets][gh-secrets].

[gh-secrets]: https://docs.github.com/en/free-pro-team@latest/actions/reference/encrypted-secrets

Now all that was left to do was to call the `upload-build` script from the GitHub build workflow.

Here is [Git Bonsai](https://github.com/agateau/git-bonsai) build workflow, showing how to call `upload-build` after each push to the master branch.

```yaml
name: Build

on: [push, pull_request]

jobs:
  build:
    strategy:
      fail-fast: false
      matrix:
        os:
        - ubuntu-18.04
        - macos-10.15
        - windows-2019

    runs-on: ${{ matrix.os }}

    defaults:
      run:
        shell: bash

    steps:
    - uses: actions/checkout@v2

    - name: Build
      run: ci/build-app

    - name: Run static checks
      run: ci/run-static-checks

    - name: Run tests
      run: ci/run-tests

    - name: Create archive
      run: ci/create-archive

    - name: Upload
      if: github.ref == 'refs/heads/master'
      run: ci/upload-build git-bonsai artifacts/*.bz2
      env:
        UPLOAD_USERNAME: ${{ secrets.UPLOAD_USERNAME }}
        UPLOAD_PRIVATE_KEY: ${{ secrets.UPLOAD_PRIVATE_KEY }}
        UPLOAD_HOSTNAME: ${{ secrets.UPLOAD_HOSTNAME }}
```

### Cleanup

One last thing was required on the server side: to ensure the server disk does not get filled with builds and the build list page does not become too long to load, I added a cleanup script to keep only the latest 30 builds for each project. This script runs every day.

Here it is, once again it's a bit longer than what one would expect because of argument parsing:

```bash
#!/bin/bash
set -euo pipefail

PROGNAME=$(basename $0)
ROOT_DIR=/srv/builds.agateau.com/html
MAX_BUILDS=30

# Verbose command by default
CMD="rm -v"
QUIET_CMD="rm"
DRY_RUN_CMD="echo Would delete "

clean_project_dir() {
    local project_dir="$1"
    ls --sort time --reverse "$project_dir" \
        | awk 'NR > '$MAX_BUILDS' { print $1 }' \
        | while read name
    do
        $CMD "$project_dir/$name"
    done
}

usage() {
    if [ "$*" != "" ] ; then
        echo "Error: $*"
        echo
    fi

    cat << EOF
Usage: $PROGNAME [OPTION ...]
Delete old builds artifacts.

Options:
-h, --help          display this usage message and exit
-q, --quiet         work silently
--dry-run           print what would be deleted instead of deleting anything
EOF

    exit 1
}

while [ $# -gt 0 ] ; do
    case "$1" in
    -h|--help)
        usage
        ;;
    -q|--quiet)
        CMD="$QUIET_CMD"
        shift
        ;;
    --dry-run)
        CMD="$DRY_RUN_CMD"
        shift
        ;;
    -*)
        usage "Unknown option '$1'"
        ;;
    *)
        usage "Too many arguments"
        ;;
    esac
done

for project_dir in $ROOT_DIR/*/ ; do
    clean_project_dir "$project_dir"
done
```

### Refinements

To make the builds site look a bit nicer, I configured the Fancy Index module to use the [Flat theme][flat]. I also made it list builds in descending date order, so that the latest builds are always at the top of the page.

That's it, you can have a look at it here: <https://builds.agateau.com/>. There are only two projects for now, I plan to add more in the future.

[flat]: https://github.com/alehaa/nginx-fancyindex-flat-theme

### Conclusion

I am happy I spent some time setting up this artifact upload system as it has proved useful to let bug reporters confirm a fix after they reported an issue. Let me know if this was useful to you, or if you know of simpler solutions to publish build artifacts.
