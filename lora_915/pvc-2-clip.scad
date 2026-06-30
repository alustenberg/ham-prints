include <lib/inc.scad>

th=4;
l=7;
off=1.1;

  
w=8;
wt=4; // wall thick
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




rotate([0,45,0])
rotate([0,90,90])
half(r=staff_od/2,ang=270);

sl=90;
sl2=136;

for(i=[-1, 1]){
    rotate([0,15*i,0])
    left(-8*i)
    up(sl2/3.05)
    cuboid([4,w,sl2/2+wt]);
}

r3=pvc2_od/2;
up(sl)
rotate([0,180+(360-270)/2,0])
rotate([0,90,90])
half(r=pvc2_od/2,ang=270);