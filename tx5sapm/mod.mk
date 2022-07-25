#+
# Mod definitions for the Tronxy X5SA Pro 3D Printer.
#-
$(info MOD=${MOD})

# 3D CAD models.
CAD_TOOL_3DP = openscad
CAD_TOOL_3DP_VARIANT = dev

# Firmware variant.
FIRMWARE = marlin
FIRMWARE_VARIANT = 2.1.x
# Marlin specific definitions.
# Which board.
MARLIN_MOD_BOARD = chitu_f103
# The output firmware image. This differs depending upon the board.
MARLIN_FIRMWARE = update.cbd

# Remote control software
HUI_SOFTWARE = octoprint
HUI_ADMIN = ${USER}
HUI_ADMIN_ID = $(shell id -u)
HUI_ADMIN_GID = $(shell id -g)
HUI_USER = ${USER}
HUI_USER_ID = ${HUI_ADMIN_ID}
HUI_USER_GID = ${HUI_ADMIN_GID}
HUI_ACCESS = ssh
HUI_OS = linux
HUI_OS_BOARD = opiz
HUI_OS_VARIANT = armbian

ifeq (${MAKECMDGOALS},help-mod)
define HelpModMsg
Make segment: mod.mk

This segment defines the MOD specific options for the Tronxy X5SA Pro 3D
printer.

See the other help targets for more information.

Defines (see help for more information):
  CAD_TOOL_3DP = ${CAD_TOOL_3DP}
  CAD_TOOL_3DP_VARIANT = ${CAD_TOOL_3DP_VARIANT}
  FIRMWARE = ${FIRMWARE}
  FIRMWARE_VARIANT = ${FIRMWARE_VARIANT}
  MARLIN_MOD_BOARD = ${MARLIN_MOD_BOARD}
  MARLIN_FIRMWARE = ${MARLIN_FIRMWARE}
  HUI_SOFTWARE = ${HUI_SOFTWARE}
  HUI_ADMIN = ${HUI_ADMIN}
  HUI_USER = ${HUI_USER}
  HUI_ACCESS = ${HUI_ACCESS}
  HUI_OS = ${HUI_OS}
  HUI_OS_BOARD = ${HUI_OS_BOARD}
  HUI_OS_VARIANT = ${HUI_OS_VARIANT}

Command line targets:
  help-mod          Display this help.
endef

export HelpModMsg
help-mod:
> @echo "$$HelpModMsg" | less
endif
