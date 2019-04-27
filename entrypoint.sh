#!/bin/sh

if [ "${SWITCH_USER:-0}" -ne 0 ]; then
  USER_ID=${LOCAL_UID:-9001}
  GROUP_ID=${LOCAL_GID:-9001}
  
  echo "Starting with UID : $USER_ID, GID: $GROUP_ID"
  # NOTE: We use system user here to skip setting password prompt.
  # And we use system group just for consistency with user.
  addgroup -S -g $GROUP_ID user
  adduser -S -u $USER_ID -G user user
  export HOME=/home/user
  
  cmd="/sbin/su-exec user"
else
  cmd=""
fi
exec $cmd "$@"
