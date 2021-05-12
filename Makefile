#CPUS ?= $(getconf _NPROCESSORS_ONLN)
CPUS ?= $(shell nproc)
MAKEFLAGS += --jobs=$(CPUS)


SCADC?=openscad

SCAD_DIR=SCAD
STL_DIR=STL
DEPS_DIR=SCAD/deps


STL_TARGETS = $(addprefix $(STL_DIR)/,$(patsubst %.scad,%.stl,$(notdir $(wildcard $(SCAD_DIR)/*.scad))))
DEPS_TARGETS = $(addprefix $(DEPS_DIR)/,$(patsubst %.scad,%.deps,$(notdir $(wildcard $(SCAD_DIR)/*.scad))))

default: all

.PHONY: all models clean
all: models
models: $(STL_TARGETS)

deps: $(DEPS_TARGETS)

%.deps: ../%.scad

$(STL_DIR)/%.stl: $(SCAD_DIR)/%.scad
	$(SCADC) -o $@ $<

clean:
	rm -f STL/*