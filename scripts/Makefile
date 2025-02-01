
PREFIX=$(HOME)/.my-scripts

STARTUPDIR=startup
STARTUP=$(notdir $(wildcard $(STARTUPDIR)/*))
UTILDIR=util
UTIL=$(notdir $(wildcard $(UTILDIR)/*))

# ------------------------------------------------------------------------------

.PHONY: install install-startup install-util

install: install-startup install-util

install-startup: $(addprefix $(PREFIX)/$(STARTUPDIR)/, $(STARTUP))

# About the comma prefix, see:
# https://rhodesmill.org/brandon/2009/commands-with-comma/
COMMA=,
install-util: $(addprefix $(PREFIX)/$(UTILDIR)/$(COMMA), $(UTIL))

# ------------------------------------------------------------------------------

$(PREFIX)/$(STARTUPDIR)/% : $(STARTUPDIR)/%
	install -D -m 755 $< $(DESTDIR)$@

$(PREFIX)/$(UTILDIR)/$(COMMA)% : $(UTILDIR)/%
	install -D -m 755 $< $(DESTDIR)$@
