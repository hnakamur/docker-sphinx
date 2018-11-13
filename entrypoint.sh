#!/bin/sh

USER_ID=${LOCAL_UID:-9001}
GROUP_ID=${LOCAL_GID:-9001}

echo "Starting with UID : $USER_ID, GID: $GROUP_ID"
groupadd -g $GROUP_ID user
useradd -u $USER_ID -g user user
export HOME=/home/user

exec /usr/sbin/gosu user "$@"
