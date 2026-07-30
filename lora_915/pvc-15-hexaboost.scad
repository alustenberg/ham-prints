include <lib/inc.scad>
$fa=5;

module body(id,th=th,tth=th,l=15){
    c=2;
 
    // ant side
    ant_od=22.9;
    l2=30;
    up(l2/2)
    color("silver")
    difference(){
        cyl(r1=pvc15_od/2,r2=ant_od/2+3,l=l2);
        down(1)
        cyl(r=ant_od/2,l=l2+2.1);
    }
    
    // coupler
    /*
    cl+=15;
    up(15)
    color("red")
    difference(){
        cyl(r1=pvc_od/2+th,r2=ant_od/2+th,l=cl);
        up(0)
        cyl(r1=pvc_od/2,r2=ant_od/2,l=cl+.1);
    }
    */

    down(10)
    color("green")
    difference(){
        nid=16.0;
        cyl(r=pvc15_id/2+.00,l=20);
        cyl(r=nid/2,l=22);
        down(5.01)
        cyl(r=pvc10_od/2,l=10);
    }
}

body(pvc_od);
        