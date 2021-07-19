include <Settings.scad>

// if(!USESTL) 
use <Platform.scad>

module Base(PlatformAngle_=PlatformAngle){

module CuttingCube(){
cube([Platform_XYZ.x, Platform_XYZ.y, Platform_XYZ.z+abs(( Platform_XYZ.x*sin(PlatformAngle_) - Platform_XYZ.z*cos(PlatformAngle_)  ) * cos(PlatformAngle_) ) ]);
}

difference(){
linear_extrude(Platform_XYZ.x*sin(PlatformAngle_))
projection()
rotate([0, PlatformAngle_, 0])
if(USESTL) GetSTL("Platform");
else Platform();

rotate([0, PlatformAngle_, 0])
translate([-Platform_XYZ.x, 0, 0])
CuttingCube();

CuttingCube();
translate([0,0,-(Platform_XYZ.z+abs(( Platform_XYZ.x*sin(PlatformAngle_) - Platform_XYZ.z*cos(PlatformAngle_)  ) * cos(PlatformAngle_) ))])
CuttingCube();

}
}

Base(PlatformAngle);