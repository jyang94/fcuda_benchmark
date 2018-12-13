open_project -reset matmul
set_top matrixMul

add_files -cflags "-I/home/xu67/thesis_fcuda/fcuda/fcuda_src/include" fcuda_gen/fcuda_gen_matmul.cpp

add_files -tb -cflags "-I/home/xu67/thesis_fcuda/fcuda/fcuda_src/include" matrixMul.cpp

#add_files /home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul

open_solution -reset "solution1"

set_part {xc7z020clg484-1}

create_clock -period 10 -name default
csim_design
csynth_design
cosim_design -trace_level none -rtl verilog -tool xsim

exit