# OF Vision

You can use the following script to test OFVision fork (macOS only now).
This script will bootstrap installation, clone this fork and install libs, install ofgen tool (projectGenerator substitute here) to your path.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/dimitre/openFrameworks/refs/heads/tuningfork/install_of.sh)" pwd
```

This fork have some small differences from OF.
### Differences
- Examples are not present, but you can copy them from OF git or download
- It install libraries from https://github.com/dimitre/ofLibs instead of apothecary
- Classic math (ofVecXf, ofMatrix4x4, etc) are removed. They can be added back as an addon if needed.
- there is no ofxSvg addon in this fork, mostly because the libs are old, hard to build and there is a great substitute out there https://github.com/NickHardeman/ofxSvgParser
### ofGen
substitute of projectGenerator here
it will compile and install ofgen, a tool to build OF projects.
it can be invoked without parameters if your project uses ofPath as ../../..
```bash
cd $ofw/examples/templates/allAddonsExample
ofGen
```
or with parameters for a more complete control
```bash
ofGen templates=zed,macos,make platform=macos addons=ofxMidi,ofxOpencv ofpath=../../.. path=/Volumes/tool/Transcend
```


# ofLibs

As a proof of concept it is building libraries for multiple platforms.
You are welcome to jump in and help building and testing more libraries.

![title](https://github.com/dimitre/ofLibs/actions/workflows/assimp.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/brotli.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/cairo.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/FreeImage.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/freetype.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/glew.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/glfw.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/glm.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/json.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/libpng.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/libusb.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/libxml2.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/opencv.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/pugixml.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/tess2.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/uriparser.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/utfcpp.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/zlib.yml/badge.svg)
![title](https://github.com/dimitre/ofLibs/actions/workflows/openssl-curl.yml/badge.svg)
