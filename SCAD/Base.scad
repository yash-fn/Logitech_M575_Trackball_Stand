include <Settings.scad>

// if(!USESTL) 
use <Platform.scad>

module Base(PlatformAngle_=PlatformAngle){
difference(){
linear_extrude(Platform_XYZ.x*sin(PlatformAngle_))
projection()
rotate([0, PlatformAngle_, 0])
if(USESTL) GetSTL("Platform");
else Platform();
rotate([0, PlatformAngle_, 0])
translate([-Platform_XYZ.x, 0, 0])
cube([Platform_XYZ.x, Platform_XYZ.y, Platform_XYZ.z+abs(( Platform_XYZ.x*sin(PlatformAngle_) - Platform_XYZ.z*cos(PlatformAngle_)  ) * cos(PlatformAngle_) ) ]);
}
}

Base(PlatformAngle);