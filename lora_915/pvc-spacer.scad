include <../lib/inc.scad>

clip=true;
usb=true;

th=2.5;
tth=2.5;

// 1"
//id=26.02-.02;
//od=33.61+.02;

// 5/8" ('1/2" sch40')
//id=15.87-.02;

// 1/2" actual
id=12.7-.02;

l=2;

// pcb edge support



xo=2.4;


// 2.2 x 4.6
module base(){
    up(l/2)
    difference(){
        cyl(r=id/2+th,l=l,chamfer=.5);

        for( xi = [-1, 1] ){
                forward(xo*xi)
                cyl(r=3/2,l=l+.1);
            
                forward(xo*xi)
                up(th/2*xi)
                cyl(r=10/2,l=l);

        }

    }
}

module cap(){
    base();

}
cap();
