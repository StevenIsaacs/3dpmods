#++++++++++++++++++++++++++++++++++++++++
# From the Tronxy XS5A Pro zip file.
#----------------------------------------
$(info CAD model for the Tronxy XS5A Pro mod)

# The X mount needs to be modified. A SolidPython script
# will be used. At that time this needs to be replaced
# with a dependency on the script.
${OSC_STL_PATH}/x_motor_mount_X5SA.stl: \
  ${OSC_OTS_PATH}/djb-x.stl
> mkdir -p $(@D)
> cp $< $@

${OSC_STL_PATH}/y_motor_mount_X5SA.stl: \
  ${OSC_OTS_PATH}/djb-y.stl
> mkdir -p $(@D)
> cp $< $@

#++++++++++++++++++++++++++++++++++++++++
# Downloaded from the net.
#----------------------------------------
${OSC_STL_PATH}/Cornerbrackets.stl:
> mkdir -p $(@D)
> wget -O $@ \
>   https://cdn.thingiverse.com/assets/d6/30/9e/1f/7d/Cornerbrackets.STL

${OSC_STL_PATH}/x-belt-holder-gt2.stl:
> mkdir -p $(@D)
> wget -O $@ \
>   https://cdn.thingiverse.com/assets/20/e0/50/20/35/X-Belt-Holder-GT2.stl

${OSC_STL_PATH}/x-belt-holder-thin-gt2.stl:
> mkdir -p $(@D)
> wget -O $@ \
>   https://cdn.thingiverse.com/assets/2e/a0/07/b3/cd/X-Belt-Holder-Thin-GT2.stl

# Model dependencies.
MODEL_DEPS = \
  ${OSC_STL_PATH}/x_motor_mount_X5SA.stl \
  ${OSC_STL_PATH}/y_motor_mount_X5SA.stl \
  ${OSC_STL_PATH}/Cornerbrackets.stl \
  ${OSC_STL_PATH}/x-belt-holder-gt2.stl \
  ${OSC_STL_PATH}/x-belt-holder-thin-gt2.stl \

# Running OctoPrint has some advantages -- one of which is display of the
# bed leveling mesh.

ifdef OS_BOARD
ifeq (${OS_BOARD},rpi3)
${OSC_STL_PATH}/rpi_3b_top.stl:
> mkdir -p $(@D)
> wget -O $@ \
>   https://cdn.thingiverse.com/assets/ca/1f/da/dd/38/Ender3OctopiTop.stl

${OSC_STL_PATH}/rpi_3b_bottom.stl:
> mkdir -p $(@D)
> wget -O $@ \
>   https://cdn.thingiverse.com/assets/f1/4b/1b/8b/d8/RaspPi_Bp_bottom_case_V2.stl

MODEL_DEPS += \
  ${OSC_STL_PATH}/rpi_3b_top.stl \
  ${OSC_STL_PATH}/rpi_3b_bottom.stl
endif
ifeq (${OS_BOARD},opiz)
${OSC_STL_PATH}/opiz_top.stl:
> mkdir -p $(@D)
> wget -O $@ \
>   https://cdn.thingiverse.com/assets/c8/8f/23/bf/e2/opiz_box_top_1v0.stl

${OSC_STL_PATH}/opiz_bottom.stl:
> mkdir -p $(@D)
> wget -O $@ \
>   https://cdn.thingiverse.com/assets/2e/82/97/2c/d4/opiz_box_bottom1_1v0.stl

MODEL_DEPS += \
  ${OSC_STL_PATH}/opiz_top.stl \
  ${OSC_STL_PATH}/opiz_bottom.stl
endif
endif


ifeq (${MAKECMDGOALS},help-model)
define HelpModelMsg
Make segment: model.mk (Used by ModFW)

This segment defines all the targets for building the 3D printed parts
for the Tronxy X5SA Pro 3D printer mod and is included by the ModFW
top level make file.

Defined in mod.mk:
  OS_BOARD = ${OS_BOARD}
    Which SBC will be used to run OctoPrint. If defined then a 3D printable
    case is generated for the board.

Defined in config.mk:

Defines:

Command line targets:
  help-model    Display this help.

Uses:

Attributions:
  Many thanks to the efforts of others.

  Chassis stiffening
    This corner brace stiffens the frame significantly.
    https://www.thingiverse.com/thing:2878626

  Belt retainers
    These are a much better way of holding a belt than the tie straps supplied
    by Tronxy. Face the teeth of the belt inward so that one side holds the
    other and slip the holder over both layers. The teeth of the belt do the
    rest.
    https://www.thingiverse.com/thing:2354961

  SBC case
    For a Raspberry PI 3b.
    https://www.thingiverse.com/thing:3046390

    For a Orange PI Zero.
    Instructions at: https://daumemo.com/installing-octoprint-on-orangepi-zero-part-1/
    NOTE: OpenScad source is also available.
    https://www.thingiverse.com/thing:3157217
endef

export HelpModelMsg
help-model:
> @echo "$$HelpModelMsg" | less

endif
