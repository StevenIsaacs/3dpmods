""" This file creates the power supply mount part for printing. """

from solid import rotate

import parts.power_supply_mount as PSM


class Psm3DP:
    """ This class returns a printable object. """

    def gen_part(self):
        """ Generate the foot and return the resulting part. """
        return PSM.PowerSupplyMount()


if __name__ == '__main__':
    import sys
    from solid import scad_render_to_file
    o = sys.argv[1] if len(sys.argv) > 1 else 'build/psm.scad'
    print('Generating: {}'.format(o))
    part = rotate([90, 0, 0])(Psm3DP().gen_part().part)
    scad_render_to_file(part, o)
