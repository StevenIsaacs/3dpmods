#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 3dpmods mod kit definitions.
#----------------------------------------------------------------------------
$(info KIT=${KIT})

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

Supported mods are:
  tx5aspm   Tronxy X5SA Pro Core XY 3d printer.
endef

export HelpKitMsg
help-kit:
> @echo "$$HelpKitMsg" | less
endif
