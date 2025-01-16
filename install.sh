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

executa() {
    printf ${COLOR2}
    echo "✅ --> " $@
    printf ${NC}
    # printf ${COLOR2}"✅ --> " $@  "${NC}\n"
    printf ${NC}
    $@
}

#"axel -n 5 url"
W="wget2 --chunk-size=1M "
W="aria2c -x 5 " #where 16 is the number of connections
W="aria2c -s 7 -x 7 -j 7 " #where 16 is the number of connections

instala() {
    LIBNAME=$@
    section Installing ${LIBNAME}
    DOWNLOAD=oflib_${LIBNAME}_osx.zip
    # executa ${W} https://github.com/dimitre/ofLibs/releases/download/v0.12.1/${DOWNLOAD} -O ${DOWNLOAD}
    executa ${W} https://github.com/dimitre/ofLibs/releases/download/v0.12.1/${DOWNLOAD}
    executa unzip -o ${DOWNLOAD} -d ${LIBS_FOLDER}/${LIBNAME}
}

instala2() {
    LIBNAME=$1
    FOLDERNAME=$2
    section Installing ${LIBNAME}
    DOWNLOAD=oflib_${LIBNAME}_osx.zip
    # executa ${W} https://github.com/dimitre/ofLibs/releases/download/v0.12.1/${DOWNLOAD} -O ${DOWNLOAD}
    executa ${W} https://github.com/dimitre/ofLibs/releases/download/v0.12.1/${DOWNLOAD}
    executa unzip -o ${DOWNLOAD} -d ${FOLDERNAME}
}

instalaLocal() {
    LIBNAME=$1
    FOLDERNAME=$2
    executa unzip -o ./${LIBNAME}/dist/${LIBNAME}.zip -d ${LIBS_FOLDER}/${LIBNAME}
}

# executa mkdir _download
# executa cd _download
# rm -rf *.zip

# if [ -d ${ADDON_FOLDER} ]; then
#     echo "Directory exists: ${ADDON_FOLDER}"
#     # open  ${ADDON_FOLDER}
#     # mv ${ADDON_FOLDER} ${ADDON_FOLDER}_bak
# else
#     echo "Directory does not exist: ${ADDON_FOLDER}"
# fi

# --no-clobber
# # unzip -o = overwrite without prompting

# instala2 assimp ${OF_FOLDER}/addons/ofxAssimpModelLoader/libs/assimp
# instala glm
# instala curl
instala FreeImage
#
#
# instalaLocal FreeImage
