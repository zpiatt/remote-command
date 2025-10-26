PREFIX = /usr

.PHONY: install uninstall

ifneq ($(SUDO_USER),)
  USER_HOME=$(shell eval echo ~$(SUDO_USER))
else
  USER_HOME=$(HOME)
endif

all:
	@printf "Run 'make install' to install rc.\n"

install:
	@mkdir -p $(DESTDIR)$(USER_HOME)/.config/rc
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@cp -p rc $(DESTDIR)$(PREFIX)/bin/rc
	@cp -p hosts $(DESTDIR)$(USER_HOME)/.config/rc
	@test -z $(SUDO_USER) || chown -R $(SUDO_USER): $(USER_HOME)/.config/rc
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/rc

uninstall:
	@rm -rf $(DESTDIR)$(USER_HOME)/.config/rc
	@rm -rf $(DESTDIR)$(PREFIX)/bin/rc
