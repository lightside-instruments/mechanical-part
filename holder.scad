// Higher definition curves
//$fs = 0.01;
$fn = 100;

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


module hook() {
  // Top blob
  square([11, 2.9]);
  cirlceR = 4.9;
  translate([cirlceR, cirlceR + 9 - cirlceR, 0]) circle(cirlceR);
  translate([11 - 6, 2.9, 0]) square([6, 11]);  
  square(9, 5);
  
  // Hook
  translate([9, 10-5.1])
  minkowski() {
    square([5, 8]);
    circle(1);
  }
  
  // Peg
  translate([16+11.8, 0, 0]) minkowski() {
    square([12.8, 4.5]);
    circle(1);
  }
  
  translate([0, -1, 0]) square([47, 1]);
}

module vertical()
{
    translate([50, 14, 0])
    rotate([0,0,180])
    union() {
	linear_extrude(height=2.6, center=false, convexity=10)
		hook();
    translate([0,-8.0,0])
        cube([55,8,8]);
    }
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


