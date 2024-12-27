#!/bin/bash
cd "$(dirname "$0")"

# rm -rf buildios
LIB="zlib"

FOLDERIOS=${LIB}-ios
FOLDERSIM=${LIB}-sim
mkdir ${FOLDERIOS}
mkdir ${FOLDERSIM}

COMMON="-DCMAKE_BUILD_TYPE=Release \
-DCMAKE_INCLUDE_OUTPUT_DIRECTORY=include \
-DCMAKE_ARCHIVE_OUTPUT_DIRECTORY=lib \
-DCMAKE_LIBRARY_OUTPUT_DIRECTORY=lib \
-DBUILD_SHARED_LIBS=OFF \
-DZLIB_BUILD_EXAMPLES=OFF \
-DCMAKE_TOOLCHAIN_FILE=../../_ios-cmake/ios.toolchain.cmake \
"

cd ${FOLDERIOS}
cmake ../chalet_external/${LIB}  -G Xcode ${COMMON} \
    -DPLATFORM=OS64 \
cmake --build . --config Release


cd ../${FOLDERSIM}
cmake ../chalet_external/${LIB} -G Xcode ${COMMON} \
    -DPLATFORM=SIMULATOR64COMBINED
cmake --build . --config Release
cd ..


rm -rf include
mkdir include
cp chalet_external/${LIB}/*.h include

xcframework_flags=""
xcframework_flags+=" -library ${FOLDERSIM}/lib/Release/*.a"
xcframework_flags+=" -library ${FOLDERIOS}/lib/Release/*.a"
xcframework_flags+=" -headers include"

# echo xcodebuild -create-xcframework ${xcframework_flags} -output ${LIB}.xcframework
xcodebuild -create-xcframework ${xcframework_flags} -output ${LIB}.xcframework
# cmake --install . --prefix `pwd`/install
