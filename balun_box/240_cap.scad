// dual 240 oct box

include <lib/common.scad>
use <../lib/BOSL/shapes.scad>
use <../lib/BOSL/masks.scad>


r232=10;
wt=7;

difference()
{

    union(){
        cyl(r=t_r+wt,h=wt,$fa=60);

        translate([0,0,wt])
        cyl(r=t_r,h=wt+e,$fa=60);
    }

    color("grey")
    translate([0,0,wt])
    cyl(r=t_r-wt,h=wt+e*2,$fa=60);


}
