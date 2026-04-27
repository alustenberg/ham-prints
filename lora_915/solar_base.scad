include <lib/inc.scad>

clip=false;
xt30=true;
sma=false;

l=15;
off=1.1;
r1=7.69/2;


module body(){
    difference(){
        cyl(r1=20,r2=10,h=30,$fa=60);
        
        up(th)
        cyl(r=8,h=30);

        cyl(r=(6.75/2),l=50);
 
        down(15-th*1.5)
        rotate([0,0,30])
        cyl(r=(9.5/2),l=th*2,$fa=60);

   

    }
}

body();