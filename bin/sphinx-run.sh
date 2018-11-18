#!/bin/sh
dockertag="${DOCKER_TAG:-hnakamur/sphinx}"
if [ -n "$BASE_DIR" ]; then
  cd "$BASE_DIR"
fi
if [ "$(uname -s)" == "Darwin" ]; then
  uid_opts="-e USE_GOSU=0"
else
  uid_opts="-e USE_GOSU=1 -e LOCAL_UID=$(id -u $USER) -e LOCAL_GID=$(id -g $USER)"
fi
exec docker run --rm -it -v "$PWD:/documents" $uid_opts $dockertag "$@"
