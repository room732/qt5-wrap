#!/usr/bin/env sh

NAME=qt-src

if [ -z $NAME ]; then
    echo "You must specify a super-archive name."
    exit 1
fi

RELSRCROOT=$(dirname $0)
SRCROOT=$(readlink -e $RELSRCROOT)

cd ${SRCROOT}/qt5

git archive --prefix "$NAME/" -o "${SRCROOT}/$NAME.tar" HEAD
git submodule foreach --recursive "git archive --prefix=$NAME/\$path/ --output=\$sha1.tar HEAD && tar --concatenate --file=${SRCROOT}/$NAME.tar \$sha1.tar && rm \$sha1.tar"

cd ${SRCROOT}
gzip "$NAME.tar"
