include <../lib/inc.scad>

module assembly(th=th,w1=8,w2=8,holes){
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
            cube([20,i[0]*.75,th+e],center=true);
        }
    }
  }
}
d=2.2;
assembly(w1=d*2.5,w2=d*2.5,holes=[
  [d, d*3*2, 45],
  [d, d*3, 45],
  [d, 0, 180+45],
]);
