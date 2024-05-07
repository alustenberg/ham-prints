include <lib/inc.scad>
$fs=.2;
wall_thick=8;
wt2=wall_thick*2;

nut_height=16;
bar_height=100;

module vert_assembly(
    nut_width=bar_height/2,
    screw_diam=9.7+0.5,
    wall_thick=8
    )
{
    difference(){
        intersection(){
            rotate([0,0,180])
            angle_pie_mask(r=nut_width, l=nut_height,ang=180);

            cyl(r=nut_width/2+wall_thick, h=nut_height,$fa=15);
        }

        cyl(r=nut_width/2, h=nut_height+e,$fa=60);
    }
}

module mast_assembly(
    mast_diam=24.8,
    wall_thick=5,
    )
{
    difference(){
        intersection(){
            rotate([0,0,-45])
            angle_pie_mask(r=mast_diam, l=nut_height,ang=270);

            cyl(r=mast_diam/2+wall_thick, h=nut_height);
        }

        //down(3)
        cyl(r=mast_diam/2, h=nut_height+e);
    }
}


module assembly(
    offset=100,
    bridge=70,
    trim=-5,
    width=6,
){
    color("blue")
    vert_assembly();

    color("grey")
    forward(offset)
    mast_assembly();

    color("yellow")
    for(i=[-1,1]){
   
    forward(offset/2-trim)
    left(i*15)
    rotate([0,0,i*10])
    cuboid([width,bridge,nut_height]);
    }
}

rotate([180,0,0])
assembly();