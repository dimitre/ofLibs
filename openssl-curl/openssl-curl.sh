#!/bin/bash
set -e

cd "$(dirname "$0")"
cd Build-OpenSSL-cURL
./build.sh -o 3.0.15 -c 8.11.1 -d -i 11.0 -a 11.0

# mkdir dist

cd ..
mkdir curl
cd curl
cp -r Build-OpenSSL-cURL/curl/include .
cp -r Build-OpenSSL-cURL/curl/lib .
cp Build-OpenSSL-cURL/curl/curl*/COPYING .
mkdir lib/${PLATFORM}
mv lib/*.a lib/${PLATFORM}
zip -r ../oflib_curl_${PLATFORM}.zip lib include
cd ..

mkdir openssl
cd openssl
cp -r Build-OpenSSL-cURL/openssl/Mac/include .
cp -r Build-OpenSSL-cURL/openssl/Mac/lib .
cp Build-OpenSSL-cURL/openssl/openssl*/LICENSE .

mkdir lib/${PLATFORM}
mv lib/*.a lib/${PLATFORM}

zip -r ../oflib_openssl_${PLATFORM}.zip lib include
cd ..
