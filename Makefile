all: trackball-plate.stl

%.stl: %.scad
	openscad -o $@ $<

%.gcode: %.stl
	slic3r --load ditto.ini -o $@ $<
