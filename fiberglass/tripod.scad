include <../lib/inc.scad>
$fs=.1;

module leg_mount(thickness=10,length=20, bolt_radius=2, leg_radius=10, offset=20){
    width = leg_radius * 3;
    
    rotate([-45,0,0])
    translate([-offset-thickness/2,-3,50])
    difference(){
        translate([0,-8,-35+e])
        cuboid([offset*2+thickness,15,40],center=false);

        translate([offset+thickness/2,leg_radius,-length*2])
        cylinder(r=leg_radius,h=500,center=false);
    }
    
    for(side=[-1,1]){
        
        translate([offset*side - thickness/2,0,0])
        rotate([0,90.0])
        {
            difference(){
                union(){
                    cuboid([width,length,thickness],center=false);
            
                    translate([0,length/2,0]){
                        cylinder(h=thickness, r=width/2,center=false);
                        
                        rotate([0,0,45])
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

module assembly(d=8.5, h=15,c=22,off=38){
  difference(){
    cylinder(r1=32, r2=28,h=h);

    // center hole
    translate([0,0,-e])
    cylinder(r=d/2,h=h+e2);

    for ( i=[0:2] ){
      rotate([0,0,i*120]) translate([0,off,-e])
      cylinder(r=c,h=h+e2);


      rotate([0,0,i*120-60]) translate([0,24,-2])
      rotate([18,0,0])
      cylinder(r=d/2,h=h*2);
    }
  }
}


leg_mount();
// assembly();