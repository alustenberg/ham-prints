include <../../lib/inc.scad>

// wall thick
th=2.5;

// wire diameter
wd=1.5+.5;

staff_od=18.91+.02;
mast_od= 25.16+.25;
mast_id= 19.31-.00;
pvc_od=  33.61+.02;
pvc_id=  26.00+.00;
pvc2_od=2.375*25.4-.5;
arrow_od= 7.69+.00;

pvc10_id=26.50+.00;
pvc10_od=33.61+.02;
pvc15_id=40.20+.00;
pvc15_od=48.30+.00;

module base(id,th=th,tth=th,l=15){
    up(l/2)
    difference(){
        cyl(r=id/2+th,l=l);

        up(tth)
        cyl(r=id/2,l=l);
    }
}

module xt30(th=th){
        cuboid([5.5+.1, 10.48+.1,th*2], chamfer=.5);
}
