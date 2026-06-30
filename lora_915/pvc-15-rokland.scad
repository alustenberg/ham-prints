include <lib/inc.scad>
$fa=5;

//nid=16.0;
nid=20.50; // why would you use n male here??!?!
off=7;

module body(id,th=th,tth=th,l=15){
    c=2;

    // ant side
    ant_od=24.60;
    l2=58;

    up(l2/2)
    color("silver")
    difference(){
        union(){
            cyl(r=pvc_id/2,l=l2);

            up(l2/2+th)
            cyl(r=pvc_od/2,l=th*2);
        }
        down(1)
        left(off)
        cyl(r=ant_od/2,l=l2*2);
    }

    down(10/2-.1)
    color("green")
    difference(){
        cyl(r=pvc_id/2,l=10);
        left(off)
        cyl(r=nid/2,l=12);
    }

}

pvc_od=48.30;
pvc_id=40.30;
body(pvc_od);

