include <../lib/inc.scad>

/* wiring
black  85  coil
white  86  coil
red    30  common
yellow 87a norm close
blue   87  norm open
*/

module brace(
    width=27,
    mount_thick=12, // 12 / 2 = 6, 6=thick*3
    thick=2,
    switch_d=7,
    lip=5,
){
    difference(){
        union(){
            difference(){
                cuboid([width,width,thick]);
                cyl(r=switch_d/2,h=thick*2);
            }
            
            translate([0,0,thick])
            difference(){
                 cuboid([width,width,thick*2]);
                 cuboid([width-thick*2,width-thick*2,thick*2+e]);
            }
            
            translate([0,0,thick*2])
            difference(){
                 cuboid([width+lip*2,width+lip*2,thick]);
                 cuboid([width-thick*2,width-thick*2,thick+e]);
            }
        }
        
        translate([0,0,thick])
        rotate([0,0,45])
        translate([width/2,0,0])
        cuboid([width,switch_d,thick*4]);
    }
}

rotate([180,0,0])
brace();