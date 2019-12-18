#!/bin/sh
name="fftw"
root=$(dirname $(realpath $0))/..
url="http://fftw.org/fftw-3.3.8.tar.gz"
file="$name.tar.gz"
build_path="$root/build/$name"
output_path="$root/output/$name"
source="$root/fftw/fftw-*"


download(){
    echo "Download..."
    curl -L "$url" -o "$file"
}
unzip_source(){
    echo "Unzip"
    tar -zxvf "$file"
}
cd $(dirname $0)
download
unzip_source

cd $source
OUT="$output_path"
mkdir -p $OUT
LDFLAGS="-L$OUT/lib" CPPFLAGS="-I$OUT/include" ./configure --prefix=$OUT $*
make -j && make install
