#!/bin/sh
cd "$(dirname "$0")"
mkdir $1/lib/$2
mv $1/lib/*.a $1/lib/$2
