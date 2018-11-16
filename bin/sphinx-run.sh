#!/bin/sh
dockertag="${DOCKER_TAG:-hnakamur/sphinx}"
if [ -n "$BASE_DIR" ]; then
  cd "$BASE_DIR"
fi
exec docker run --rm -it -v "$PWD:/documents" -e USE_GOSU=1 -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER) $dockertag "$@"
