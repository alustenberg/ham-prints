include <../lib/shared.scad>

module assembly(th=th,rt=3,holes){
    h=holes[0][1]+0;
    hl=len(holes);

    difference(){
        rotate([-90,0,0])
        body(
            th,
            holes[hl-1][0]*rt,
            holes[0][0]*rt,
            h
        );
  
        for(i = holes){
            translate([0,i[1],0])
            rotate([0,0,i[2]])
            union(){
                cyl(r=i[0]/2,h=th+e);
       
                if(i[2]){
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
}

// wire diam
d=2.5;
lr=3;
th=5*.32;

assembly(holes=[
  [d, d*lr, 0],
  [3.5, 0, 0], // #42
  //[2.5, 0, 0], // #24
  //[2.0, 0, 0], // #18

]);
