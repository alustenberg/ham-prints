include <../lib/inc.scad>
$fs=.1;
thickness=5;

bulkhead_od = 25;
bulkhead_thick = 45;

channel_id=20;
flange_od=36;
flange_thick=2.5;

module assembly(){
    difference(){
        union(){
            cyl(r=bulkhead_od/2, h=bulkhead_thick+flange_thick,chamfer=1,center=false);

	    // outer flange
            cylinder(r=flange_od/2, h=flange_thick);

        }

        // inner cutout
        translate([0,0,-e])
        cylinder(r=channel_id/2,h=bulkhead_thick+e2+10);

        // floor
        translate([0,0,-50+e])
        cylinder(h=50,r=100);
    }
}



//leg_mount();
assembly();