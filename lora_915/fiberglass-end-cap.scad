include <lib/inc.scad>

xt30=false;
l=15;

module cap(){
    difference(){
        base(mast_od);
        
        if(xt30){
            up(th/2)
            xt30();
        } 
    }
}

cap();

