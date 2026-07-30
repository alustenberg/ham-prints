include <lib/inc.scad>

clip=true;

th=3.5;
c=th;

od=62.30-0.5;
id=56.87+0.5;

l=20;

    
difference(){
    cyl(r=od/2,l=l,chamfer=1);
   
    up(th)
    cyl(r=id/2,l=l, chamfer=0);
    
    cyl(r=od/2-5,l=l*2);
    
    angle_pie_mask(ang=60,l=l,r=od/2+2);
}

