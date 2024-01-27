// transplate box for balun designs 4116 hybrid


use <../lib/BOSL/shapes.scad>
use <../lib/BOSL/masks.scad>

$fs=.2;
$fa=1;
e=.1;




w=10;
wt=3; // wall thick
f=0;

t_r=48/2; // across torid and wrap
thick=100+wt; // lenght of carrier + cap

so_off=12.85;

pp=8.4; // anderson powerpole side
term_r=5/2;

// quick link
ql_d=5.0;
ql_l=20;

cl_l=5;
cl_d=4;


ch=thick+wt*w;

difference()
{
    rotate([0,0,15])
    cyl(r=t_r+wt,h=thick+wt,$fa=30);

    translate([0,0,wt])
    cyl(r=t_r,h=thick+e);

    cyl(r=45/2,h=thick/2); // measured

    // terminals
    for(i=[1,-1]){
        for(j=[1,-1]){
            rotate([0,0,90*i])
            translate([term_r*j*1.5,t_r,-thick/2+term_r*3+wt])
            rotate([90,0,0])
            cyl(h=wt*3,r=term_r);
        }
    }
    translate([0,0,-wt*3])
    rotate([0,0,0])
    cyl(h=thick,r=term_r);
}
