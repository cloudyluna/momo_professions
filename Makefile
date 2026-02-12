PROJECT_NAME=momo_professions
PREFIX=$(HOME)/.var/app/org.cataclysmbn.CataclysmBN/data/cataclysm-bn/mods/cbn-mods-meta/$(PROJECT_NAME)
NICKEL=nickel
SOURCES_DIR=nickel/professions
ALL_SOURCES=$(wildcard $(SOURCES_DIR)/*.ncl)
FORBIDDEN_SOURCES=$(wildcard $(SOURCES_DIR)/prelude.ncl $(SOURCES_DIR)/*-schema.ncl $(SOURCES_DIR)/utilities.ncl)
SOURCES=$(filter-out $(FORBIDDEN_SOURCES), $(ALL_SOURCES))
OUTPUTS=$(SOURCES:.ncl=.json)
DIST_DIR=$(PROJECT_NAME)

.PHONY: all

all: $(OUTPUTS)

$(OUTPUTS): %.json: %.ncl
	echo
	$(NICKEL) format $<
	$(NICKEL) export $< --output $@
	mv $@ .
	rename 's/-/_/g' *.json


install: $(OUTPUTS)
	mkdir -p $(PREFIX)
	cp -f README.md LICENSE CHANGELOG.md *.json $(PREFIX)

uninstall: $(PREFIX)
	rm -rf $(PREFIX)

dist: $(OUTPUTS)
	mkdir -p $(DIST_DIR)
	cp -f README.md LICENSE CHANGELOG.md *.json $(DIST_DIR)
	tar -cvzf $(PROJECT_NAME).tar.gz $(DIST_DIR)

clean:
	mv modinfo.json nickel
	rm -f *.json *.tar.gz
	rm -rf $(DIST_DIR)
	mv nickel/modinfo.json .
