#!/usr/bin/env bash

set -e

MODDIRS=$(git submodule status | cut -d ' ' -f 3)
for d in $MODDIRS; do
  (
    echo "updating submodule @ $d"
    cd $d
    git checkout master && git pull origin master
  )
done
