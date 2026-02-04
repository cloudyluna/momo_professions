PREFIX=$(HOME)/.var/app/org.cataclysmdda.CataclysmDDA/data/cataclysm-dda/mods/le_professions
NICKEL=nickel
SOURCES_DIR=nickel/professions
ALL_SOURCES=$(wildcard $(SOURCES_DIR)/*.ncl)
FORBIDDEN_SOURCES=$(wildcard $(SOURCES_DIR)/prelude.ncl $(SOURCES_DIR)/*-schema.ncl $(SOURCES_DIR)/utilities.ncl)
SOURCES=$(filter-out $(FORBIDDEN_SOURCES), $(ALL_SOURCES))
OUTPUTS=$(SOURCES:.ncl=.json)

all: $(OUTPUTS)

$(OUTPUTS): %.json: %.ncl
	$(NICKEL) export $< --output $@
	mv $@ .

install: $(OUTPUTS)
	mkdir -p $(PREFIX)
	cp -f README.md LICENSE *.json $(PREFIX)

uninstall: $(PREFIX)
	rm -rf $(PREFIX)

clean:
	mv modinfo.json nickel
	rm -f *.json
	mv nickel/modinfo.json .
