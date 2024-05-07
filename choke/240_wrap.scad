// single 240 form, 
include <../lib/inc.scad>;

/*
type    b rd    5m  50m
400max  2.5     0.3 1.1
D8u     2.5     0.3 1.3
D213u   5.0     0.4 1.3
d214    5.0     0.4 1.3
D8x     2.4     0.7 2.3
rg400   1.0     0.9 2.9
D58au   3.0     1.5 3.0
*/

f2_r2=34.70/2+.1;
div=13;
th=360/13;
or=2.8;
h=4;

module ft240(h=13.4, fr1=60.60/2+.2, fr2=f2_r2){
    difference(){
        cyl(r=fr1,h=h, chamfer=1);
        cyl(r=fr2,h=h+e);
    }
    /*
    for(i=[0:div]){
        rotate([0,0,th*(i+0.5)])
        translate([0,fr2,0])
        cuboid([1,2,h*2]);
        
    }
    */
}

// 25.4mm to 1 inch
// rg8x, 2.4" bend r, 6.10mm width
module wrap_loop(r=2.5*25.4,w=6,o=0,or=or,c=2,ho=5,he=20){
    translate([0,r+f2_r2-o,0])
    // im sure there is a nice maths for this.. but
    rotate([0,-90,or])
    intersection(){
        color("grey")
        difference(){
            cyl(r=r,h=w,chamfer=1);
            
            // tiedown hole
            translate([8,-50,0])
            cyl(r=3,h=w*2);
        }
        // top clip
        color("orange")
        // -1 to sink the chamfer
        translate([h+he/2-1,-58,0])
        cuboid([he-e,12,w+e],chamfer=1);

        // back clip
        
        color("blue")
        // -1 to sink the chamfer
        translate([h+he/2-1,-62,0])
        rotate([0,0,-30])
        cuboid([25-e,22,w+e],chamfer=1);

    }
}

module wrap(){
    for(i=[0:div]){
        rotate([0,0,th*i])
        wrap_loop();
    }
}

module mount(r1=30, r2=18){
    color("green")
    up(h)
    difference(){
        intersection(){
            cyl(r=r1,h=h,chamfer=0);
            
            down(1)
            cyl(r=r1,h=h+1,chamfer=1);
        }
        cyl(r=r2,h=h+e);
    }
}



if(true){
    difference(){
    union(){
       wrap();
       mount();
    }
    //ft240();
    cyl(r=18+e,h=100);
    }
} else {
    wrap_loop();
}




