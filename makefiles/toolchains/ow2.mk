CC_DEFAULT ?= wcc
AS_DEFAULT ?= wasm
LD_DEFAULT ?= wlink OPTION quiet

include $(MWD)/tc-common.mk
CFLAGS += -0 -bt=dos -ms -s -osh -zu
AFLAGS +=
LDFLAGS += SYSTEM dos OPTION MAP LIBPATH $(FUJINET_LIB_DIR)

ifdef FUJINET_LIB_INCLUDE
  CFLAGS += -I$(FUJINET_LIB_INCLUDE)
endif
ifdef FUJINET_LIB_DIR
  LIBS += $(FUJINET_LIB_LDLIB)
endif

define link-bin
  $(LD) $(LDFLAGS) \
    disable 1014 \
    name $1 \
    file {$2} \
    library {$(LIBS)}
endef

define compile
  $(CC) $(CFLAGS) -ad=$(OBJ_DIR)/$(basename $(notdir $2)).d -fo=$1 $2
endef

define assemble
  $(AS) -c $(AFLAGS) -o $1 $2 2>&1
endef
