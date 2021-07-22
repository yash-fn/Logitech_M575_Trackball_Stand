include <Settings.scad>

// if(!USESTL) {
use <Platform.scad>
use <Base.scad>
// }

angle=PlatformAngle;

union(){
if(USESTL) GetSTL("Base");
else Base(angle);

difference(){
rotate([0, angle, 0])
if(USESTL) GetSTL("Platform");
else Platform();

translate([0,0,-Platform_XYZ.z])
cube(Platform_XYZ);
}
}