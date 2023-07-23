#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# 3dpmods mod kit definitions.
#----------------------------------------------------------------------------
# The prefix k3dp must be unique for all files.
# +++++
# Preamble
ifndef k3dp_id
$(call Enter-Segment,k3dp)
# -----

# Nothing to do before loading the mod.

# +++++
# Postamble
ifneq ($(call Is-Goal,help-${k3dp_seg}),)
$(info Help message variable: help_${k3dp_name}_msg)
define help_${k3dp_name}_msg
Make segment: ${k3dp_seg}.mk

This is a collection of mods for 3D printers.

Defined in kits.mk:
  mod_path = ${mod_path}
    Where the path to the mod in the kit.

Included mods are:
  tx5aspm   Tronxy X5SA Pro Core XY 3d printer.

Command line goals:
  help-${k3dp_seg}   Display this help.
endef
endif # help goal message.

$(call Exit-Segment,k3dp)
else # k3dp_id exists
$(call Report-Segment-Exists,k3dp)
endif # k3dp_id
# -----
