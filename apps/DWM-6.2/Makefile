# dwm - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk

SRC = drw.c dwm.c util.c
OBJ = ${SRC:.c=.o}

all: options dwm

options:
	@echo dwm build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

config.h:
	cp config.def.h $@

dwm: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	rm -f dwm ${OBJ} dwm-${VERSION}.tar.gz

# Remove config.h because I use config.def.h
cleaner: clean
	rm -f config.h

dist: clean
	mkdir -p dwm-${VERSION}
	cp -R LICENSE Makefile README config.def.h config.mk\
		dwm.1 drw.h util.h ${SRC} dwm.png transient.c dwm-${VERSION}
	tar -cf dwm-${VERSION}.tar dwm-${VERSION}
	gzip dwm-${VERSION}.tar
	rm -rf dwm-${VERSION}

install: all
	install -D -m 755 dwm -t ${DESTDIR}${PREFIX}/bin
	install -D -m 755 scripts/dwm-menu-layout -t ${DESTDIR}${PREFIX}/bin
	install -D -m 755 scripts/dwm-menu-quit -t ${DESTDIR}${PREFIX}/bin
	install -D -m 755 dwm.desktop -t ${DESTDIR}${PREFIX}/share/xsessions
	install -D -m 755 dwm.svg -t ${DESTDIR}${PREFIX}/share/icons
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	sed "s/VERSION/${VERSION}/g" < dwm.1 > ${DESTDIR}${MANPREFIX}/man1/dwm.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/dwm.1

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/dwm\
		${DESTDIR}${MANPREFIX}/man1/dwm.1\
		${DESTDIR}${PREFIX}/bin/scripts/dwm-menu-layout\
		${DESTDIR}${PREFIX}/bin/scripts/dwm-menu-quit\
		${DESTDIR}${PREFIX}/share/xsessions/dwm.desktop\
		${DESTDIR}${PREFIX}/share/icons/dwm.svg

.PHONY: all options clean cleaner dist install uninstall
