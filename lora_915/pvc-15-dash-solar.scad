include <lib/inc.scad>
off=10;

inc=false;
pvc_od=48.30;
pvc_id=40.50;
panel_width=60+1.0;
panel_thick=1.8+0.5;
overlap=6;

module end_cutouts(){
    down(th*2)
    cyl(r=pvc_od/2,l=th*5);
    
    up(12)
    cyl(r=10,l=10);

    // sma
    up(5)
    cyl(r=(6.75/2),l=th*2);

    up(th)
    rotate([0,0,30])
    cyl(r=(9.5/2),l=th*2,$fa=60);
}


module body(id=pvc_od,th=th,tth=th,l=15){
    l2=th*2;
    
    difference(){
        rotate(30)
        intersection(){
           
            cyl(r=panel_width+overlap,l=50,$fa=60);
            
            union(){
                down(th)
                cyl(r=panel_width+overlap,l=th*2,$fa=60);
                
                
                cap=2;
                rotate([0,-3,-30])
                up(th*cap-1)
                left(pvc_od/2-th)
            
                cyl(r1=panel_width+overlap,r2=pvc_od/2,l=th*cap*2);
            }
        }
        
        
        left(pvc_od/2+2)
        back(.2)
        union(){
            end_cutouts();
            for(i=[0:120:180-1]){  
                up(th*0)
                rotate([0,0,i+120])
                left(pvc_od/2-th)
                cube([th*5,th*2,th*4.1],center=true);
            }
        }
        
        block=150;
        right(block/2+th)
        cube(block,center=true);
  
        up(block/2+th*2.5)
        cube(block,center=true);
        
        rotate(30)
        for(i=[0:60:180-1]){
            // panel slots
            rotate([0,0,i])
            down(panel_width/2+1)
            back(panel_width-7)
            cube([panel_width,panel_thick,panel_width],center=true);
        }
        
  
  
    }
}

body(pvc_od);

