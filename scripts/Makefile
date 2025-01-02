
PREFIX=$(HOME)/.my-scripts

STARTUPDIR=$(PREFIX)/startup
STARTUP=change-layout.sh dwmbar.sh git-prompt.sh multiple-monitors.sh startx.sh

UTILDIR=$(PREFIX)/util
UTIL=archive-website \
	 bin-diff \
	 bin-print \
	 emacs-tor \
	 git-log-short \
	 gpg-enc \
	 gpg-dec \
	 ipatch \
	 find-similar \
	 randomize-mac \
	 scat \
	 src2ps \
	 magnet2torrent \
	 mapc \
	 mpv-sub \
	 print-alternate-pages \
	 mail-fetch

# ------------------------------------------------------------------------------

.PHONY: install install-startup install-util

install: install-startup install-util

install-startup: $(addprefix $(STARTUPDIR)/, $(STARTUP))

# About the comma prefix, see:
# https://rhodesmill.org/brandon/2009/commands-with-comma/
COMMA=,
install-util: $(addprefix $(UTILDIR)/, $(addprefix $(COMMA), $(UTIL)))

# ------------------------------------------------------------------------------

$(STARTUPDIR)/% : startup/%
	install -D -m 755 $< $(DESTDIR)$@

$(UTILDIR)/$(COMMA)% : util/%
	install -D -m 755 $< $(DESTDIR)$@
