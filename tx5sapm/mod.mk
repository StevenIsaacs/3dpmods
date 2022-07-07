#+
# Mod definitions for the Tronxy X5SA Pro 3D Printer.
#-
$(info MOD=${MOD})

# 3D CAD models.
CAD_TOOL = openscad
CAD_TOOL_VARIANT = dev

# Firmware variant.
FIRMWARE = marlin
FIRMWARE_VARIANT = 2.1.x
# Marlin specific definitions.
# Which board.
MARLIN_MOD_BOARD = chitu_f103
# The output firmware image. This differs depending upon the board.
MARLIN_FIRMWARE = update.cbd

# Remote control software
# SERVER_SOFTWARE = octoprint
SBC_BOARD = opiz
OS_VARIANT = debian

ifeq (${MAKECMDGOALS},help-mod)
define HelpModMsg
Make segment: mod.mk

This segment defines the MOD specific options for the Tronxy X5SA Pro 3D
printer.

See the other help targets for more information.

Defines (see help for more information):
  CAD_TOOL = ${CAD_TOOL}
  CAD_TOOL_VARIANT = ${CAD_TOOL_VARIANT}
  FIRMWARE = ${FIRMWARE}
  FIRMWARE_VARIANT = ${FIRMWARE_VARIANT}
  MARLIN_MOD_BOARD = ${MARLIN_MOD_BOARD}
  MARLIN_FIRMWARE = ${MARLIN_FIRMWARE}
  SERVER_SOFTWARE = ${SERVER_SOFTWARE}
  SBC_BOARD = ${SBC_BOARD}
  OS_VARIANT = ${OS_VARIANT}

Command line targets:
  help-mod	        Display this help.
endef

export HelpModMsg
help-mod:
	@echo "$$HelpModMsg" | less
endif
