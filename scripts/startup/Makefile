
FILES=change-layout.sh dwmbar.sh multiple-monitors.sh
INSTALL_DIR=$(HOME)/.my-scripts

.PHONY: install

install: $(addprefix $(INSTALL_DIR)/, $(FILES))

$(INSTALL_DIR)/% : %
ifeq ($(shell id -u), 0)
	@echo "These scripts shouldn't be installed as root."
	@exit 1
else
	mkdir -p $(dir $@)
	install -m 755 $< $@
endif
