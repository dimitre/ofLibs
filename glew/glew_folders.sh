#!/bin/bash
cd "$(dirname "$0")"
#LIB="FreeImage"
#echo $@
mkdir $1/lib/$2
mv $1/lib/*.a $1/lib/$2
#printenv
