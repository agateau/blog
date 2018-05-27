pub_date: 2013-04-30 11:25:21 +02:00
public: true
tags: [kde, kubuntu, ubiquity]
title: "Hacking on Ubiquity, the setup"
summary: |
    How I setup my system to work on Ubiquity, the Kubuntu installer

Working on Ubiquity, the Kubuntu installer, is not trivial, or at least it was
not for me.
This article describes the setup I ended up using, so that I do not waste time on my next
Ubiquity hacking session. Hopefully it will be useful to others interested in
working on Ubiquity.

This article was originally a part of my [previous Ubiquity
article][ubiquity-raring], but
I decided to split it as the audience is not the same.

## Setting everything up

### Intro

I learned the hard way the preferred way to test Ubiquity is to run your code
from within a live Kubuntu session. This is necessary because the installer
needs the ISO file system to complete, otherwise it fails when you are done
answering questions.

The quick and dirty way to get stuff done is to edit files in `/usr` from within
the live Kubuntu session, then copy them back to your checkout of Ubiquity
source code. Quick but dirty, and error prone.

The setup I ended up with looks like this:

1. Start live ISO in a VM, tweak the VM environment
2. Edit code on host
3. Push changes from host to VM
4. While broken, goto 2
5. Commit changes, file merge request

### Get the code and tools

First, setup a base dir. This dir is going to contain 3 repositories: the source
for Ubiquity itself, the source for Ubiquity slideshow and a set of scripts I
put together.

    mkdir src/ubiquity

Get the repositories:

    cd src/ubiquity
    bzr clone lp:ubiquity code
    bzr clone lp:ubiquity-slideshow-ubuntu slideshow
    bzr clone lp:~agateau/+junk/ubiquity-scripts scripts

### Setting up a VM to accept our code

I use VirtualBox to run this live session on my development machine. I push code
from the host to the VM using rsync over ssh, because I can never get VirtualBox
Shared Folders to work on development versions of Ubuntu :/.

First, download a live ISO from <http://cdimage.ubuntu.com/kubuntu/daily-live/current/>.

Then, create a Virtualbox VM, adding the live ISO as CDROM.

Now start the VM and after it has finished booting, select "Try Kubuntu".

At this point, we can start to tweak the VM environment.

_Note: In the following sections, terminal commands prefixed with `[VM]` are meant to
be run inside the VM, while commands prefixed with `[HOST]` should be run on the
host._

Open Konsole and create the folder which will contain the code to test:

    [VM] mkdir -p src/ubiquity

Setup ssh:

    [VM] sudo apt-get install openssh-server

For some reason, sshd does not start automatically for me and running `sudo
start ssh` does not help.

Running `sshd` by hand shows it misses the `/run/sshd` dir. Here is my ugly
workaround.

Create the missing dir:

    [VM] sudo mkdir /run/sshd

Start `sshd` by hand.

    [VM] sudo /usr/sbin/sshd

_Note: One must use the full path to the sshd binary, otherwise it does not start._

Now we need to set a password for the `kubuntu` user, otherwise we can't ssh to it:

    [VM] sudo passwd kubuntu
    Enter new UNIX password:
    Retype new UNIX password:

Before going back to the host, write down the IP address of the VM:

    [VM] ifconfig

Go back to the host and install your ssh public key in the VM so that you
don't have to enter the password of the `kubuntu` user every time you want to
test a change.

    [HOST] ssh-copy-id kubuntu@$VM_IP

Check it works:

    [HOST] ssh kubuntu@$VM_IP

You should get logged in the VM without entering the password.

### Initial installation of our code in the VM

Time to push our code. From the host:

    [HOST] ~/src/ubiquity/scripts/rsync-to-vm $VM_IP

Now, switch back to the VM and let's do some final setup.  We are going to
rename some of Ubiquity dirs to append "-distro" to their name and replace the
original dirs with symlinks. Our development version gets its own symlinks as
well, suffixed with "-dev".  We will then be able to switch from the distro to
the dev version and back.

For example, in `/usr/lib/ubiquity`, the following changes will be done for the
`plugins` dir:

- `plugins` is going to be renamed to `plugins-distro`
- Two symlinks are going to be created:
    - `plugins-dev`, pointing to `/home/kubuntu/src/ubiquity/code/plugins`
    - `plugins` pointing either to `plugins-distro` or `plugins-dev`

There are a few dirs to alter, so I created a script to do the work:

    [VM] cd ~/src/ubiquity
    [VM] scripts/setup setup

