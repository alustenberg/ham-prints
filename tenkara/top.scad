include <../lib/inc.scad>

th=4;

r0=1.8;
off=80;
off2=10;
r=off*3;

difference(){
    assembly(w1=13,w2=8,th=th,holes=[
        [2.2, off, 60],
        //[2.2, 35, 180+45],
        [6.7, 0]
        ]);

/*
    for(i=[-1,1]){
        translate([i*r,off/2+off2,0])
        cyl(r=(r-r0),h=th+e);
    }
*/
}
