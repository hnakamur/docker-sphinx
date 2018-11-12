#!/bin/sh
dockertag="${DOCKER_TAG:-hnakamur/sphinx}"
basedir="${BASE_DIR:-$PWD}"
exec docker run --rm -it -v "$basedir:/documents" $dockertag "$@"
