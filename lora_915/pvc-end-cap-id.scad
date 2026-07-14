include <lib/inc.scad>

clip=false;
xt30=false;

top=false;
tripod=false; //!top;
usb=!top && false;
mount=false;
tabs=!mount && false;
mount_short=true;

short_mount=mount && mount_short;
long_mount=mount && !mount_short;
sma=top;

l=15;
off=1.1;
r1=7.69/2;

ant_off=8;
out_off=8;
usb_off=2;

// pcb edge support
pth=1.77;
pwd=5;
psz=2;
psl=1;
xo=8+psz/2;
yo=1+psz/2;

module base(id,od,th=th,tth=th,l=15){
    up(l/2)
    difference(){
        cyl(r1=od/2,r2=od/2,l=l);

        up(tth)
        union(){
            difference(){
                cyl(r=od/2+.1,l=l);
                cyl(r=id/2,l=l);
             }
            cyl(r=id/2-th,l=l);
            cuboid([od,12,l]);
        }
        
    }
}

module cap(){
    difference(){
        union(){
            base(od=pvc_od, id=pvc_id+0.5);

            if(tabs){
                for( xi = [-1, 1] ){
                    for( yi = [-1, 1]) {
                        forward(xo*xi)
                        right(yo*yi)
                        up(psl/2+th)
                        cyl(r=psz/2,l=psl);
                        //cuboid([psz,psz,psz]);
                    }
                }
            }
            if(short_mount){
                right(5)
                up(th+l/2)
                difference(){
                    
                    down(0)
                    cuboid([th,24,l+1],chamfer=.5);
                    
                    for(yi=[-1,1]){
                        up(6)
                        forward(7*yi)
                        rotate([0,90,0])
                        cyl(r=1+.1,l=th+1);
                    }
                }
            }
        }

        if(sma){
            tth=th;
            right(ant_off)
            cyl(r=(6.75/2),l=tth*2);


            up(tth)
            right(ant_off)
            rotate([0,0,30])
            cyl(r=(9.5/2),l=tth,$fa=60);
        }

        if(xt30){
            up(th/2)
            left(out_off)
            xt30();
        }
        
        if(usb){
            up(1)
            left(usb_off)
            cuboid([6, 11, th*2], chamfer=.5);
        }

    }
}
// 6mm tube
//r2=(6.00-.03)/2;

module clip(a=90,th=th){
    up(l/2)
    difference(){
        union(){
            intersection(){
                cyl(r=r1+th,l=l);

                rotate([0,0,a/2])
                angle_pie_mask(ang=360-a,l=l,r=50);
           }
        }
        cyl(r=r1,l=l*2);
    }
}


cap();
if(clip){
    off=23.7;
    rot=90;
    rotate([0,0,-(rot/2)]) right(off) clip();
    rotate([0,0,(rot/2)]) right(off) clip();
}
