#!/bin/sh
dockertag="${DOCKER_TAG:-hnakamur/sphinx}"
basedir="${BASE_DIR:-$PWD}"
if [ ! -f "$basedir/Dockerfile" ]; then
  echo >&2 "file $basedir/Dockerfile not found. Please cd to project base directory or set BASE_DIR environment variable."
  exit 1
fi
exec docker build -t "$dockertag" "$basedir"
