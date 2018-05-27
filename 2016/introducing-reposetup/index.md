pub_date: 2016-04-11 22:03:58 +01:00
public: true
tags: [git, hosting, apache, reposetup]
title: Introducing Reposetup
summary: |
    A minimalist tool to manage hosted Git repositories

The other day at work I was considering how we could setup a simple server to host Git repositories for proof-of-concepts and other one-off projects. Sometimes we create a proof-of-concept just to illustrate a point in a pull request, or to explore options before starting work. Git is handy for this: it makes it easy to try things, fail, rewind, explore other options. It felt overkill to ask our IT teams to create official repositories for such potentially short-lived projects which don't need the full infrastructure required to manage long-term projects.

Since we already have an internal server on which we have SSH access, one alternative I imagined was installing a tool like [GitLab][] but that felt heavyweight: I didn't want to create additional load on the server by adding other services. [Gitolite][] was another option, but using it is a bit more involved, and since we all have SSH access on this server, the main point of Gitolite, providing access without giving all users a shell account, was not required.

Hosting a Git repository on a server with SSH access is actually quite simple: create a bare repository with `git init --bare`, optionally mark it shareable with `git-daemon` and/or enable the hook to provide read-only HTTP access to it.

At this point, you can probably guess where I am heading to: I created another project... welcome [Reposetup][]! Reposetup is a command-line tool (written in shell for now) which you can install on your server. Once it is installed you can run it over SSH to create, list, rename or delete repositories. Repositories are accessible for read/write access over SSH for you, but you can also add read-only access to others through Git dumb-HTTP protocol. Read-only access is easy to add if you use an HTTP server like Apache with the `mod_userdir` module.

Installation boils down to copying the `reposetup` binary to `/usr/local/bin` or similar, then creating a `/etc/reposetuprc` file with the following content:

    # Path where repositories will be created
    REPO_BASE_DIR=$HOME/public_html/git

    # Repository url for read-write access
    REPO_RW_URL=$USER@<yourserver>:public_html/git/$REPO_NAME

    # Repository url for read-only access
    REPO_RO_URL=http://<yourserver>/~$USER/git/$REPO_NAME

`REPO_RO_URL` can be omitted if you don't want to provide read-only access.

Reposetup is ready. Now you can create a repository with:

    $ ssh server.lan reposetup create testproj
    
Reposetup creates the repository and tells you how to push to it:

    The "testproj" repository has been created. You can clone it with:

        git clone you@server.lan:public_html/git/testproj

    If you already have a local repository, you can push its content with:

        git remote add origin you@server.lan:public_html/git/testproj
        git push -u origin master

    The url for read-only access is:

        http://server.lan/~you/git/testproj

`create` is the main command, but there are a few others:

- `rename`: to rename an existing repository
- `ls`: to list created repositories and their urls
- `rm`: to delete a repository

That's it, you can get it [on GitHub][Reposetup]. Hope you find it useful!

[GitLab]: https://gitlab.com
[Gitolite]: https://github.com/sitaramc/gitolite
[Reposetup]: https://github.com/agateau/reposetup