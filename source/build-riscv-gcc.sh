#!/bin/bash
# call with first argument = 0 to checkout only

set -e
export ROOT=/home/snaveed/openpiton/piton/design/chip/tile/ariane

mkdir -p $RISCV

cd $RISCV

if [ -z ${NUM_JOBS} ]; then
    NUM_JOBS=1
fi


if ! [ -e $RISCV/bin ]; then

    cd /home/snaveed/tools/riscv_install

    if [[ $1 -ne "0" || -z ${1} ]]; then
      echo "Compiling RISC-V Toolchain"
      ./configure --prefix=$RISCV > /dev/null
      make
      echo "Compilation Finished"
    fi
fi
