cd ../..
source env_vars.sh
cd fcuda_src
./make_FCUDA.sh compile_fcuda3
cd ../fcuda-benchmarks/matmul
./fcuda_gen.sh
cd ..