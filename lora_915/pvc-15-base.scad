include <lib/inc.scad>
off=8;

module body(id,th=th,tth=th,l=15){
    l2=th*2;

    up(l2/2)
    color("silver")
    difference(){
        union(){
            cyl(r=pvc_id/2,l=l2);

            up(l2/2+th)
            cyl(r=pvc_od/2,l=th*2);
        }
        
        for(i=[-1,1]){
            left(off*i)
            xt30(th=30);
        }

    }

}

pvc_od=48.30;
pvc_id=40.30;
body(pvc_od);

