// Adaptor plate for mounting a trackball (U-Trak from ultimarc.com) on a metal plate.

// Dimensions in millimeters.
plate_thickness = 8;
size = 145;
hole = 86;


 difference() {
  translate([-size/2, -size/2, 0]) {
    cube([size, size, 19-3-plate_thickness]);
  }
  cylinder(d=hole, h=20, center=true);
  for (angle = [0:270:90]) {
      rotate([0, 0, angle]) {
  translate([57.5, 0, 0]) {
      cylinder(d=5, h=20, center=true);
  }
  }
  }
}