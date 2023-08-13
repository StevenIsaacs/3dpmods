""" This file creates the idler spacer part for printing. """

import parts.idler_spacer as IPS


class Ips3DP:
    """ This class returns a printable object. """

    def gen_part(self):
        """ Generate the spacer and return the resulting part. """
        return IPS.IdlerSpacer()


if __name__ == '__main__':
    import sys
    from solid import scad_render_to_file
    o = sys.argv[1] if len(sys.argv) > 1 else 'build/idler_spacer.scad'
    print('Generating: {}'.format(o))
    ips = Ips3DP().gen_part().part
    scad_render_to_file(ips, o)
