#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 3dpmods mod kit definitions.
#----------------------------------------------------------------------------
$(info KIT=${KIT})

ifeq (${MAKECMDGOALS},help-kit)
define HelpKitMsg
Make segment: kit.mk

3dpmods

This is a supported collection of mods for 3D printers.

Supported mods are:
  tx5aspm   Tronxy X5SA Pro Core XY 3d printer.
endef

export HelpKitMsg
help-kit:
	@echo "$$HelpKitMsg"
endif
