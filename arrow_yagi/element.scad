include <../lib/inc.scad>

th=4;
l=8;
off=1.6;

// arrow 7.69mm d
r1=7.69/2;

// 12awg insulated solid wire 3.0mm
//r2=3.4/2;

// 14awg insulated solid wire 2.8mm
r2=(2.6+0.25)/2;

intersection(){
    difference(){
        union(){
            cuboid([12,8,11],chamfer=.5);
            
            down(r1*off)
            intersection(){
                rotate([90,0,0])
                cyl(r=r1+2,l=l+1);
      /*
                rotate([0,45,0])
                rotate([90,0,0])
                angle_pie_mask(ang=180,l=l,r=50);
        */    }
        }
        
        down(r1*off)
        rotate([90,0,0])
        cyl(r=r1,l=l*2);
            
        up(r2*off)
        rotate([90,0,90])
        cyl(r=r2,l=l*2);
    }
    /* 18-17, workable but rough */
    cuboid([12,8,17],chamfer=0);
}

