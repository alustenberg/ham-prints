include <../lib/inc.scad>
$fs=.1;
thickness=5;

bulkhead_od = 20-1;
bulkhead_thick = 45;

standoff_len=50;
standoff_od=40;

coax_diam=12;
channel_id=coax_diam;

module assembly(){
    difference(){

        union(){    
            color("green")
            cyl(r=bulkhead_od/2, h=bulkhead_thick+5,chamfer=1,center=false);

            translate([0,0,bulkhead_thick])
            standoff();
        }

        // inner cutout
        color("blue")
        translate([-bulkhead_od/2+channel_id/2+2,0,bulkhead_thick])
        cuboid([channel_id+e2,channel_id+e2,bulkhead_thick+standoff_len+e],chamfer=1);
    }
}

module standoff(){
  r1=30;
  off1=1;
  off2=5;
  arm_thick=5;


  difference(){
    intersection(){
      // main body
      cyl(r=standoff_od/2,h=standoff_len,center=false);

      // end rounding
      translate([40,0,20])
      rotate([90,0,0])
      cyl(r=standoff_len,h=standoff_od+e2);
    }

    difference(){
      // cable guide
      color("yellow")
      translate([0,0,standoff_len/2])
      cuboid([standoff_od+e2,standoff_od-arm_thick*2+e2,standoff_len+e]);

      color("pink")
      translate([0,0,-42])
      rotate([90,0,0])
      cyl(r=50,h=standoff_od+e2);


    }
  }
}


//leg_mount();
translate([-50,0,0])
rotate([0,90,0])
intersection(){
  // global clip
  translate([1,0,0])
  cuboid([12,200,200]);
    
  assembly();

  //standoff();
}