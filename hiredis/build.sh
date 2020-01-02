#!/bin/sh
name="hiredis"
root=$(dirname $(realpath $0))/..
url="https://github.com/redis/hiredis/archive/v0.14.0.tar.gz"
file="$name.tar.gz"
output_path="$root/output/$name"
source="$root/$name/${name}*"
source_dir="$root/$name/hiredis-*"
build_path="$root/build/$name"


download(){
    echo "Download..."
    curl -L "$url" -o "$file"
}
unzip_source(){
    echo "Unzip"
    tar -zxvf "$file"
}
mkdir -p $output_path
cd $(dirname $0)
# download
# unzip_source
cd $source_dir
# cat Makefile |sed 's/\/usr\/local/install/' >> myMakefile
echo "PREFIX?=$output_path"
echo "PREFIX?=$output_path"  > myMakefile
cat Makefile |sed "s/PREFIX\?\=\/usr\/local/#/" >> myMakefile
make -j -f myMakefile &&      \
    make -f myMakefile install 


