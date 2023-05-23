include <lib/inc.scad>
$fs=.2;

// 53mm wide
module assembly(
    height=60,
    wall_thick=4,
    box_width=54,
    box_depth=39,
    jack_diam=25,
    pole_diam=8.6,
    
    )
{
    
    
    module leg(h=height,r=pole_diam/2+wall_thick,mask=false){
        if ( ! mask ) {
            cyl(r=r,h=h,center=true,chamfer=2);
            
            translate([r,0,0])
            cuboid([20,wall_thick,height]);
        } else {
            translate([0,0,-wall_thick])
            cylinder(h=height-wall_thick,r=pole_diam/2,center=true);

        }
    }
    
    module legs(offset=box_depth/2+pole_diam/0.6,rot=15,mask=false){
        for (i = [-1,1]){
            translate([0,i*offset,-15])
            rotate([rot*i,0,0])
            rotate([0,0,-90*i])
            leg(mask=mask);
        }
    }
    
    module anchor(mask=false,r,h=wall_thick*3,t=wall_thick*2){
        if (! mask ){
            cylinder(h=h,r=r+t);
        } else {
            translate([0,0,-e])
            cylinder(h=h+e2,r=r);
        }
    }
    
    module anchors(offset=0,mask=false,r=8){
        for (i = [-1,1]){
            translate([i*(box_width/2+r*1.5),0,-height/2])
            anchor(mask=mask,r=r);
        }
    }
    wt2=wall_thick*2;

    intersection(){
        cuboid([box_width*2.0,box_depth*2.2,height*1],chamfer=2);
        difference(){
            union(){
                cuboid([box_width+wt2,box_depth+wt2,height],chamfer=1);
                legs();
                anchors();
            }
            translate([0,0,wall_thick])
            cuboid([box_width,box_depth,height]);
            
            // coax cutout
            translate([0,0,-height/2-e])
            cylinder(h=wt2+e2,r=jack_diam/2);
            
           
            legs(mask=true);
            anchors(mask=true);
           
        }
    }
}

assembly();