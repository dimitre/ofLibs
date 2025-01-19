#!/bin/bash
cd "$(dirname "$0")"
cd Build-OpenSSL-cURL
./build.sh -o 3.0.15 -c 8.11.1 -d -i 11.0 -a 11.0

cd ..
mkdir curl
cp -r Build-OpenSSL-cURL/curl/include curl
cp -r Build-OpenSSL-cURL/curl/lib curl
mkdir curl/lib/${PLATFORM}
mv curl/lib/*.a curl/lib/${PLATFORM}

zip -r oflib_cairo_${PLATFORM}.zip lib include
