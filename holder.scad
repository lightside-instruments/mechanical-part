$fn=50*1.0;

include <lego_beam.scad>;

// length of rack equipment mounting bracket 19 inch or 486.2 mm
// max length of equipment body 449
// (482.6-449)/2 = 16.8
// side bars are 0.625 inch or 15.875 mm

side_bar_width=15.875;
side_gap_full_length =   (482.6-449)/2-side_bar_width;
side_gap_agilent_6060b = (482.6-425.5)/2-side_bar_width; //Agilent 6060B is 425.5 mm wide instead of 449

side_gap = 2*side_gap_agilent_6060b-side_gap_full_length;

scale([1,1,1]) {
	translate([0,-(side_gap+side_bar_width)/2-3/2 ,12/2-2]) {
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
            cube(size = [44.45*2,side_gap+side_bar_width,4], center = true);
        }
        union() {
            translate([-44.45+6.35,(side_gap+side_bar_width)/2-side_bar_width/2,-5])
                cylinder(h=10, r1=3.55, r2=3.55);
            translate([44.45-6.35,(side_gap+side_bar_width)/2-side_bar_width/2,-5])
                cylinder(h=10, r1=3.55, r2=3.55);
            union() {
                rotate([90,0,0]) {
                    translate([-44.45/2,13/4,-(side_gap+side_bar_width+1)/2])
                       cylinder(h=side_gap+side_bar_width+2, r1=4.1, r2=4.1);
                    translate([44.45/2,13/4,-(side_gap+side_bar_width+1)/2])
                        cylinder(h=side_gap+side_bar_width+2, r1=4.1, r2=4.1);
                    translate([0,13/4,-(side_gap+side_bar_width+1)/2])
                        cylinder(h=side_gap+side_bar_width+2, r1=4.1, r2=4.1);
                }
            }
        }
    }
}
