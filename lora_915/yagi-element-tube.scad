include <lib/inc.scad>

th=4;
l=8;
off=1.2;

// arrow 7.69mm d
r1=arrow_od/2;

// 6mm tube
r2=(6.00-.03)/2;

//rotate([90,0,0])
difference(){
    union(){
        up(-1)
        //cuboid([12,10,14],chamfer=.5);
        cyl(r=8,l=14,chamfer=.25);
    }
    
    cyl(r=5,l=20);

    down(r1*off)
    rotate([90,0,0])
    cyl(r=r1,l=l*2);
    
    down(8)
    cuboid([r1*1.5,20,2]);
    
    up(r2*off)
    rotate([90,0,90])
    cyl(r=r2,l=l*2);
        
    up(6)
    cuboid([20,r2*1.5,2]);
}


