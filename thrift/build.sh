#!/bin/sh
name="thrift"
root=$(dirname $(realpath $0))/..
url="https://github.com/apache/thrift/archive/v0.13.0.tar.gz"
file="$name.tar.gz"
build_path="$root/build/$name"
output_path="$root/output/$name"
source="$root/thrift/thrift*"


download(){
    echo "Download..."
    curl -L "$url" -o "$file"
}
unzip_source(){
    echo "Unzip"
    tar -zxvf "$file"
}

download
unzip_source

cd $source
mkdir -p $output_path
./bootstrap.sh &&
    ./configure                \
        --enable-shared=no     \
        --with-nodejs=no       \
        --with-python=no       \
        --with-go=no           \
        --prefix=$output_path  \
        --with-qt4=no          \
        --with-qt5=no          \
        --with-php=no          \
        --with-boost=/home/wangyi/proj/cpp/libs \
        --with-libevent=/home/wangyi/proj/cpp/libs \
        CXXFLAGS='-g -O2' \
        CFLAGS='-g -O2' \
    &&  \
    make -j \
    && \
    make install
