#!/bin/sh
name="libevent"
root=$(dirname $(realpath $0))/..
url="https://github.com/libevent/libevent/archive/release-2.1.11-stable.tar.gz"
file="$name.tar.gz"
output_path="$root/output/$name"
source="$root/$name/${name}*"


download(){
    echo "Download..."
    curl -L "$url" -o "$file"
}
unzip_source(){
    echo "Unzip"
    tar -zxvf "$file"
}

download
eunzip_source

cd $source

./autogen.sh
./configure --prefix=$output_path \
            --disable-openssl    \
            --enable-shared=no \
            --disable-debug-mode && \
    make -j && make install

