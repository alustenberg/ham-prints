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
d=2.3;
th=5*.32;

assembly(w1=d*2.6,w2=d*2.8,holes=[
  //[d, d*9, 45, 4.5],
  //[d, d*7, 45, 4.5],
  [d, d*5, 45, 4.5],
  [d, 0, 180+70, 7],
]);
