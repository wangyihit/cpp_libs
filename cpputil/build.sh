#!/bin/sh
name="cpputil"
root=$(dirname $(realpath $0))/..
output_path="$root/output/$name"
source="$root/$name"
source_dir="$root/$name/spdlog-*"
build_path="$root/build/$name"
cd $(dirname $0)
mkdir -p $build_path
cd $build_path

run_qmake(){
    # for debug: CONFIG+=debug CONFIG+=qml_debug
    qmake $source/cpputil.pro -spec linux-g++
}

run_qmake
make -j && make install


