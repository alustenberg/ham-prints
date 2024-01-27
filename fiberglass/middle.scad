include <../lib/inc.scad>
$fs=.1;

module assembly(d, h=5){
  r=d/2;

  difference(){
    // main disk
    cylinder(r=r+12, h=h);

    // inner cutout
    translate([0,0,-e])
    cylinder(r=r,h=h+e2);
    
    // outer notches
    for ( i=[0:2] ){
      rotate([0,0,i*120+30]) translate([0,d*2.9,-e])
      cylinder(r=r*4.4,h=h+e2);
    }

    // mounts
    for ( i=[0:2] ){
      rotate([0,0,i*120-30]) translate([0,r+5,-2])
      cylinder(r=3,h=h*2);
    }
  }
}


assembly(d=33);