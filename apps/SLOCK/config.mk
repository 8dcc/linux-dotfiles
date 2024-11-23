# slock version
VERSION = 1.4

# user for slock
SLOCKUSER ?= slock

# paths
PREFIX    ?= /usr/local
MANPREFIX ?= ${PREFIX}/share/man

# includes and libs
INCS = -I. -I/usr/include -I${X11INC} -I${FREETYPEINC}
LIBS = -L/usr/lib -lc -lcrypt -L${X11LIB} -lX11 ${XINERAMALIBS} ${FREETYPELIBS} -lXext -lXrandr

INCS = $(shell pkg-config --cflags x11 fontconfig freetype2)
LIBS = -lc -lcrypt $(shell pkg-config --libs x11 fontconfig freetype2 xinerama xext xrandr)

# flags
CPPFLAGS  ?= -DVERSION=\"${VERSION}\" -D_DEFAULT_SOURCE -DHAVE_SHADOW_H -DXINERAMA
CFLAGS    ?= -std=c99 -pedantic -Wall -Os ${INCS} ${CPPFLAGS}
LDFLAGS   ?= -s ${LIBS}
COMPATSRC ?= explicit_bzero.c

# compiler and linker
CC = gcc
