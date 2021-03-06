#!/bin/sh
name="boost"
root=$(dirname $(realpath $0))/..
url="https://dl.bintray.com/boostorg/release/1.72.0/source/boost_1_72_0.tar.gz"
file="$name.tar.gz"
output_path="$root/output/boost"
source="$root/boost/${name}_1_72_0"


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
./bootstrap.sh --prefix=$output_path
./b2
cd -
mv $source boost
mv boost $output_path/

