#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 threadIdx;
if (guard_matrixMul_CMP_5)
{

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{

Csub_block[threadIdx.y][threadIdx.x]=0;

}

}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
dim3 threadIdx;
if (guard_matrixMul_TRN_10)
{

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{

C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];

}

}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE As[16][16], DATATYPE * A, int a, int wA, DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 threadIdx;
if (guard_matrixMul_TRN_6)
{

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{

As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];

}

}
return ;
}

#pragma fcuda compute name=SNC_7 end=false cores=1 begin=true 
void matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], DATATYPE As[16][16], DATATYPE Bs[16][16])
{
dim3 threadIdx;
if (guard_matrixMul_SNC_7)
{
int k;

{
lp1:

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{

for (k=0; k<16;  ++ k)
{
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}

}

}
return ;
}

void matrixMul_TRN_10_wrapper(int guard_matrixMul_TRN_10_block0, dim3 blockDim, dim3 gridDim, dim3 blockIdx_matrixMul_TRN_10_block0, DATATYPE * C, DATATYPE Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], int c_block0, int wB)
{
matrixMul_TRN_10(guard_matrixMul_TRN_10_block0, blockDim, gridDim, blockIdx_matrixMul_TRN_10_block0, C, Csub_block_block0, c_block0, wB);
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB, dim3 gridDim, dim3 blockDim)
{
int bx_block0;
int by_block0;
int aBegin_block0;
int aEnd_block0;
int aStep_block0;
int bBegin_block0;
int bStep_block0;
DATATYPE Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X];
int a_block0;
int b_block0;
int k_block0;
int c_block0;
dim3 blockIdx_block0;
int guard_matrixMul_CMP_5_block0;
int guard_matrixMul_TRN_10_block0;
int guard_matrixMul_TRN_6_block0;
int guard_matrixMul_SNC_7_block0;
dim3 blockIdx_loop;
for (blockIdx_loop.y=0; (gridDim.y+(-1*blockIdx_loop.y))>0; blockIdx_loop.y+=1)
{
blockIdx_block0.y=blockIdx_loop.y;
for (blockIdx_loop.x=0; (gridDim.x+(-1*blockIdx_loop.x))>0; blockIdx_loop.x+=1)
{
blockIdx_block0.x=(blockIdx_loop.x+0);
guard_matrixMul_SNC_7_block0=1;
guard_matrixMul_TRN_6_block0=1;
guard_matrixMul_TRN_10_block0=1;
guard_matrixMul_CMP_5_block0=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx_block0=blockIdx_block0.x;
by_block0=blockIdx_block0.y;
aBegin_block0=((wA*16)*by_block0);
aEnd_block0=((aBegin_block0+wA)-1);
aStep_block0=16;
bBegin_block0=(16*bx_block0);
bStep_block0=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0);
a_block0=0;
b_block0=0;
k_block0=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a_block0=aBegin_block0), (b_block0=bBegin_block0)); a_block0<=aEnd_block0; ((a_block0+=aStep_block0), (b_block0+=bStep_block0)))
{
DATATYPE As[16][16];
DATATYPE Bs[16][16];


matrixMul_TRN_6(guard_matrixMul_TRN_6_block0, blockDim, gridDim, blockIdx_block0, As, A, a_block0, wA, Bs, B, b_block0, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0, As, Bs);

}
c_block0=(((wB*16)*by_block0)+(16*bx_block0));


matrixMul_TRN_10_wrapper(guard_matrixMul_TRN_10_block0, blockDim, gridDim, blockIdx_block0, C, Csub_block_block0, c_block0, wB);


}
}
}

