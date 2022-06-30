#+
# Mod definitions for the Tronxy X5SA Pro 3D Printer.
#-
$(info MOD=${MOD})

# 3D CAD models.
CAD_TOOL = ed-oscad
CAD_TOOL_VARIANT = dev

# Firmware variant.
FIRMWARE = marlin
FIRMWARE_VARIANT = bugfix-2.0.x
# Marlin specific definitions.
# Which board.
MARLIN_MOD_BOARD = chitu_f103

# Remote control software
CONTROL_SOFTWARE = octoprint
SBC_BOARD = opiz
OS_VARIANT = debian

ifeq (${MAKECMDGOALS},help-mod)
define HelpModMsg
Make segment: mod.mk

This segment defines the MOD specific options for the Tronxy X5SA Pro 3D
printer.

See the other help targets for more information.

Defines:
  CAD_TOOL = ${CAD_TOOL}
  CAD_TOOL_VARIANT = ${CAD_TOOL_VARIANT}
  FIRMWARE = ${FIRMWARE}
  FIRMWARE_VARIANT = ${FIRMWARE_VARIANT}
  MARLIN_MOD_BOARD = ${MARLIN_MOD_BOARD}
  CONTROL_SOFTWARE = ${CONTROL_SOFTWARE}
  SBC_BOARD = ${SBC_BOARD}
  OS_VARIANT = ${OS_VARIANT}

Command line targets:
  help-mod	        Display this help.
endef

export HelpModMsg
help-mod:
	@echo "$$HelpModMsg"
endif
