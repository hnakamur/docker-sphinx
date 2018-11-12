#!/bin/sh
basedir="${BASE_DIR:-$PWD}"
sudo chown -R $USER: "$basedir/Makefile" "$basedir/build" "$basedir/source"
