/**
 * Martin Egli
 * 2023-06-27
 * shells to press side of corpus into shape
 */

module outerShell(part = 1, th = 40, loc_res = 32) {
    difference() {
        union() {
            translate([0, 0, 0])
            linear_extrude(height = th) import("corpusOuterShellOut.dxf");
            
            translate([0, 0, 0])
            difference() {
                translate([0, 0, 0])
                linear_extrude(height = 3) import("corpusOuterShellOut2.dxf");
                translate([0, 0, -1])
                linear_extrude(height = 3+2) import("corpusOuterShellOut.dxf");
            }
            translate([0, 0, th-3])
            difference() {
                translate([0, 0, 0])
                linear_extrude(height = 3) import("corpusOuterShellOut2.dxf");
                translate([0, 0, -1])
                linear_extrude(height = 3+2) import("corpusOuterShellOut.dxf");
            }
            
            // connector between parts
            translate([350/2-10-3, 20, 0])
            cube([3+3, 255, th]);
            translate([-7.5, 270/2+10-3, 0])
            cube([336, 3+3, th]);
        }
        translate([0, 0, -1])
        linear_extrude(height = th+2) import("corpusOuterShellIn.dxf");
        
        // M3 holes
        translate([350/2-10-5, 24, 10])
        rotate([0, 90, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        translate([350/2-10-5, 24, 10+20])
        rotate([0, 90, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        
        translate([350/2-10-5, 270+10-10, 10])
        rotate([0, 90, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        translate([350/2-10-5, 270+10-10, 10+20])
        rotate([0, 90, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        
        translate([-3, 270/2+20, 10])
        rotate([90, 0, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        translate([-3, 270/2+20, 10+20])
        rotate([90, 0, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        
        translate([350-26, 270/2+20, 10])
        rotate([90, 0, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        translate([350-26, 270/2+20, 10+20])
        rotate([90, 0, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        
        // cut in parts
        if(part == 1) {
            // 1
            *translate([350/2-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 2
            translate([-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 3
            translate([-10, 10, -1])
            cube([350/2, 270/2, th+2]);
            // 4
            translate([350/2-10, 10, -1])
            cube([350/2, 270/2, th+2]);
        } else if(part == 2) {
            // 1
            translate([350/2-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 2
            *translate([-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 3
            translate([-10, 10, -1])
            cube([350/2, 270/2, th+2]);
            // 4
            translate([350/2-10, 10, -1])
            cube([350/2, 270/2, th+2]);
        } else if(part == 3) {
            // 1
            translate([350/2-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 2
            translate([-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 3
            *translate([-10, 10, -1])
            cube([350/2, 270/2, th+2]);
            // 4
            translate([350/2-10, 10, -1])
            cube([350/2, 270/2, th+2]);
        } else { // if(part == 1) {
            // 1
            translate([350/2-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 2
            translate([-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 3
            translate([-10, 10, -1])
            cube([350/2, 270/2, th+2]);
            // 4
            *translate([350/2-10, 10, -1])
            cube([350/2, 270/2, th+2]);
        }
    }
}

module innerSchell(part = 1, th = 40, loc_res = 32) {
    difference() {
        union() {
            difference() {
                union() {
                    translate([0, 0, 0])
                    linear_extrude(height = th) import("corpusInnerShellOut.dxf");
                }
                union() {
                    translate([0, 0, 3])
                    linear_extrude(height = th-2*3) import("corpusInnerShellIn.dxf");
                    translate([0, 0, -2])
                    linear_extrude(height = th + 2*3) import("corpusInnerShellOut2.dxf");
                }
            }
            // connectors between parts
            translate([350/2-10-3, 49, 0])
            cube([3+3, 18, th]);
            translate([16, 270/2+10-3, 0])
            cube([15, 3+3, th]);
            
            translate([350/2-10-3, 225, 0])
            cube([3+3, 20, th]);
            translate([290, 270/2+10-3, 0])
            cube([15, 3+3, th]);
        }
        // M3 holes
        translate([350/2-10-5, 60, 10])
        rotate([0, 90, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        translate([350/2-10-5, 60, 10+20])
        rotate([0, 90, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        
        translate([350/2-10-5, 230, 10])
        rotate([0, 90, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        translate([350/2-10-5, 230, 10+20])
        rotate([0, 90, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        
        translate([25, 270/2+20, 10])
        rotate([90, 0, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        translate([25, 270/2+20, 10+20])
        rotate([90, 0, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        
        translate([294, 270/2+20, 10])
        rotate([90, 0, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        translate([294, 270/2+20, 10+20])
        rotate([90, 0, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        
        // cut in parts
        if(part == 1) {
            // 1
            *translate([350/2-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 2
            translate([-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 3
            translate([-10, 10, -1])
            cube([350/2, 270/2, th+2]);
            // 4
            translate([350/2-10, 10, -1])
            cube([350/2, 270/2, th+2]);
        } else if(part == 2) {
            // 1
            translate([350/2-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 2
            *translate([-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 3
            translate([-10, 10, -1])
            cube([350/2, 270/2, th+2]);
            // 4
            translate([350/2-10, 10, -1])
            cube([350/2, 270/2, th+2]);
        } else if(part == 3) {
            // 1
            translate([350/2-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 2
            translate([-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 3
            *translate([-10, 10, -1])
            cube([350/2, 270/2, th+2]);
            // 4
            translate([350/2-10, 10, -1])
            cube([350/2, 270/2, th+2]);
        } else { // if(part == 1) {
            // 1
            translate([350/2-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 2
            translate([-10, 270/2+10, -1])
            cube([350/2, 270/2, th+2]);
            // 3
            translate([-10, 10, -1])
            cube([350/2, 270/2, th+2]);
            // 4
            *translate([350/2-10, 10, -1])
            cube([350/2, 270/2, th+2]);
        }
    }
}

outerShell(1);
*innerSchell(1);
