include <../lib/inc.scad>

module body(th,w1,w2,h,f=2){
    rotate([90,0,0])
    cyl(r=w1/2.00,h=th,chamfer=fl);

    rounded_prismoid(size1=[w1/f,th],size2=[w2/f,th],h=h,r=fl);

    translate([0,0,h])
    rotate([90,0,0])
    cyl(r=w2/2.00,h=th,chamfer=fl);
}


module assembly(th=th,w1=6,w2=6,holes){
   h=holes[0][1]+0;


  difference(){
    rotate([-90,0,0])
    body(th,w1,w2,h);

    for(i = holes){
       translate([0,i[1],0])
       rotate([0,0,i[2]])
       union(){
            cyl(r=i[0]/2,h=th+e);

            translate([-10,0,0])
            cube([20,i[0]*.8,th+e],center=true);
            if(i[3]){
                translate([-i[3],i[0],0])
                rotate([0,0,0])
                cube([5,i[0]*2,th+e],center=true);
            }

        }
    }
  }
}

d=6;
th=8*.32;
s=2;

assembly(w1=d*s,w2=d*s,holes=[
  [d, 70, 45, 0],
  [d, 0, -45, 0],
]);
