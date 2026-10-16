#!/bin/sh
set -e
cd "$(dirname "$0")"

# Translate the counter and build its simulation.
verilator -Wall --cc --trace counter.sv --exe counter_tb.cpp
make -j -C obj_dir/ -f Vcounter.mk Vcounter

# Use serial-port permissions even in terminals opened before group setup.
exec sg dialout -c './obj_dir/Vcounter'
