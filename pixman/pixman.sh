#!/bin/sh
cd "$(dirname "$0")"
# pwd
#
export

cd chalet_external/pixman
meson setup build -Ddefault_library=static -Dbuildtype=release --reconfigure -Ddemos=disabled -Dtests=disabled
ninja -C build

mkdir -p lib/${PLATFORM}
cp build/pixman/*.a lib/${PLATFORM}
mkdir -p include/pixman
cp -R build/pixman/*.h include/pixman
# zip -r oflib_pixman_${PLATFORM}.zip lib include
# mv *.zip ../..

# cd ..
# mkdir -p lib/${PLATFORM}
# cp cairo/build/src/*.a lib/${PLATFORM}
# mkdir -p include/cairo
# cp -R cairo/src/*.h include/cairo
# cp -R cairo/build/src/*.h include/cairo

# zip -r oflib_cairo_${PLATFORM}.zip lib include
