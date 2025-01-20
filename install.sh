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

# "axel -n 5 url"
# W="wget2 --chunk-size=1M "
# W="aria2c -x 5 " #where 16 is the number of connections
W="aria2c -s 7 -x 7 -j 7 " #where 16 is the number of connections

LIBADDONS=( "assimp:ofxAssimpModelLoader"
        "opencv:ofxOpenCv"
        "libxml2:ofxSvg"
        "svgtiny:ofxSvg"
        "libusb:ofxKinect"
)



instala() {
    LIBNAME=$@
    section Installing ${LIBNAME}
    DOWNLOAD=oflib_${LIBNAME}_${PLATFORM}.zip
    # executa ${W} https://github.com/dimitre/ofLibs/releases/download/v0.12.1/${DOWNLOAD} -O ${DOWNLOAD}
    executa ${W} https://github.com/dimitre/ofLibs/releases/download/v0.12.1/${DOWNLOAD} &&
    OUTFOLDER=${LIBS_FOLDER}/${LIBNAME}
    # OUTFOLDER=${LIBS_FOLDER}/macos

    for libaddon in "${LIBADDONS[@]}" ; do
        LIB=${libaddon%%:*}
        ADDON=${libaddon#*:}
        if [[ ${LIBNAME} == ${LIB} ]]
        then
            printf "%s likes to %s.\n" "$LIB" "$ADDON"
            OUTFOLDER=${OF_FOLDER}/addons/${ADDON}/libs/${LIB}
        fi
    done

    rm -rf ${OUTFOLDER}
    executa unzip -o ${DOWNLOAD} -d ${OUTFOLDER}
}


instala2() {
    LIBNAME=$1
    FOLDERNAME=$2
    section Installing ${LIBNAME}
    DOWNLOAD=oflib_${LIBNAME}_${PLATFORM}.zip
    # executa ${W} https://github.com/dimitre/ofLibs/releases/download/v0.12.1/${DOWNLOAD} -O ${DOWNLOAD}
    executa ${W} https://github.com/dimitre/ofLibs/releases/download/v0.12.1/${DOWNLOAD} &&
    executa unzip -o ${DOWNLOAD} -d ${FOLDERNAME}
}

instalaLocal() {
    LIBNAME=$1
    FOLDERNAME=$2
    executa unzip -o ./${LIBNAME}/dist/${LIBNAME}.zip -d ${LIBS_FOLDER}/${LIBNAME}
}

executa mkdir -p _download
# rm -rf _download/*.zip

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
# instala FreeImage
# instala freetype
# instala glew
#instala glfw
# instala glm
# instala libpng
#
# instala FreeImage
#
#
# instalaLocal FreeImage

getlink() {
    # for LIBNAME in "$@"
    LIBS=( assimp brotli cairo FreeImage freetype glew glfw glm json libpng libusb libxml2 opencv pugixml svgtiny tess2 uriparser utfcpp zlib openssl curl )
    for LIBNAME in ${LIBS[@]}
    do
        # echo "$var"
        DOWNLOAD=oflib_${LIBNAME}_${PLATFORM}.zip
        PARAMS+=" "https://github.com/dimitre/ofLibs/releases/download/v0.12.1/${DOWNLOAD}
    done
    executa wget2 ${PARAMS} -P _download


    # executa wget2 ${PARAMS} -P _download
    # wget2 ${PARAMS}
}

if [ $# -ne 0 ]
    then
    instala $@
fi


unzipall() {
    for filename in _download/*.zip; do
        echo ${filename}
        executa unzip -o ${filename} -d _download/macos
    done
}

# getlink
unzipall
mv _download/macos/lib/macos/*.a _download/macos/lib/


# getlink assimp brotli cairo curl FreeImage freetype glew glfw glm json libpng libusb libxml2 opencv pugixml svgtiny tess2 uriparser utfcpp zlib
