// transplate box for balun designs 4116 hybrid


use <../lib/BOSL/shapes.scad>
use <../lib/BOSL/masks.scad>

$fs=.2;
$fa=1;
e=.1;


wt=3; // wall thick


t_r=48/2; // across torid and wrap

// measured 42mm
// 9:1 28
// ch  20




module so239_mask(){
    r232=18/2;
    rotate([0,0,45])
    union(){
        cyl(r=r232,h=wt*4);
        
        for(i=[-1,1]){
            translate([12*i,0,0])
            cyl(r=3.5/2,h=wt*4);
            
            translate([0,12*i,0])
            cyl(r=3.5/2,h=wt*4);
           
        }
    }
}
module cap(){
    translate([0,0,-wt/2])
    difference(){
        union(){
            rotate([0,0,15])
            cyl(r=t_r+wt,h=wt,$fa=30);

            translate([0,0,wt])
            cyl(r=t_r,h=wt+e);
        }
        
        translate([0,0,wt])
        cyl(r=t_r-wt,h=wt+e*2);

        so239_mask();

    }
}

module sled(){
    min_r=42/2;
    length=100; // across both torids
    
    translate([0,0,length/2])
    difference(){
        union(){
            cyl(r=min_r+wt/1.2, h=length-e);

        }
       
        // half cut
        translate([0,min_r,0])
        cuboid([min_r*4,min_r*2,length+4*e]);
       
       
        // wire cut
        // 25mm wide measured
        translate([min_r/2,0,0])
        intersection(){
            //cyl(r=20/2, h=length+e*5);
            
            translate([6,0,0])
            cuboid([15,50,length]);
        }
        
        // so gap
        translate([0,0,-length/2+8])
        union(){
            cyl(r=min_r,h=20);
            cuboid([min_r*1.5,min_r*3,20]);
        }
        
        // choke
        translate([0,0,-length/2+32])
        union(){
            cyl(r=min_r,h=20);
            cuboid([min_r*1.0,min_r*3,20]);
        }
        
        // 9:1
        translate([0,0,-length/2+58+10])
        union(){
            cyl(r=min_r,h=28);
            cuboid([min_r*1.0,min_r*3,28]);
        }
        
        // legs
        translate([6,0,40])
        //rotate([90,0,0])
        //cyl(r=min_r,h=min_r*3);
        cuboid([min_r,min_r*3,30]);
    }
}

rotate([-90,0,0])
union(){
//cap();

//color("yellow",.3)
sled();
}
