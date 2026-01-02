include <../lib/shared.scad>

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
       
            if(i[2]){
                translate([-10,0,0])
                cube([20,i[0]*.8,th+e],center=true);
            }
        }
    }
  }
}

d=3.8;
th=2;
s=2.2;

assembly(w1=d*s,w2=d*s,holes=[
  [d, d*2, 0],
  [d, 0, -30],
]);
