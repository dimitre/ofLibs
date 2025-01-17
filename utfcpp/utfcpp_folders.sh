#!/bin/bash
cd "$(dirname "$0")"
mkdir -p $1/include
# cp $1/*.h $1/include
cp -R $1/source/* $1/include
