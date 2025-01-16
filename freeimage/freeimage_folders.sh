#!/bin/bash
cd "$(dirname "$0")"
LIB="FreeImage"

echo $@
mkdir $1/include
cp $1/Source/FreeImage.h $1/Source/include
#printenv
