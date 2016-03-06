all: trackball-plate.stl

%.stl: %.scad
	openscad -o $@ $<
