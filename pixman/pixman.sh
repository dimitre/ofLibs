#!/bin/sh
cd "$(dirname "$0")"
# pwd
#
# export
# export MACOSX_DEPLOYMENT_TARGET=11.6
unset MACOSX_DEPLOYMENT_TARGET
export MIN_SUPPORTED_MACOSX_DEPLOYMENT_TARGET=11.6
export LDFLAGS='-mmacosx-version-min=11.6'
export CFLAGS='-stdlib=libc++ -mmacosx-version-min=11.6'
export CXXFLAGS='-stdlib=libc++ -mmacosx-version-min=11.6'

git clone https://gitlab.freedesktop.org/pixman/pixman.git --depth 1
cd pixman
# git fetch --depth 1 origin 727966dfca933d4a8fc6e65a428e1a9ce1a2fec2


# cd chalet_external/pixman
meson setup build -Ddefault_library=static -Dbuildtype=release --reconfigure -Ddemos=disabled -Dtests=disabled
ninja -C build

mkdir -p lib/${PLATFORM}
cp build/pixman/*.a lib/${PLATFORM}
mkdir -p include/pixman
cp -R build/pixman/*.h include/pixman
zip -r oflib_pixman_${PLATFORM}.zip lib include
mv *.zip ..

# cd ..
# mkdir -p lib/${PLATFORM}
# cp cairo/build/src/*.a lib/${PLATFORM}
# mkdir -p include/cairo
# cp -R cairo/src/*.h include/cairo
# cp -R cairo/build/src/*.h include/cairo

# zip -r oflib_cairo_${PLATFORM}.zip lib include
