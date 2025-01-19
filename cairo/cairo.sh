# brew install meson

git clone https://gitlab.freedesktop.org/cairo/cairo --depth 1 cairogit
cd cairogit
git fetch --depth 1 origin 727966dfca933d4a8fc6e65a428e1a9ce1a2fec2

meson setup build -Ddefault_library=static -Ddefault_both_libraries=static -Dbuildtype=release -Dxcb=disabled -Dxlib=disabled -Dlzo=disabled
# --buildtype=release
ninja -C build

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
