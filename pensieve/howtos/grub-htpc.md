public: no
pub_date: 2018-12-31 21:35:41 +01:00
tags: [howto, grub]
title: "GRUB HTPC howto"
disqus: false

# GRUB HTPC howto

## Font

Generate a large font:

    sudo grub-mkfont -s 36 -o /boot/grub/fonts/dejavusans-mono-36.pf2 /usr/share/fonts/truetype/dejavu/DejaVuSansMono.ttf

(Do not use Ubuntu Mono or the outer rectangle of the screen will look broken)

## Global settings

Edit /etc/default/grub.

Enable high res:

    GRUB_GFXMODE=1920x1080,1024,768,auto

and keep it while booting:

    GRUB_GFXPAYLOAD_LINUX=keep

Use the large font:

    GRUB_FONT=/boot/grub/fonts/dejavusans-mono-36.pf2

## Define boot entries

Set labels on your root partitions, it's much more convenient than uuids:

    sudo e2label /dev/sdaN myroot

Define your boot entries in `/etc/grub.d/40_custom`. Here is my template:

    menuentry 'Kodi' --id 'kodi' {
        recordfail
        load_video
        gfxmode keep
        insmod gzio
        insmod part_msdos
        insmod ext2
        search --no-floppy --label --set=root kodiroot
        linux /vmlinuz root=LABEL=kodiroot ro splash quiet vt.handoff=1
        initrd /initrd.img
    }

Note the use of labels instead of uuids and of /vmlinuz and /initrd.img instead
of real paths, since the real paths change when the kernel is updated.

Set the default entry by editing /etc/default/grub:

    GRUB_DEFAULT=kodi

## Generate your new grub

    sudo update-grub

Reboot and try it out.

## Final changes

You might want your entries to appear first in the list. To do so, rename
`40_custom` to something like `08_custom`, what matters is that the number is
lower than the `10_linux`, which adds the entry for your current OS.

Another nice touch is to insert a separator between your entries and the
default entries. This can be done by adding the following to `08_custom`:

    menuentry '' {
        true
    }

## References

[GNU GRUB Manual][manual] is very complete.

[manual]: https://www.gnu.org/software/grub/manual/grub/html_node/index.html
