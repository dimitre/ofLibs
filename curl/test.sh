#!/bin/bash
cd "$(dirname "$0")"
chalet build &&
cp -rf build/arm64-apple-darwin_Release/ext.curl/lib/lib/libcurl.a /Volumes/tool/ofw/libs/curl/lib/macos
cd /Volumes/tool/ofw/examples/3d/assimp3DModelLoaderExample
make && make RunRelease
