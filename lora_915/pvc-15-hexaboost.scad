include <lib/inc.scad>
$fa=5;

tripod=false;

module body(id,th=th,tth=th,l=15){
    c=2;
 
    // ant side
    ant_od=22.9;
    l2=55;
    up(l2/2)
    color("silver")
    difference(){
        cyl(r1=pvc_od/2,r2=ant_od/2+.4,l=l2);
        down(1)
        cyl(r=ant_od/2,l=l2+2.1);
    }
    
    // coupler
    /*
    cl+=15;
    up(15)
    color("red")
    difference(){
        cyl(r1=pvc_od/2+th,r2=ant_od/2+th,l=cl);
        up(0)
        cyl(r1=pvc_od/2,r2=ant_od/2,l=cl+.1);
    }
    */

    down(th)
    color("green")
    difference(){
        nid=16.0;
        cyl(r=pvc_id/2,l=10);
        cyl(r=nid/2,l=12);
    }
    
  
     if(tripod){
        tl=10;
        down(7.5)
        intersection(){
            cylinder(h=l*2,r=50);

            for(i=[0,1,2]){
                rotate([0,0,i*120-30])
                union(){
                    back(20)
                    cuboid([2,5,5]);

                    back(25.0)
                    up(tl-1.5)
                    rotate([25,0,0])
                    difference(){
                        up(1)
                        cyl(r=arrow_od/2+th,l=l+tl);
                        down(th)
                        cyl(r=arrow_od/2+.2,l=l+tl);
                    }
                }
            }
        }
    }
    
}

pvc_od=48.30;
pvc_id=40.30;
body(pvc_od);
        