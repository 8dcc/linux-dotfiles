
FILES=archive-website bin-diff gpg-enc gpg-dec randomize-mac scat print-alternate-pages mail-fetch
INSTALL_DIR=/usr/local/bin

.PHONY: install

# About the comma prefix, see:
# https://rhodesmill.org/brandon/2009/commands-with-comma/
COMMA=,
install: $(addprefix $(INSTALL_DIR)/, $(addprefix $(COMMA), $(FILES)))

$(INSTALL_DIR)/$(COMMA)% : %
ifneq ($(shell id -u), 0)
	@echo "These scripts must be installed as root."
	@exit 1
else
	mkdir -p $(dir $@)
	install -m 755 $< $@
endif
