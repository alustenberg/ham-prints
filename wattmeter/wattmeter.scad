include <../lib/inc.scad>

width=15;
thick=5;

module clip(width=width, depth=10, height=40, thick=thick,gap=.5){
    
    difference(){
        cuboid([width,depth+thick*2,height+thick*2],chamfer=2);
        
        
        translate([0,0,0])
        cuboid([width+thick*2,depth,height]);
        
        translate([0,0,thick*3+e])
        cuboid([width+thick*2,depth*gap,height]);
        
        
    }

}


rotate([0,90,0])
union(){
    
    rotate([180,0,0])
    clip(depth=11.9, height=30,gap=0.8);

    translate([0,22.5,22])
    rotate([-60,0,0])
    clip(depth=42, height=24,gap=0.8);
}
