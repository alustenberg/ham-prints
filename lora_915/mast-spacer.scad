include <lib/inc.scad>;

t=1.0; // cookie thickness

double=false;

c=0; // chamfer
c2=1; // line camfer



od=11.5; // 1/2" id 3/4" od pipe
//od=18.5; // 3/4" id 1/1" od pipe
wd=1.0;  // rg6 conductor diameter
bd=7.0;  // rg6 od

off=2.5;

module cookie(){
  difference(){
      down(t/2)
      cyl(h=t,r=od/2,align=1,chamfer=c,$fa=1);
         
      for(i=[-1,1]){
          union(){
              translate([-off*i,-0,-e])
              union(){
                  color("white")
                  down(t)
                  cylinder(h=t*2, r=wd/1.2);

                  color("blue")
                  translate([0,od/2,0])
                  cube([wd,od,t*2],center=true);


              }

          }
      }
  }
}

for (i=[0:0]){
    rotate([0,0,360*i/6])
    //translate([-55,15,0])
    cookie();
}
