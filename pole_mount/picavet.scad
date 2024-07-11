include <lib/inc.scad>
include <lib/GoPro_Mount.scad>

$fs=.2;
wall_thick=6;

// gopro lens offset to mount
cam_offset=16;

// print area is 200mm x 200mm
arm_len=sqrt(2)*80;



module assembly(p=60){

    rotate([0,0,45])
    cuboid([p,p,wall_thick]);


/*
    up(wall_thick/2)
    rotate([0,90,45])
    forward(cam_offset)
    mount3();
*/
    for(i=[0,1]){
        difference(){
            rotate([0,0,i*90])
            union(){
                cuboid([arm_len*2,wall_thick*2,wall_thick]);

                for(j=[-1,1]){
                    translate([arm_len*j,0,0])
                    cyl(r=wall_thick,h=wall_thick);
                }
            }

            for(j=[-1,1]){
                rotate([0,0,i*90])
                translate([arm_len*j,0,0])
                cyl(r=wall_thick/2,h=wall_thick+e);
            }
        }
    }

}

difference(){
    rotate([0,0,45]) assembly();
    cyl(h=wall_thick*2+e,r=.25*26);
}