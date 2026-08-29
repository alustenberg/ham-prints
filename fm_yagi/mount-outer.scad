include <lib/inc.scad>

th=4;
ll=20;
rr=20;

// fiberglass
r1=(18.80-0.0)/2;

// 4mm tube
r2=( 4.00-0.03)/2;

//rotate([90,0,0])
difference(){
    union(){

        //cuboid([12,10,14],chamfer=.5);
        cyl(r=rr,l=ll,chamfer=.25);
    }
    
    cyl(r=rr-th,l=ll+1);

    down(4)
    rotate([90,0,0])
    cyl(r=r1,l=rr*2);
   
    up(8.5)
    rotate([90,0,90])
    cyl(r=r2,l=rr*2);

}


