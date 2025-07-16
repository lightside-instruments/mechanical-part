$fn=50*1.0;
expansion=90/100;

//difference()
//{
  union() {
//    cylinder(r=(5/16*25.4)*2/sqrt(3)/2, h=5, $fn=6);
    cylinder(r=4*expansion/2, h=8);
    cylinder(r=2.5*expansion/2, h=8+3);
  }
//  translate([0,0,-0.5])
//    cylinder(r=0.5, h=3+5+14+1);
//}