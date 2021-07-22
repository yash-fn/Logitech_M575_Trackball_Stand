include <Settings.scad>

use <DeviceScan.scad> //For alignment purposes only
// GetSTL("DeviceScan");

// if(!USESTL) {
use <Corner.scad>
use <EdgeGuard.scad>
use <IndentsKnob.scad>
// }

module
Platform_unrotated()
{
    union()
    {
        if(USESTL) {
            GetSTL("IndentsKnob");
            GetSTL("EdgeGuard"); 
            GetSTL("Corner");
        } else {
            IndentsKnob();
            EdgeGuard();
            Corner();
        }
    }
}

module
RotatePlatform()
{
    translate([-(RidgeWidth), (CornerRimWidth), 0])
    translate(PlatformRotateTranslate)
    
    translate([Knob_Center.x,Knob_Center.y,0]) //undo center on knob
    rotate(PlatformRotate)
    translate([-Knob_Center.x,-Knob_Center.y,0]) //center on knob
    children();
}

module
Platform()
{
    RotatePlatform()
    Platform_unrotated();
}

difference(){
rotate([0,PlatformAngle,0,])
intersection(){ //To determine PlatformRotateTranslate variable
Platform();
if (Guidelines) {
 cube([1,160,1]);
 translate([-160,-1,0])
 cube([160,1,1]);
}
}

translate([0,0,-Platform_XYZ.z])
cube(Platform_XYZ);
}

