NICKEL=nickel
SOURCES_DIR=nickel
ALL_SOURCES=$(wildcard $(SOURCES_DIR)/*.ncl)
FORBIDDEN_SOURCES=$(wildcard $(SOURCES_DIR)/*-schema.ncl)
SOURCES=$(filter-out $(FORBIDDEN_SOURCES), $(ALL_SOURCES))
OUTPUTS=$(SOURCES:.ncl=.json)

all: $(OUTPUTS)

$(OUTPUTS): %.json: %.ncl
	$(NICKEL) export $< --output $@
	mv $@ .
