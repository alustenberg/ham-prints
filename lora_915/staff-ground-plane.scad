include <lib/inc.scad>

clip=true;

l=15;
off=1.1;
out_off=10.2;

th=4;



module cap(){
    difference(){
        union(){
            base(pvc_od,l=25,tth=10);

            color("green")
            down(l-9.4)
            difference(){
                cyl(r1=staff_od/2+th,r2=pvc_od/2+4,l=l,chamfer=1);

                down(th)
                cyl(r=staff_od/2,l=l*2, chamfer=0);
            }
            
            // supports
            
            down(1-2) 
            for(i=[0:4]){
                rotate([0,0,360/4*i+45])
                
                left(staff_od/2)
                rotate([0,0,0])
                cyl(r=1,l=5);
            }
        }

        // internal channel
        down(l)
        cyl(r=3,l=l*4);
        
        // sma
        up(5)
        rotate([0,0,30])
        cyl(r=(9.5/2),l=30,$fa=60);
        
        // washer seat
        color("red")
        up(0.2)
        cyl(r=6,l=0.5);

        
        // wire feed
        rotate([0,0,-5])
        down(l*2)
        right(out_off)
        cylinder(h=l*3,r=wd/2+0.2);
        
        // coax to wire
        right(7)
        down(2)
        rotate([0,90-45,2])
        cylinder(h=8,r=wd/2-0.2);

      
        // radials
        down(1-2) 
        for(i=[0:8]){
            rotate([0,0,360/8*i+360/16])
            
            left(staff_od/2)
            rotate([0,-45,0])
            cyl(r=1,l=40);
        }

    }
}




rotate([180,0,0])
union(){
    cap();
    


}

