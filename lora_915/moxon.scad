include <lib/inc.scad>
$fa=5;

// https://antenna2.github.io/cebik/content/moxon/moxpage.html
// 910.525 with 12awg wire
ma=117.47; // drive dipole length to bends
mb= 14.08; // drive element after bend
mc=  6.97; // drive to director spacing
md= 22.91; // director element post bend
//me= 43.96; // overall side length (b+c+d)

wd=  2.00; // wire diam

// trim offset
e=.01;


// 906.875
/*
ma=117.95;
mb= 14.14;
mc=  6.99;
md= 23.00;
me= 44.13;
*/

me=mb+mc+md;

// wire thickness, 12 awg bare
wt=2.00;

// coax thickness
ct=6.00;

// frame thickness
ft=wt*2;

difference(){
    cuboid([ma+wt, me, ft]);

    forward(ft*1.5)
    cuboid([ma-ft*2,me,ft+1]);
    

    
    for(i = [-1,1]){
        back(i*(me/2-wt/2+e))
        cuboid([ma,wt,wt]);
        
        left(i*(ma/2+e))
        back(me/2-mb/2+e)
        cuboid([wt,mb,wt]);
        
        left(i*(ma/2+e))
        forward(me/2-md/2+e)
        cuboid([wt,md,wt]);
        
        
    }
}
