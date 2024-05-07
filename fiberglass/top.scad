//include <../lib/inc.scad>
e=.01;
e2=e*2;
$fs=.1;

module assembly(d=25.8, h=20, off=5){
  r=d/2;

  difference(){
    // main disk
    intersection(){
        cylinder(r1=r+8,r2=r+40, h=h);
        cylinder(r=r+30, h=h);
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
        for(o=[0:2]){
            rotate([10,0,i*120-30]) 
            translate([0,r+12+7*o,-5])
            cylinder(r=3,h=h*2);
        } 
    }
  }
}


assembly();