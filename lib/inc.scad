use <BOSL/shapes.scad>
use <BOSL/threading.scad>
use <BOSL/masks.scad>

e = .1;
e2 = e*2;
_mm = 25.4; // inch to mm

$fs=.1;
$fa=1;
th=2.0; // thickness
fl=.1; // fillet

module body(th,w1,w2,h){
    rotate([90,0,0])
    cyl(r=w1/2.00,h=th,fillet=fl);

    rounded_prismoid(size1=[w1,th],size2=[w2,th],h=h,r=fl);

    translate([0,0,h])
    rotate([90,0,0])
    cyl(r=w2/2.00,h=th,fillet=fl);
}

module cutout(d,multi=1.2,th=th,closed=false){
  rotate([90,0,0])
  cyl(r=multi*d/2,h=th+e2);

  if(! closed){
    translate([0,-th/2-e,-d/2*1/multi])
    rotate([0,-45,0])
    translate([1.0,0,-0.9])
    cube([15,th+e2,d]);
  }
}

module assembly(th=th,w1,w2,h,holes){
  rotate([90,0,0])
  difference(){
    body(th,w1,w2,h);
    for(hole = holes){
      translate([0,0,hole[0]/2+hole[1]])
      cutout(d=hole[0],closed=hole[2]);
    }
  }
}
