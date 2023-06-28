/**
 * Martin Egli
 * 2023-06-27
 */

module outerShell(part = 1, th = 40, loc_res = 32) {
    difference() {
        union() {
            translate([0, 0, 0])
            linear_extrude(height = th) import("sketch7korpusOuterShellOut.dxf");
            translate([-10, 10, 0])
            cube([350, 270, 3]);
            translate([-10, 10, th-3])
            cube([350, 270, 3]);
            
            translate([350/2-10, 10, 0])
            cube([3+3, 270, th]);
            translate([-10, 270/2+10, 0])
            cube([350, 3+3, th]);
        }
        translate([0, 0, -1])
        linear_extrude(height = th+2) import("sketch7korpusOuterShellIn.dxf");
        
        // M3 holes
        translate([350/2-10-5, 10+10, 10])
        rotate([0, 90, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        translate([350/2-10-5, 10+10, 10+20])
        rotate([0, 90, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        
        translate([350/2-10-5, 270+10-10, 10])
        rotate([0, 90, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        translate([350/2-10-5, 270+10-10, 10+20])
        rotate([0, 90, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        
        translate([10-15, 270/2+20, 10])
        rotate([90, 0, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        translate([10-15, 270/2+20, 10+20])
        rotate([90, 0, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        
        translate([350-20, 270/2+20, 10])
        rotate([90, 0, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        translate([350-20, 270/2+20, 10+20])
        rotate([90, 0, 0])
        cylinder(d = 3, h = 20, $fn = loc_res);
        
        // part cutout
        *if(part == 1) {
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

module innerSchell(part = 1, th = 40) {
    difference() {
        translate([0, 0, 0])
        linear_extrude(height = th) import("sketch7korpusInnerShellOut.dxf");
        translate([0, 0, -1])
        linear_extrude(height = th+2) import("sketch7korpusInnerShellIn.dxf");
    }
    translate([20, 20, -4])
    cube([20, 20, th+8]);
}

*outerShell(1);
innerSchell(1);
