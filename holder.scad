    $fn=50*1.0;

include <lego_beam.scad>;


bracket_len=482.6; // length of rack equipment mounting bracket 19 inch
bracket_height = 44; // actually 44.45 mm 1.75 inch
body_len=449; // max length of equipment body
ear_len=(bracket_len-body_len)/2; //16.8

scale([1,1,1]) {

	translate([16/2-4/2,ear_len/2+4/2,-bracket_height/2+44/2]) {
		rotate([90,0,0]) {
            side_column();
        }
    }

	translate([16/2-4/2,bracket_len/4-1.5*ear_len-4/2,-bracket_height/2+44/2]) {
		rotate([90,0,0]) {
            side_column();
        }
    }

	translate([-4/2,(bracket_len/4-2*ear_len-2*4)/2+ear_len/2+4,-bracket_height/2+4/2]) {
		rotate([0,180,0]) {
            base();
        }
    }

	translate([-4/2,(bracket_len/4-2*ear_len-2*4)/2+ear_len/2+4,+bracket_height/2-4/2]) {
		rotate([0,180,0]) {
            top();
        }
    }


/*left side*/
	translate([0,0,0]) {
		rotate([0,90,0]) {
            side();
        }
    }

/*right side*/    
	translate([0,bracket_len/4-ear_len,0]) {
		rotate([0,90,0]) {
            side();
        }
    }


}

module m4_cone_3mm()
{
    union() {
        cylinder(h=3.02, r1=4/2+0.1, r2=4/2+0.1);
        cylinder(h=2.2, r1=7.5/2+0.1, r2=4/2+0.1);
    }
}

module side_column()
{
        cube(size = [16,44,4], center = true);
}



module side()
{
    difference() {
        union() {
            cube(size = [bracket_height,ear_len,4], center = true);
        }
        union() {
            translate([-bracket_height/2+6.15,0,-5])
                cylinder(h=10, r1=3.55, r2=3.55);
            translate([bracket_height/2-6.15,0,-5])
                cylinder(h=10, r1=3.55, r2=3.55);

        }
    }
}

module top()
{
    translate([-16/2,0,-0])
        cube(size = [16,bracket_len/4-2*ear_len/*-2*4*/,4], center = true);
}


module base()
{
    difference() {
        union() {
            translate([-30/2,0,-0])
                cube(size = [30,bracket_len/4-2*ear_len/*-2*4*/,4], center = true);
            translate([-(85+4)/2,-49/2,-0])
                cube(size = [85+4,10,4], center = true);
            translate([-(85+4)/2, 49/2,-0])
                cube(size = [85+4,10,4], center = true);
        }
        union() {
            translate([-(85-3.5-58),-49/2,-5])
                cylinder(h=10, r1=1.25, r2=1.25);
            translate([-(85-3.5-58),-49/2,0.01])
                cylinder(h=2, r1=3, r2=3);
            translate([-(85-3.5-58),49/2,-5])
                cylinder(h=10, r1=1.25, r2=1.25);
            translate([-(85-3.5-58),49/2,0.01])
                cylinder(h=2, r1=3, r2=3);
            translate([-(85-3.5),-49/2,-5])
                cylinder(h=10, r1=1.25, r2=1.25);
            translate([-(85-3.5),-49/2,0.01])
                cylinder(h=10, r1=3, r2=3);
            translate([-(85-3.5),49/2,-5])
                cylinder(h=10, r1=1.25, r2=1.25);
            translate([-(85-3.5),49/2,0.01])
                cylinder(h=10, r1=3, r2=3);
        }
    }
}
