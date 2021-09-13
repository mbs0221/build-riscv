#!/bin/bash

CONFIG=${1:-RocketVC709Config}
LONG_NAME=chipyard.fpga.vc709.VC709FPGATestHarness.$CONFIG

export CHIPYAR=~/chipyard
export FPGA=$CHIPYARD/fpga
export RESOURCES=$FPGA/src/main/resources
export GEN_PATH=$FPGA/generated-src
export OBJ_PATH=$GEN_PATH/$LONG_NAME/obj
export TCL_DIR=$FPGA/fpga-shells/xilinx/common/tcl
export BUILD=$(pwd)

BOARD=xc7vx690t_0
MCS=$OBJ_PATH/VC709FPGATestHarness.mcs
PRM=$OBJ_PATH/VC709FPGATestHarness.prm

##################### HARDWARE FLOW #####################

# build project

cd $FPGA
make -j$(nproc) SUB_PROJECT=vc709 CONFIG=$CONFIG mcs

# boot the board from mcs
if [ ! $1 ]; then
	exit 0
fi

echo upload: $MCS
echo upload: $PRM

vivado -nojournal -mode batch \
        -source $TCL_DIR/upload_mcs.tcl \
        -tclargs $BOARD $MCS $PRM \

vivado -nojournal -mode batch \
        -source $TCL_DIR/boot.tcl \
        -tclargs $BOARD

##################### SOFTWARE FLOW #####################
cp -p $RESOURCES/vc709/uartsend/upload $BUILD

cd $BUILD
