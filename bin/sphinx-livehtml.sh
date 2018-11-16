#!/bin/sh
dockertag="${DOCKER_TAG:-hnakamur/sphinx}"
port="${PORT:-8000}"
listen_addr="${LISTEN_ADDR:-0.0.0.0}"
if [ -n "$BASE_DIR" ]; then
  cd "$BASE_DIR"
fi
exec docker run --rm -it -v "$PWD:/documents" -p "$port:8000" -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) "$dockertag" "$@" sphinx-autobuild source build/html -H "$listen_addr"
