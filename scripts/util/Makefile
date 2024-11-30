
FILES=archive-website bin-diff emacs-tor git-log-short gpg-enc gpg-dec ipatch \
	  randomize-mac scat src2ps mapc mpv-sub print-alternate-pages mail-fetch
PREFIX=/usr/local/bin

.PHONY: install

# About the comma prefix, see:
# https://rhodesmill.org/brandon/2009/commands-with-comma/
COMMA=,
install: $(addprefix $(PREFIX)/, $(addprefix $(COMMA), $(FILES)))

$(PREFIX)/$(COMMA)% : %
ifneq ($(shell id -u), 0)
	@echo "These scripts must be installed as root."
	@exit 1
else
	@mkdir -p $(dir $@)
	install -m 755 $< $@
endif
