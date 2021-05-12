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
    translate([-(RidgeRimWidth+RidgeWidth), (RidgeRimWidth+RidgeWidth), 0])
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
    translate(PlatformRotateTranslate)
    rotate(PlatformRotate)
    Platform_unrotated();
}

// intersection(){ //To determine PlatformRotateTranslate variable
Platform();
// cube([1,160,1]);
// }

