#!/bin/bash
cd "$(dirname "$0")"
#LIB="FreeImage"
#echo $@
PLATFORM=macos
cmake --install ./build/arm64-apple-darwin_Release/ext.opencv
mkdir Release/lib/${PLATFORM}
mv Release/lib/{opencv4,*.a} Release/lib/${PLATFORM}
#printenv
