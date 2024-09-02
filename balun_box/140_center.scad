// dual 240 oct box

include <lib/common.scad>
use <../lib/BOSL/shapes.scad>
use <../lib/BOSL/masks.scad>

cr=17.5/2;
h=25;

difference(){
cyl(r=cr,h=h,fillet=1);
cyl(r=cr*.6,h=h+1);
}