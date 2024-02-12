#!/bin/bash

set -eux

# From Qt 5.15 onwards, Qt does require libxcb 1.11. Also, the -qt-xcb configure option got removed that was bundling some of the libs below. Anyhow, you can now configure with -bundled-xcb-xinput to avoid a dependency to system xcb-xinput.
# install xcb before building:
#    apt install libfontconfig1-dev libfreetype6-dev libx11-dev  libx11-xcb-dev libxext-dev libxfixes-dev libxi-dev libxrender-dev  libxkbcommon-dev libxkbcommon-x11-dev '^libxcb.*-dev'


#export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib:/usr/local/lib
#export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:/usr/local/lib/pkgconfig

cd qt5

./configure -opensource -confirm-license -recheck-all \
		-skip qtwebengine -skip qtwebchannel \
		-skip qtwayland -skip qtscript \
		-skip qtconnectivity -skip qtdatavis3d -skip qtcanvas3d -skip qt3d \
		-skip qtlocation -skip qtpurchasing -skip qtspeech -skip qtgamepad -skip qtserialbus \
		-nomake tests -nomake examples -no-compile-examples \
        -qpa xcb -xcb -xkbcommon -libudev -evdev -feature-thread \
		-sql-mysql -sql-sqlite -no-icu -cups \
		-shared -silent -debug -qt-freetype

make -j"$(nproc)"
    
    
#-static -silent -release
