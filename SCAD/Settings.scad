PlatformAngle = 45;
CornerRimWidth = 3.2;

RidgeWidth = 3.2+2;

PlatformTranslateOffset=((-pow(1.071782995, PlatformAngle) + 172.21)/PlatformAngle) - .36 + RidgeWidth;

PlatformRotate=16;
PlatformRotateTranslate=[-1.413+PlatformTranslateOffset,-5.60,0];
Guidelines=false;


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