

module DeviceScan() {
    translate([-46,60,0.8])
rotate([0,0,66])
scale(81)
    color("orange")
import("../Scans/Photogrammetry/texturedMesh.stl");
;
}
;


DeviceScan();

