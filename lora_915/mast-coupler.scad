include <lib/inc.scad>

id=20;
l=15;
out_off=13.4;


module cap(){
    difference(){
        union(){
            base(pvc_od);
            
            color("green")
            
            down(l/2-th+.01)
            difference(){
                cyl(r1=mast_od/2+th,r2=pvc_od/2+th,l=l,chamfer=0);

                down(th)
                cyl(r=mast_od/2,l=l, chamfer=0);
            }
        }
        
        down(l)
        cyl(r=id/2,l=l*3);

        // wire guide
        rotate([0,0,0])
        down(l)
        left(out_off)
        
        cylinder(h=l*3,r=wd/2);

    }
}

rotate([180,0,0])
cap();

