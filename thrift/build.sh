#!/bin/sh
name="thrift"
root=$(dirname $(realpath $0))/..
url="https://github.com/apache/thrift/archive/v0.13.0.tar.gz"
file="$name.tar.gz"
build_path="$root/build/$name"
output_path="$root/output/$name"
source="$root/thrift/thrift*"
boost="$root/output/boost"
libevent="$root/output/libevent"

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
# patch to shared port
patch lib/cpp/src/thrift/transport/TServerSocket.cpp < ./0001-add-set-option-to-share-socket.patch
cd $source
mkdir -p $output_path
./bootstrap.sh &&
    ./configure                \
        --enable-shared=no     \
        --with-python=no       \
        --prefix=$output_path  \
        --with-qt4=no          \
        --with-boost=$boost    \
        --with-libevent=$libevent \
        CXXFLAGS='-g -O2'      \
        CFLAGS='-g -O2'        \
        --with-as3=no \
        --with-qt5=no \
        --with-openssl=DIR=no \
        --with-csharp=no \
        --with-java=no \
        --with-erlang=no \
        --with-nodejs=no \
        --with-nodets=no \
        --with-lua=no \
        --with-python=no \
        --with-py3=no \
        --with-perl=no \
        --with-php=no \
        --with-php_extension=no \
        --with-dart=no \
        --with-ruby=no \
        --with-haskell=no \
        --with-go=no \
        --with-swift=no \
        --with-rs=no \
        --with-cl=no \
        --with-haxe=no \
        --with-dotnetcore=no \
        --with-d=no \
    &&  \
    make -j \
    && \
    make install
