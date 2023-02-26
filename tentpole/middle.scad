include <lib/inc.scad>
$fs=.2;

module assembly(d=8.2, h=5,c=14,off=27){
  difference(){
    cylinder(r=20, h=h);

    translate([0,0,-e])
    cylinder(r=d/2,h=h+e2);


    for ( i=[0:2] ){
      rotate([0,0,i*120+30]) translate([0,off,-e])
      cylinder(r=c,h=h+e2);
    }

    for ( i=[0:2] ){
      rotate([0,0,i*120-30]) translate([0,15,-2])
      rotate([30,0,0])
      cylinder(r=3,h=h*2);
    }
  }
}


assembly();