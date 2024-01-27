include <../lib/BOSL/constants.scad>
use <../lib/BOSL/threading.scad>

// all units are mm
$fa=1;
$fs=.5;

eps = .5;
_mm = 25.4; // inch to mm

// filiment spools
// 3/8-16
thread_d = 3/8*_mm+.5;
thread_pitch = 1/16*_mm;

step_height = 4;
end_height = 1;
total_height=step_height+end_height+eps*2;

spool_d = 57;
edge_dd=total_height*.8;

step_d = spool_d-edge_dd;
outer_d = spool_d+edge_dd;


cut_r = outer_d * .50;
cut_offset = cut_r*1.40;
cut_count = 3;

hole_d = thread_d * 0.90;
hole_offset = thread_d*1.10;

hole_d2 = thread_d * .80;
hole_offset2 = thread_d*2.10;

difference() {
    union(){
        color("Gray")
        translate([0,0,0])
        cylinder(r1=outer_d/2, r2=step_d/2, h=step_height);

        color("Gray")
        translate([0,0,-end_height])
        cylinder(r=outer_d/2, h=end_height);
    }

    for (i = [ 0 : cut_count - 1 ]){

        translate([
            sin(i*360/cut_count)*cut_offset,
            cos(i*360/cut_count)*cut_offset,
            - end_height - eps
        ])
        cylinder(r1=cut_r, r2=cut_r-2,h=total_height);


        translate([
            sin(i*360/cut_count+60)*hole_offset,
            cos(i*360/cut_count+60)*hole_offset,
            - end_height - eps
        ])
        cylinder(
            r1=hole_d/2,
            r2=hole_d/2,
            h=total_height
        );

        translate([
            sin(i*360/cut_count+60)*hole_offset2,
            cos(i*360/cut_count+60)*hole_offset2,
            - end_height - eps
        ])
        cylinder(
            r1=hole_d2/2,
            r2=hole_d2/2,
            h=total_height
        );
    }

    translate([0,0,0])
    acme_threaded_rod(
        d=thread_d,
        pitch=thread_pitch,
        l=total_height*2
    );
}
