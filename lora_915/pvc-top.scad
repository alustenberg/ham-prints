include <../lib/inc.scad>

clip=true;
usb=true;

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
xo=8+psz/2;
yo=1+psz/2;

// 2.2 x 4.6
module base(){
    up(l/2)
    difference(){
        cyl(r=od/2+th,l=l,chamfer=1);

        up(tth)
        cyl(r=od/2,l=l, chamfer=1);
        
        if(usb){
            right(yo*2+1)
            usb();
        }
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

module usb(x=6,y=13,ch=1){
    cuboid([x,y,20],chamfer=1);
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

module cap(){
    base();

    if(clip){
        right(24)
        clip();
    }
}
cap();
