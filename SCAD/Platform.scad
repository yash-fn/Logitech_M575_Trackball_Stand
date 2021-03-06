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
Platform()
{

    translate([-(RidgeWidth), (RidgeWidth), 0])
    translate(PlatformRotateTranslate)
    
    translate([Knob_Center.x,Knob_Center.y,0]) //undo center on knob
    rotate(PlatformRotate)
    translate([-Knob_Center.x,-Knob_Center.y,0]) //center on knob
    
    Platform_unrotated();
}

intersection(){ //To determine PlatformRotateTranslate variable
Platform();
if (Guidelines) {
 cube([1,160,1]);
 translate([-160,-1,0])
 cube([160,1,1]);
}
}

