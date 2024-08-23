
.PHONY: all

FILES=layoutmenu dwm-quit-menu tsurf scat
INSTALL_DIR=/usr/local/bin

all: $(addprefix $(INSTALL_DIR)/, $(FILES))

$(INSTALL_DIR)/% : %
	install -m 755 $< $@
