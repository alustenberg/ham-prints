include <lib/inc.scad>

clip=true;

l=15;
off=1.1;
out_off=10.2;


module cap(){
    difference(){
        union(){
            base(pvc_od);

            color("green")
            down(l/2)
            difference(){
                cyl(r1=staff_od/2+th,r2=pvc_od/2,l=l,chamfer=0);

                down(th)
                cyl(r=staff_od/2,l=l, chamfer=0);
            }
        }

        down(l)
        cyl(r=staff_od/2-2,l=l*3);
/*
        down(l)
        left(out_off)
        cylinder(h=l*3,r=wd/2);
*/
    }
}


rotate([180,0,0])
cap();

