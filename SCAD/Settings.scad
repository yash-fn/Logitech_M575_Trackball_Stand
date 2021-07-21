PlatformRotate=16;
PlatformRotateTranslate=[-1.41295,-7.6692,0];
Guidelines=false;

PlatformAngle = 15;
Platform_XYZ = [ 100, 135.5 , 45]; //Dimensions after z plane (not y plane) rotation

USESTL=false;

//Below is not really supposed to be dynamically changed
IndentHeight=0.36; //0.35 Measured
BaseHeight = 1.2*2.5;
KnobHeight = 5;
KnobRadius = 6.25;
KnobRimHeight = 0;
KnobRimRadius_add = 0.3;
Knob_Center = [ -70.725, 73.95 ];
HoleFillCenter = [ -70.725, 73.95 ];

CornerRimWidth = 1.2 + 2;

RidgeWidth = 4+1.2;
RidgeHeight = 3;



module
ScannedBase()
{
    mirror([ 1, 0, 0 ]) import("../Scans/Base/Base.svg");
}

module
ScannedIndents()
{
    mirror([ 1, 0, 0 ]) import("../Scans/Indents/indents.svg");
}

module
ScannedEdgeGaurd()
{
    import("../Scans/Photogrammetry/EdgeGaurdScan_simp.stl");
};

module
ScannedCorner()
{
    import("../Scans/Photogrammetry/uniformmeshresample2_simp.stl");
}

module
GetSTL(Filename="")
{
    echo(Filename);
    import(str("../STL/", Filename, ".stl"));
}