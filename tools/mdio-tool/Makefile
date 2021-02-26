ifdef _REALRUN

include macro.mk
include *.mk

else
export _REALRUN=1
.DEFAULT_GOAL:=usage
_MAKEFILE=$(CURDIR)/$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
_MAKEFLAGS=$(filter-out --,$(MAKEFLAGS))

.PHONY: $(shell find . -mindepth 1 -maxdepth 1 -type d -printf "%P ")
%: 
	@make -f $(_MAKEFILE) $@ $(filter-out --,$(_MAKEFLAGS))

endif
