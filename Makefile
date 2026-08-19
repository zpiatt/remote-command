PREFIX = /usr
MANDIR = $(PREFIX)/share/man/man1

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
	@cp -pn hosts $(DESTDIR)$(USER_HOME)/.config/rc
	@test -z $(SUDO_USER) || chown -R $(SUDO_USER): $(USER_HOME)/.config/rc
	@gzip -c rc.1 > $(DESTDIR)$(MANDIR)/rc.1.gz
	@chmod 755 $(DESTDIR)$(PREFIX)/bin/rc

uninstall:
	@rm -rf $(DESTDIR)$(USER_HOME)/.config/rc
	@rm -rf $(DESTDIR)$(PREFIX)/bin/rc
	@rm -rf $(DESTDIR)$(MANDIR)/rc.1*
