#!/bin/bash
set -eux
cd qt5
./init-repository -f --module-subset="qtbase,qtcharts,qtgamepad,qtimageformats,qtmultimedia,qtnetworkauth,qtserialport,qtsvg,qtsystems,qttools,qttranslations,qtwebsockets,qtwinextras,qtx11extras,qtxmlpatterns,qtdeclarative,qtgraphicaleffects,qtquickcontrols2,qtquicktimeline,qtscxml,qtwebview"
