""" This file creates the manual bed leveling tool for printing. """

from solid import rotate

import parts.manual_bed_level_tool as MBLT


class Mblt3DP:
    """ This class returns a printable object. """

    def gen_bed_level_tool(self):
        """ Generate the tool and return the resulting part. """
        return MBLT.ManualBedLevelTool()


if __name__ == '__main__':
    import sys
    from solid import scad_render_to_file
    o = sys.argv[1] if len(sys.argv) > 1 else 'build/mblt.scad'
    print('Generating: {}'.format(o))
    part = rotate([-90, 0, 0])(Mblt3DP().gen_bed_level_tool().part)
    scad_render_to_file(part, o)
