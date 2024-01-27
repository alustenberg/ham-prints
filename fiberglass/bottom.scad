include <../lib/inc.scad>
$fs=.1;

module assembly(d=64, h=30, off=10){
  r=d/2;

  difference(){
    // main disk
      union(){
          translate([0,0,+off])
          cylinder(r=r+10, h=h-off);
          
          cylinder(r1=r+2, r2=r+10, h=off);
      }

    // inner cutout
    translate([0,0,off-e])
    cylinder(r=r,h=h+e2);
    
    // outer notches
    for ( i=[0:2] ){
      rotate([0,0,i*120+30]) translate([0,d*2.9,-e])
      cylinder(r=r*4.4,h=h+e2);
    }

    // mounts
    for ( i=[0:2] ){
      rotate([0,0,i*120-30]) translate([0,r+5,-e+off])
      cylinder(r=3,h=h+e2);
        
      rotate([0,0,i*120-30]) translate([0,r+10,-e-(h-off)])
      cylinder(r=8,h=h+e2);
        
         
    }
  }
}


assembly();