pub_date: 2013-09-13 18:28:56 +02:00
public: true
tags: [lenovo, tips, power management]
title: "Running the Lenovo X1 Carbon at full speed when compiling"
summary: |
    Describes some tweaks I had to make to get my laptop to run at full speed when compiling.

As you may remember, I got myself a shiny new laptop. With every new laptop comes a series of tweaks one has to apply to make the most of it. I already blogged about [the changes I made to the keyboard layout][kb]. But there was actually a more serious issue: that laptop was slow!

## The problem

How do I define "slow"? My non-scientific benchmark is building Gwenview from scratch several times in a row. Since the X1 comes with an Intel i5 processor and an SSD disk, I expected it to be blazingly faster than my old ASUS laptop, with its Core 2 Duo processor and traditional hard disk.

I was thus quite disappointed when I realized the X1 was 3 (three!) times slower than the ASUS!

After a bit of research and poking of friends who are much more knowledgeable than me when it comes to Linux plumbing, we found out the X1 was keeping its cores running at 800MHz while building, instead of scaling them to 1800MHz. This is easily verifiable by running this line on a terminal, which prints the CPU frequency of all cores in a loop:

    watch 'grep "cpu MHz" /proc/cpuinfo'

It printed a constant output:

    cpu MHz         : 800.000
    cpu MHz         : 800.000
    cpu MHz         : 800.000
    cpu MHz         : 800.000

There are multiple "power management governors" for the Linux kernel. Those governors are responsible for scaling the CPU frequencies based on various criteria.

You can list available governors with a command like this:

    $ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors
    conservative ondemand userspace powersave performance

And available frequencies with:

    $ cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies 
    1801000 1800000 1700000 1600000 1500000 1400000 1300000 1200000 1100000 1000000 900000 800000

Ubuntu Raring defaults to the "ondemand" governor, which is supposed to scale the frequency dynamically based on the load.

## Fixing it

One can change governors by echoing the desired governor in the right files. This simple script does it:

    #!/bin/sh
    governor=$1
    cd /sys/devices/system/cpu
    for x in cpu[0-9]* ; do
        echo $governor > $x/cpufreq/scaling_governor
    done

Following the advice of my knowledgeable friends, I tried to switch to the "conservative" governor. This fixed my issue, or so I thought.

It was time to make this permanent. The package `cpufrequtils` provides a simple way to do so by creating a file named `/etc/default/cpufrequtils` with the following content:

    ENABLE=true
    GOVERNOR=conservative

All done, reboot and be happy!

## Or Not

What happened there was weird at first: after rebooting my governor was set to "conservative", but after a few minutes it was back to "ondemand"... Sorcery!

It took me quite some time and blind grepping to find out the ugly culprit: `/etc/init.d/ondemand`

What this script basically does is this:

1. Sleep for 60 seconds
2. Set the governor to "interactive" or "ondemand", whichever is available

This script is installed by the "initscripts" package, not something which can be safely removed. I could disable the script, but experience tells me those have a tendency to re-enable themselves on upgrades... There goes my plan of using "conservative".

## Sticking with "ondemand"

So I was back with "ondemand". More investigation revealed the governor was never scaling up because load was not reaching 100%. This threshold can be adjusted through another file: `/sys/devices/system/cpu/cpufreq/ondemand/up_threshold`, which holds the CPU load in percent before scaling up. Echoing "70" in this file makes the governor scale the core to their maximum frequency when compiling. Yay!

One last thing to do was to make the change permanent. To do so, I installed the `sysfsutils` package and edited `/etc/sysfs.conf` to add the following line:

    devices/system/cpu/cpufreq/ondemand/up_threshold = 70

A quick reboot to check and confirm that, yes, the kernel now scales up the cores correctly when building.

That was way too complicated than necessary, but it works now. Hopefully this can save you a bit of time if you are affected by the same issue.

## Reference

This page was quite handy to learn more about this topic: <http://www.pantz.org/software/cpufreq/usingcpufreqonlinux.html>

<a href="https://flattr.com/submit/auto?user_id=agateau&url=http%3A%2F%2Fagateau.com%2F2013%2F09%2F13%2Flenovo-x1-carbon-cpu-speed%2F" target="_blank"><img src="//api.flattr.com/button/flattr-badge-large.png" alt="Flattr this" title="Flattr this" border="0"></a>

[kb]: http://agateau.com/2013/08/01/remapping-keyboard-keys-on-lenovo-laptops
