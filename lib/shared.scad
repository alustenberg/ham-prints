include <inc.scad>

module body(th,w1,w2,h){
    rotate([90,0,0])
    cyl(r=w1/2.00,h=th,chamfer=fl);

    rounded_prismoid(size1=[w1,th],size2=[w2,th],h=h,r=fl);

    translate([0,0,h])
    rotate([90,0,0])
    cyl(r=w2/2.00,h=th,chamfer=fl);
}

module cutout(d,multi=1.2,th,closed=false){
  rotate([90,0,0])
  cyl(r=multi*d/2,h=th+e2);

  if(! closed){
    translate([0,-th/2-e,-d/2*1/multi])
    rotate([0,-45,0])
    translate([1.0,0,-0.7])
    cube([15,th+e2,d]);
  }
}

module assembly(th=th,w1,w2,holes){
   h=holes[0][1]+0;

  difference(){
    rotate([-90,0,0])
    body(th,w1,w2,h);

    for(i = holes){
       translate([0,i[1],0])
       cyl(r=i[0]/2,h=th+e);

       if(i[2]){
            translate([0,i[1],0])
            rotate([0,0,i[2]])
            translate([-15,0,0])
            cube([30,i[0]*.8,th+e],center=true);
        }
      }

  }
}
