""" Use this tool to manually level the bed. Place one over each of the springs
    between the bed and the support. Turn the adjustors until the bed contacts
    the tool and then back off 1/4 turn. This provides a good starting point
    for fine adjustment using a piece of paper. """

from solid import cube, translate


class ManualBedLevelTool:
    """ The leveling tool for manual leveling.

    Six are needed. One for each rod. Slip these over each spring between
    the bed and the support and then manually turn the adjusters to move
    the bed down until the tool stops any further movement. Do not force. """

    MBLT_T = 3
    """ Typical wall thickness for the tool. """
    MBLT_R_T = 10
    """ The opening for the spring. """
    MBLT_Z = 14
    """ The overall vertical length of the tool. This is long enough to
    allow room for working on the print bed. """
    MBLT_E = 5
    """ The horizontal length of the stabilizing ears. """

    def __init__(self):
        # The basic tool.
        mblt = cube([self.MBLT_R_T + self.MBLT_T * 2,
                    self.MBLT_R_T + self.MBLT_T,
                    self.MBLT_Z])
        # Add the stabilizing ears.
        e = cube([self.MBLT_E, self.MBLT_R_T + self.MBLT_T, self.MBLT_T])
        """
        # Top end.
        mblt += translate(
            [-self.MBLT_E, 0, self.MBLT_Z - self.MBLT_T])(e)
        mblt += translate(
            [self.MBLT_R_T + self.MBLT_T * 2, 0, self.MBLT_Z - self.MBLT_T])(e)
        """
        # Bottom end.
        mblt += translate([-self.MBLT_E, 0, 0])(e)
        mblt += translate([self.MBLT_R_T + self.MBLT_T * 2, 0, 0])(e)
        # Remove the space for the rod.
        mblt -= translate([self.MBLT_T, 0, -0.5])(
            cube([self.MBLT_R_T, self.MBLT_R_T, self.MBLT_Z + 1]))
        self.part = mblt
