$fn=50*1.0;

include <lego_beam.scad>;

scale([1,1,1]) {
    vertical_w_hole();
}

module vertical_lego()
{

    translate([0,0,0]) {
        vertical_w_hole();
    }
}


module vertical()
{
	linear_extrude(height=8, center=true, convexity=10)
		    import(file="vertical.dxf");
}

module vertical2()
{
    union() {
        cube([20, 26 /*2mm slack*/, 20],center=true);
        translate([12,11,0])
        cube([4,4,20],center=true);
    }
}

module vertical_w_hole()
{
    cr=4.1/2; 
    difference() {
        vertical2();
 
            translate([0,0,0])
                rotate([90,0,0])
                cylinder(h=27, r1=cr, r2=cr, center=true);
    }
}

