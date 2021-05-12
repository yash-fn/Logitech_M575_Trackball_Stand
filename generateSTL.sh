#!/bin/bash

#openscad -D angle=50 -o STL/50.stl SCAD/Logi_M575_Stand.scad

# for angle in {0..89} ; do
# openscad -D angle=$angle -o STL/$angle-Logi_M575_Stand.stl SCAD/Logi_M575_Stand.scad
# done



printf '%s\0' {0..89} | xargs -0 -n1 -P10 sh -c 'openscad -D angle=$1 -o STL/$1-Logi_M575_Stand.stl SCAD/Logi_M575_Stand.scad' _