""" Use this tool to level the bed. Place one over each of the rods and then
move the bed until it stops against the tool. """

from solid import cube, translate


class BedLevelTool:
    """ The leveling tool.

    Four are needed. One for each rod. Slip these over each rod and then
    manually turn the screw to move the bed mount up until the tool stops
    any further movement. Do not force. """

    BLT_T = 3
    """ Typical wall thickness for the tool. """
    BLT_R_T = 8
    """ The opening for the rod. """
    BLT_Z = 42
    """ The overall vertical length of the tool. This is long enough to
    allow room for working on the print bed. """
    BLT_E = 10
    """ The horizontal length of the stabilizing ears. """

    def __init__(self):
        # The basic tool.
        blt = cube([self.BLT_R_T + self.BLT_T * 2,
                    self.BLT_R_T + self.BLT_T,
                    self.BLT_Z])
        # Add the stabilizing ears.
        e = cube([self.BLT_E, self.BLT_R_T + self.BLT_T, self.BLT_T])
        # Top end.
        blt += translate(
            [-self.BLT_E, 0, self.BLT_Z - self.BLT_T])(e)
        blt += translate(
            [self.BLT_R_T + self.BLT_T * 2, 0, self.BLT_Z - self.BLT_T])(e)
        # Bottom end.
        blt += translate([-self.BLT_E, 0, 0])(e)
        blt += translate([self.BLT_R_T + self.BLT_T * 2, 0, 0])(e)
        # Remove the space for the rod.
        blt -= translate([self.BLT_T, 0, -0.5])(
            cube([self.BLT_R_T, self.BLT_R_T, self.BLT_Z + 1]))
        self.part = blt
