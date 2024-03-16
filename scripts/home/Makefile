
.PHONY: all

FILES=change-layout.sh dwmbar multiple-monitors.sh
INSTALL_DIR=~/.my-scripts

all: $(addprefix $(INSTALL_DIR)/, $(FILES))

$(INSTALL_DIR):
	mkdir -p $@

$(INSTALL_DIR)/% : %
	install -m 755 $< $@
