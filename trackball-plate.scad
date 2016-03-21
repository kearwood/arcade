// Adaptor plate for mounting a trackball (U-Trak from ultimarc.com) on a metal plate.

// Dimensions in millimetres.
panel_thickness = 6;
thickness = 19-3-panel_thickness;

// Centre mount hole is 82mm, 86 with bezel.
hole = 83;

// Mounting studs are at the four corners.
size = 145;
stud_offset = size/2 * sqrt(2);
stud_surround = 24;

// Calculate approximately tangent circle for bracing.
web_thickness = min(thickness, 6);
web_offset = (pow(stud_offset,2) + pow(stud_surround/2,2) - pow(size/2,2)) /
                (2*size+2*stud_surround/2-2*sqrt(2)*size/2);
web_radius = 2*size - sqrt(2)*web_offset;

// Set arc smoothness limits for a better finish.
$fa = 3;
$fs = 1;

difference() {
  union() {
    // Start with a blank plate.
    cylinder(d=size, h=thickness, center=false);
    // Arms for mounting studs.
    for (angle = [0:90:270]) {
      rotate([0, 0, angle+45]) {
        translate([0, -stud_surround/2, 0]) {
          cube([stud_offset, stud_surround, thickness]);
        }
        translate([stud_offset, 0, 0]) {
          cylinder(d=stud_surround, h=thickness, center=false);
        }
      }
    }
    // Bracing web between the arms.
    difference() {
      s = size + stud_surround;
      translate([0, 0, web_thickness/2]) {
        cube([s, s, web_thickness], center=true);
      }
      for (angle = [0:90:270]) {
        rotate([0, 0, angle]) {
          translate([size/2 + web_radius, 0, 0]) {
            cylinder(r=web_radius, h=2.2*web_thickness, center=true);
          }
        }
        rotate([0, 0, angle+45]) {
          translate([stud_offset+stud_surround/2, 0, 0]) {
            cylinder(d=stud_surround, h=2.2*web_thickness, center=true);
          }
        }
      }
    }
  }

  // Central mount hole for the trackball.
  cylinder(d=hole, h=2.2*thickness, center=true);
  // Trackball's through-hole screws are 5mm diameter.
  // Inserts are 6-7mm diameter, 7mm deep.
  for (angle = [0:90:270]) {
    rotate([0, 0, angle]) {
      translate([57.5, 0, thickness - 7]) {
        cylinder(d=7.1, h=thickness, center=false);
      }
    }
  }
  // Panel mounting studs are 20mm M3.
  for (angle = [0:90:270]) {
    rotate([0,0,angle+45]) {
      translate([stud_offset, 0, 0]) {
        cylinder(d=3.2, h=2.2*thickness, center=true);
      }
    }
  }
}
