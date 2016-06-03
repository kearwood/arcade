all: trackball-plate.gcode

%.stl: %.scad
	openscad -o $@ $<

%.gcode: %.stl ditto.ini
	slic3r --load ditto.ini -o $@ $<
