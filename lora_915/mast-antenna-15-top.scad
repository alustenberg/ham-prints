include <lib/inc.scad>


off=30;

mast_r=38.20/2;
node_r=48.30/2;
ant_r=22.10/2;

cut=60;
ang=360-cut;

w=15;  // length
wt=5; // wall thick



module half(r,ang,top=false){
    intersection(){
        difference(){
                cyl(r=r+wt,h=w);
                
                up(top ? th : 0 )
                cyl(r=r,h=w+e);
        }
        
        if(! top){
            rotate([0,0,-90+cut/2])
            angle_pie_mask(ang=ang,l=w,r=r*2);
        }
    }
}



// top of mast
color("blue")
forward(off)
half(r=mast_r,ang=ang,top=true);

// node pipe mount
color("green")
rotate([0,0,120])
forward(off)
half(r=node_r,ang=ang,top=true);

// antenna mount
color("grey")
rotate([0,0,-120])
forward(off-15)
right(4)
half(r=ant_r,ang=ang);

// fill
color("yellow")
forward(4)
right(2)
cyl(r=6,l=w);