include <Settings.scad>

use <DeviceScan.scad> //For alignment purposes only
// GetSTL("DeviceScan");

use <IndentsKnob.scad> //For alignment purposes only
// GetSTL("IndentsKnob");


module ExtrudedEdge(){

module EdgeGaurdSkin() {
x=1.4;
translate([-17.2+x-0.4,111.9-x+0.2,0.8]) //translate to proper attachment
rotate([-0,0,-21.4])
scale(1.0)
translate([11.6,-63.4,-0.15]) //translate to zero point
scale(81)
color("red")
ScannedEdgeGaurd();
}
;

    j=1.2;
    translate([-0.1,-0.1,.15+0.4+0.2])
    color("red")
    difference(){
        hull()
        translate([j,-0.3*j, 0])
        EdgeGaurdSkin();
        hull()
        EdgeGaurdSkin();
        translate([0,0,1])
        hull()
        EdgeGaurdSkin();
    }

};
;


module Ridge() {

module FullRidge() {
module BasewithRim() {
offset(r=RidgeRimWidth)
ScannedBase();
}
color("#008F39")
linear_extrude(BaseHeight+RidgeHeight)
difference(){
offset(r=RidgeWidth)
BasewithRim();
BasewithRim();
}
}
;

module FullRim() {
color("#FF7514")
linear_extrude(BaseHeight)
difference(){
offset(r=RidgeRimWidth)
ScannedBase();
ScannedBase();
}
}
;


intersection(){
    union(){
difference(){
    FullRidge();
    translate([0,0,1])
    hull()
    ExtrudedEdge();
    hull()
    ExtrudedEdge();
}
    FullRim();
    }
    translate([-56,-3.5,0])
    rotate(-21.15)
    cube([100,140,6]);
}
;
}
;


module EdgeGuard() {
    union(){
ExtrudedEdge();
Ridge();    
}
}

EdgeGuard();