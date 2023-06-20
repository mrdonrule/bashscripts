#!/bin/bash
# Remove Go access daily statistics from cwp
# author Victor Tin

#user getent comment to get all users availbe in /etc/passwd
getent passwd | while IFS=: read -r name password uid gid gecos home shell; do

# asign variables to DIR and FILE from home parameter field in etc/passwd
DIR="$home/cwp_stats/goaccess"
# check if folder exists
if [ -d "$DIR" ]; then
  # Take action if $DIR exists. delete direcotory #
  rm -Rf $DIR
  # echo "deleted ${DIR}"
  echo "deleted ${DIR}"
fi
done