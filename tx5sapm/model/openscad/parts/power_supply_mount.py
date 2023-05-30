""" This part is designed to support the power supply after the controller
    enclosure has been moved away from the extrusion (see
    ControllerEnclosureMount).
"""

from solid import cube, cylinder, translate, rotate

import parts.controller_enclosure_mount as CEM


class PowerSupplyMount:
    """ The power supply mount.

    This is designed to attach to the face of the 2020 extrusion. """

    PSM_X = 20
    """ The length along the X axis. """
    PSM_M_V_Z = 10
    """ The Z distance to the center of the mount holes on the vertical. """

    def __init__(self):
        cem = CEM.ControllerEnclosureMount()
        # A screw hole in the vertical. Long enough to pass completely
        # through.
        vsh = rotate([-90, 0, 0])(
            translate([0, 0, -0.5])(
                cylinder(r=cem.CEM_V_D / 2,
                         h=cem.CEM_T + 1,
                         center=False,
                         segments=10)))
        # The vertical which attaches to the 2020 extrusion.
        psm = cube([self.PSM_X, cem.CEM_T, cem.CEM_Z])
        # Open the screw holes in the vertical.
        psm -= translate([
            self.PSM_X / 2,
            0,
            self.PSM_M_V_Z])(vsh)

        # A screw hole in the horizontal.
        hsh = translate([0, 0, -0.5])(
                cylinder(r=cem.CEM_H_D / 2,
                         h=cem.CEM_T + 1,
                         center=False,
                         segments=10))
        # The horizontal which carries the display.
        h = translate([0, 0, 0])(
                cube([self.PSM_X, cem.CEM_Y, cem.CEM_T]))
        # Open the screw hole in the horizontal.
        h -= translate([self.PSM_X / 2,
                        cem.CEM_Y / 2,
                        0])(hsh)
        psm += translate([0, 0, cem.CEM_Z - cem.CEM_T])(h)
        self.part = psm
