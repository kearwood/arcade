all: trackball-plate.stl

%.stl: %.scad
	openscad -o $@ $<

%.gcode: %.stl ditto.ini
	slic3r --load ditto.ini -o $@ $<
