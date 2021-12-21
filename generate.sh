#/usr/bin/env bash

BASE_DIR=$(cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd)
CONFIG_DIR=$BASE_DIR/config
NORNS_DIR=$BASE_DIR/norns
DOC_DIR=$NORNS_DIR/doc
OUT_DIR=$BASE_DIR/build

set -euxo pipefail

if [ ! -f $NORNS_DIR/.git ]
then
    git submodule init
    git submodule update
fi

cp $CONFIG_DIR/{dashing.json,icon@2x.png} $DOC_DIR
cd $DOC_DIR
dashing build norns
tar --exclude='.DS_Store' --exclude='crone' -cvzf norns.tgz norns.docset
mkdir -p $OUT_DIR
cp norns.tgz $OUT_DIR
VERSION=$(git tag -l "v*" --sort=-v:refname | head -n 1 | cut -c 2-)
sed -e "s/\${VERSION}/${VERSION}/" $CONFIG_DIR/docset.template.json > $OUT_DIR/docset.json
git clean -fd .
