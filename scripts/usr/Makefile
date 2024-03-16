
.PHONY: all

FILES=layoutmenu dwm-quit-menu ras tsurf
INSTALL_DIR=/usr/local/bin

all: $(addprefix $(INSTALL_DIR)/, $(FILES))

$(INSTALL_DIR)/% : %
	install -m 755 $< $@
