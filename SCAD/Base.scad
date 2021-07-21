include <Settings.scad>

// if(!USESTL) 
use <Platform.scad>
use <IndentsKnob.scad>
use <Corner.scad>
use <EdgeGuard.scad>


module Base(PlatformAngle_=PlatformAngle){

module CuttingCube(){
cube([Platform_XYZ.x, Platform_XYZ.y, Platform_XYZ.z+abs(( Platform_XYZ.x*sin(PlatformAngle_) - Platform_XYZ.z*cos(PlatformAngle_)  ) * cos(PlatformAngle_) ) ]);
}

difference(){
linear_extrude(Platform_XYZ.x*sin(PlatformAngle_))
rotate([0, PlatformAngle_, 0])

if(USESTL) GetSTL("Platform");
else {
projection()
intersection(){
RotatePlatform()
PlatformComponents();
translate([-Platform_XYZ.x,0,-Platform_XYZ.z+0.04])
cube(size=[Platform_XYZ.x, Platform_XYZ.y, Platform_XYZ.z], center=false);
}
} 

rotate([0, PlatformAngle_, 0])
translate([-Platform_XYZ.x, 0, 0])
CuttingCube();

CuttingCube();

Z_Val = (Platform_XYZ.z+abs(( Platform_XYZ.x*sin(PlatformAngle_) - Platform_XYZ.z*cos(PlatformAngle_)  ) * cos(PlatformAngle_) ));

translate([0,0,-Z_Val])
CuttingCube();
translate([-Platform_XYZ.x, 0, -Z_Val])
CuttingCube();
}
}


module PlatformComponents(){
union(){
IndentsKnob();
Rim();
translate([0,0,BaseHeight])
Ridge();
}
};


Base(PlatformAngle);