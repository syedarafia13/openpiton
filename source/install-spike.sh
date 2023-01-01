#!/bin/bash
set -e
export ROOT=/home/snaveed/openpiton/piton/design/chip/tile/ariane

cd /home/snaveed/openpiton/piton/design/chip/tile/ariane/tmp

if [ -z ${NUM_JOBS} ]; then
    NUM_JOBS=1
fi

if [ ! -e "${RISCV}/bin/spike"  ]; then
    echo "Installing Spike"
    git clone https://github.com/riscv/riscv-isa-sim.git 
    cd riscv-isa-sim
    mkdir -p build
    cd build
    ../configure --prefix="$RISCV/"
    make -j${NUM_JOBS}
    make install
else
    echo "Using Spike from cached directory."
fi
