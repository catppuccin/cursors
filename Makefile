PREFIX ?= /usr
CURSOR_THEMES ?= $(patsubst %/index.theme,%,$(wildcard ./dist/*/index.theme))

all: build

build:
	bash build.sh

clean:
	-rm -rf build/ dist/ *.tar.gz

install:
	mkdir -p $(DESTDIR)$(PREFIX)/share/icons
	cp -R $(CURSOR_THEMES) $(DESTDIR)$(PREFIX)/share/icons

uninstall:
	-rm -rf $(foreach cursor_theme,$(CURSOR_THEMES),$(DESTDIR)$(PREFIX)/share/icons/$(cursor_theme))

$(CURSOR_THEMES):
	cp -f AUTHORS LICENSE $@
	tar -C $(dir $@) -czf $(notdir $@)_$(VERSION).tar.gz $(notdir $@)

.PHONY: all build clean dist install uninstall $(CURSOR_THEMES)
