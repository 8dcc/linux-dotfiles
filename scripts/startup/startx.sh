#!/bin/bash

PREFIX="$HOME/.guix-profile"

# NOTE: Intended to run on TTY1 (vt1)
$PREFIX/bin/xinit -- $PREFIX/bin/Xorg :0 vt1 -keeptty \
	-configdir $PREFIX/share/X11/xorg.conf.d \
	-modulepath $PREFIX/lib/xorg/modules
