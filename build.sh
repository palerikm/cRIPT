if [ ! -d "build" ]; then
    mkdir build
fi

cd build && cmake -DBORINGSSL_DIR=../boringssl -DLSQUIC_DIR=../lsquic .. && make $*
