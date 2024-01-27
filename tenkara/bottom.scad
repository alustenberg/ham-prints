include <../lib/inc.scad>

th=5;
off=80;

difference(){
    assembly(w1=32,w2=27,th=th,holes=[
        [21, off],
        [18, off*1/3],
        [18, off*2/3],
        [22, 0]
        ]);

/*
    for(i=[-1,1]){
        translate([i*20,21,0])
        cyl(r=15,h=th+e);
    }
    */
}
