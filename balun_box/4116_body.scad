// transplate box for balun designs 4116 hybrid


use <../lib/BOSL/shapes.scad>
use <../lib/BOSL/masks.scad>

$fs=.2;
$fa=1;
e=.1;


t_r=45; // across torid and wrap
thick=50; // across both torids

w=10;
wt=5; // wall thick
f=0;

r232=18/2;
so_off=12.85;

pp=8.4; // anderson powerpole side
term_r=6.2/2; 

// quick link
ql_d=5.0;
ql_l=20;

cl_l=5;
cl_d=4;


ch=thick+wt*w;

difference()
{
    cyl(r=t_r+wt,h=thick+wt,$fa=60);

    translate([0,0,wt])
    cyl(r=t_r,h=thick+wt+e,$fa=60);

    //cyl(r=70/2,h=width/2); // measured

    cyl(r=20,h=w);


    //so-239
    translate([0,t_r,0])
    union(){
        translate([0,0,0])
        rotate([90,0,0])
        cyl(r=r232,h=t_r*2);
        
        for(i=[-1,1]){
            translate([12*i,0,0])
            rotate([90,0,0])
            cyl(r=3.5/2,h=wt*5);
            /*
            translate([0,0,15*i])
            rotate([90,0,0])
            cyl(r=1,h=wt*5);
            */
        }
    }

    // terminals
    for(i=[1,-1]){
        rotate([0,0,120*i])
        translate([10*i,t_r,15])
        rotate([90,0,0])
        cyl(h=wt*3,r=term_r);
    }

/*
    // quick link lashing
    for(i=[-1,0,1]){
        translate([i*15,-t_r+wt*2,0])
        rotate([90,0,0])
        cyl(r=2,h=wt*5);
    }
    */
}
