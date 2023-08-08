$fn=50*1.0;

include <lego_beam.scad>;

scale([1,1,1]) {
    horizontal_w_hole();
}

module vertical_lego()
{
    lego_beam_placed();
    translate([4,0,-4]) {
        vertical();
    }
}

module lego_beam_placed()
{
	translate([26,22,-4]) {
		rotate([0,0,0]) {
			lego_beam(3);
		}
	}
}

module vertical_lego_placed()
{
	translate([4,0,4]) {
		rotate([0,-90,0]) {
			vertical_lego();
		}
	}
}


module horizontal()
{
	linear_extrude(height=1.6, center=false, convexity=10)
		import(file="horizontal.dxf");
}

module horizontal_w_hole()
{

    difference() {
        union () {
            horizontal();
            //camera standoffs
            translate([65/2+12.4,30/2-21/2,-4])
                    cylinder(h=4, r1=2, r2=2);
            translate([65/2+12.4,30/2+21/2,-4])
                    cylinder(h=4, r1=2, r2=2);
            translate([65/2,30/2-21/2,-4])
                    cylinder(h=4, r1=2, r2=2);
            translate([65/2,30/2+21/2,-4])
                    cylinder(h=4, r1=2, r2=2);
        }
        union() {
            translate([3.5,3.5,-1])
                cylinder(h=5.1, r1=2.75/2, r2=2.75/2);
            translate([65-3.5,3.5,-1])
                cylinder(h=5.1, r1=2.75/2, r2=2.75/2);
            translate([65-3.5,30-3.5,-1])
                cylinder(h=5.1, r1=2.75/2, r2=2.75/2);
            translate([3.5,30-3.5,-1])
                cylinder(h=5.1, r1=2.75/2, r2=2.75/2);
            //camera holes
            translate([65/2+12.4,30/2-21/2,-10])
                cylinder(h=20, r1=1.1, r2=1.1);
            translate([65/2+12.4,30/2+21/2,-10])
                cylinder(h=20, r1=1.1, r2=1.1);
            translate([65/2,30/2-21/2,-10])
                cylinder(h=20, r1=1.1, r2=1.1);
            translate([65/2,30/2+21/2,-10])
                cylinder(h=20, r1=1.1, r2=1.1);
        }
    }
}

module horizontal_w_hole_flipped()
{
	translate([4,0,4]) {
		rotate([0,180,0]) {
            horizontal_w_hole();
        }
    }
}
