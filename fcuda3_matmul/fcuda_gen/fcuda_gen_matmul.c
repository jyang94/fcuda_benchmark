#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute end=false cores=1 begin=true name=CMP_6 
void matrixMul_CMP_6(int guard_matrixMul_CMP_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, int tx_block[BLOCKDIM_Y][BLOCKDIM_X], int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int &aBegin, int by, int wA, int &aEnd, int &aStep, int &bBegin, int bx, int &bStep, int wB, DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 threadIdx;
if (guard_matrixMul_CMP_6)
{

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{

tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;


aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);

Csub_block[threadIdx.y][threadIdx.x]=0;

}

}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_11 
void matrixMul_TRN_11(int guard_matrixMul_TRN_11, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int tx_block[BLOCKDIM_Y][BLOCKDIM_X], int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wB)
{
dim3 threadIdx;
if (guard_matrixMul_TRN_11)
{

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{

C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];

}

}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_7 
void matrixMul_TRN_7(int guard_matrixMul_TRN_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE As[16][16], DATATYPE * A, int a, int tx_block[BLOCKDIM_Y][BLOCKDIM_X], int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wA, DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 threadIdx;
if (guard_matrixMul_TRN_7)
{

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{

As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];

}

}
return ;
}

#pragma fcuda compute end=false cores=1 begin=true name=SNC_8 
void matrixMul_SNC_8(int guard_matrixMul_SNC_8, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], DATATYPE As[16][16], DATATYPE Bs[16][16], int tx_block[BLOCKDIM_Y][BLOCKDIM_X], int ty_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 threadIdx;
if (guard_matrixMul_SNC_8)
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
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
}

}

}


}
return ;
}

void matrixMul_TRN_11_wrapper(int guard_matrixMul_TRN_11_block0, dim3 blockDim, dim3 gridDim, dim3 blockIdx_matrixMul_TRN_11_block0, DATATYPE * C, DATATYPE Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], int c_block0, int tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], int ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X], int wB)
{
matrixMul_TRN_11(guard_matrixMul_TRN_11_block0, blockDim, gridDim, blockIdx_matrixMul_TRN_11_block0, C, Csub_block_block0, c_block0, tx_block_block0, ty_block_block0, wB);
}

#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB, dim3 gridDim, dim3 blockDim)
{
int bx_block0;
int by_block0;
int tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X];
int ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X];
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
int guard_matrixMul_CMP_6_block0;
int guard_matrixMul_TRN_11_block0;
int guard_matrixMul_TRN_7_block0;
int guard_matrixMul_SNC_8_block0;
dim3 blockIdx_loop;
for (blockIdx_loop.y=0; (gridDim.y+(-1*blockIdx_loop.y))>0; blockIdx_loop.y+=1)
{
blockIdx_block0.y=blockIdx_loop.y;
for (blockIdx_loop.x=0; (gridDim.x+(-1*blockIdx_loop.x))>0; blockIdx_loop.x+=1)
{
blockIdx_block0.x=(blockIdx_loop.x+0);
guard_matrixMul_SNC_8_block0=1;
guard_matrixMul_TRN_7_block0=1;
guard_matrixMul_TRN_11_block0=1;
guard_matrixMul_CMP_6_block0=1;
bx_block0=blockIdx_block0.x;
by_block0=blockIdx_block0.y;


matrixMul_CMP_6(guard_matrixMul_CMP_6_block0, blockDim, gridDim, blockIdx_block0, tx_block_block0, ty_block_block0, aBegin_block0, by_block0, wA, aEnd_block0, aStep_block0, bBegin_block0, bx_block0, bStep_block0, wB, Csub_block_block0);

a_block0=0;
b_block0=0;
k_block0=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_7 
for (((a_block0=aBegin_block0), (b_block0=bBegin_block0)); a_block0<=aEnd_block0; ((a_block0+=aStep_block0), (b_block0+=bStep_block0)))
{
DATATYPE As[16][16];
DATATYPE Bs[16][16];



matrixMul_TRN_7(guard_matrixMul_TRN_7_block0, blockDim, gridDim, blockIdx_block0, As, A, a_block0, tx_block_block0, ty_block_block0, wA, Bs, B, b_block0, wB);




matrixMul_SNC_8(guard_matrixMul_SNC_8_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0, As, Bs, tx_block_block0, ty_block_block0);

}
c_block0=(((wB*16)*by_block0)+(16*bx_block0));



matrixMul_TRN_11_wrapper(guard_matrixMul_TRN_11_block0, blockDim, gridDim, blockIdx_block0, C, Csub_block_block0, c_block0, tx_block_block0, ty_block_block0, wB);



}
}
}

