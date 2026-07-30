include <lib/inc.scad>
$fa=5;

l=50;
th=3;


module body(){
   
    // 1.5 limit flange
    down(l/2+th/2)
    color("silver")
    difference(){
        cyl(r=pvc15_od/2,l=th);
        cyl(r=pvc15_id/2,l=th+1);
    }
    
    // 1.5 - 1.0 overlap
    difference(){
        cyl(r=pvc15_id/2,l=l+2*th);
        cyl(r=pvc10_od/2,l=l+2*th+1);
    }

    // 1.0 internal limit flang
    up(l/2+th/2)
    color("silver")
    difference(){
        cyl(r=pvc10_od/2,l=th);
        cyl(r=pvc10_id/2,l=th+1);
    }
    
}


body();
        