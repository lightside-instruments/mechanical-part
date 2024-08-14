$fn=50*1.0;

include <lego_beam.scad>;

// length of rack equipment mounting bracket 19 inch or 486.2 mm
// max length of equipment body 449
// (482.6-449)/2 = 16.8
// side bars are 0.625 inch or 15.875 mm

side_bar_width=15.875;
side_gap = (482.6-449)/2-side_bar_width;

scale([1,1,1]) {
	translate([0,6-28.8/2-1.5 ,12/2-2]) {
		rotate([90,0,0]) {
            vertical();
        }
    }
    horizontal();


}



module vertical()
{
    difference() {
        union() {
            cube(size = [39.25*2,12,3], center = true);
        }
        union() {
            translate([-44.45/2,0,-5])
                cylinder(h=10, r1=2.1, r2=2.1);
            translate([+44.45/2,0,-5])
                cylinder(h=10, r1=2.1, r2=2.1);
            translate([0,0,-5])
                cylinder(h=10, r1=2.1, r2=2.1);
        }
    }
}

module horizontal()
{
    difference() {
        union() {
            cube(size = [44.45*2,16.8,4], center = true);
        }
        union() {
            translate([-44.45+6.35,side_gap,-5])
                cylinder(h=10, r1=3.55, r2=3.55);
            translate([44.45-6.35,side_gap,-5])
                cylinder(h=10, r1=3.55, r2=3.55);
            union() {
                rotate([90,0,0]) {
                    translate([-44.45/2,13/4,-20/2])
                       cylinder(h=20, r1=4.1, r2=4.1);
                    translate([44.45/2,13/4,-20/2])
                        cylinder(h=20, r1=4.1, r2=4.1);
                    translate([0,13/4,-20/2])
                        cylinder(h=20, r1=4.1, r2=4.1);
                }
            }
        }
    }
}
