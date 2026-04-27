include <lib/inc.scad>


l=117;
off=20;

cyl(r=mast_id/2-wd,l=l+wd*2.2);


for(i = [-1,1]){
    up(l/2)
    rotate([90,0,off*i])
    cyl(r=wd,l=mast_id+wd);


    down(l/2)
    rotate([90,0,off*i])
    cyl(r=wd,l=mast_id+wd);
}
