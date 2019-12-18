#!/bin/sh
name="boost"
root=$(dirname $(realpath $0))/..
url="https://dl.bintray.com/boostorg/release/1.72.0/source/boost_1_72_0.tar.gz"
file="$name.tar.gz"
output_path="$root/output/"
source="$root/boost/${name}*"


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

mv $source $output_path
