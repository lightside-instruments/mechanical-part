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

module vertical_w_hole()
{
    cr=4.1/2; 
    ch=8.1*2;
    difference() {
        vertical();
        union() {
            for ( i = [1,3,4,5,8,9,10,11,12,13,14,15,16,17,18,19])
            translate([i*10,4,0])
                rotate([90,0,0])
                cylinder(h=ch, r1=cr, r2=cr, center=true);
        }
    }
}


