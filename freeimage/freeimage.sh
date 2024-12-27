#!/bin/bash
cd "$(dirname "$0")"
LIB="FreeImage"
# DRYRUN="echo --------->>>> echo"
DRYRUN=""
FOLDERIOS=${LIB}-ios
FOLDERSIM=${LIB}-sim

${DRYRUN} mkdir ${FOLDERIOS}
${DRYRUN} mkdir ${FOLDERSIM}


COMMON="-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INCLUDE_OUTPUT_DIRECTORY=include \
-DCMAKE_ARCHIVE_OUTPUT_DIRECTORY=lib \
-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=lib \
-DBUILD_SHARED_LIBS=OFF \
-DCMAKE_POSITION_INDEPENDENT_CODE=ON \
-DBUILD_TESTS=OFF \
-DBUILD_ZLIB=ON \
-DBUILD_JXR=OFF \
-DBUILD_LIBPNG=OFF \
-DBUILD_LIBRAWLITE=OFF \
-DBUILD_OPENEXR=OFF \
-DBUILD_WEBP=OFF \
-DCMAKE_CXX_EXTENSIONS=OFF \
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
${DRYRUN} cp chalet_external/${LIB}/Source/*.h include

xcframework_flags=""
xcframework_flags+=" -library ${FOLDERSIM}/lib/Release/*.a"
xcframework_flags+=" -library ${FOLDERIOS}/lib/Release/*.a"
xcframework_flags+=" -headers include"

${DRYRUN} xcodebuild -create-xcframework ${xcframework_flags} -output ${LIB}.xcframework

${DRYRUN} mkdir dist
${DRYRUN} zip -r dist/${LIB}.zip ${LIB}.xcframework
