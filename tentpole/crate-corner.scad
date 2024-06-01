include <lib/inc.scad>
$fs=1/2;
$fa=1/1;
// 53mm wide
module assembly(
    height=20,
    wall_thick=3,
    box_width=30,
    box_depth=30,
    pole_diam=10.0,
    end_cap=0,
    )
{
    wt2=wall_thick*2;
    difference(){
        union(){
            intersection(){
                cuboid([box_width+wt2,box_depth+wt2,height],chamfer=1);

                translate([0,0,0])
                rotate([0,0,45])
                cuboid([box_width+wt2,box_depth+wt2,height],chamfer=1);
            }

        }
        /*
        translate([0,0,wall_thick])
        cuboid([box_width,box_depth,height]);
        */

        translate([0,0,end_cap])
        cylinder(h=height+e2,r=pole_diam/2,center=true);

        rotate_extrude() translate([box_width-5,0,0]) circle(7);
    }
}


assembly();

translate([40,0,0]) assembly(end_cap=3);
