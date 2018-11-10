#!/bin/sh
if [ -n "$PORT" ]; then
  port_opt="-p $PORT:8000 "
else
  port_opt=""
fi
exec docker run --rm -it -v $PWD/documents:/documents $port_opt hnakamur/sphinx "$@"
