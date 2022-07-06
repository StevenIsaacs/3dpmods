#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 3dpmods mod kit definitions.
#----------------------------------------------------------------------------
$(info KIT=${KIT})

MOD_DIR = ${KIT_DIR}/${MOD}
MOD_STAGING_DIR = ${STAGING_DIR}/${KIT}/${MOD}

include ${MOD_DIR}/mod.mk

ifeq (${MAKECMDGOALS},help-kit)
define HelpKitMsg
Make segment: kit.mk

3dpmods

This is a supported collection of mods for 3D printers.

Defined previously:
  KIT_DIR = ${KIT_DIR}
    Where the kit is cloned to.

Defines:
  MOD_DIR = ${MOD_DIR}
    Where the mod within the kit is stored.
  MOD_STAGING_DIR = ${MOD_STAGING_DIR}
    Where the mod build output is stored.

Supported mods are:
  tx5aspm   Tronxy X5SA Pro Core XY 3d printer.
endef

export HelpKitMsg
help-kit:
	@echo "$$HelpKitMsg" | less
endif
