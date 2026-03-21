include <lib/inc.scad>

xt30=false;

th=2.5;

module cap(){
    difference(){
        base(staff_od);
        
        up(th/2)
        if(xt30){
            xt30();
        }
    }
}

cap();

