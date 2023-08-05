""" This file creates the bed leveling tool for printing. """

from solid import rotate

import parts.bed_level_tool as BLT


class Blt3DP:
    """ This class returns a printable object. """

    def gen_bed_level_tool(self):
        """ Generate the tool and return the resulting part. """
        return BLT.BedLevelTool()


if __name__ == '__main__':
    import sys
    from solid import scad_render_to_file
    o = sys.argv[1] if len(sys.argv) > 1 else 'build/bed_level_tool.scad'
    print('Generating: {}'.format(o))
    blt = rotate([-90, 0, 0])(Blt3DP().gen_bed_level_tool().part)
    scad_render_to_file(blt, o)
