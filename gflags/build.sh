#!/bin/sh
name="gflags"
root=$(dirname $(realpath $0))/..
url="https://github.com/gflags/gflags/archive/v2.2.2.tar.gz"
file="$name.tar.gz"
output_path="$root/output/$name"
source="$root/$name/${name}*"
source_dir="$root/$name/gflags-2.2.2"
build_path="$root/build/$name"


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
mkdir -p $build_path
cd $build_path

run_cmake(){
cmake \
    -DCMAKE_INSTALL_PREFIX=$output_path \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=NO \
    $source_dir
}

run_cmake
make -j && make install


