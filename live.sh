#!/bin/sh
dockertag="${DOCKER_TAG:-hnakamur/sphinx}"
basedir="${BASE_DIR:-$PWD}"
exec docker run --rm -it -v "$basedir:/documents" -p ${PORT:-8000}:8000 -e USE_GOSU=1 -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) "$dockertag" "$@"
