""" This is an adjustable foot designed to accept a 10mm bolt and
    a 5mm screw for attachment to the 2020 extrusion. """

from solid import cylinder, translate


class LevelingFoot:
    """ The foot is a cylinder with a bolt hole at one end and a screw hole
        at the other. The depth of the bolt hole is enough to allow for the
        head of a 5mm button head screw.
    """

    LF_Z = 30
    """ Overall height of the foot. """
    LF_B_Z = 25
    """ The depth of the bolt hole with enough clearance for the button
        head mounting screw. """
    LF_D = 20
    """ The overall diameter of the foot. """
    LF_B_D = 9
    """ The diameter of the adjustment foot bolt. """
    LF_S_D = 4
    """ The diameter of the button head screw hole where attached to the
    2020 extrusion. """

    def __init__(self):
        # The foot body.
        lf = translate([0, 0, 0])(
            cylinder(
                r=self.LF_D / 2,
                h=self.LF_Z,
                center=False,
                segments=100))
        # The adjustment bolt.
        lf -= translate([0, 0, 0])(
            cylinder(
                r=self.LF_B_D / 2,
                h=self.LF_B_Z,
                center=False,
                segments=20))
        # The hole for the mounting screw.
        sh = self.LF_Z - self.LF_B_Z
        lf -= translate([0, 0, self.LF_Z - sh / 2 - 0.5])(
            cylinder(
                r=self.LF_S_D / 2,
                h=sh + 1,
                center=True,
                segments=20))
        self.part = lf
