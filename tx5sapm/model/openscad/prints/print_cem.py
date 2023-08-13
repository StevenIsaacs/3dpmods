""" This file creates the controller enclousure mount part for printing. """

from solid import rotate

import parts.controller_enclosure_mount as CEM


class Cem3DP:
    """ This class returns a printable object. """

    def gen_part(self):
        """ Generate the foot and return the resulting part. """
        return CEM.ControllerEnclosureMount()


if __name__ == '__main__':
    import sys
    from solid import scad_render_to_file
    o = sys.argv[1] if len(sys.argv) > 1 else 'build/cem.scad'
    print('Generating: {}'.format(o))
    part = rotate([0, 0, 0])(Cem3DP().gen_part().part)
    scad_render_to_file(part, o)
