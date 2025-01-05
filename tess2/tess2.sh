#!/bin/bash
cd "$(dirname "$0")"
LIB="tess2"
# DRYRUN="echo --------->>>> echo"
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

${DRYRUN} cmake -S chalet_external/${LIB} -B ${FOLDERIOS} -G Xcode ${COMMON} \
    -DPLATFORM=OS64
${DRYRUN} cmake --build ${FOLDERIOS} --config Release

${DRYRUN} cmake -S chalet_external/${LIB} -B ${FOLDERSIM} -G Xcode ${COMMON} \
    -DPLATFORM=SIMULATOR64COMBINED
${DRYRUN} cmake --build ${FOLDERSIM} --config Release

${DRYRUN} rm -rf include
${DRYRUN} mkdir include
${DRYRUN} cp chalet_external/${LIB}/*.h include

xcframework_flags=""
xcframework_flags+=" -library ${FOLDERSIM}/code/lib/Release/*.a"
xcframework_flags+=" -library ${FOLDERIOS}/code/lib/Release/*.a"
xcframework_flags+=" -headers include"

${DRYRUN} xcodebuild -create-xcframework ${xcframework_flags} -output ${LIB}.xcframework

${DRYRUN} mkdir dist
${DRYRUN} zip -r dist/${LIB}.zip ${LIB}.xcframework
