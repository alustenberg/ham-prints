// transplate box for balun designs 4116 hybrid


use <../lib/BOSL/shapes.scad>
use <../lib/BOSL/masks.scad>

$fs=.1;
$fa=.1;
e=.1;



t_id=35; // inner torid
t_r=t_id/2;

j_off=7; // jib clearance

wt=2.8; // wall thick

ic=10;

if(true){
rotate([0,180,0])
difference()
{
    union(){
        cyl(r=t_r,h=2);
    }
    cyl(r=t_r-wt,h=wt+e);

    for(i=[0:ic]){   
      rotate([0,0,i*360/ic])
      translate([t_r-3,0,0])
      wrap();
    }
}
}else{
    wrap();
}


module wrap(){

    translate([0,.2,-1.55])
    difference(){
        cube(center=true,[20,wt,wt]);
        
        translate([0,0,-1.5-e])
        cube(center=true,[10,wt+e*2,2]);
    }

}