// dual 240 oct box

include <lib/common.scad>
use <../lib/BOSL/shapes.scad>
use <../lib/BOSL/masks.scad>

thick=50; // across both torids

w=10;
f=0;

ch=thick+wt*w;


difference()
{
    cyl(r=t_r+wt,h=thick+wt,$fa=60);

    translate([0,0,0])
    cyl(r=t_r,h=thick+wt+e,$fa=60);
}

