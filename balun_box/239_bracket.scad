// dual 240 oct box

include <lib/common.scad>
use <../lib/BOSL/shapes.scad>
use <../lib/BOSL/masks.scad>

r232=10;

module plate(){
    difference()
    {
        
        union(){
            cuboid([40,40,wt],chamfer=1);
            //cyl(r=t_r+wt,h=wt,$fa=60);

        }

       
        //so-239
        color("blue")
        rotate([0,0,45])
        //translate([0,t_r,0])
        union(){
            translate([0,0,0])
            rotate([0,0,0])
            cyl(r=r232,h=wt*5);

            for(i=[-1,1]){
                translate([25.2/2*i,0,0])
                rotate([0,0,0])
                cyl(r=3.5/2,h=wt*5);

                translate([0,25/2*i,0])
                rotate([0,0,0])
                cyl(r=3.5/2,h=wt*5);

            }
        }
    }
}


union(){
    translate([-20,0,0])
    cuboid([100,60,wt],chamfer=1);
    
   
    intersection(){
        translate([0,0,20])
        cuboid([40,50,40]);
        
        union(){
            for(i=[-1,1]){
                translate([19,i*(20-wt/2),0])
                rotate([90,45,0])
                cuboid([sqrt(40*40*2),sqrt(40*40*2),wt],chamfer=1);
            }
        }
    }

   
    
    translate([20,0,20])
    rotate([0,90,0])
    plate();
}
