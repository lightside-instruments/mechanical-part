//$fn=50*1.0;

//scale([1,1,1]) {
//	translate([0,0,0]) {
//		rotate([0,0,0]) {
//          vertical();
//      }
//}
horizontal();


module horizontal() 
{
    linear_extrude(height=3, center=true, convexity=10)
        import(file="horizontal.dxf");
}