include <../lib/inc.scad>
$fs=.1;
thickness=5;

bulkhead_od = 20-1;
bulkhead_thick = 45;

channel_id=7;

standoff_len=50;
standoff_od=40;


module assembly(){
    difference(){
        union(){
            cyl(r=bulkhead_od/2, h=bulkhead_thick+5,chamfer=1,center=false);


            translate([0,0,bulkhead_thick])
            standoff();
        }

        // inner cutout
        translate([-bulkhead_od/2+channel_id/2+1,0,bulkhead_thick/2])
        //cylinder(r=channel_id/2,h=bulkhead_thick+e2+10);
        cuboid([channel_id,channel_id+e2,bulkhead_thick+standoff_len+e]);



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
      translate([20,0,0])
      rotate([90,0,0])
      cyl(r=standoff_len,h=standoff_od+e2);
    }

    difference(){
      // cable guide
      translate([0,0,standoff_len/2])
      cuboid([standoff_od+e2,standoff_od-arm_thick*2+e2,standoff_len+e]);

      translate([r1-bulkhead_od/2,0,off2])
      rotate([90,0,0])
      cyl(r=r1-channel_id-off1,h=standoff_od+e2);


    }
/*
      difference(){
        translate([0,0,standoff_len/2])
        cuboid([bulkhead_od,standoff_od+e2,standoff_len+e]);

        translate([0,0,arm_thick])

      }
    }
    */
  }
}


//leg_mount();
intersection(){
  assembly(); cuboid([15,1000,1000]);
  //standoff();
}