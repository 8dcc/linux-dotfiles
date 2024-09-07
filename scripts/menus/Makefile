

FILES=dwm-menu-layout dwm-menu-quit
INSTALL_DIR=/usr/local/bin

.PHONY: all

all: $(addprefix $(INSTALL_DIR)/, $(FILES))

$(INSTALL_DIR)/% : %
	install -m 755 $< $@
