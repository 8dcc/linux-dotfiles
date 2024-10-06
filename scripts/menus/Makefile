
FILES=dwm-menu-layout dwm-menu-quit
INSTALL_DIR=/usr/local/bin

.PHONY: install

install: $(addprefix $(INSTALL_DIR)/, $(FILES))

$(INSTALL_DIR)/% : %
ifneq ($(shell id -u), 0)
	@echo "These scripts must be installed as root."
	@exit 1
else
	mkdir -p $(dir $@)
	install -m 755 $< $@
endif
