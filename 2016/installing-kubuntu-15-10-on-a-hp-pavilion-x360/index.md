pub_date: 2016-03-19 00:00:00 +01:00
public: true
tags: [Kubuntu, HP]
title: Installing Kubuntu 15.10 on a HP Pavilion X360
summary: |
    Overcoming the bumps one face when installing Kubuntu 15.10 on some semi-recent piece of hardware.

I recently bought an HP X360 11-K100NF to replace the aging netbook used by my wife. Installing Kubuntu 15.10 worked mostly well, with the exception of two annoying bugs: wifi was broken and Gwenview was unusable.

## Fix wifi

Wifi card is a Realtek RTL8723BE. Apparently it comes with two antennas, but HP only wired the second one (way to go HP, how much did you save with that trick?). Unfortunately the Linux module tries to use the first antenna. I fixed this thanks to this [Ask Ubuntu answer][askubuntu].

[askubuntu]: http://askubuntu.com/a/635629

It's not over though: the `acer_wmi` module controls many parts of this laptop and likes to block the card to save power. I haven't found another solution than to blacklist it:

    echo "blacklist acer_wmi" | sudo tee /etc/modprobe.d/blacklist.conf

Unfortunately blacklisting the module also prevents `logind` from being notified about lid events: `journalctl -b -u systemd-logind` does not report lid opening or lid closing anymore. After unsuccessfully trying various combinations of module options, I gave up and configured the power button to suspend the laptop (Thanks Plasma for providing a way to configure this!). That works but it's less natural than just closing the lid, so not ideal. Hopefully this will be addressed in a future version.

## Gwenview

[Bug 352622][gwenviewbug] causes Gwenview to start with wrong toolbars and menus, making it unusable. The bug has been fixed upstream so I expect the fix to be in Kubuntu 16.04, but for now you can unbreak Gwenview with this:

    mkdir -p ~/.local/share/kxmlgui5
    cp /usr/share/kxmlgui5/gwenview/gwenviewui.rc ~/.local/share/kxmlgui5/org.kde.gwenviewui.rc

[gwenviewbug]: https://bugs.kde.org/show_bug.cgi?id=352622

## Extra rant

I wish laptop manufacturers simplified their product ranges. When looking for hardware issues like this, it is a maze to find solutions for your exact hardware because there are some many variants of the same machine. When you start searching for "HP X360 11-K110NF" you hit so many false positives because others have issues on the 11-H110YF or 11-H108AB or whatever... You know something is wrong when typing a product model feels like entering a weak password.
