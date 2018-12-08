############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2015 Xilinx Inc. All rights reserved.
############################################################
open_project -reset vec_add_hls
set_top vec_add

add_files fcuda_gen_matmul.c
add_files fcuda.h
add_files -tb fcuda_gen_matmul.c

open_solution -reset "solution1"
set_part {xc7vx690tffg1761-2}
create_clock -period 10 -name default
#source "directives.tcl"
csim_design
csynth_design
cosim_design
#export_design -evaluate verilog
