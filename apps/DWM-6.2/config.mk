# dwm version
VERSION = 6.2

# Customize below to fit your system

# paths
PREFIX    ?= /usr/local
MANPREFIX ?= ${PREFIX}/share/man

# Xinerama, comment if you don't want it
XINERAMAFLAGS ?= -DXINERAMA

# includes and libs
INCS = $(shell pkg-config --cflags x11 freetype2)
LIBS = $(shell pkg-config --libs x11 freetype2 xft fontconfig xinerama)

# flags
CPPFLAGS ?= -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_C_SOURCE=2 -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
CFLAGS   ?= -std=c99 -pedantic -Wall -Wno-unused-function -Wno-deprecated-declarations -O2 ${INCS} ${CPPFLAGS}
LDFLAGS  ?= ${LIBS}

# Solaris
#CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
#LDFLAGS = ${LIBS}

# compiler and linker
CC ?= gcc
