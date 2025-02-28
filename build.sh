#!/bin/bash

if [ $# -ne 1 ]; then
    echo "not found target"
    exit 1
fi

TARGET=$1

git clone https://github.com/google/bloaty.git bloaty --recursive

cd bloaty
cmake -B build -S .
cmake --build build
ls -lh build

mkdir ../dist
cp -r ./build/bloaty ../dist
cp -r ./build/*libbloaty* ../dist

cd ..
ls -lh dist

tar -czf ./bloaty-${TARGET}.tar.gz -C dist .
ls -l ./bloaty-${TARGET}.tar.gz
