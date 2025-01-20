#!/bin/bash
set -e

if [[ "$PWD" == "/Users/d/src/ofLibs/openssl-curl" ]]; then
echo "Local developtment"
PLATFORM=macos
fi
cd "$(dirname "$0")"
cd Build-OpenSSL-cURL
./build.sh -o 3.0.15 -c 8.11.1 -d -i 11.0 -a 11.0

# mkdir dist

cd ..
mkdir -p curl
cd curl
cp -r ../Build-OpenSSL-cURL/curl/include .
cp -r ../Build-OpenSSL-cURL/curl/lib .
cp ../Build-OpenSSL-cURL/curl/curl*/COPYING .
mkdir -p lib/${PLATFORM}
mv lib/*.a lib/${PLATFORM}
zip -r ../oflib_curl_${PLATFORM}.zip lib include
cd ..

mkdir -p openssl
cd openssl
cp -r ../Build-OpenSSL-cURL/openssl/Mac/include .
cp -r ../Build-OpenSSL-cURL/openssl/Mac/lib .
cp ../Build-OpenSSL-cURL/openssl/openssl*/LICENSE.* .

tree -h
exit 1

mkdir -p lib/${PLATFORM}
mv lib/*.a lib/${PLATFORM}

zip -r ../oflib_openssl_${PLATFORM}.zip lib include
cd ..
