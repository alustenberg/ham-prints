include <lib/inc.scad>
$fs=.2;

// 53mm wide
module assembly(
    wall_thick=4,
    height=40,
    box_width=102,
    box_depth=63,
    jack_diam=25,
    pole_diam=8.6,

    )
{


    module leg(h=height*1.1,r=pole_diam/2+wall_thick,mask=false){
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
            translate([0,i*offset,-5])
            rotate([rot*i,0,0])
            rotate([0,0,-90*i])
            leg(mask=mask);
        }
    }

    wt2=wall_thick*2;

    intersection(){
        cuboid([box_width*2.0,box_depth*2.2,height*1],chamfer=2);
        difference(){
            union(){
                cuboid([box_width+wt2,box_depth+wt2,height],chamfer=1);
                legs();
            }
            translate([0,0,wall_thick])
            cuboid([box_width,box_depth,height]);

            // coax cutout
            translate([0,0,-height/2-e])
            cylinder(h=wt2+e2,r=jack_diam/2);

            legs(mask=true);

            // weight savings
            for( x = [ -1, 1 ]){
                for ( y = [ -1, 1 ]){
                    translate([x*box_width / 2.5, y*box_depth / 2,0])
                    cuboid([box_width/2, box_depth/2,height*2],chamfer=5);
                }
            }
        }
    }
}

assembly();