// Adaptor plate for mounting a trackball (U-Trak from ultimarc.com) on a metal plate.

// Dimensions in millimetres.
panel_thickness = 8;
thickness = 19-3-panel_thickness;
size = 145;
// Centre mount hole is 82mm, 86 with bezel.
hole = 86;

intersection() {
  difference() {
    translate([-size/2, -size/2, 0]) {
      cube([size, size, thickness]);
    }
    cylinder(d=hole, h=20, center=true);
    // Trackball's through-hole screws are 5mm diameter.
    // Inserts are 6-7mm diameter, 7mm deep.
    for (angle = [0:90:270]) {
      rotate([0, 0, angle]) {
        translate([57.5, 0, thickness - 7]) {
          cylinder(d=6, h=thickness, center=false);
        }
      }
    }
    // Panel's mounting studs are 20mm M3.
    for (angle = [0:90:270]) {
      rotate([0,0,angle+45]) {
        translate([size/2, 0, 0]) {
          cylinder(d=3.2, h=2.2*thickness, center=true);
        }
      }
    }
  }
  union() {
    cylinder(d=size, h=2.2*thickness, center=true);
    for (angle = [0:90:270]) {
      rotate([0, 0, angle+45]) {
        translate([size/2, 0, 0]) {
          cylinder(d=24, h=2.2*thickness, center=true);
        }
      }
    }
  }
}
