include <../lib/inc.scad>

clip=true;

th=2.5;
tth=2.5;

id=26.02;
od=33.61+.02;

pod=18.91+.02;

l=15;
off=1.1;
r1=7.69/2;

wd=1.4+0;
out_off=12;


// 2.2 x 4.6
module base(){
    up(l/2) 
    difference(){
        cyl(r=od/2+th,l=l,chamfer=1);
       
        up(tth)
        cyl(r=od/2,l=l, chamfer=1);
    }
    
    down(l/2-th+.01)
    difference(){
        cyl(r1=pod/2+th,r2=od/2,l=l,chamfer=0);
       
        down(tth)
        cyl(r=pod/2,l=l, chamfer=0);
    }
    
}


module cap(){
    difference(){
        base();
  
        
        down(l)
        cyl(r=pod/2-2,l=l*3);
        
        down(l)
        left(out_off)
        cylinder(h=l*3,r=wd/2);
       
    }
}



rotate([180,0,0])
cap();

