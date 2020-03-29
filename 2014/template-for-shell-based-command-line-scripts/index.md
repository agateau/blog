pub_date: 2014-06-04 18:54:24 +02:00
public: true
tags: [shell, tips]
title: "A template for shell-based command-line scripts"
summary: |
    A handy template to make your command-line shell scripts more comfortable

If you write shell scripts, you may be familiar with the situation where you wrote a script, and now would like to extend it to add some optional argument. Said script being a temporary hack (as temporary as those tend to be...) you end up writing a quick'n'dirty command-line parser, suffering limitations like fixed argument orders or other things which make tools annoying to use, but which would take too much time to get right than would be worth for this tiny shell script.

I felt this annoyance many times while writing scripts. To avoid that situation, I used to have a template which made use of the [getopt][] binary but I always found it cumbersome: annoying to work with and hard to read again when coming back to my code after a while. Recently I came up with a simpler, slightly more manual, alternative.

The whole template looks like this:

    #!/bin/sh
    set -e

    PROGNAME=$(basename $0)

    die() {
        echo "$PROGNAME: $*" >&2
        exit 1
    }

    usage() {
        if [ "$*" != "" ] ; then
            echo "Error: $*"
        fi

        cat << EOF
    Usage: $PROGNAME [OPTION ...] [foo] [bar]
    <Program description>.

    Options:
    -h, --help          display this usage message and exit
    -d, --delete        delete things
    -o, --output [FILE] write output to file
    EOF

        exit 1
    }

    foo=""
    bar=""
    delete=0
    output="-"
    while [ $# -gt 0 ] ; do
        case "$1" in
        -h|--help)
            usage
            ;;
        -d|--delete)
            delete=1
            ;;
        -o|--output)
            output="$2"
            shift
            ;;
        -*)
            usage "Unknown option '$1'"
            ;;
        *)
            if [ -z "$foo" ] ; then
                foo="$1"
            elif [ -z "$bar" ] ; then
                bar="$1"
            else
                usage "Too many arguments"
            fi
            ;;
        esac
        shift
    done

    if [ -z "$bar" ] ; then
        usage "Not enough arguments"
    fi

    cat <<EOF
    foo=$foo
    bar=$bar
    delete=$delete
    output=$output
    EOF

_Note: the `die` function is not used by the template itself, but most of the scripts I write needs such a function at some point, which is why it is there._

This template supports:

- Short and long options (`-d` and `--delete` for example)
- Options with and without arguments
- Arbitrary position for options: `myscript foo -d` will do the same as `myscript -d foo`
- Aborting when invalid options are passed
- Checks for mandatory positional arguments

This last feature is done in two parts. First the `*)` case in the while loop sets variables as it goes through arguments and aborts if too many arguments are passed. Once the code leaves the while loop, a check is done on the last argument: if it is empty the code aborts complaining about missing arguments.

## Supporting a variable number of arguments

A common change is accepting a variable number of arguments. If you are confident your arguments will never contain spaces or other weird characters, then you can do the following changes:

1. Declare an empty `args` variable before the while loop:

        args=""

2. Replace the code in the `*)` case with something like this:

        *)
            args="$args $1"
            ;;

3. Remove the check for the last argument or alter it to check if `args` is empty.

4. Iterate over the arguments with:

        for arg in $args ; do
            # Do work here
        done

If you want to support arguments which contain spaces, that's another story. The simplest solution I know of is to make use of Bash arrays. The changes would thus look like this:

1. Change the shebang to `#!/bin/bash`.

2. Declare an empty `args` _array_ before the while loop:

        args=()

3. Replace the code in the `*)` case with something like this:

        *)
            args=("${args[@]}" "$1")
            ;;

4. Same as before: remove the check for the last argument or alter it to check if `args` is empty.

5. Iterate over the arguments with:

        for arg in "${args[@]}" ; do
            # Do work here
        done

Higher percentage of cabalistic symbols in there, but that's the price one has to pay to manipulate arrays with Bash.

## Pros and cons

Compared to `getopt`, this template has a few advantages but also limitations one must be aware of:

- Pros
    - No need to list the options again in a call to `getopt`
    - Less boilerplate: `getopt` requires you to run it, then eval its output
    - Positional arguments are handled in the same loop which handles the options
- Cons
    - No support for concatenated short options: `-ab` is not the same as `-a -b`.
    - No support for separating option arguments with an equal sign: you must write `--output file.log` and not `--output=file.log`.

That's it for this template, hope it is useful to you.

[getopt]: http://man7.org/linux/man-pages/man1/getopt.1.html
