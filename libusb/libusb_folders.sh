#!/bin/bash
cd "$(dirname "$0")"

COLOR='\033[0;32m'
COLOR2='\033[0;34m'
NC='\033[0m' # No Color

section() {
    printf "⚡️ ${COLOR} ${@} ${NC}\n\r"
}
sectionOK() {
    printf "💾 ${COLOR} ${@} ${NC}\n\r"
}
executa2() {
    printf "✅ ${COLOR2} ${@} ${NC}\n\r"
}
executa() { #echoes and execute. dry run is "executa2"
    printf "✅ ${COLOR2} ${@} ${NC}\n\r"
    $@
}

pwd
ls
echo $1
executa mkdir -p $1/include
executa cp $1/libusb/libusb/*.h $1/include
