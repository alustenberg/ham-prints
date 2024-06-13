// https://www.printables.com/model/320972-basic-gopro-mount-openscad/files
// bsd 3 clause, copy https://www.printables.com/@Naomi

$fa = 2;
$fs = 0.25;
Extra_Mount_Depth = 3;

module nut_hole()
{
	rotate([0, 90, 0]) // (Un)comment to rotate nut hole
	rotate([90, 0, 0])
		for(i = [0:(360 / 3):359])
		{
			rotate([0, 0, i])
				cube([4.6765, 8.1, 5], center = true);
		}
}

module flap(Width)
{
	rotate([90, 0, 0])
	union()
	{
		translate([3.5, (-7.5), 0])
			cube([4 + Extra_Mount_Depth, 15, Width]);


		translate([0, (-7.5), 0])
			cube([7.5 + Extra_Mount_Depth, 4, Width]);

		translate([0, 3.5, 0])
			cube([7.5 + Extra_Mount_Depth, 4, Width]);

		difference()
		{
			cylinder(h = Width, d = 15);

			translate([0, 0, (-1)])
				cylinder(h = Width + 2, d = 6);
		}
	}
}

module mount2()
{
	union()
	{

			translate([0, 4, 0])
		flap(3);

		translate([0, 10.5, 0])
		flap(3);
	}
}

module mount3()
{
    // index to base
    translate([-10.5,0,0])
	union()
	{
		difference()
		{
			translate([0, (-2.5), 0])
				flap(8);

			translate([0, (-8.5), 0])
				nut_hole();
		}

		mount2();
	}
}

/* GoPro Mount - 2 flap no nut hole
translate([0, 0, 10.5])
	rotate([0, 90, 0])
		mount2();
// */

/* GoPro Mount - 3 flap w/nut hole
translate([0, 0, 10.5])
	rotate([0, 90, 0])
		mount3();
*/