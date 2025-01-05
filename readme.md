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
- [ ] json
- [x] libusb
- [ ] libxml2
- [x] opencv (missing emscripten)
- [ ] pugixml (needed by core ofXml)
- [ ] rtAudio
- [ ] svgtiny (needed by addon ofxSvg, to be replaced to a new one)
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



LEFTOVERS

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
