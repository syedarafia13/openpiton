#!/bin/bash
set -e
export ROOT=/home/snaveed/openpiton/piton/design/chip/tile/ariane
cd /home/snaveed/openpiton/piton/design/chip/tile/ariane/tmp

if [ -z ${NUM_JOBS} ]; then
    NUM_JOBS=1
fi

if [ ! -e "$VERILATOR_ROOT/bin/verilator" ]; then
    echo "Installing Verilator"
    rm -f verilator*.tgz
    wget https://www.veripool.org/ftp/verilator-4.110.tgz
    tar xzf verilator*.tgz
    rm -f verilator*.tgz
    cd verilator-4.110
    mkdir -p $VERILATOR_ROOT
    # copy scripts
    autoconf && ./configure --prefix="$VERILATOR_ROOT" && make -j${NUM_JOBS}
    cp -r * $VERILATOR_ROOT/
    make test
else
    echo "Using Verilator from cached directory."
fi
