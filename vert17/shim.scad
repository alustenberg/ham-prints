include <lib/inc.scad>
$fs=.2;

// 53mm wide
module assembly(
    wall_thick=5,
    nut_width=16.04+.5,
    nut_height=31.82,
    screw_diam=9.7+.5,
    collar_diam=34.05,
    )
{
    wt2=wall_thick*2;
    difference(){
        union(){
            cyl(r=collar_diam/2, h=nut_height);
            
            up(nut_height/2-wall_thick/2)
            cyl(r=collar_diam/2+wall_thick, h=wall_thick);
   
        }
        //up(wall_thick)
        cyl(r=nut_width/2, h=nut_height+wt2,$fa=60);
        //cyl(r=screw_diam/2, h=nut_height+wall_thick*2);
        
        forward(collar_diam-15)
        down(wt2)
        cube([17,15,nut_height],center=true);
    }
}

assembly();