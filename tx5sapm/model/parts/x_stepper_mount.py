""" Modify the X axis stepper mount to raise the stepper motor so that the
belt pully is further down the shaft of the stepper motor reducing the
possibility of wobble of the belt pully. """

from solid import os, import_stl, cube, cylinder, rotate, translate


class XStepperRiser:
    """ X Axis stepper mount riser to be added to the underside of the
    stepper motor mount to raise the stepper so that the belt pully is
    further down on the stepper motor shaft.

    A tab is added to the side of the riser to increase stability of
    the stepper motor mount. """

    XSM_Z = 7.8
    """ The thickness of the mount. """
    XSM_X = 50.6
    """ The width of the mount. """
    XSM_Y = 62.5
    """ The length of the mount. """

    XSR_Z = 6.5
    """ The thickness of the riser. This is so that the belt pulley will be
    flush with the end of the stepper motor shaft when the belt is level. """
    XSR_X = XSM_X
    """ The width of the riser. This is equal to the width of the mount. """
    XSR_Y = 20.0
    """ The length of the riser. The is equal to the width of the 20mm
    frame that the stepper is mounted to. """

    XSR_T_Z = XSR_Z + XSM_Z
    """ Thick enough to cover both the riser and the mount. """
    XSR_T_X = 20
    """ The width of the riser tab which sits on the Y axis printer frame. """
    XSR_T_Y = 20
    """ The length of the riser tab extending down the Y axis printer frame. """
    XSR_T_O = 10
    """ Overlap of the tab and the riser/mount to cover the rounded corner
    of the mount. """

    XSR_H_D = 4
    """ The diameter of the mount screw hole. """
    XSR_H_X_O = 38.0
    """ The offset from the mount left edge to the center of the first mount
    hole. """
    XSR_H_Y_O = 10.0
    """ The offset from the mount back edge to the center of the mount hole.
    Half the width of the 2020 xtrude. """

    def __init__(self):
        stl_dir = os.environ['OSC_OTS_DIR']

        # The mount.
        m = import_stl(stl_dir + 'djb-x.stl')
        # The riser.
        r = cube([self.XSR_X, self.XSR_Y, self.XSR_Z])
        # A screw hole in the riser. Long enough to pass completely through.
        vsh = rotate([0, 0, 0])(
            translate([0, 0, -self.XSR_T_Z / 2])(
                cylinder(r=self.XSR_H_D / 2,
                         h=self.XSR_T_Z + 2,
                         center=True,
                         segments=10)))
        # Open the srew holes in the riser.
        r -= translate([self.DM_X / 2 - self.DM_M_H_X / 2, 0, self.DM_M_H_Z])(
            vsh)
        r -= translate([self.DM_X / 2 + self.DM_M_H_X / 2, 0, self.DM_M_H_Z])(
            vsh)
