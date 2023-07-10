#+
# Mod definitions for the Tronxy X5SA Pro 3D Printer.
#-
$(info MOD=${MOD})

# 3D CAD models.
openscad_VARIANT = dev

# Firmware variant.
marlin_VARIANT = 2.1.x
# Marlin specific definitions.
# Which board.
marlin_MOD_BOARD = chitu_f103
# The output firmware image. This differs depending upon the board.
marlin_FIRMWARE = update.cbd

# Remote control software
GW_APP = octoprint
GW_OS = linux
GW_OS_BOARD = opiz
GW_OS_VARIANT = armbian
GW_ADMIN = ${USER}
GW_ADMIN_ID = $(shell id -u)
GW_ADMIN_GID = $(shell id -g)
GW_USER = ${USER}
GW_USER_ID = ${GW_ADMIN_ID}
GW_USER_GID = ${GW_ADMIN_GID}
MCU_ACCESS_METHOD = ssh

ifeq (${MAKECMDGOALS},help-mod)
define HelpModMsg
Make segment: mod.mk

This segment defines the MOD specific options for the Tronxy X5SA Pro 3D
printer.

See the other help targets for more information.

Defines (see help for more information):
  CAD_TOOL_3DP = ${CAD_TOOL_3DP}
  openscad_VARIANT = ${openscad_VARIANT}
  FIRMWARE = ${FIRMWARE}
  marlin_VARIANT = ${marlin_VARIANT}
  marlin_MOD_BOARD = ${marlin_MOD_BOARD}
  marlin_FIRMWARE = ${marlin_FIRMWARE}
  GW_APP = ${GW_APP}
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
