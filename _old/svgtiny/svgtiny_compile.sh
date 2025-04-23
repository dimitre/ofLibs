#!/bin/bash
cd "$(dirname "$0")"
cd $1
pwd
make -j
#mkdir -p $1/include
#cp $1/libusb/libusb/*.h $1/include
