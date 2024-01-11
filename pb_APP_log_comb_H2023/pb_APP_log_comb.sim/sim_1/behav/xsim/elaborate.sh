#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2020.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Wed Jan 10 16:19:46 EST 2024
# SW Build 3064766 on Wed Nov 18 09:12:47 MST 2020
#
# Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# elaborate design
echo "xelab -wto 6e88f38826214958bd01804f64fad5de --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot Add4bitsTb_behav xil_defaultlib.Add4bitsTb -log elaborate.log"
xelab -wto 6e88f38826214958bd01804f64fad5de --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot Add4bitsTb_behav xil_defaultlib.Add4bitsTb -log elaborate.log

