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
