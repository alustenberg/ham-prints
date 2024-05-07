include <../lib/inc.scad>

wt=3;

module mount(pole_d=5,pole_l=10,hook_len=7,off=2){
    difference(){
        cyl(r=pole_d/2+wt,h=pole_l);
        cyl(r=pole_d/2,h=pole_l+e2);
    }
    translate([pole_d/2+hook_len-off,0,-pole_l/4])
    union(){
        cuboid([hook_len,wt,pole_l/2]);
        
        translate([hook_len/2-wt/2,0,pole_l/4])
        cuboid([wt,wt,pole_l]);
    }
}


mount(pole_d=10);