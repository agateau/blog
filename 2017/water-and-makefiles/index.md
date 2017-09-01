public: false
tags: [tinywheels, makefiles]
title: Water and Makefiles
summary: |
    Improving water tiles, having fun with Makefiles.

This week I improved the water and beach tiles of [Tiny Wheels][tw]. Water looks like this now:

.. thumbimg:: water.png
    :alt: Crusing between islands

[tw]: /projects/tinywheels/

I ended up with 16 tiles to represent sand, water and deep water. Here they are, straight from Aseprite:

.. thumbimg:: water-tiles.png
    :alt: Water tiles

I like this new version better. The water - sand line is still a bit too regular and the water might be a bit too shiny, will need some more refinements.

I also did some cleanup in my assets by automating a few things. For now I am using a Makefile, though I might look into rewriting the tasks using Gradle instead since this is what is used to build the game. I spent a bit of time reading [GNU make doc][make], and came up with some nifty, if a bit cryptic, rules. For example, here are the rules to prepare the images for the vehicles:

[make]: https://www.gnu.org/software/make/manual/make.html

.. sourcecode:: makefile

    # Look for all *.ase files, put them in the VEHICLE_IMAGES variable
    VEHICLE_IMAGES := $(wildcard sprites/vehicles/*.ase)
    # Declare a matching OUT_VEHICLE_IMAGES variable to store the list of .png to produce
    OUT_VEHICLE_IMAGES := $(VEHICLE_IMAGES:%.ase=$(OUT_DIR)/%.png)

    # Declare a `vehicles` target to rebuild all the vehicle images
    vehicles: $(OUT_VEHICLE_IMAGES)

    # Declare a target-specific variable: TMP_PNG, which is the name of the output png file
    # with a -tmp suffix
    $(OUT_DIR)/sprites/vehicles/%.png: TMP_PNG = $(@:%.png=%-tmp.png)

    # For each $name.ase inside sprites/vehicles, export it to a $name-tmp.png file
    # rotate $name-tmp.png 90° clockwise, store the result in $name.png
    # delete $name-tmp.png
    $(OUT_DIR)/sprites/vehicles/%.png: sprites/vehicles/%.ase
        mkdir -p $(OUT_DIR)/sprites/vehicles
        aseprite --batch $< --save-as $(TMP_PNG)
        convert -rotate 90 $(TMP_PNG) $@
        rm $(TMP_PNG)

    clean-vehicles:
        rm -f $(OUT_VEHICLE_IMAGES)

A bit scary, but it works!

In case you are wondering why vehicle images are rotated on the fly instead of being drawn at the right orientation: it feels more natural to draw them facing north, but the code requires that they face east when angle is 0, so to keep the artist (me) and the developer happy (also me), they are rotated at export time.
