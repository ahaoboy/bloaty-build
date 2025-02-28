#!/bin/bash

if [ $# -ne 1 ]; then
    echo "not found target"
    exit 1
fi

TARGET=$1

cmake -B build -S .
cmake --build build
mkdir dist
cp -r ./build/bloaty dist/bloaty
tar -czf ./bloaty-${TARGET}.tar.gz -C dist .
ls -l ./bloaty-${TARGET}.tar.gz
