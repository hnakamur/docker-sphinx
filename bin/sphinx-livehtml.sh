#!/bin/sh
dockertag="${DOCKER_TAG:-hnakamur/sphinx}"
port="${PORT:-8000}"
listen_addr="${LISTEN_ADDR:-0.0.0.0}"
basedir="${BASE_DIR:-$PWD}"
exec docker run --rm -it -v "$basedir:/documents" -p "$port:8000" -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) "$dockertag" "$@" sphinx-autobuild "$basedir/source" "$basedir/build/html" -H "$listen_addr"
