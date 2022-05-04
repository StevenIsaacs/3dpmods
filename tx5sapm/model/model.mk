# Enable this if using Octoprint.
# USE_OCTOPRINT = YES
# Enable this if using an Raspberry PI 3 for Octoprint.
# USE_RPI3 = YES
# Enable this if using an Orange PI Zero for Octoprint.
# USE_OPIZ = YES

ifeq (${USE_OCTOPRINT},YES)
$(info Adding parts for Octoprint)
ifeq (${USE_RPI3},YES)
$(info Adding case for Raspberry Pi 3)
OCTOPRINT_DEPS = \
  ${OSC_STL_DIR}/rpi_3b_top.stl \
  ${OSC_STL_DIR}/rpi_3b_bottom.stl
endif
ifeq (${USE_OPIZ},YES)
$(info Adding case for Orange Pi Zero)
OCTOPRINT_DEPS = \
  ${OSC_STL_DIR}/opiz_top.stl \
  ${OSC_STL_DIR}/opiz_bottom.stl
endif
endif

#++++++++++++++++++++++++++++++++++++++++
# From the Tronxy XS5A Pro zip file.
#----------------------------------------

# The X mount needs to be modified. A SolidPython script
# will be used. At that time this needs to be replaced
# with a dependency on the script.
${OSC_STL_DIR}/x_motor_mount_X5SA.stl: \
  ${OSC_OTS_DIR}/djb-x.stl
	mkdir -p $(@D)
	cp $< $@

${OSC_STL_DIR}/y_motor_mount_X5SA.stl: \
  ${OSC_OTS_DIR}/djb-y.stl
	mkdir -p $(@D)
	cp $< $@

#++++++++++++++++++++++++++++++++++++++++
# Downloaded from the net.
#----------------------------------------
# This corner brace stiffens the frame significantly.
# https://www.thingiverse.com/thing:2878626
${OSC_STL_DIR}/Cornerbrackets.stl:
	mkdir -p $(@D)
	wget -O $@ \
	  https://cdn.thingiverse.com/assets/d6/30/9e/1f/7d/Cornerbrackets.STL

# These are a much better way of holding a belt than the tie straps supplied
# by Tronxy. Face the teeth of the belt inward so that one side holds the
# other and slip the holder over both layers. The teeth of the belt do the
# rest.
# https://www.thingiverse.com/thing:2354961
${OSC_STL_DIR}/x-belt-holder-gt2.stl:
	mkdir -p $(@D)
	wget -O $@ \
	  https://cdn.thingiverse.com/assets/20/e0/50/20/35/X-Belt-Holder-GT2.stl

# https://www.thingiverse.com/thing:2354961
${OSC_STL_DIR}/x-belt-holder-thin-gt2.stl:
	mkdir -p $(@D)
	wget -O $@ \
	  https://cdn.thingiverse.com/assets/2e/a0/07/b3/cd/X-Belt-Holder-Thin-GT2.stl

# Running OctoPrint has some advantages -- one of which is display of the
# bed leveling mesh.

# For a Raspberry PI 3b.
# https://www.thingiverse.com/thing:3046390
${OSC_STL_DIR}/rpi_3b_top.stl:
	mkdir -p $(@D)
	wget -O $@ \
	  https://cdn.thingiverse.com/assets/ca/1f/da/dd/38/Ender3OctopiTop.stl

${OSC_STL_DIR}/rpi_3b_bottom.stl:
	mkdir -p $(@D)
	wget -O $@ \
	  https://cdn.thingiverse.com/assets/f1/4b/1b/8b/d8/RaspPi_Bp_bottom_case_V2.stl

# For a Orange PI Zero.
# Instructions at: https://daumemo.com/installing-octoprint-on-orangepi-zero-part-1/
# NOTE: Openscad source is also available.
# https://www.thingiverse.com/thing:3157217
${OSC_STL_DIR}/opiz_top.stl:
	mkdir -p $(@D)
	wget -O $@ \
	  https://cdn.thingiverse.com/assets/c8/8f/23/bf/e2/opiz_box_top_1v0.stl

${OSC_STL_DIR}/opiz_bottom.stl:
	mkdir -p $(@D)
	wget -O $@ \
	  https://cdn.thingiverse.com/assets/2e/82/97/2c/d4/opiz_box_bottom1_1v0.stl

# Model dependencies.
MODEL_DEPS = \
  ${OSC_STL_DIR}/x_motor_mount_X5SA.stl \
  ${OSC_STL_DIR}/y_motor_mount_X5SA.stl \
  ${OSC_STL_DIR}/Cornerbrackets.stl \
  ${OSC_STL_DIR}/x-belt-holder-gt2.stl \
  ${OSC_STL_DIR}/x-belt-holder-thin-gt2.stl \
  $(OCTOPRINT_DEPS)
