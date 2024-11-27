# `xorg.conf.d`

You should copy this files to `/etc/X11/xorg.conf.d/`.

The files in this folder are the Xorg configuration files for devices like the
touchpad or mouse.

Keep in mind that `20-intel.conf` uses the "intel" driver, and you will probably
need to install the `xf86-video-intel` package.

For more information check
[this](https://wiki.archlinux.org/title/xorg#Input_devices) or
[this](https://wiki.archlinux.org/title/Xinput).
