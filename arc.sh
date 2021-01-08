#!/usr/bin/env sh

NAME=qt-src

if [ -z $NAME ]; then
    echo "You must specify a super-archive name."
    exit 1
fi

git archive --prefix "$NAME/" -o "$NAME.tar" HEAD
git submodule foreach --recursive "git archive --prefix=$NAME/\$path/ --output=\$sha1.tar HEAD && tar --concatenate --file=$(pwd)/$NAME.tar \$sha1.tar && rm \$sha1.tar"

gzip "$NAME.tar"
