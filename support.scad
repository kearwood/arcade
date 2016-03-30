// Temporary support stand-offs for the front panel
// until we have a case built.

// dimensions in millimetres.
wall = 15;
height = 70;
length = 120;
width = 90;
stud_surround = 24;

// Set arc smoothness limits for a better finish.
$fa = 3;
$fs = 1;

difference() {
  union() {
    cube([wall, length, height]);
    cube([width, wall, height]);
    intersection() {
      cube([length, length, height]);
      translate([wall, wall, 0]) {
        cylinder(r=wall + stud_surround/2, h=15);
      }
    }
  }
  translate([wall + stud_surround/2, wall + stud_surround/2, 0]) {
    cylinder(d=4, h = 32, center=true);
  }
}
