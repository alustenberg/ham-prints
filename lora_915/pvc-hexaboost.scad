include <lib/inc.scad>

tripod=true;

module body(id,th=th,tth=th,l=15){
    c=2;
    // pvc side
    difference(){
        cyl(r=pvc_od/2+th,l=l);
        down(c)
        cyl(r=pvc_od/2,l=l+c*2+.1,chamfer=1);
    }
    
    // ant side
    ant_od=22.9;
    up(l)
    difference(){
        cyl(r=ant_od/2+th,l=l);
        down(1)
        cyl(r=ant_od/2,l=l+2.1);
    }
    
    // coupler
    cl=10;
    up(10)
    difference(){
        cyl(r1=pvc_od/2+th,r2=ant_od/2+th,l=cl);
        down(0)
        cyl(r1=pvc_od/2,r2=ant_od/2,l=cl+.1);
    }
    

    up(5)
    difference(){
        nid=16.0;
        cyl(r=pvc_od/2,l=1);
        cyl(r=nid/2,l=2);
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

                    back(24.8)
                    up(tl-1.5)
                    rotate([20,0,0])
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


body(pvc_od);
        