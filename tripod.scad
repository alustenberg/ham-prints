include <lib/inc.scad>
$fs=.2;

module assembly(d=8.5, h=15,c=22,off=38){
  difference(){
    cylinder(r1=32, r2=28,h=h);

    // center hole
    translate([0,0,-e])
    cylinder(r=d/2,h=h+e2);

    for ( i=[0:2] ){
      rotate([0,0,i*120]) translate([0,off,-e])
      cylinder(r=c,h=h+e2);


      rotate([0,0,i*120-60]) translate([0,24,-2])
      rotate([18,0,0])
      cylinder(r=d/2,h=h*2);
    }
  }
}


assembly();