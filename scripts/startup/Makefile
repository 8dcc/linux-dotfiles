
FILES=change-layout.sh dwmbar.sh multiple-monitors.sh
INSTALL_DIR=$(HOME)/.my-scripts

.PHONY: all

all: $(addprefix $(INSTALL_DIR)/, $(FILES))

$(INSTALL_DIR):
	mkdir -p $@

$(INSTALL_DIR)/% : %
	install -m 755 $< $@
