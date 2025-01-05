cd chalet_external/cairo
#meson setup --reconfigure
meson setup --reconfigure builddir
meson configure -Dxlib=disabled -Dfontconfig=disabled -Dfreetype=disabled -Ddwrite=disabled
meson compile -C builddir
# cd builddir
# meson compile
# meson test

# echo meson build
# meson build
# echo meson compile -C build --xlib=false
# meson compile -C build --xlib=false
