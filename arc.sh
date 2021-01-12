#!/usr/bin/env sh

NAME=qt5

if [ -z $NAME ]; then
    echo "You must specify a super-archive name."
    exit 1
fi

RELSRCROOT=$(dirname $0)
SRCROOT=$(readlink -e $RELSRCROOT)

cd ${SRCROOT}

#git archive --prefix "$NAME/" -o "${SRCROOT}/$NAME.tar" HEAD
#git submodule foreach --recursive "git archive --prefix=$NAME/\$path/ --output=\$sha1.tar HEAD && tar --concatenate --file=${SRCROOT}/$NAME.tar \$sha1.tar && rm \$sha1.tar"

archdir="qt5"
archname="$archdir.tar"
#tar --exclude-vcs -cvhf "$archname" "$archdir" <<<  !!!  NOT works
tar -cvhf "$archname" --exclude='\.git/*' "$archdir"


# delete tests, docs, examples, ...

tar -f "$archname" --wildcards --delete \
qt5/coin/ \
qt5/qt3d/ \
qt5/qtactiveqt/ \
qt5/qtandroidextras/ \
qt5/qtcanvas3d/ \
qt5/qtconnectivity/ \
qt5/qtdatavis3d/ \
qt5/qtdeclarative/ \
qt5/qtdoc/ \
qt5/qtdocgallery/ \
qt5/qtfeedback/ \
qt5/qtgraphicaleffects/ \
qt5/qtlocation/ \
qt5/qtmacextras/ \
qt5/qtpim/ \
qt5/qtpurchasing/ \
qt5/qtqa/ \
qt5/qtquickcontrols/ \
qt5/qtquickcontrols2/ \
qt5/qtremoteobjects/ \
qt5/qtrepotools/ \
qt5/qtscript/ \
qt5/qtscxml/ \
qt5/qtsensors/ \
qt5/qtserialbus/ \
qt5/qtspeech/ \
qt5/qtvirtualkeyboard/ \
qt5/qtwayland/ \
qt5/qtwebchannel/ \
qt5/qtwebengine/ \
qt5/qtwebglplugin/ \
qt5/qtwebview/ \
qt5/qtlottie \
qt5/qtquick3d \
qt5/qtquicktimeline \
qt5/qtshadertools

tar -f "$archname" --wildcards --delete */dist/
tar -f "$archname" --wildcards --delete */docs/
tar -f "$archname" --wildcards --delete */doc/*/images/
tar -f "$archname" --wildcards --delete */doc/images/
tar -f "$archname" --wildcards --delete */doc/snippets/
tar -f "$archname" --wildcards --delete */*.qdoc
tar -f "$archname" --wildcards --delete */examples/
tar -f "$archname" --wildcards --delete */example/
tar -f "$archname" --wildcards --delete */tests/
tar -f "$archname" --wildcards --delete */translations/designer_*
tar -f "$archname" --wildcards --delete */translations/assistant_*
tar -f "$archname" --wildcards --delete */translations/linguist_*

# add missing tests for building
tar --append --file=${SRCROOT}/$NAME.tar --wildcards qt5/*/tests/auto/cmake/*

# optional compression
#gzip "$NAME.tar"
#time zstd "$NAME.tar" -f --ultra -22
#time zstd "$NAME.tar" -f -19

