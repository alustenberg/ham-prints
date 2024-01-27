include <../lib/inc.scad>

in=37+14;

module brace(
    width=20, inner=in, outer=in+8, depth=120,
    off=20, mount_off=30, thick=4){
    difference(){
        linear_extrude(width){
            polygon([
                [0,0], // top
                [depth,0], // bottom
                [depth, thick+e], // bottom chamf
                [depth-thick*5, thick+e], // mid chamf
                [off+thick*2,inner], // inner offset
                [off,inner], // inner offset
                [off, outer+thick], // outer offset
                [off+thick*2, outer+thick], // lip inner bottom?
                [off+thick*2, outer+thick*2], // lip outer bottom
                [off-thick/2,outer+thick*2], // lip outer top
            
                //[off-thick,outer],
                [0,inner],
            ]);
        };
        
        // window cutout
        translate([0,0,+e])
        linear_extrude(width){
            polygon([
                [off+thick*2,thick], // top
                [depth-thick*8,thick], // bottom
                [off+thick*2,inner-thick*2], // inner offset
            ]);
        };
        // top cutout
        translate([-e,thick,-e])
        cube([off-thick,outer,width-thick]);
        
        // bottom cutout
        translate([off+e,thick,-e])
        cube([depth-off-thick,outer,width-thick]);
        
    
        for(i=[mount_off,mount_off + 60]){
            translate([i,thick+e,width/2-thick/2])
            rotate([90,0,0])
            cylinder(h=thick+e2,r=5.5/2);
        }
    }
}

rotate([180,0,0])
brace();