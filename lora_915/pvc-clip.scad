include <lib/inc.scad>

th=4;
l=7;
off=1.1;
r1=arrow_od/2;

difference(){
    //down(2)
    intersection(){
        
        rotate([0,0,45/2])
        cyl(r=l,l=10,$fa=45);
    
        cuboid([15,8,5]);
    }
    
    // arrow 7.69mm d

    
    
    down(r1*off)
    rotate([90,0,0])
    cyl(r=r1,l=l*2);
     
}

w=8;
wt=3; // wall thick
f=0;

module half(r,ang,off=0){
    intersection(){
        difference(){
                cyl(r=r+wt,h=w,fillet=f);
                cyl(r=r,h=w+e);

                translate([0,0,w/2])
                fillet_hole_mask(r=r,fillet=f);

                translate([0,0,-w/2])
                rotate([180,0,0])
                fillet_hole_mask(r=r,fillet=f);

        }
        angle_pie_mask(ang=ang,l=w,r=r*2);
    }
}

// arrow
down(r1+wt-2)
rotate([0,45,0])
rotate([0,90,90])
half(r=r1,ang=270);

// 1" sch 40 PVC
r3=pvc_od/2;
up(r3+wt*off)
rotate([0,180+(360-270)/2,0])
rotate([0,90,90])
half(r=r3,ang=270);