#!/bin/bash
cd "$(dirname "$0")"
#LIB="FreeImage"
echo $@


# mkdir -p doesnt give an error if folder exists
mkdir -p ./$1/include
mv ./$1/glm ./$1/include
#printenv
