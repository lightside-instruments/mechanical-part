$fn=50*1.0;

include <lego_beam.scad>;

scale([1,1,1]) {
    vertical_lego_placed();
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


module vertical()
{
	linear_extrude(height=8, center=false, convexity=10)
		import(file="vertical.dxf");
}

module vertical_w_hole()
{
    cr=6.1/2; //lego hole radius
    ch=5.1; //cilinder height 4+1.1
    difference() {
        vertical();
        union() {
            translate([6,4,-1])
                cylinder(h=ch, r1=cr, r2=cr);
            translate([6,12,-1])
                cylinder(h=ch, r1=cr, r2=cr);
            translate([6,20,-1])
                cylinder(h=ch, r1=cr, r2=cr);
            translate([6,28,-1])
                cylinder(h=ch, r1=cr, r2=cr);
            translate([14,28,-1])
                cylinder(h=ch, r1=cr, r2=cr);
            translate([22,28,-1])
                cylinder(h=ch, r1=cr, r2=cr);
            translate([30,28,-1])
                cylinder(h=ch, r1=cr, r2=cr);
        }
    }
}


