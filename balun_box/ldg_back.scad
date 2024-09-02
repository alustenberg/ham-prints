// dual 240 oct box

include <lib/common.scad>
use <../lib/BOSL/shapes.scad>
use <../lib/BOSL/masks.scad>

w=51.05; // 2"
h=76.37; // 3"
th=3; // stock is 2mm, but 3 holds up better
r1=4/2; // bolt holes
ro=5.2; // bolt hole offset

$fs=.5;
$fa=5;

module cutout(o=0,r=35/2){
    translate([0,0,-w*.5+11])
    rotate([90,0,0])
    cyl(r=r+o,h=32,fillet=5);

}

difference()
{
    intersection(){
        union(){
            cuboid([w,h,th]);
            
            cutout(th);

        }
        
        color("blue",0.2)
        cuboid([w,h,th*10],fillet=2);
        
        color("grey",0.2)
        translate([0,0,th*3])
        cuboid([w+2,h+2,th*7-.01]);
    }
    cutout();
    for(x=[-1,1]){
        for(y=[-1,1]){
            translate([(w/2-ro)*x, (h/2-ro)*y,0])
            cyl(r=r1,h=th*2);
        }
    }

}

