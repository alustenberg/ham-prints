include <../lib/inc.scad>

clip=true;

th=3;

c=1;

od=18.91+.02;
l=15;

wd=1.4+0;
out_off=od/2+(th-wd)/2+.2;

    
difference(){
    cyl(r=od/2+th,l=l,chamfer=c);
   
    down(th)
    cyl(r=od/2,l=l, chamfer=0);
    
    down(l)
    left(out_off)
    cylinder(h=l,r=wd/2);
}

