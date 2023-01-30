include <lib/inc.scad>



module assembly(oh=25,bth=10,th=10){
  difference(){
    cylinder(r1=55/2, r2=30/2, h=oh);

    translate([0,0,bth/2])
    trapezoidal_threaded_rod(d=3/8*_mm, l=bth, pitch=1/16*_mm, thread_angle=29, $fn=32);

    translate([0,0,oh-th+e])
    cylinder(r=11.2/2,h=th);
  }
}


assembly();