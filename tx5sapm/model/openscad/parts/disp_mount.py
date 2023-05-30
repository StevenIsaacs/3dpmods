""" This part is designed to be used to mount the display at the rear of
the printer so that the rear can become the front. This makes loading
of filament a lot easier.
"""

from solid import cube, cylinder, translate, rotate


class DispMount:
    """ The display mount.

    This is designed to attach to the face of the 2020 extrusion. """

    DM_T = 5
    """ The typical thickness of the mount. """
    DM_X = 120
    """ The length along the X axis. """
    DM_Y = 20
    """ The Width along the Y axis. """
    DM_Z = 40
    """ The overall height along the Z axis. """
    DM_M_H_X = 80
    """ The X distance between the mount holes. The holes are centered
    this far apart. """
    DM_M_H_Z = 10
    """ The Z distance to the center of the mount holes. """
    DM_D_H_X = 75
    """ The X distance between the display mount holes. The holes are
    centered this far apart. """
    DM_D_H_Y = 10
    """ The Y distance to the center of the display mount holes. """
    DM_H_D = 4
    """ Mounting screw hole diameter. """

    def __init__(self):
        # A screw hole in the vertical. Large enough to pass completely
        # through.
        vsh = rotate([90, 0, 0])(
            translate([0, 0, -self.DM_T / 2])(
                cylinder(r=self.DM_H_D / 2,
                         h=self.DM_T + 2,
                         center=True,
                         segments=10)))
        # The vertical which attaches to the 2020 xtrude.
        dm = cube([self.DM_X, self.DM_T, self.DM_Z])
        # Remove screw holes in the vertical.
        dm -= translate([self.DM_X / 2 - self.DM_M_H_X / 2, 0, self.DM_M_H_Z])(
            vsh)
        dm -= translate([self.DM_X / 2 + self.DM_M_H_X / 2, 0, self.DM_M_H_Z])(
            vsh)

        # A screw hole in the horizontal.
        hsh = translate([0, 0, self.DM_T / 2])(
                cylinder(r=self.DM_H_D / 2,
                         h=self.DM_T + 2,
                         center=True,
                         segments=10))
        # The horizontal which carries the display.
        dm += translate([0, 0, self.DM_Z - self.DM_T])(
                cube([self.DM_X, self.DM_Y, self.DM_T]))
        # Remove the screw holes in the horizontal.
        dm -= translate([self.DM_X / 2 - self.DM_D_H_X / 2,
                         self.DM_Y / 2,
                         self.DM_Z - self.DM_T])(hsh)
        dm -= translate([self.DM_X / 2 + self.DM_D_H_X / 2,
                         self.DM_Y / 2,
                         self.DM_Z - self.DM_T])(hsh)
        self.part = dm
