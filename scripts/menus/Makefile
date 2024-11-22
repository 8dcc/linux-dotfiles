
FILES=dwm-menu-layout dwm-menu-quit
PREFIX=/usr/local/bin

.PHONY: install

install: $(addprefix $(PREFIX)/, $(FILES))

$(PREFIX)/% : %
ifneq ($(shell id -u), 0)
	@echo "These scripts must be installed as root."
	@exit 1
else
	@mkdir -p $(dir $@)
	install -m 755 $< $@
endif
