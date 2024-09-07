

FILES=archive-website bin-diff randomize-mac scat
INSTALL_DIR=/usr/local/bin

.PHONY: all

# About the comma prefix, see:
# https://rhodesmill.org/brandon/2009/commands-with-comma/
COMMA=,
all: $(addprefix $(INSTALL_DIR)/, $(addprefix $(COMMA), $(FILES)))

$(INSTALL_DIR)/$(COMMA)% : %
	install -m 755 $< $@
