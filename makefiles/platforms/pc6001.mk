EXECUTABLE = $(R2R_PD)/$(PRODUCT_BASE).ptp
LIBRARY = $(R2R_PD)/$(PRODUCT_BASE).$(PLATFORM).lib
AS_DEFAULT = zcc

MWD := $(realpath $(dir $(lastword $(MAKEFILE_LIST)))..)
include $(MWD)/common.mk
include $(MWD)/toolchains/z88dk.mk

PC6001_FLAGS = +pc6001
CFLAGS += $(PC6001_FLAGS)
ASFLAGS += $(PC6001_FLAGS) -c
LDFLAGS += $(PC6001_FLAGS)

r2r:: $(BUILD_EXEC) $(BUILD_LIB) $(R2R_EXTRA_DEPS_$(PLATFORM_UC))
	make -f $(PLATFORM_MK) $(PLATFORM)/r2r-post
