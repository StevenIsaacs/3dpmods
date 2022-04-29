""" This file creates the cable chain support part for printing. """

from solid import rotate

import parts.cable_chain_support as CCS


class Ccs3DP:
    """ This class returns a printable object. """

    def gen_part(self):
        """ Generate the foot and return the resulting part. """
        return CCS.CableChainSupport()


if __name__ == '__main__':
    import sys
    from solid import scad_render_to_file
    o = sys.argv[1] if len(sys.argv) > 1 else 'build/ccs.scad'
    print('Generating: {}'.format(o))
    part = rotate([0, -90, 0])(Ccs3DP().gen_part().part)
    scad_render_to_file(part, o)
