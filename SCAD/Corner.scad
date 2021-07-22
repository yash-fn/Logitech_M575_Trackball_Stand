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

module corner_cut() {
difference(){
rotate([0,180,0])
scale(70)
ScannedCorner();

color("red", 0.5)
translate([-27,-43,11]) //12 to 11
rotate([20,0,20])
cube([45,40,50]);
}
}

module MainCorner(){
    
difference(){
    
    
translate([0.50,-0.75,1])
translate([-52.6,105.6,BaseHeight])
rotate([0,0,-63])
corner_cut();
    
    
translate([-90,70,-10])
cube([90,90,10]); //make bottom flat
}
    

}

module TabCorner() {
translate([-74.5,50.5,BaseHeight])
difference(){

minkowski(){
translate([0,0,-4.3])
rotate([10,-30,48]) //was 15,15
cube([2,10,10]);
    
sphere(1.4);
}

translate([0,0,-5])
cube([20,20,10], center=true);
}


}

module Corner() {

MainCorner();
Rim();
//TabCorner();

}

Corner();



