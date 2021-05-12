include <Settings.scad>

use <DeviceScan.scad> //For alignment purposes only
// GetSTL("DeviceScan");


use <IndentsKnob.scad> //For alignment purposes only
// GetSTL("IndentsKnob");


module Rim() {
color("#FF7514")
linear_extrude(BaseHeight)
difference(){
offset(r=CornerRimWidth)
ScannedBase();
ScannedBase();
}
}
;

module corner_full(){
translate([-52.6,105.6,BaseHeight])
rotate([0,180,-60.5])
scale(70)
ScannedCorner();
}

module Corner() {
difference(){
translate([-1,1,0.0])
corner_full();
translate([-90,70,-10])
cube([90,90,10]);
}

Rim();
}

Corner();