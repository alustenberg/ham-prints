include <../lib/inc.scad>

clip=true;

th=2.5;
tth=2.5;

id=26.02;
od=33.61+.02;

l=15;
off=1.1;
r1=7.69/2;

ant_off=8;
out_off=8;

// pcb edge support
pth=1.77;
pwd=5;
psz=2;
psl=1;
xo=3+psz/2;
yo=1+psz/2;

// 2.2 x 4.6
module base(){
    up(l/2) 
    difference(){
        cyl(r=od/2+th,l=l,chamfer=1);
       
        up(tth)
        cyl(r=od/2,l=l, chamfer=1);
    }
    
    
    for( xi = [-1, 1] ){
        for( yi = [-1, 1]) {
            forward(xo*xi)
            right(yo*yi) 
            up(psl/2+tth)
            cyl(r=psz/2,l=psl);
            //cuboid([psz,psz,psz]);
        }
    }
}

module xt30(){
        cuboid([5.5+.1, 10.48+.1,tth*2], chamfer=.5);
}

module cap(){
    difference(){
        base();
        right(ant_off)
        cyl(r=(6.75/2),l=tth*2);
        
        up(tth)
        right(ant_off)
        rotate([0,0,30])
        cyl(r=(9.5/2),l=tth,$fa=60);
        
        up(tth/2)
        left(out_off)
        xt30();
    }
}

module clip(a=90,th=3){
    up(l/2)
    difference(){
        union(){
            intersection(){
                cyl(r=r1+th,l=l, chamfer=1);
      
                rotate([0,0,a/2])
                angle_pie_mask(ang=360-a,l=l,r=50);
           }
        }
        cyl(r=r1,l=l*2);
    }
}

cap();
if(clip) right(24) clip();
