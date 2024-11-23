# dmenu version
VERSION = 5.0

# paths
PREFIX    ?= /usr/local
MANPREFIX ?= $(PREFIX)/share/man

# includes and libs
INCS = $(shell pkg-config --cflags x11 xft fontconfig freetype2)
LIBS = $(shell pkg-config --libs x11 xft fontconfig freetype2 xinerama)

# flags
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_XOPEN_SOURCE=700 -D_POSIX_C_SOURCE=200809L -DVERSION=\"$(VERSION)\" -DXINERAMA
CFLAGS   = -std=c99 -pedantic -Wall -Os $(INCS) $(CPPFLAGS)
LDFLAGS  = $(LIBS)

# compiler and linker
CC = gcc
