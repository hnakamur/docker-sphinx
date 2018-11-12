#!/bin/sh
basedir="${BASE_DIR:-$PWD}"
if [ ! -d "$basedir/build/html" ]; then
  echo >&2 "Directory $basedir/build/html not found. Please cd to project base directory or set BASE_DIR environment variable."
  exit 1
fi
cd "$basedir"
git subtree push --prefix build/html/ origin gh-pages
