# vim: ts=4 sw=4 noet :
SOURCES := $(wildcard *.scad)
OBJECTS := $(patsubst %.scad, stl/%.stl, $(SOURCES))


stl/%.stl: %.scad
	openscad -o $@ $<

stl: $(OBJECTS)
	
clean:
	find -iname '*.stl' -delete
