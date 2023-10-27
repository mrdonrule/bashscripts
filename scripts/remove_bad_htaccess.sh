#!/bin/bash

# remove htaccess in sub directory  find . -name ".htaccess" -exec rm -rf {} \;
find . -type f -perm 0444 -name ".htaccess" -exec echo rm {} \;
