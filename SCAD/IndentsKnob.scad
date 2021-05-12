include <Settings.scad>

use <DeviceScan.scad> //For alignment purposes only
// GetSTL("DeviceScan");

module Indents() {
union(){
    
//Base with indents present
linear_extrude(BaseHeight)
ScannedIndents();
    
//Fill hole marker
translate(HoleFillCenter)
cylinder(BaseHeight, r = 6.89, center = false);

//Indent Base Bottom
color("#aaffbb")
linear_extrude(BaseHeight-IndentHeight)
ScannedBase();
}
}
;
module Knob() {
union(){
color("#aaffbb")
translate(Knob_Center)
cylinder(BaseHeight+KnobRimHeight, r = KnobRadius+KnobRimRadius_add, center = false);

color("#ffaabb")
translate(Knob_Center)
cylinder(KnobHeight+BaseHeight, r = KnobRadius, center = false);
}
}
;

module IndentsKnob() {
//    translate(BaseTranslate) //TBA
//    rotate(BaseRotate) //TBA
    //translate([-RimWidth-RidgeWidth, RimWidth+RidgeWidth])
    union(){
        Indents();
        Knob();
    }
}
;

IndentsKnob();