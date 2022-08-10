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
GW_SOFTWARE = octoprint
GW_ADMIN = ${USER}
GW_ADMIN_ID = $(shell id -u)
GW_ADMIN_GID = $(shell id -g)
GW_USER = ${USER}
GW_USER_ID = ${GW_ADMIN_ID}
GW_USER_GID = ${GW_ADMIN_GID}
MCU_ACCESS_METHOD = ssh
GW_OS = linux
GW_OS_BOARD = opiz
GW_OS_VARIANT = armbian

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
  GW_SOFTWARE = ${GW_SOFTWARE}
  GW_ADMIN = ${GW_ADMIN}
  GW_USER = ${GW_USER}
  MCU_ACCESS_METHOD = ${MCU_ACCESS_METHOD}
  GW_OS = ${GW_OS}
  GW_OS_BOARD = ${GW_OS_BOARD}
  GW_OS_VARIANT = ${GW_OS_VARIANT}

Command line targets:
  help-mod          Display this help.
endef

export HelpModMsg
help-mod:
> @echo "$$HelpModMsg" | less
endif
