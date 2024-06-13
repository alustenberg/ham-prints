include <lib/inc.scad>
include <lib/GoPro_Mount.scad>

$fs=.2;
wall_thick=4;
wt2=wall_thick*2;

nut_height=15;
mast_diam=32-.5;

// gopro lens offset to mount
cam_offset=15;
mount_offset=3;

module mast_assembly(    )
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


module assembly(){
    difference(){
        union(){
            color("grey")
            mast_assembly();

            // shim
            back(mast_diam/2-3)
            left(cam_offset+.1)
            rotate([0,0,30])
            cyl(r=12,h=nut_height,$fn=3);


            back(mast_diam/2+mount_offset)
            left(cam_offset)
            rotate([0,0,-90])
            mount3();
        }
        
        // duplicate mast_assembly mask
        cyl(r=mast_diam/2, h=nut_height+e);
    }
}

//rotate([180,0,0])
assembly();