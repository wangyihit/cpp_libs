#!/bin/sh
# for root env
root=$(dirname $(realpath $0))/..
cv_url="https://github.com/opencv/opencv/archive/3.4.8.tar.gz"
cv_file="cv.tar.gz"
contrib_url="https://github.com/opencv/opencv_contrib/archive/3.4.8.tar.gz"
contrib_file="contrib.tar.gz"
build_path="$root/build/opencv"
output_path="$root/output/opencv"
cv_source="$root/opencv/opencv-3.4.8"
contrib_source="$root/opencv/opencv_contrib-3.4.8"

download(){
    echo "Download cv"
    curl -L "$cv_url" -o "$cv_file"
    echo "Download contrib"
    curl -L "$contrib_url" -o "$contrib_file"
}
unzip_source(){
    echo "Unzip cv"
    tar -zxvf "$cv_file"
    echo "Unzip contrib"
    tar -zxvf "$contrib_file"
}

# download
# unzip_source

# install dep
# sudo apt-get install libavresample-dev libavcodec-dev libavformat-dev libswscale-dev libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev libgtk2.0-dev

mkdir -p "$build_path"
cd "$build_path"
run_cmake(){
cmake \
    -DCMAKE_INSTALL_PREFIX=$output_path \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=NO \
    -DWITH_IPP=NO \
    -DBUILD_EXAMPLES=OFF \
    -WITH_FFMPEG=ON \
    -DOPENCV_EXTRA_MODULES_PATH=$contrib_source/modules \
    -DBUILD_TESTS=OFF \
    $cv_source
}

run_cmake
make -j && make install