_Note: no need to call `scripts/setup` with `sudo`, the script uses it when necessary._

All symlinks have been created. You can check the status with:

    [VM] scripts/setup status

    lrwxrwxrwx 1 root root 14 mars  25 17:22 /usr/lib/ubiquity/plugins -> plugins-distro
    lrwxrwxrwx 1 root root 15 mars  25 17:22 /usr/lib/ubiquity/ubiquity -> ubiquity-distro
    lrwxrwxrwx 1 root root 9 mars  25 17:22 /usr/share/ubiquity/qt -> qt-distro
    lrwxrwxrwx 1 root root 25 mars  25 17:22 /usr/share/ubiquity-slideshow -> ubiquity-slideshow-distro

To switch to our development version, run:

    [VM] scripts/setup dev

Symlinks look like this now:

    [VM] scripts/setup status

    lrwxrwxrwx 1 root root 11 mars  25 17:23 /usr/lib/ubiquity/plugins -> plugins-dev
    lrwxrwxrwx 1 root root 12 mars  25 17:23 /usr/lib/ubiquity/ubiquity -> ubiquity-dev
    lrwxrwxrwx 1 root root 6 mars  25 17:23 /usr/share/ubiquity/qt -> qt-dev
    lrwxrwxrwx 1 root root 22 mars  25 17:23 /usr/share/ubiquity-slideshow -> ubiquity-slideshow-dev

We are now ready to work! We can run our version of Ubiquity with:

    [VM] ubiquity -d kde_ui

The `-d` switch turns on debug output, which can be found in
`/var/log/installer/debug`.

## Getting some work done

Hack on the host and whenever you want to test your changes, run:

    [HOST] scripts/rsync-to-vm $VM_IP

Then switch to the VM and run Ubiquity:

    [VM] ubiquity -d kde_ui

_Note: Since the setup relies on the code being in `/home/kubuntu/src/ubiquity/code` and
`/home/kubuntu/src/ubiquity/slideshow`, using Bazaar branches can be problematic.
I recommend the [bzr-colo][] plugin to switch branches in place._

## Testing the greeter

The greeter is the screen which appears when you boot the live ISO. It asks you
your language, and let you pick between trying or installing Kubuntu.

To quickly test the greeter mode from within the running Plasma session, run ubiquity with the `--greeter` option:

    [VM] ubiquity -d --greeter kde_ui

If you want to test the full thing, you must restart Ubiquity. To do so, switch to a console session (using Host-VM-key + F1) then run these commands:

    [VM] sudo -i
    [VM] stop --no-wait lightdm
    [VM] stop ubiquity
    [VM] pkill -9 X
    [VM] start ubiquity

You probably also want to make sure the greeter does not try to run the GTK+ frontend. _ubiquity-dm_ picks the GTK+ frontend if it is available, and since you now have the source code of Ubiquity installed, the GTK+ frontend is available. For now the hack I use is to rm it:

    [VM] rm ~/src/ubiquity/code/ubiquity/frontend/gtk_ui.py

Note that you need to do so everytime you run _rsync-to-vm_, since it will bring back the `gtk_ui.py` file.

## Testing OEM config

Ubiquity can be run in "OEM" mode. In this mode, the installer is split in
two steps:

1. The installer installs Kubuntu on the hard disk without creating a user.
2. When the user boots the system for the first time, he is prompted with user
   configuration questions.

To test step 1, set the `UBIQUITY_OEM_USER_CONFIG` environment
variable:

    [VM] UBIQUITY_OEM_USER_CONFIG=1 ubiquity -d kde_ui

To test step 2, create a symlink named `oem-config` on the `ubiquity` script,
and start Ubiquity from this script:

    [VM] ln -s /usr/lib/ubiquity/bin/ubiquity oem-config
    [VM] kdesudo ./oem-config -d kde_ui

_Note the source of the link is `/usr/lib/ubiquity/bin/ubiquity`, not
`/usr/bin/ubiquity`. The latter is just a wrapper around the former._

## Wrap up

If you read this far, then either you are interested in hacking on Ubiquity and
I hope this article helps you, or you are an Ubiquity developer and I hope you
did not spot too many mistakes. If you find some, please point them out.

<a href="http://flattr.com/thing/1305089/Hacking-on-Ubiquity-the-setup" target="_blank"><img src="http://api.flattr.com/button/flattr-badge-large.png" alt="Flattr this" title="Flattr this" border="0" /></a>

[ubiquity-raring]: /2013/04/11/hacking-on-ubiquity/
[bzr-colo]: http://launchpad.net/bzr-colo
