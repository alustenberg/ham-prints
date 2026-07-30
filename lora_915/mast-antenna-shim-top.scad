include <lib/inc.scad>

clip=true;

th=3.5;
c=th;

od=62.30+0.5;
id=56.87+0.5;

l=20;


difference(){
    cyl(r1=od/2+0.5,r2=od/2-0.5,l=l,chamfer=2);
    cyl(r=id/2,l=l+1);
}

