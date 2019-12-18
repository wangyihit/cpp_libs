#!/bin/sh
name="musicretr"
root=$(dirname $(realpath $0))/..
output_path="$root/output/$name"
source="$root/musicretr"
cd $(dirname $0)  
mkdir -p $output_path
CXXFLAGS=" -std=c++11 " LIBS="-L../output/fftw/lib/" CPPFLAGS="-I../output/fftw/include/" ./configure --prefix=$output_path
make -j && make install

