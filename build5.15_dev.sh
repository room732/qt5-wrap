#!/bin/bash

set -eux

#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib:/usr/local/lib
#export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/local/lib/pkgconfig

cd qt5

./configure -opensource -confirm-license -recheck-all \
		-skip qtwebengine -skip qtwebchannel -skip qtwebsockets \
		-skip qtwayland -skip qtscript \
		-skip qtconnectivity -skip qtdatavis3d -skip qtcanvas3d -skip qt3d \
		-skip qtlocation -skip qtpurchasing -skip qtspeech -skip qtgamepad -skip qtserialbus \
		-nomake tests -nomake examples -no-compile-examples \
		-xkbcommon -libudev -evdev -feature-thread \
		-sql-mysql -sql-sqlite -no-icu -cups \
		-shared -silent -debug

make -j"$(nproc)"
    
    
#-static -silent -release
