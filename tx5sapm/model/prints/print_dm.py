""" This file creates the container frame part for printing. """

import parts.disp_mount as DM


class Dm3DP:
    """ This class returns a printable object. """

    def gen_display_mount(self):
        """ Generate the frame and return the resulting part. """
        return DM.DispMount()


if __name__ == '__main__':
    import sys
    from solid import scad_render_to_file
    o = sys.argv[1] if len(sys.argv) > 1 else 'build/disp_mount.scad'
    print('Generating: {}'.format(o))
    scad_render_to_file(Dm3DP().gen_display_mount().part, o)
