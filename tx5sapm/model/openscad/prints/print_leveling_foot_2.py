""" This file creates the leveling foot part for printing. """

from solid import rotate

import parts.leveling_foot_2 as LF2


class Lf23DP:
    """ This class returns a printable object. """

    def gen_part(self):
        """ Generate the foot and return the resulting part. """
        return LF2.LevelingFoot()


if __name__ == '__main__':
    import sys
    from solid import scad_render_to_file
    o = sys.argv[1] if len(sys.argv) > 1 else 'build/leveling_foot_2.scad'
    print('Generating: {}'.format(o))
    lf = rotate([0, 0, 0])(Lf23DP().gen_part().part)
    scad_render_to_file(lf, o)
