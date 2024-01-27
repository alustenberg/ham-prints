include <../lib/inc.scad>

//quad(3);

module quad(segment=1,center=0,th=5,wca=270,off1=120,c=2 ){
    //off1=30;
    off2=off1*1/3;

    pole_ods=[
        // 1.6, // 22ga wire friction mount
         3.0, // #24 cave line

        21.5,
        15.7,
         9.1,
         2.75,
    ];

    pole_id=pole_ods[segment];
    wire_id=pole_ods[0];
    for (arm=[0:c]){
        holes=[
            [wire_id, off2],
            [wire_id, off2-wire_id*2],
        ];

        extra = arm ? [] : [ [wire_id, off1], ];

        rotate([0,0,arm*120])
        assembly(w1=center,w2=pole_ods[0]*2.8,th=th, holes=concat(extra, holes,[[pole_id, 0]]));
    }
}