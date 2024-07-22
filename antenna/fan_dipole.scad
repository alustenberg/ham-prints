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
            if(i[3]){
                translate([-i[3],i[0],0])
                rotate([0,0,0])
                cube([5,i[0]*2,th+e],center=true);
            }
           
        }
    }
  }
}
d=2.5;
th=10*.32;
s=3.5;
rd=3;
a=30;

assembly(w1=d*s,w2=d*s,holes=[
  [d, 180, a, 0],
  [d, 180-rd*d, a, 0],
  [d, 180-rd*d*2, a,0],
  [d, 180-rd*d*3, a,0],

  [d, 90],

  [d, rd*d*3,-a,0],
  [d, rd*d*2,-a,0],
  [d, rd*d, -a, 0],
  [d, 0, -a, 0],
]);
