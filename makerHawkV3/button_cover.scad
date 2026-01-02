// all units are mm
use <../lib/BOSL/shapes.scad>

$fs=.2;

w=31.5; // unit full width
sw=28.5; // split width
h=15;  // bracket height
d=28; // bracket depth
wt=2; // wall thick


difference(){
    cuboid([w+2*wt,d+2*wt,h],center=true,chamfer=.5);
    cuboid([w,d,h*2+d],center=true, chamfer=2);

    translate([0,d/2,0])
    cuboid([sw,d,h+2],center=true, chamfer=1);
}
