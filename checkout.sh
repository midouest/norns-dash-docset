#!/usr/bin/env bash

BASE_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
NORNS_DIR=$BASE_DIR/norns

set -euxo pipefail

if [ ! -f $NORNS_DIR/.git ]
then
    git submodule init
    git submodule update
fi

cd $NORNS_DIR
git fetch
git checkout $(git tag -l "v*" --sort=-v:refname | head -n 1)
