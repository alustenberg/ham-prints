include <../lib/inc.scad>

// 600 ohm ladder line, 6" spacing
s_in=4;
s=s_in*25.4;

assembly(w1=8,w2=8,th=3,holes=[
  [2.8, s+8, true],
  [2.0, s+1, false],
  [2.0, 1, false],
]);