#!/bin/bash
cd "$(dirname "$0")"
mkdir -p $1/include
# cp $1/*.h $1/include
cp $1/src/*.hpp $1/include
