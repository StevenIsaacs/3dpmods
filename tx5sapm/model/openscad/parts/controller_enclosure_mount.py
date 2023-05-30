""" This part is designed to be used to move the controller enclosure away from
    the extrusion to allow for more space for the feet, the USB connector can
    be accessed after installing the corner brace and, the moving the
    ribbon cable slighly out of the way of the spool holder.
"""

from solid import cube, cylinder, translate, rotate


class ControllerEnclosureMount:
    """ The controller enclosure mount.

    This is designed to attach to the face of the 2020 extrusion. """

    CEM_T = 5
    """ The typical thickness of the mount. """
    CEM_X = 200
    """ The length along the X axis. """
    CEM_Y = 20
    """ The Width along the Y axis. """
    CEM_Z = 20
    """ The overall height along the Z axis. """
    CEM_M_H_X = 90
    """ The X distance between the mount holes on the controller enclosure.
        There are three holes centered and separated by this distance. """
    CEM_M_H_Y = 10
    """ The distance along the Y axis to the center of the controller enclosure
        mount holes. """
    CEM_M_V_X = 100
    """ The distance between the mounting screw holes in the verrtical section.
        There are two hole. """
    CEM_M_V_Z = 10
    """ The Z distance to the center of the mount holes on the vertical. """
    CEM_H_D = 4
    """ Mounting screw hole diameter. """
    CEM_V_D = 5
    """ Mounting screw hole on the vertical diameter. """

    def __init__(self):
        # A screw hole in the vertical. Long enough to pass completely
        # through.
        vsh = rotate([-90, 0, 0])(
            translate([0, 0, -0.5])(
                cylinder(r=self.CEM_V_D / 2,
                         h=self.CEM_T + 1,
                         center=False,
                         segments=10)))
        # The vertical which attaches to the 2020 extrusion.
        cem = cube([self.CEM_X, self.CEM_T, self.CEM_Z])
        # Open the screw holes in the vertical.
        cem -= translate([
            self.CEM_X / 2 - self.CEM_M_V_X / 2,
            0,
            self.CEM_M_V_Z])(vsh)
        cem -= translate([
            self.CEM_X / 2 + self.CEM_M_V_X / 2,
            0,
            self.CEM_M_V_Z])(vsh)

        # A screw hole in the horizontal.
        hsh = translate([0, 0, -0.5])(
                cylinder(r=self.CEM_H_D / 2,
                         h=self.CEM_T + 1,
                         center=False,
                         segments=10))
        # The horizontal which carries the display.
        cem += translate([0, 0, 0])(
                cube([self.CEM_X, self.CEM_Y, self.CEM_T]))
        # Open the screw holes in the horizontal.
        cem -= translate([self.CEM_X / 2 - self.CEM_M_H_X,
                         self.CEM_Y / 2,
                         0])(hsh)
        cem -= translate([self.CEM_X / 2,
                         self.CEM_Y / 2,
                         0])(hsh)
        cem -= translate([self.CEM_X / 2 + self.CEM_M_H_X,
                         self.CEM_Y / 2,
                         0])(hsh)
        self.part = cem
