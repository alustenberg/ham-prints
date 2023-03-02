include <../lib/inc.scad>
$fs=.1;
thickness=5;

module leg_mount(length=20, bolt_radius=6.8/2, leg_radius=20.00/2, offset=26.00/2+1, rot=90-30){
    width = leg_radius * 5;
    
    rotate([-rot,0,0])
    translate([-offset-thickness/2,-3,60])
    difference(){
        intersection(){
            translate([0,-thickness,-31.3-e])
            cuboid([offset*2+thickness,thickness*3,33],center=false);
        
            translate([offset+thickness/2,leg_radius-3,-length*2+e])
            cylinder(r=leg_radius+thickness,h=50,center=false);
        }
        translate([offset+thickness/2,leg_radius,-length*2])
        cylinder(r=leg_radius,h=500,center=false);
    }
    
    for(side=[-1,1]){
        translate([offset*side-thickness/2,0,0])
        rotate([0,90.0])
        {
            difference(){
                union(){
                    cuboid([length,width,thickness],center=false);
            
                    translate([0,length/2,0]){
                        cylinder(h=thickness, r=leg_radius,center=false);
                        
                        rotate([0,0,90-rot])
                        translate([-length/2,0,0])
                        cuboid([width,50,thickness],center=false);
                    }
                }
                
                translate([0,length/2,-e])
                cylinder(h=thickness+e2, r=bolt_radius, center=false);
            }
        }
    }
}

module assembly(d=64, h=60, off=10){
    r=d/2;

    difference(){
        union(){
            cylinder(r=r+thickness, h=h-off);
    
            for ( i=[0:2] ){
                rotate([0,0,i*120-30]) 
                translate([0,r+21,h-thickness*2])
                rotate([-90,0,0])
                leg_mount();
            }
        }    

        // inner cutout
        translate([0,0,-e])
        cylinder(r=r,h=h+e2);
        
        // floor
        translate([0,0,-50+e])
        cylinder(h=50,r=100);
    }
}



//leg_mount();
assembly();