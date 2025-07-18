#!/bin/bash

set -eux -o pipefail

cd "$(dirname -- "$(realpath -- "${BASH_SOURCE[0]}")")"

rm -rf build
mkdir  build
cd     build

CC=gcc-13 CXX=g++-13 \
    cmake \
        -DCMAKE_CXX_STANDARD=17 \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCPACK_DEBIAN_PACKAGE_SHLIBDEPS=Yes \
        ".."

cd ".."

cmake --build build --parallel --target package
