#!/bin/bash
cd "$(dirname "$0")"
pwd
# export CCACHE_DISABLE=1

git clone https://gitlab.freedesktop.org/cairo/cairo.git --depth 1
cd cairo
git fetch --depth 1 origin 7fd0cd0a9c0278c2b3d4c78087ca8481087b588b


meson setup --cross-file ../macos-x86_64.txt ../intel -Ddefault_library=static -Ddefault_both_libraries=static -Dbuildtype=release -Dxcb=disabled -Dxlib=disabled -Dlzo=disabled --reconfigure
ninja -C ../intel

meson setup ../silicon -Ddefault_library=static -Ddefault_both_libraries=static -Dbuildtype=release -Dxcb=disabled -Dxlib=disabled -Dlzo=disabled --reconfigure
ninja -C ../silicon

cd ..
lipo -info ./intel/src/*.a
lipo -info ./silicon/src/*.a

# cd ..
mkdir -p lib/${PLATFORM}
lipo ./intel/src/*.a ./silicon/src/*.a -create -output ./lib/${PLATFORM}/libcairo.a
lipo -info ./lib/${PLATFORM}/libcairo.a

# cp cairo/build/src/*.a lib/${PLATFORM}
mkdir -p include/cairo
cp -R ./intel/src/*.h include/cairo
cp -R cairo/src/*.h include/cairo

zip -r ofLibs_cairo_${PLATFORM}.zip lib include

# --buildtype=release

# cd chalet_external/cairo
# meson setup --reconfigure builddir
# meson configure -Dxlib=disabled -Dfontconfig=disabled -Dfreetype=disabled -Ddwrite=disabled
# meson compile -C builddir
# cd builddir
# meson compile
# meson test

# echo meson build
# meson build
# echo meson compile -C build --xlib=false
# meson compile -C build --xlib=false


#
#
# meson setup build -Dc_args="-arch x86_64" -Dcpp_args="-arch x86_64" -Ddefault_library=static -Ddefault_both_libraries=static -Dbuildtype=release -Dxcb=disabled -Dxlib=disabled -Dlzo=disabled --reconfigure
# meson setup build -Dc_args="-march=x86-64 -march=arm64" -Ddefault_library=static -Ddefault_both_libraries=static -Dbuildtype=release -Dxcb=disabled -Dxlib=disabled -Dlzo=disabled --reconfigure
# ninja -C build

# -Dpng=disabled -Dzlib=disabled  \
