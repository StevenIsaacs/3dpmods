""" This is an adjustable foot designed to accept a 10mm bolt and
    a 5mm screw for attachment to the 2020 extrusion. """

from solid import cube, cylinder, translate, rotate

from math import atan, degrees


class LevelingFoot:
    """ The foot is a cube with a bolt hole and tabs at two corners 90
        degrees apart with a screw hole for attachment to 2020 extrusions.
    """

    LF2_Z = 30
    """ Overall height of the body of the foot. """
    LF2_W = 20
    """ The width of the body of the foot. """
    LF2_E_L = 40
    """ The foot is designed to attach to the corner of two 2020 extrusions.
        Basically two ears attached to the core cube to form an L shape.
    """
    LF2_E_B_T = 5
    """ The thickness of the ear base (where it attaches). """
    LF2_E_W_T = 3
    """ Each ear has an angled wall at the sides to provide stiffness. This
        is the thickness of that wall.
    """
    LF2_B_Z = 25
    """ The depth of the bolt hole with enough clearance for the button
        head mounting screw. """
    LF2_B_D = 9
    """ The diameter of the adjustment foot bolt. """
    LF2_S_D = 4
    """ The diameter of the button head screw hole where attached to the
    2020 extrusion. """

    def __init__(self):
        # The foot body.
        lf = translate([0, 0, 0])(
            cube([self.LF2_W, self.LF2_W, self.LF2_Z]))
        # An ear.
        ear = cube([self.LF2_E_L, self.LF2_W, self.LF2_Z])
        ear -= translate([0, self.LF2_E_W_T, self.LF2_E_B_T])(
            cube([self.LF2_E_L + 1,
                  self.LF2_W - self.LF2_E_W_T * 2,
                  self.LF2_Z]))
        # The taper the walls.
        taper = degrees(atan((self.LF2_Z - self.LF2_E_B_T * 2) / self.LF2_E_L))
        ear -= translate([0, -0.5, self.LF2_Z])(
                rotate([0, taper, 0])(
                    cube([self.LF2_E_L * 1.5, self.LF2_W + 1, self.LF2_E_L])))
        # The hole for the mounting screw.
        ear -= translate([self.LF2_E_L / 4 * 3, self.LF2_W / 2, -0.5])(
            cylinder(
                r=self.LF2_S_D / 2,
                h=self.LF2_E_B_T + 1,
                center=False,
                segments=10))
        # Add the ears.
        lf += translate([self.LF2_W, 0, 0])(ear)
        lf += translate([self.LF2_W, self.LF2_W, 0])(rotate([0, 0, 90])(ear))
        # The adjustment bolt.
        lf -= translate([self.LF2_W / 2, self.LF2_W / 2, self.LF2_E_B_T])(
            cylinder(
                r=self.LF2_B_D / 2,
                h=self.LF2_B_Z + 1,
                center=False,
                segments=20))
        self.part = lf
