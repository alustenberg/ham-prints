// dual 240 oct box

include <lib/common.scad>
use <../lib/BOSL/shapes.scad>
use <../lib/BOSL/masks.scad>

difference()
{
    union(){
        cyl(r=t_r+wt,h=wt,$fa=60);

        translate([0,0,wt])
        cyl(r=t_r,h=wt+e,$fa=60);
    }
    translate([0,0,wt])
    cyl(r=t_r-wt,h=wt+e*2,$fa=60);
    
        
    // terminals
    color("yellow")
    for(i=[0]){
        rotate([0,0,60*i+90])
        translate([0,37,4])
        rotate([0,90,-90])
        onePole();
    }
    color("red")
    translate([0,0,4])
    rotate([0,90,0])
    onePole();
    
}


// PowerPole Splitter Builder (Vertical)
// Michael Glover, AE5ZC <ae5zc@arrl.net>
//  with additional suggestions from Matt Barlow, W5VO
// August 10, 2014
// Released under a Creative Commons Attribution-NonCommercial-ShareAlike 3.0 Unported License
// Creative Commons license: http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode
// License summary: http://creativecommons.org/licenses/by-nc-sa/3.0/
module key(){
  translate([-e,-1.5,-0.5]) cube([12.5+e,3,1]);
}

module onePole(s=1.05){
  scale([s,s,s])
  translate([-6,-4,-4])
  difference() {
    union(){
      difference(){
        // body
        union() {
          difference() {
            difference() {
              cube([25,8,8]);
              union(){
                //translate([0,(8-5.5)/2,(8-5.5)/2]) cube([5,5.5,5.5]);
                translate([25-6,1,1]) cube([6,6,6]);
              }
            }
                translate([25-6,0,0]) cube([6,8,4]);
          }
          translate([25-6,1,0]) cube([6,6,3.5]);
        }
        // recessed keys
        union(){
          translate([0,4,0]) key();
          translate([0,0,4]) rotate([90,0,0]) key();
          }
      }
      // proud keys
      union(){
        translate([0,4,8]) key();
        translate([0,8,4]) rotate([90,0,0]) key();
      }
    }
    // pin channels
    union() {
      translate([15,0,-e]) cylinder(r=1,h=8+e2); // 20140408
      translate([15,8,-e]) cylinder(r=1,h=8+e2); // 20140408
    }
  }
}