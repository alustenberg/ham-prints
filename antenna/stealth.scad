include <../lib/shared.scad>

module assembly(th=th,w1=8,w2=8,wf=.6,holes){
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
            cube([20,i[0]*wf,th+e],center=true);
            if(i[3]){
                translate([-i[3],i[0],0])
                rotate([0,0,0])
                cube([5,i[0]*2,th+e],center=true);
            }
           
        }
    }
  }
}
cord_d=1.5;
wire_d=1.1;

th=5*.32;

assembly(w1=cord_d*2.6,w2=wire_d*2.8,holes=[
  //[d, d*9, 45, 4.5],
  //[d, d*7, 45, 4.5],
  [wire_d, cord_d*2, 45, 4],
  [cord_d, 0, 45-90],
]);
