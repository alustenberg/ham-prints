include <lib/inc.scad>

clip=true;
xt30=false;
sma=false;

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


module cap(){
    difference(){
        union(){
            base(48,l=9,th=4);
            /*
            for( xi = [-1, 1] ){
                for( yi = [-1, 1]) {
                    forward(xo*xi)
                    right(yo*yi) 
                    up(psl/2+th)
                    cyl(r=psz/2,l=psl);
                    //cuboid([psz,psz,psz]);
                }
            }*/
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
    }
}

// arrow 7.69mm d
ra=arrow_od/2;

// 6mm tube
rt=(6.00-.03)/2;

module mount_mask(l=50){
    down(ra*off)
    rotate([90,0,0])
    cyl(r=ra,l=l*2);

    /*
    up(rt*off)
    rotate([90,0,90])
    cyl(r=rt,l=l*2);
        
    up(5)
    cuboid([l,rt*1.5,2]);
    */
}

difference(){
    off=21;
    union(){
        cap();

    }
    for(i = [-1, 1] ){
        up(2.5)
        forward(off*i)
        rotate([0,180,90*i])
        mount_mask();
    }

    cyl(r=(6.35/2)+.1,l=20);

}

