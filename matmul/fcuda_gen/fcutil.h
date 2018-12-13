//============================================================================//
//    FCUDA
//    Copyright (c) <2016> 
//    <University of Illinois at Urbana-Champaign>
//    <University of California at Los Angeles> 
//    All rights reserved.
// 
//    Developed by:
// 
//        <ES CAD Group & IMPACT Research Group>
//            <University of Illinois at Urbana-Champaign>
//            <http://dchen.ece.illinois.edu/>
//            <http://impact.crhc.illinois.edu/>
// 
//        <VAST Laboratory>
//            <University of California at Los Angeles>
//            <http://vast.cs.ucla.edu/>
// 
//        <Hardware Research Group>
//            <Advanced Digital Sciences Center>
//            <http://adsc.illinois.edu/>
//============================================================================//

#ifndef FCUDA_UTILS
#define FCUDA_UTILS

#define CUT_SAFE_CALL(x) (x)
#define CUDA_SAFE_CALL(x) (x)
#define CUT_CHECK_ERROR(x) 
#define __mul24(x,y) ((x)*(y))
#define __umul24(x,y) ((x)*(y))
#define rsqrtf(x) (1/sqrtf(x))
#if defined(__cplusplus)
extern "C" {
#endif

void cutCreateTimer(unsigned int* timer);

void cutStartTimer(unsigned int timer);

void cutStopTimer(unsigned int timer);

float cutGetTimerValue(unsigned int timer);

void cutDeleteTimer(unsigned int timer);

void cudaMemcpy(void* dest, void* src, size_t size, int type);
void cudaMalloc(void** dest, size_t size);
void cudaFree(void* ptr);
void cudaMemcpyToSymbol(void* dst, void* src, size_t size, int type);
void cudaMemset(void* ptr, int i, size_t size);
void cudaThreadSynchronize();

#if defined(__cplusplus)
}
#endif


#endif
