
#!/bin/bash
cd "$(dirname "$0")"

OF_FOLDER=/Volumes/tool/ofw
LIBS_FOLDER=${OF_FOLDER}/libs
# PLATFORM=osx
PLATFORM=macos

COLOR='\033[0;32m'
COLOR2='\033[0;34m'
NC='\033[0m' # No Color

section() {
    echo ""
    printf "💾 ${COLOR}"
    echo $@
    printf "${NC}"
}

executa() {
    printf ${COLOR2}
    echo "✅ --> " $@
    printf ${NC}
    # printf ${COLOR2}"✅ --> " $@  "${NC}\n"
    printf ${NC}
    $@
}

instalaLocal() {
    export PLATFORM="macos"
    LIBNAME=$1
    cd ${LIBNAME}
    chalet bundle --compiler-cache --show-commands
    cd ..
    executa unzip -o ./${LIBNAME}/dist/${LIBNAME}.zip -d ${LIBS_FOLDER}/${LIBNAME}
}


if [ $# -ne 0 ]
  then
  instalaLocal $@
fi
