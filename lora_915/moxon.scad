//include <lib/inc.scad>
include <pvc-end-cap.scad>

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
coax=false;

// frame thickness
ft=wt*2;


difference(){
    union(){
        down(ft/2)
        rotate([0,0,90])
        cap();
        
        moxon();
    }
    
    
    back(20.2)
    rotate([80,0,0])
    cylinder(r=1.0,10.5);
}


module moxon(){
    difference(){
        union(){
            cuboid([ma+wt, me, ft]);
            
            if(coax){
                up(ft/2-wt/2)
                back(me/2)
                cylinder(r=ct/2+3,mb);
            } 
                
        }

        // inner coax
        if(coax){
            up(ft/2-wt/2-e)
            back(me/2)
            cylinder(r=ct/2,mb+e*2);
        }

        // front cutout
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
}