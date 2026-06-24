include <lib/inc.scad>
$fa=5;

tripod=false;


module body(id,th=th,tth=th,l=20,l2=th){
    c=2;
    odp=0.1;
   
    difference(){
        cyl(r=pvc_od/2+th*2+odp,l=l);
        down(c)
        cyl(r=pvc_od/2+th+odp,l=l+c*2+.1);
    }
    
    // bottom lip
    down(l/2-th/2)
    difference(){
        cyl(r=pvc_od/2+th+odp,l=l2);
        down(c)
        cyl(r=pvc_od/2+odp,l=l2+c*2+.1);
    }

    tl=10;
    down(10)
    intersection(){
        cylinder(h=l*2,r=50);

        for(i=[0,1,2]){
            rotate([0,0,i*120-30])
            union(){
                back(25)
                cuboid([2,10,5]);

                back(32.5)
                up(tl-1.5)
                rotate([25,0,0])
                difference(){
                    up(1)
                    cyl(r=arrow_od/2+th,l=l+tl);
                    down(th)
                    cyl(r=arrow_od/2+.2,l=l+tl);
                }
            }
        }
    }

    
}


body(pvc_od);
        