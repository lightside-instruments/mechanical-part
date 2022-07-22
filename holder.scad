$fn=50*1.0;

include <lego_beam.scad>;

scale([1,1,1]) {
    horizontal_w_hole();

    translate([-8/2+65/2,-8+30/2,1.6]) {
        rotate([90,0,90]) {
            lego_beam(3);
		}
	}
}

module horizontal2()
{
	linear_extrude(height=1.6, center=false, convexity=10)
		import(file="horizontal.dxf");
}

module horizontal()
{
    cube([65,30,1.6]);
}

module horizontal_w_hole()
{
    difference() {
        horizontal();
        union() {
            translate([3.5,3.5,-1])
                cylinder(h=5.1, r1=1.25, r2=2.75/2);
            translate([65-3.5,3.5,-1])
                cylinder(h=5.1, r1=1.25, r2=2.75/2);
            translate([65-3.5,30-3.5,-1])
                cylinder(h=5.1, r1=1.25, r2=2.75/2);
            translate([3.5,30-3.5,-1])
                cylinder(h=5.1, r1=1.25, r2=2.75/2);
        }
    }
}


