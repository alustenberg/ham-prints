include <lib/inc.scad>
$fs=.2;

// 53mm wide
module assembly(
    height=60,
    wall_thick=3,
    box_width=54,
    box_depth=39,
    jack_diam=25,
    pole_diam=9.8,

    )
{
    wt2=wall_thick*2;
    difference(){
        union(){
            cuboid([box_width+wt2,box_depth+wt2,height],chamfer=1);

            translate([0,box_depth/2,0])
            cyl(r=pole_diam*1.5,h=height,center=true,chamfer=1);
        }
        translate([0,0,wall_thick])
        cuboid([box_width,box_depth,height]);


        translate([0,0,-height/2-e])
        cylinder(h=wt2+e2,r=jack_diam/2);


        translate([0,box_depth/2+wall_thick/2+pole_diam/2,-wall_thick])
        cylinder(h=height+e2,r=pole_diam/2,center=true);

    }
}

assembly();