    $fn=50*1.0;

include <lego_beam.scad>;


bracket_len=482.6; // length of rack equipment mounting bracket 19 inch
bracket_height = 44; // actually 44.45 mm 1.75 inch
body_len=449; // max length of equipment body
ear_len=(bracket_len-body_len)/2; //18.6
slack=0.3;

difference()
{
    joint();
    translate([0,0,-1])
    cube(size=[100,100,4],center=true);

}

horizontal_offset_from_end = 0.625*25.4/2; //0.625 inch is the side rail and the hole is in the middle
vertical_hole_distance = 31.75;
mounting_hole_radius = 3.55;

module joint()
{
    union() {
        cube(size = [bracket_height,ear_len*2-slack,4], center = true);
 
        union() {
            translate([vertical_hole_distance/2, horizontal_offset_from_end,4/2])
                pin();
            translate([-vertical_hole_distance/2, horizontal_offset_from_end,4/2])
                pin();
            translate([-vertical_hole_distance/2,-horizontal_offset_from_end,4/2])
                pin();
            translate([vertical_hole_distance/2,-horizontal_offset_from_end,4/2])
                pin();
        }
    }
}

module pin()
{
    difference() {    

    difference() {
        union() {
            cylinder(h=6, r1=mounting_hole_radius-slack, r2=mounting_hole_radius-slack);
            translate([0,0,4.2])
                cylinder(h=1.8, r1=mounting_hole_radius*1.1-slack, r2=mounting_hole_radius*1.00-slack);
            translate([0,0,4])
                cylinder(h=0.2, r1=mounting_hole_radius*1.0-slack, r2=mounting_hole_radius*1.1-slack);
        }
        cylinder(h=6+0.1, r1=mounting_hole_radius/2, r2=mounting_hole_radius/2);
    }
        translate([0,0,2+6/2])
            cube(size = [100,mounting_hole_radius,6], center = true);
    }
    
}