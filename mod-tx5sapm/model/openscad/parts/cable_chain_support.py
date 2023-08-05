""" This part is designed to support the cable chain and keep it from sagging
    to the point of interfering with belts etc.
"""

from solid import cube, cylinder, translate, rotate


class CableChainSupport:
    """ The cable chain support.

    This is designed to attach to the face of the 2020 extrusion. """

    PSM_T = 4
    """ The thickness of all members. """
    PSM_W = 20
    """ The width of the support. Sized for 2020 extrusion. """
    PSM_H = 55
    """ The height of the support to the bottom of the tray. """
    PSM_T_X = 30
    """ The length of the tray (X dimension) """
    PSM_T_S_Y = 10
    """ The height of the tray sides from the bottom side of the tray. """
    PSM_F_X = 20
    """ The length of the foot of the support. """
    PSM_S_D = 4.5
    """ The diameter of the screw hole in the foot for attachment to the
        extrusion. """
    PSM_G_X = 5
    """ The length of the guide. This is arbitrary but short enough to not
        interfere with the mounting t-nut. """
    PSM_G_Y = 6.3
    """ A guide attached to the foot. This is the width of the slot in the
        extrusion that the guide slots into. """
    PSM_G_T = 3
    """ The thickness of the guide on the bottom of the foot. """

    def __init__(self):
        # The vertical.
        psm = cube([self.PSM_T, self.PSM_W, self.PSM_H])

        # The top cable chain tray.
        tray = cube([self.PSM_T_X, self.PSM_W, self.PSM_T])
        # A side of the tray.
        side = cube([self.PSM_T_X, self.PSM_T, self.PSM_T_S_Y])
        # Add the sides to the tray.
        tray += translate([0, -self.PSM_T, 0])(side)
        tray += translate([0, self.PSM_W, 0])(side)
        # Add the tray to the vertical.
        psm += translate([0, 0, self.PSM_H - self.PSM_T])(tray)
        # The foot.
        foot = cube([self.PSM_F_X, self.PSM_W, self.PSM_T])
        # A screw hole in the foot.
        fsh = translate([0, 0, -0.5])(
                cylinder(r=self.PSM_S_D / 2,
                         h=self.PSM_T + 1,
                         center=False,
                         segments=10))
        foot -= translate([self.PSM_F_X / 2, self.PSM_W / 2, 0])(fsh)
        # A guide for alignment in the extrusion slot.
        guide = cube([self.PSM_G_X, self.PSM_G_Y, self.PSM_G_T])
        guide -= translate([3.75, -0.5, -self.PSM_G_T])(
            rotate([0, -45, 0])(
                cube([self.PSM_G_X, self.PSM_G_Y + 1, self.PSM_G_T])))
        # Add the guide.
        foot += translate([
            0,
            self.PSM_W / 2 - self.PSM_G_Y / 2,
            -self.PSM_G_T])(guide)
        foot += translate([
            self.PSM_F_X,
            self.PSM_W / 2 + self.PSM_G_Y / 2,
            -self.PSM_G_T])(rotate([0, 0, 180])(guide))
        # Add the foot to the vertical.
        psm += foot
        self.part = psm
