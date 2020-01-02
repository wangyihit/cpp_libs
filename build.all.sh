#!/bin/sh

./boost/build.sh           \
    && ./libevent/build.sh \
    && ./thrift/build.sh   \
    && ./fftw/build.sh     \
    && ./opencv/build.sh   \
    && ./spdlog/build.sh   \
    && ./cpputil/build.sh
