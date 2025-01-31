# OF Vision

You can use the following script to test OFVision fork (macOS only now).
This script will bootstrap installation, clone this fork and install libs, install ofgen tool (projectGenerator substitute here) to your path.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/dimitre/openFrameworks/refs/heads/tuningfork/install_of.sh)" pwd
```

This fork have some small differences from OF.
- Examples are not present, but you can copy them from OF git or download
- It install libraries from https://github.com/dimitre/ofLibs instead of apothecary
- It uses ofGen instead of projectGenerator


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
