CC_DEFAULT ?= zcc
AS_DEFAULT ?= z80asm
LD_DEFAULT ?= $(CC_DEFAULT)

include $(MWD)/tc-common.mk

CFLAGS += +coleco -subtype=adam
AFLAGS +=
LDFLAGS += +coleco -subtype=adam

ifdef FUJINET_LIB_INCLUDE
  CFLAGS += -I$(FUJINET_LIB_INCLUDE)
endif
ifdef FUJINET_LIB_DIR
  LIBS += -L$(FUJINET_LIB_DIR) -l$(FUJINET_LIB_LDLIB)
endif

define link-bin
  $(LD) $(LDFLAGS) $2 $(LIBS) -o $1
endef

define compile
  $(CC) -c $(CFLAGS) -o $1 $2
endef

define assemble
  $(AS) -c $(AFLAGS) -o $1 $2
endef
