include <lib/inc.scad>
$fs=.2;
wall_thick=8;
wt2=wall_thick*2;
nut_height=31.82;


// 53mm wide
module vert_assembly(
    nut_width=16.04+0.5,
    screw_diam=9.7+0.5,

    )
{

    difference(){
        union(){
            cyl(r=nut_width/2+wall_thick, h=nut_height,$fa=30);
        }
        cyl(r=nut_width/2, h=nut_height+wt2,$fa=60);

    }
}

module mast_assembly(
    mast_diam=25.13+0.0,
    )
{
    difference(){
        union(){
            cyl(r=mast_diam/2+wall_thick, h=nut_height);
        }
        down(3)
        cyl(r=mast_diam/2, h=nut_height);
    }
}


module assembly(
    offset=35,
    bridge=8,
    trim=3,
){
    color("blue")
    vert_assembly();

    color("grey")
    forward(offset)
    mast_assembly();

    color("yellow")
    forward(offset/2-trim)
    cuboid([26,12,nut_height]);
}

rotate([180,0,0])
assembly();