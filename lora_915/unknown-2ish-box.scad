include <lib/inc.scad>

th=4;
l=15;

off=1.1;
r1=arrow_od/2;
pvc2r=2.375*25.4/2-.5;


w=30;
wt=7; // wall thick
f=0;

bracelen=95;

module half(r,ang,w,wt,off=0){
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


// 1" sch 40 PVC
r3=pvc2r;
ang=120;
up(r3+wt)
back(10)
rotate([0,180+(360-ang)/2,0])
rotate([0,90,90])
half(r=r3,ang=120,wt=wt,w=w+20);

// gussest
difference(){
an=110;
up(r3+wt)
rotate([0,180+(360-an)/2,0])
rotate([0,90,90])
half(r=r3,ang=an,wt=wt*4,w=w);

for(i=[-1,1]){
    
    up(10)
    left(i*28)
    rotate([90,0,0])
    cyl(r=2,l=w*2);
}

down(10)
cuboid([bracelen,w+2,30]);

}


up(wt/2)
difference(){
    cuboid([bracelen,w,wt]);
    difference(){
        cuboid([bracelen+wt,23,1.5]);
        cuboid([bracelen-50,23,1.5]);
    }
}