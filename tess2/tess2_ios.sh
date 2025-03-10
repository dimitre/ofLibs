#!/bin/bash
cd "$(dirname "$0")"
LIB="tess2"
# DRYRUN="echo --------->>>> echo"

executa() {
    echo -e "\033[0;35m$@ \033[0m"
    "$@"
}
DRYRUN=""
FOLDERIOS=${LIB}-ios
FOLDERSIM=${LIB}-sim

${DRYRUN} mkdir ${FOLDERIOS}
${DRYRUN} mkdir ${FOLDERSIM}

COMMON="-DCMAKE_BUILD_TYPE=Release \
-DBUILD_SHARED_LIBS=OFF \
-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
-DCMAKE_TOOLCHAIN_FILE=../../_ios-cmake/ios.toolchain.cmake \
"

executa cmake -S chalet_external/${LIB} -B ${FOLDERIOS} -G Xcode ${COMMON} -DPLATFORM=OS64
executa cmake --build ${FOLDERIOS} --config Release

executa cmake -S chalet_external/${LIB} -B ${FOLDERSIM} -G Xcode ${COMMON} -DPLATFORM=SIMULATOR64COMBINED
executa cmake --build ${FOLDERSIM} --config Release

executa rm -rf include
executa mkdir include
executa cp chalet_external/${LIB}/Include/*.h include

xcframework_flags=""
xcframework_flags+=" -library ${FOLDERSIM}/Release-iphonesimulator/*.a"
xcframework_flags+=" -library ${FOLDERIOS}/Release-iphoneos/*.a"
xcframework_flags+=" -headers include"

executa xcodebuild -create-xcframework ${xcframework_flags} -output ${LIB}.xcframework

executa mkdir dist
executa zip -r dist/${LIB}.zip ${LIB}.xcframework
