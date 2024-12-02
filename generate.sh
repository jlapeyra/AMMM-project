#!/bin/sh
mkdir -p build/debug
mkdir -p build/release
cmake . -B build/debug -DCMAKE_BUILD_TYPE=Debug
cp -r dat build/debug/
cmake . -B build/release -DCMAKE_BUILD_TYPE=Release
cp -r dat build/release/
