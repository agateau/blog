public: false
tags: [KDE, Kubuntu, Ubiquity]
title: "Hacking on Ubiquity"
summary: |
    I worked a bit on Ubiquity, the Kubuntu Installer. What follows is a description of some of the changes I made and some hints on how to work on Ubiquity.

## Working on Ubiquity

Initial reason to look into it: Add OS name in partition manager, as asked by Blue Systems.

Occasion to finally work on other pet-peeves:

- hard-to-read breadcrumbs
- cut breadcrumbs
- cut text in some screens
- not resizable
- fullscreen, c-s-d like window

Refreshed the look and improved RTL support.

## The Setup

### Intro

Edit code on host, test it in VM running live iso. Need to test on live iso
because you need the squashed file system, otherwise install will fail at the
end.

Push code from host to guest using rsync over ssh (because I can never get
VirtualBox Shared Folders to work on development versions of Ubuntu).

### Get the code and tools

Setup base dir:

    mkdir src/ubiquity
    cd src/ubiquity

Get repositories for the code and the slideshow:

    bzr clone lp:ubiquity code
    bzr clone lp:ubiquity-slideshow-ubuntu slideshow
    bzr clone lp:~agateau/+junk/ubiquity-scripts scripts

### Setting up a VM to accept our code

- Create a VM, add live .iso as CDROM
- Start VM
- Select "Try Kubuntu"

Open Konsole and create the folder which will contain the code to test:

    [VM] mkdir src/ubiquity

Now setup ssh:

    [VM] sudo apt-get install openssh-server

For some reason, sshd does not start. Running `sudo start ssh` does not work.
Here is my ugly workaround:

    [VM] sudo mkdir /run/sshd
    [VM] sudo /usr/sbin/sshd

Note: full path to sshd is necessary

Now we need to set a password for the `kubuntu` user, otherwise we can't ssh to it:

    [VM] sudo passwd kubuntu
    x
    x

Before going back to the host, write down the IP address of the VM:

    [VM] ifconfig

Go back to the host and install your ssh public key in the guest so that you
don't have to enter the password of the `kubuntu` user every time you want to
test a change.

    [HOST] ssh-copy-id kubuntu@$VM_IP

Check it works with `ssh kubuntu@$VM_IP`. You should get logged in the VM
without entering the password.

### Initial installation of our code in the VM

Time to push our code. From the host:

    [HOST] ~/src/ubiquity/scripts/rsync-to-vm $VM_IP

Now, switch back to the guest and let's do some final setup.

We are going to rename some of Ubiquity dirs to append "-distro" to their name
and replace the original dirs with symlinks. Our development version gets its
own symlinks as well, suffixed with "-dev".

We will then be able switch from the distro to the dev version and back.

To sum up, it looked like this before:

    [VM] ls -ld /usr/lib/ubiquity/foo*

    /usr/lib/ubiquity/foo

And it is going to be changed to this:

    [VM] ls -ld /usr/lib/ubiquity/foo*

    /usr/lib/ubiquity/foo -> /usr/lib/ubiquity/foo-distro
    /usr/lib/ubiquity/foo-distro
    /usr/lib/ubiquity/foo-dev -> /home/kubuntu/src/ubiquity/code/foo

There are a few dirs to alter, so I created a script to do so:

    [VM] cd ~/src/ubiquity
    [VM] scripts/setup setup

Note: no need to call `scripts/setup` with `sudo`, the script uses it when necessary.

All symlinks have been created. You can check the status with:

    [VM] scripts/setup status

    lrwxrwxrwx 1 root root 14 mars  25 17:22 /usr/lib/ubiquity/plugins -> plugins-distro
    lrwxrwxrwx 1 root root 15 mars  25 17:22 /usr/lib/ubiquity/ubiquity -> ubiquity-distro
    lrwxrwxrwx 1 root root 9 mars  25 17:22 /usr/share/ubiquity/qt -> qt-distro
    lrwxrwxrwx 1 root root 25 mars  25 17:22 /usr/share/ubiquity-slideshow -> ubiquity-slideshow-distro

To switch to our development version, run:

    [VM] scripts/setup dev

Let's check:

    [VM] scripts/setup status

    lrwxrwxrwx 1 root root 11 mars  25 17:23 /usr/lib/ubiquity/plugins -> plugins-dev
    lrwxrwxrwx 1 root root 12 mars  25 17:23 /usr/lib/ubiquity/ubiquity -> ubiquity-dev
    lrwxrwxrwx 1 root root 6 mars  25 17:23 /usr/share/ubiquity/qt -> qt-dev
    lrwxrwxrwx 1 root root 22 mars  25 17:23 /usr/share/ubiquity-slideshow -> ubiquity-slideshow-dev

We are now ready to work (finally!), you can run our version of Ubiquity with:

    [VM] ubiquity -d kde_ui

Look for errors in `/var/log/installer/debug`.

## Working with the setup

Hack on the host and whenever you want to test things, run:

    [HOST] scripts/rsync-to-vm $VM_IP

You can now switch back to the VM and run:

    [VM] ubiquity -d kde_ui

Since the setup relies on the code being in /home/kubuntu/src/ubiquity/code and
/home/kubuntu/src/ubiquity/slideshow, using Bazaar branches can be problematic.
I use the [bzr-colo][] plugin to switch branches in place.

## Testing greeter

    UBIQUITY_GREETER=1

## Testing oem-config

symlink to ubiquity

[bzr-colo]: http://launchpad.net/bzr-colo
