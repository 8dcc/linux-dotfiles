# slock version
VERSION = 1.4

# user for slock
SLOCKUSER ?= slock

# paths
PREFIX    ?= /usr/local
MANPREFIX ?= ${PREFIX}/share/man

# includes and libs
INCS = $(shell pkg-config --cflags x11 xft fontconfig freetype2 )
LIBS = -lc $(shell pkg-config --libs x11 xft fontconfig freetype2 xinerama xext xrandr libcrypt)

# flags
CPPFLAGS  ?= -DVERSION=\"${VERSION}\" -D_DEFAULT_SOURCE -DHAVE_SHADOW_H -DXINERAMA
CFLAGS    ?= -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
LDFLAGS   ?= -s ${LIBS}
COMPATSRC ?= explicit_bzero.c

# compiler and linker
CC = gcc
