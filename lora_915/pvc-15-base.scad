include <lib/inc.scad>
off=10;
top=true;

module body(id,th=th,tth=th,l=15){
    l2=th*2;

    up(l2/2)
    difference(){
        union(){
            cyl(r=pvc_id/2,l=l2);

            up(l2/2+th)
            cyl(r=pvc_od/2,l=th*2);
        }
        cyl(r=pvc_id/2-th,l=l2+.1);
        
        down(.09)
        cuboid([18,pvc_od,5.1]);
        
        
        if(top){
            tth=10;
            up(tth)
            union(){
                right(off)
                cyl(r=(6.75/2),l=tth);

                down(tth-.1)
                right(off)
                rotate([0,0,30])
                cyl(r=(9.5/2),l=tth,$fa=60);
            }
        }
        
        if(top){
            left(off)
            xt30(th=30);
        }

    }

}

pvc_od=48.30;
pvc_id=40.50;
if(!inc)
body(pvc_od);

