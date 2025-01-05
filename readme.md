# ALTpothecary

## TODO
- [ ] make install scripts for all platforms (script? bash? python? c++? autodetect platform?)
- [ ] make correct folders inside .zip in each library
- [ ] add more libraries
- [ ] add library with dependencies
- [ ] test ios/simulator built libs

## DONE
- [x] build ios / simulator some lib
- [x] cross compile for raspberry pi
- [x] compile one library with emscripten
- [x] add license to libraries .zip

## Apothecary Libs
Other than the natural complexity of a such large project things can be tidy there. some suggestions:
- removing variants, like bleeding, latest, etc. to the minimum to make libraries and scripts work.
- formulas: we now have some duplicate defines which turns hard to find and fix issues.
- we could have the global cmake defines, for all platforms, and then the exceptions:
- like the specific defines for each platform. This way we decrease the number of lines to work.

Apothecary actually clones compiles, packages, do a lot. Some of the repetitive work could be handed to some tool like Chalet, and concentrate in the right settings for each platform:
Individual libraries could have its own individual .zip files in each release and platform, something like:
oflibs-osx-curl.zip
oflibs-windows-opencv.zip

We can have an individual runner for each library and it takes in consideration if the folder was changed in latest push (possible in gh actions)
there is a proof of concept running here, the only caveat is this action to release needs a tag, so it is not possible to consider only the folder.

Another idea, we can keep a TSV with all libraries for all platforms, one per line, indicating if it is a download or uses a package manager, so this is a good way of choosing how custom the libraries will be.
example:
| lib      | platform | kind    | data                   | comment |
|----------|----------|---------|------------------------|---------|
| freetype | osx      | static  | oflib_osx_freetype.zip |         |
| freetype | linux64  | package | libfreetype6-dev       |         |
| freetype | macos    | package | freetype               |         |


```csv
lib,platform
freetype, osx, static, oflib_osx_freetype.zip
freetype, linux64, package, libfreetype6-dev
freetype, macos, package, freetype
```

## Libraries CORE


- [x] assimp
it seems to be building all platforms.
I'm not sure emscripten is ok. ```wasm-tools validate libassimp.a``` returns
```error: failed to parse `libassimp.a`: input bytes aren't valid utf-8```
TODO: Check lib and headers paths. maybe add a step to put in the right folder for each platform.

- [ ] cairo
- [.] curl
ok for macos.
- [x] freetype
- [/] glew
- [x] glfw
- [x] glm
- [x] json
- [x] libusb
- [x] libxml2 (addon ofxSvg)
- [x] opencv (missing emscripten)
- [x] pugixml (needed by core ofXml)
- [ ] rtAudio (maybe not needed anymore)
- [ ] svgtiny (needed by addon ofxSvg, to be replaced to a new one)
to build svgtiny additional libraries are needed libwapcaplet & libdom
- [x] tess2
- [x] uriparser
- [x] utf8

- [ ] openssl (curl dependency)
- [ ] pixman (cairo dep?)
- [ ] zlib
- [ ] libpng
- [ ] brotli
- [ ] fmod
- [ ] fmt


brew info fmt
open /opt/homebrew/Cellar/fmt/11.0.2
brew --cellar fmt
/opt/homebrew/Cellar/fmt
mkdir dist
ls $(brew --cellar fmt)
cp $(brew --cellar fmt)/**/*.a dist



## LEFTOVERS

      # - name: Chalet Configure ios
      #   if: matrix.cfg.platform == 'ios'
      #   shell: bash
      #   run: |
      #     #
      #     chalet configure --os-target-name iphoneos -a arm64e
      #     # chalet configure --os-target-name iphonesimulator
      #     # chalet configure --os-target-name {iphoneos,iphonesimulator}

      # - name: Chalet Configure IOS
      #   if: matrix.cfg.platform == 'ios'
      #   shell: bash
      #   run: |
      #     chalet configure


##  Test TSV
```csv
emscripten_assimp, emscripten_curl, emscripten_FreeImage, emscripten_freetype, emscripten_glew, emscripten_glfw, emscripten_glm, emscripten_json, emscripten_libusb, emscripten_libxml2, emscripten_opencv, emscripten_pugixml, emscripten_tess2, emscripten_uriparser, emscripten_usb, emscripten_utfcpp,
ios_assimp, ios_curl, ios_FreeImage, ios_freetype, ios_glew, ios_glfw, ios_glm, ios_json, ios_libusb, ios_libxml2, ios_opencv, ios_pugixml, ios_tess2, ios_uriparser, ios_usb, ios_utfcpp,
linux64_assimp, linux64_curl, linux64_FreeImage, linux64_freetype, linux64_glew, linux64_glfw, linux64_glm, linux64_json, linux64_libusb, linux64_libxml2, linux64_opencv, linux64_pugixml, linux64_tess2, linux64_uriparser, linux64_usb, linux64_utfcpp,
osx_assimp, osx_curl, osx_FreeImage, osx_freetype, osx_glew, osx_glfw, osx_glm, osx_json, osx_libusb, osx_libxml2, osx_opencv, osx_pugixml, osx_tess2, osx_uriparser, osx_usb, osx_utfcpp,
rpi-aarch64_assimp, rpi-aarch64_curl, rpi-aarch64_FreeImage, rpi-aarch64_freetype, rpi-aarch64_glew, rpi-aarch64_glfw, rpi-aarch64_glm, rpi-aarch64_json, rpi-aarch64_libusb, rpi-aarch64_libxml2, rpi-aarch64_opencv, rpi-aarch64_pugixml, rpi-aarch64_tess2, rpi-aarch64_uriparser, rpi-aarch64_usb, rpi-aarch64_utfcpp,
rpi-armv6l_assimp, rpi-armv6l_curl, rpi-armv6l_FreeImage, rpi-armv6l_freetype, rpi-armv6l_glew, rpi-armv6l_glfw, rpi-armv6l_glm, rpi-armv6l_json, rpi-armv6l_libusb, rpi-armv6l_libxml2, rpi-armv6l_opencv, rpi-armv6l_pugixml, rpi-armv6l_tess2, rpi-armv6l_uriparser, rpi-armv6l_usb, rpi-armv6l_utfcpp,
vs_assimp, vs_curl, vs_FreeImage, vs_freetype, vs_glew, vs_glfw, vs_glm, vs_json, vs_libusb, vs_libxml2, vs_opencv, vs_pugixml, vs_tess2, vs_uriparser, vs_usb, vs_utfcpp,
```
