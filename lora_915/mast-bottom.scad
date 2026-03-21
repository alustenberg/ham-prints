include <lib/inc.scad>

clip=true;

th=3.5;
c=1;

l=15;

out_off=13.4;
    
difference(){
    cyl(r=mast_od/2+th,l=l,chamfer=c);
   
    up(th)
    cyl(r=mast_od/2,l=l);
    
    down(l/2-th)
    left(out_off)
    cylinder(h=l,r=wd/2);
}

