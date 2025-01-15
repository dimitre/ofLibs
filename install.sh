#!/bin/bash
cd "$(dirname "$0")"

OF_FOLDER=/Volumes/tool/ofw
LIBS_FOLDER=${OF_FOLDER}/libs

COLOR='\033[0;32m'
COLOR2='\033[0;34m'
NC='\033[0m' # No Color

section() {
    echo ""
    printf "💾 ${COLOR}"
    echo $@
    printf "${NC}"
}

executa () {
    printf ${COLOR2}
    echo "✅ --> " $@
    printf ${NC}
    # printf ${COLOR2}"✅ --> " $@  "${NC}\n"
    printf ${NC}
    $@
}

instala() {
    W="wget2 "
    LIBNAME=$@
    section Installing ${LIBNAME}
    DOWNLOAD=oflib_${LIBNAME}_osx.zip
    executa ${W} https://github.com/dimitre/ofLibs/releases/download/v0.12.1/${DOWNLOAD} -O ${DOWNLOAD}
    executa unzip -o ${DOWNLOAD} -d ${LIBS_FOLDER}/${LIBNAME}
}

instala2() {
    W="wget2 "
    LIBNAME=$1
    FOLDERNAME=$2
    section Installing ${LIBNAME}
    DOWNLOAD=oflib_${LIBNAME}_osx.zip
    executa ${W} https://github.com/dimitre/ofLibs/releases/download/v0.12.1/${DOWNLOAD} -O ${DOWNLOAD}
    executa unzip -o ${DOWNLOAD} -d ${FOLDERNAME}
}

executa mkdir _download
executa cd _download

# if [ -d ${ADDON_FOLDER} ]; then
#     echo "Directory exists: ${ADDON_FOLDER}"
#     # open  ${ADDON_FOLDER}
#     # mv ${ADDON_FOLDER} ${ADDON_FOLDER}_bak
# else
#     echo "Directory does not exist: ${ADDON_FOLDER}"
# fi

# --no-clobber
# # unzip -o = overwrite without prompting

instala2 assimp ${OF_FOLDER}/addons/ofxAssimpModelLoader/libs/assimp
# instala glm
# instala curl
