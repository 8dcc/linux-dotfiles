
FILES=change-layout.sh dwmbar multiple-monitors.sh randomize-mac.sh
INSTALL_DIR=~/.my-scripts

.PHONY: all

all: $(addprefix $(INSTALL_DIR)/, $(FILES))

$(INSTALL_DIR):
	mkdir -p $@

$(INSTALL_DIR)/% : %
	install -m 755 $< $@
