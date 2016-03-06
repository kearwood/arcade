// Adaptor plate for mounting a trackball (U-Trak from ultimarc.com) on a metal plate.

// Dimensions in millimetres.
plate_thickness = 8;
size = 145;

// Centre mount hole is 82mm, 86 with bezel.
hole = 86;

 difference() {
  translate([-size/2, -size/2, 0]) {
    cube([size, size, 19-3-plate_thickness]);
  }
  cylinder(d=hole, h=20, center=true);
  // Trackball's through-hole screws are 5mm diameter.
  for (angle = [0:90:270]) {
    rotate([0, 0, angle]) {
      translate([57.5, 0, 0]) {
        cylinder(d=5, h=20, center=true);
      }
    }
  }
  // Panel's mounting studs are 20mm M3.
  for (angle = [0:90:270]) {
      rotate([0,0,angle+45]) {
          translate([size/2, 0, 0]) {
              cylinder(d=3.2, h=20, center=true);
          }
      }
  }
}