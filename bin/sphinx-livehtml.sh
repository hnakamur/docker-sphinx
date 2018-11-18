#!/bin/sh
dockertag="${DOCKER_TAG:-hnakamur/sphinx}"
port="${PORT:-8000}"
listen_addr="${LISTEN_ADDR:-0.0.0.0}"
if [ -n "$BASE_DIR" ]; then
  cd "$BASE_DIR"
fi
if [ "$(uname -s)" == "Darwin" ]; then
  uid_opts="-e USE_GOSU=0"
else
  uid_opts="-e USE_GOSU=1 -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER)"
fi
exec docker run --rm -it -v "$PWD:/documents" -p "$port:8000" $uid_opts "$dockertag" "$@" sphinx-autobuild source build/html -H "$listen_addr"
