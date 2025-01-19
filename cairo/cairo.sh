#!/bin/bash
cd "$(dirname "$0")"
pwd
# brew install meson
# export CCACHE_DISABLE=1

git clone https://gitlab.freedesktop.org/cairo/cairo --depth 1
cd cairo
git fetch --depth 1 origin 727966dfca933d4a8fc6e65a428e1a9ce1a2fec2

meson setup build -Ddefault_library=static -Ddefault_both_libraries=static -Dbuildtype=release -Dxcb=disabled -Dxlib=disabled -Dlzo=disabled --reconfigure
ninja -C build

cd ..
mkdir -p lib/${PLATFORM}
cp cairo/build/src/*.a lib/${PLATFORM}
mkdir -p include/
cp -R cairo/src/*.h include

zip -r oflib_cairo_macos.zip lib include

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
