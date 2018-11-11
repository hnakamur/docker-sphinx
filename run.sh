#!/bin/sh
exec docker run --rm -it -v $PWD/documents:/documents hnakamur/sphinx "$@"
