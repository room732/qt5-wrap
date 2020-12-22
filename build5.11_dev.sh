#!/bin/bash

cd qt5
./configure -opensource -confirm-license -recheck-all\
		-skip qtwebengine -skip qtwebchannel -skip qtwebsockets\
		-skip qtwayland -skip qtscript -skip qtdeclarative\
		-skip qtconnectivity -skip qtdatavis3d -skip qtcanvas3d -skip qt3d\
		-skip qtlocation -skip qtpurchasing -skip qtspeech -skip qtgamepad -skip qtserialbus\
 		-nomake tests -nomake examples -no-compile-examples -qt-xcb -qt-xkbcommon -sql-mysql -sql-sqlite -no-icu\
		-shared -silent -debug \
    && make -j"$(nproc)"
    
    
#-static -silent -release
