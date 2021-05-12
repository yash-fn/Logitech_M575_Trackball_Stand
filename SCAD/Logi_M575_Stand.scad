include <Settings.scad>

// if(!USESTL) {
use <Platform.scad>
use <Base.scad>
// }

if (angle==undef) {
    angle=PlatformAngle;
}

if(USESTL) GetSTL("Base");
else Base(angle);

rotate([0, angle, 0])
if(USESTL) GetSTL("Platform");
else Platform();