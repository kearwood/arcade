// Adaptor plate for mounting a trackball (U-Trak from ultimarc.com) on a metal plate.

// Dimensions in millimetres.
panel_thickness = 6;
thickness = 19-3-panel_thickness;
size = 145;
// Centre mount hole is 82mm, 86 with bezel.
hole = 86;
stud_offset = size/2 * sqrt(2);

intersection() {
  difference() {
    translate([-size, -size, 0]) {
      cube([size*2, size*2, thickness]);
    }
    cylinder(d=hole, h=22, center=true);
    // Trackball's through-hole screws are 5mm diameter.
    // Inserts are 6-7mm diameter, 7mm deep.
    for (angle = [0:90:270]) {
      rotate([0, 0, angle]) {
        translate([57.5, 0, thickness - 7]) {
          cylinder(d=7.5, h=thickness, center=false);
        }
      }
    }
    // Panel's mounting studs are 20mm M3.
    for (angle = [0:90:270]) {
      rotate([0,0,angle+45]) {
        translate([stud_offset, 0, 0]) {
          cylinder(d=3.2, h=2.2*thickness, center=true);
        }
      }
    }
  }
  union() {
    cylinder(d=size, h=2.2*thickness, center=true);
    for (angle = [0:90:270]) {
      rotate([0, 0, angle+45]) {
        translate([stud_offset, 0, 0]) {
          cylinder(d=24, h=2.2*thickness, center=true);
        }
      }
    }
  }
}
