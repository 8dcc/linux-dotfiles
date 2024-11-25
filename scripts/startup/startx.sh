#!/bin/sh

PREFIX="$HOME/.guix-profile"
DEV="/dev/tty1"

if [ "$(tty)" != "$DEV" ]; then
    echo "$(basename "$0"): Current TTY is not whitelisted, ignoring." 1>&2
    exit 1
fi

# NOTE: Intended to run on TTY1 (vt1)
$PREFIX/bin/xinit -- $PREFIX/bin/Xorg :0 vt1 -keeptty \
	-configdir $PREFIX/share/X11/xorg.conf.d \
	-modulepath $PREFIX/lib/xorg/modules
