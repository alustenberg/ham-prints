include <lib/inc.scad>
off=10;

inc=false;
pvc_od=48.30;
pvc_id=40.50;
panel_width=60+1.0;
panel_thick=1.8+0.5;
overlap=6;

top=true;
module body(id,th=th,tth=th,l=15){
    l2=th*2;
    
    difference(){
        union(){
            down(th)
            cyl(r=panel_width+overlap,l=th*2,$fa=60);
            
            up(th*3)
            cyl(r1=panel_width+overlap,r2=pvc_od/2,l=th*6,$fa=60);
        }
        if(top){
            cyl(r=pvc_od/2,l=th*5);
        } else {
            cyl(r=pvc_od/2,l=th*15);
        }
        

        for(i=[0:60:360]){
            // panel slots
            rotate([0,0,i])
            down(panel_width/2+1)
            back(panel_width-7)
            cube([panel_width,panel_thick,panel_width],center=true);
        
            if(top)
                up(th)
                rotate([0,0,i])
                left(pvc_od/2-th)
                cube([th*5,th*2,th*6.1],center=true);
        }
  
        for(i=[0:120:360]){
            
            if(top){
                // hanging holes
                rotate([0,0,i+30])
                up(th*4)
                back(panel_width/2)
                cyl(r=1,l=th*3);
            } else {
                // weep holes
                rotate([0,0,i+30])
                up(th*5.5)
                back(panel_width/2)
                cyl(r=1.5,l=100);
            }
        }
    }
}


if(!inc)
body(pvc_od);

