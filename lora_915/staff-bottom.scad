include <lib/inc.scad>

clip=true;

th=3.5;
c=th;

od=18.91+.02;
l=15;

out_off=od/2+(th-wd)/2+.4;

    
difference(){
    cyl(r=od/2+th,l=l,fillet=c);
   
    up(th)
    cyl(r=od/2,l=l, chamfer=0);
    
    //up(th)
    left(out_off)
    cylinder(h=l,r=wd/2);
}

