#!/bin/sh
dockertag="${DOCKER_TAG:-hnakamur/sphinx}"
basedir="${BASE_DIR:-$PWD}"
exec docker run --rm -it -v "$basedir:/documents" -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) $dockertag "$@"
