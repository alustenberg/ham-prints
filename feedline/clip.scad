include <../lib/inc.scad>

so_diam=15.4+.2;
so_height=9.7;

plug_diam=4.2;  // 3.8 ~ 4.3 with/without compression
plug_offset=so_diam/2+plug_diam/2-.5;

wall_thick=.4*4;


module body(){
   cylinder(h=so_height+wall_thick,r=so_diam/2+wall_thick);  
    
   translate([plug_offset,0,0])
   cylinder(h=so_height+wall_thick,r=plug_diam/2+wall_thick);  
    
    
}


difference(){
    body();
    
    // so-239 cutout
    translate([0,0,wall_thick+e])
    cylinder(h=so_height,r=so_diam/2);
    
    // center plug cutout
    translate([0,0,-e])
    cylinder(h=so_height,r=plug_diam/2);    
    
    // side plug cutout
    translate([plug_offset,0,-e])
    cylinder(h=so_height+wall_thick+e2,r=plug_diam/2);  
   
}