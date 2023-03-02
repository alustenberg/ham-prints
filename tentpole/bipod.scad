include <lib/inc.scad>
$fs=.2;

module assembly(d=8.2, h=5,c=14,off=27){
  difference(){
    cylinder(r=20, h=h);

    translate([0,0,-e])
    cylinder(r=d/2,h=h+e2);


    for ( i=[0:3] ){
      rotate([0,0,i*90]) translate([0,off,-e])
      cylinder(r=c,h=h+e2);

      if(i % 2){
        rotate([0,0,i*90+45])
        translate([0,13,-2])
        cylinder(r=3,h=h*2);

        rotate([0,0,i*90-45]) translate([0,13,-2])
        rotate([15,0,0])
        cylinder(r=d/2,h=h*2);
      }
    }
  }
}


assembly();