// transplate box for balun designs 4116 hybrid


use <../lib/BOSL/shapes.scad>
use <../lib/BOSL/masks.scad>

$fs=.2;
$fa=1;
e=.1;


t_r=45; // across torid and wrap

wt=5; // wall thick

difference()
{
    union(){
        cyl(r=t_r+wt,h=wt,$fa=60);

        translate([0,0,wt])
        cyl(r=t_r,h=wt+e,$fa=60);
    }
    translate([0,0,wt])
    cyl(r=t_r-wt,h=wt+e*2,$fa=60);
}
