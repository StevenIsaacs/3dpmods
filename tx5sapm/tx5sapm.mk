#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Mod definitions for the Tronxy X5SA Pro 3D Printer.
#----------------------------------------------------------------------------
# The prefix mtx5sa must be unique for all files.
# +++++
# Preamble
ifndef mtx5sa_id
$(call Enter-Segment,mtx5sa)
# -----

# 3D CAD models.
openscad_VERSION := dev
$(call Use-Segment,model/openscad)

# Firmware variant.
marlin_VERSION := 2.1.x
# Marlin specific definitions.
# Which board.
marlin_MOD_BOARD := chitu_f103
# The output firmware image. This differs depending upon the board.
marlin_FIRMWARE := update.cbd
$(call Use-Segment,firmware/marlin)

# Remote control software
GW_OS := linux
GW_OS_BOARD := opiz
GW_OS_VARIANT := armbian
GW_ADMIN := ${USER}
GW_ADMIN_ID := $(shell id -u)
GW_ADMIN_GID := $(shell id -g)
GW_USER := ${USER}
GW_USER_ID := ${GW_ADMIN_ID}
GW_USER_GID := ${GW_ADMIN_GID}
MCU_ACCESS_METHOD := headless
GW_APP := octoprint
$(call Use-Segment,gw_app/${GW_APP})

# +++++
# Postamble
ifneq ($(call Is-Goal,help-${mtx5sa_seg}),)
$(info Help message variable: help_${mtx5sa_name}_msg)
define help_${mtx5sa_name}_msg
Make segment: ${mtx5sa_seg}.mk

This segment defines the MOD specific options for the Tronxy X5SA Pro 3D
printer.

See the other help targets for more information.

Defines (see help for more information):
  CAD_TOOL_3DP := ${CAD_TOOL_3DP}
  openscad_VERSION := ${openscad_VERSION}
  FIRMWARE := ${FIRMWARE}
  marlin_VERSION := ${marlin_VERSION}
  marlin_MOD_BOARD := ${marlin_MOD_BOARD}
  marlin_FIRMWARE := ${marlin_FIRMWARE}
  GW_APP := ${GW_APP}
  GW_ADMIN := ${GW_ADMIN}
  GW_USER := ${GW_USER}
  MCU_ACCESS_METHOD := ${MCU_ACCESS_METHOD}
  GW_OS := ${GW_OS}
  GW_OS_BOARD := ${GW_OS_BOARD}
  GW_OS_VARIANT := ${GW_OS_VARIANT}

Command line goals:
  help-${mtx5sa_seg}   Display this help.
endef
endif # help goal message.

$(call Exit-Segment,mtx5sa)
else # mtx5sa_id exists
$(call Report-Segment-Exists,mtx5sa)
endif # mtx5sa_id
# -----
