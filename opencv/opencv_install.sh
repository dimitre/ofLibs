#!/bin/bash
cd "$(dirname "$0")"

# only for running script locally
if [ -z ${var+x} ]; then
    PLATFORM=macos
fi

executa() {
    printf "✅ ${COLOR2} ${@} ${NC}\n\r"
    $@
}

executa cmake --install ./build/arm64-apple-darwin_Release/ext.opencv
executa mkdir -p Release/lib/${PLATFORM}
executa mv ./Release/lib/opencv4 ./Release/lib/${PLATFORM}
executa mv ./Release/lib/*.a ./Release/lib/${PLATFORM}
