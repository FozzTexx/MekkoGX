EXECUTABLE = $(R2R_PD)/$(PRODUCT_BASE).prg
LIBRARY = $(R2R_PD)/$(PRODUCT_BASE).$(PLATFORM).lib
DISK = $(R2R_PD)/$(PRODUCT_BASE).d64
DISK_TOOL_COPY = cc1541

MWD := $(realpath $(dir $(lastword $(MAKEFILE_LIST)))..)
include $(MWD)/common.mk
include $(MWD)/toolchains/cc65.mk

r2r:: $(BUILD_DISK) $(BUILD_EXEC) $(BUILD_LIB) $(R2R_EXTRA_DEPS)
	make -f $(PLATFORM_MK) $(PLATFORM)/r2r-post

$(BUILD_DISK): $(BUILD_EXEC) $(DISK_EXTRA_DEPS) $(DISK_EXTRA_FILES) | $(R2R_PD)
	$(RM) $@
	$(call copy-to-disk,,$<,$(shell echo "$(basename $(notdir $<))" | tr '[:lower:]' '[:upper:]'),$@)
	$(foreach f,$(DISK_EXTRA_FILES),$(call copy-to-disk,,$(f),$(shell echo "$(basename $(notdir $(f)))" | tr '[:lower:]' '[:upper:]'),$@);)

# Arguments:
# $1 == DISK_TOOL_COPY flags
# $2 == source file
# $3 == destination name
# $4 == disk image
define copy-to-disk
    $(DISK_TOOL_COPY) -f $3 -w $2 $4
endef
