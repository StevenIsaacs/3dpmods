""" Use this spacer between the belt idler plate and the Y axis linear
rail. This allows tightening the alignment screw. """

from solid import cube, cylinder, translate


class IdlerSpacer:
    """ The spacer allows tightening the plate alignment screw.

    Two are needed. One for each idler plate. Slip these under the idler plate
    and then install the screw. The screw can then be tightened. """

    IPS_Z = 1.8
    """ The thickness of the spacer. The distance between the bottom of the
    idler plate and the top of the Y axis rail. """
    IPS_X = 30
    """ The overall length of the spacer. """
    IPS_Y = 20
    """ The width of the spacer. This matches the rail width. """
    IPS_S_O = 8
    """ The distance from the end of the spacer to the center of the
    screw hole. """
    IPS_S_D = 4
    """ The diameter of the screw hole. """

    def __init__(self):
        # The basic tool.
        ips = cube([self.IPS_X,
                    self.IPS_Y,
                    self.IPS_Z])
        ips -= translate([self.IPS_S_O, self.IPS_Y / 2, self.IPS_Z / 2 - 0.5])(
            cylinder(r=self.IPS_S_D / 2 + .1,
                     h=self.IPS_Z + 1,
                     center=True,
                     segments=10))
        self.part = ips
