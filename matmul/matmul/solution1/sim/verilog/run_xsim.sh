
xelab xil_defaultlib.apatb_matrixMul_top -prj matrixMul.prj --initfile "/opt/xilinx/vivado/2016.2/Vivado/2016.2/bin/../data/xsim/ip/xsim_ip.ini" --lib "ieee_proposed=./ieee_proposed" -s matrixMul 
xsim --noieeewarnings matrixMul -tclbatch matrixMul.tcl

