#!/bin/sh
exec docker run --rm -it -v $PWD/documents:/documents -p 8000:8000 hnakamur/sphinx "$@"
