// transplate box for balun designs 4116 hybrid


use <../lib/BOSL/shapes.scad>
use <../lib/BOSL/masks.scad>

$fs=.2;
$fa=1;
e=.1;


t_r=48/2; // across torid and wrap
thick=0; // across both torids
r232=18/2;

w=10;
wt=3; // wall thick
f=0;

ch=thick+wt*w;

difference(){
    union(){
        rotate([0,0,15])
        cyl(r=t_r+wt,h=thick+wt,$fa=30);

        translate([0,0,wt])
        cyl(r=t_r,h=thick+wt+e);
    }
    
    translate([0,0,wt])
    cyl(r=t_r-wt,h=wt+e*2);

    min_r=42/2;
    // so gap
    translate([0,t_r,wt])
    union(){

        cuboid([t_r*2,t_r,wt+e*2]);
    }

    //so-239
    translate([0,0,-thick/2])
    rotate([0,0,45])
    union(){
        translate([0,0,0])
        cyl(r=r232,h=t_r*2);
        
        for(i=[-1,1]){
            translate([12*i,0,0])
            cyl(r=3.5/2,h=wt*5);
            
            translate([0,12*i,0])
            cyl(r=3.5/2,h=wt*5);
            
        }
    }
    
    
}
