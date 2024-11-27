
FILES=change-layout.sh dwmbar.sh git-prompt.sh multiple-monitors.sh startx.sh
PREFIX=$(HOME)/.my-scripts

.PHONY: install

install: $(addprefix $(PREFIX)/, $(FILES))

$(PREFIX)/% : %
ifeq ($(shell id -u), 0)
	@echo "These scripts shouldn't be installed as root."
	@exit 1
else
	@mkdir -p $(dir $@)
	install -m 755 $< $@
endif
