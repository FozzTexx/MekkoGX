EXECUTABLE = $(R2R_PD)/$(PRODUCT).prg

MWD := $(realpath $(dir $(lastword $(MAKEFILE_LIST)))..)
include $(MWD)/common.mk
include $(MWD)/toolchains/z88dk.mk

LIBS += -leos.lib

r2r:: $(EXECUTABLE) $(R2R_POSTDEPS)
	make -f $(PLATFORM_MK) $(PLATFORM)/r2r-post
