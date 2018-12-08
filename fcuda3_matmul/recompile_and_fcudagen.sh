cd ../..
source env_vars3.sh
cd fcuda_src
./make_FCUDA.sh compile_fcuda3
cd ../fcuda3-benchmarks/matmul
./fcuda_gen.sh
cd ..