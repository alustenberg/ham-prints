include <../lib/inc.scad>

th=4;
l=25;
off=1.1;

// arrow 7.69mm d
r1=7.70/2;

//rotate([180,0,0])
up(2)
difference(){
    //up(1.5)
    up(r1*off)
    intersection(){
        union(){
            rotate([90,0,0])
            cyl(r=r1+2,l=l+1);
        
            down(r1*off)
            cuboid([10,l+1,5]);
        }
  
        rotate([0,45+180,0])
        rotate([90,0,0])
        angle_pie_mask(ang=270,l=l,r=50);
    }

    
    up(r1*off)
    rotate([90,0,0])
    cyl(r=r1,l=l*2);
}           


/*
down(4)
forward(9.049)
import("Joby_Mount.stl");
*/
down(5)
forward(16.5)
right(15.2)
rotate([0,0,90])
//import("GorillaPod_Action_Hyrid_Tripod_Quick_Mount.stl");
import("Joby_Gorillapod_Hybrid_SLR_-_Zoom_Quick_Release_Clip.STL");