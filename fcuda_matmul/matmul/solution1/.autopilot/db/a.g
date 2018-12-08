#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matmul/solution1/.autopilot/db/a.g.bc ${1+"$@"}
