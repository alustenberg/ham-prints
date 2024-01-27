include <../lib/inc.scad>

/*
#18 dacon 1.4 2.0
20ga wire 1.8 2.4
18ga wire 2.4 2.6
rg8x      6.2 5.8
*/

mode=2;

if(mode==1){
  // 1x element
  // 38 total
  assembly(w1=8,w2=8,h=5,holes=[
    [2.8, 3.6, true],
    [2.8, -1., true],
  ]);
} else if(mode==2){
  // 2x element
  assembly(w1=8,w2=8,h=10,holes=[
    [2.8, 9, true],
    [2.8, 4, true],
    [2.8,  -1, true],
  ]);
} else if(mode==3){
  // feed line, 1x element
  assembly(w1=15,w2=8,h=15,holes=[
    [2.8, 14, true],
    [2.8,  9, true],
    [5.8, -3, false]
  ]);
} else if(mode==4){
  // feed line, 2x element
  assembly(w1=15,w2=8,h=20,holes=[
    [2.8, 19, true],
    [2.8, 14, true],
    [2.8,  9, true],
    [5.8, -3, false],
  ]);
}