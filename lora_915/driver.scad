include <../lib/inc.scad>

th=4;
l=8;
w=24;

off=1.6;

// arrow 7.69mm d
r1=7.69/2;

// 12awg insulated solid wire 3.00mm
//r2=3.4/2;

// 14awg insulated solid wire 2.8mm
r2=(2.6+0.2)/2;

intersection(){  
    cuboid([w,l,18],chamfer=0);
    difference(){
        union(){
            up(2)
            cuboid([w,l,10],chamfer=1);
            
            down(r1*off)
            intersection(){
                rotate([90,0,0])
                cyl(r=r1+2,l=l+1);
      
                rotate([0,45,0])
                rotate([90,0,0])
                angle_pie_mask(ang=270,l=l,r=50);
            }
        }
        
        down(r1*off)
        rotate([90,0,0])
        cyl(r=r1,l=l*2);
            
        color("blue")
        up(r2*off)
        forward(1)
        rotate([90,0,90])
        cyl(r=r2,l=w*2);
        
        // assembly
        color("green")
        up(r2*off)
        forward(3)
        cuboid([w*2,5,r2*1.8]);
        
        // plug stub
        color("gold")
        up(3)
        forward(1)
        //rotate([45,0,0])
        cuboid([6.5, 6.5, 8.1]);
    }
}



// center split
/*
up(r2*off)
rotate([90,0,90])
cyl(r=r2*1.1,l=1);

up(1)
forward(1)
cuboid([1,l/2,2]);
*/