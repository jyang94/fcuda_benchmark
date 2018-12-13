[LinkSymbol] 62 updates in 0.01 seconds
[AnnotParser] begin
Token #
Token pragma
Token FCUDA
Token GRID
Token x_dim=16
Token y_dim=16
Token #
Token pragma
Token FCUDA
Token COREINFO
Token num_cores=1
Token pipeline=no
Token #
Token pragma
Token FCUDA
Token COMPUTE
Token cores=[1]
Token begin
Token name=vec_init
Token unroll=1
Token mpart=1
Token array_split=[Csub_block|As]
Token #
Token pragma
Token FCUDA
Token COMPUTE
Token cores=[1]
Token end
Token name=vec_init
Token unroll=1
Token mpart=1
Token array_split=[Csub_block|As]
Token #
Token pragma
Token FCUDA
Token TRANSFER
Token cores=[1]
Token type=burst
Token dir=[0|0]
Token pointer=[A|B]
Token size=[16|16]
Token begin
Token name=fetch
Token unroll=1
Token mpart=1
Token array_split=[Csub_block|As]
Token #
Token pragma
Token FCUDA
Token TRANSFER
Token cores=[1]
Token type=burst
Token dir=[0|0]
Token pointer=[A|B]
Token size=[16|16]
Token end
Token name=fetch
Token unroll=1
Token mpart=1
Token array_split=[Csub_block|As]
Token #
Token pragma
Token FCUDA
Token COMPUTE
Token cores=[1]
Token begin
Token name=vec_blk
Token array_split=[Csub_block|As]
Token unroll=1
Token mpart=1
Token #
Token pragma
Token FCUDA
Token COMPUTE
Token cores=[1]
Token end
Token name=vec_blk
Token array_split=[Csub_block|As]
Token unroll=1
Token mpart=1
Token #
Token pragma
Token FCUDA
Token TRANSFER
Token cores=[1]
Token type=burst
Token dir=[1]
Token pointer=[C]
Token size=[16]
Token begin
Token name=write
Token unroll=1
Token mpart=1
Token array_split=[Csub_block|As]
Token #
Token pragma
Token FCUDA
Token TRANSFER
Token cores=[1]
Token type=burst
Token dir=[1]
Token pointer=[C]
Token size=[16]
Token end
Token name=write
Token unroll=1
Token mpart=1
Token array_split=[Csub_block|As]
[AnnotParser] end in 0.07 seconds
WARNING: Fcuda flag is set but mcuda_nolib is not set
WARNING: turning on mcuda_nolib
WARNING: mcuda_nolib flag is set but serialThr is not set
WARNING: turning on serialThr
 ... Setting: FLOW = 3
       TASK DECOMP = 2
       CODE MOTION = 0

*** Before Any Passes  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0, b = 0, k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}



===========================================
[SingleDeclarator] begin
-------------working on eliminating: signed char x, y
------eliminating: signed char x, y its child is: signed char x, y its parent is: signed char x, y;
------parent is instance of declaration statement, child was: signed char x, y parent was: signed char x, y; outer was: null
------now child becomes: signed char x, y; parent becomes: struct char2
{
signed char x, y;
};
 outer becomes: struct char2
{
signed char x, y;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct char2
{
signed char x, y;
 ;
};

------after parent.removeChild(child), parent is: struct char2
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct char2
{
 ;
signed char y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct char2
{
 ;
signed char y;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct char2
{
 ;
signed char x;
signed char y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct char2
{
 ;
signed char x;
signed char y;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct char2
{
signed char x;
signed char y;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct char2
{
signed char x;
signed char y;
};

------Done with eliminateMultipleDeclarators, d now is: signed char x, y
-------------working on eliminating: unsigned char x, y
------eliminating: unsigned char x, y its child is: unsigned char x, y its parent is: unsigned char x, y;
------parent is instance of declaration statement, child was: unsigned char x, y parent was: unsigned char x, y; outer was: null
------now child becomes: unsigned char x, y; parent becomes: struct uchar2
{
unsigned char x, y;
};
 outer becomes: struct uchar2
{
unsigned char x, y;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct uchar2
{
unsigned char x, y;
 ;
};

------after parent.removeChild(child), parent is: struct uchar2
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uchar2
{
 ;
unsigned char y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uchar2
{
 ;
unsigned char y;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uchar2
{
 ;
unsigned char x;
unsigned char y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uchar2
{
 ;
unsigned char x;
unsigned char y;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct uchar2
{
unsigned char x;
unsigned char y;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct uchar2
{
unsigned char x;
unsigned char y;
};

------Done with eliminateMultipleDeclarators, d now is: unsigned char x, y
-------------working on eliminating: signed char x, y, z
------eliminating: signed char x, y, z its child is: signed char x, y, z its parent is: signed char x, y, z;
------parent is instance of declaration statement, child was: signed char x, y, z parent was: signed char x, y, z; outer was: null
------now child becomes: signed char x, y, z; parent becomes: struct char3
{
signed char x, y, z;
};
 outer becomes: struct char3
{
signed char x, y, z;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct char3
{
signed char x, y, z;
 ;
};

------after parent.removeChild(child), parent is: struct char3
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct char3
{
 ;
signed char z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct char3
{
 ;
signed char z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct char3
{
 ;
signed char y;
signed char z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct char3
{
 ;
signed char y;
signed char z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct char3
{
 ;
signed char x;
signed char y;
signed char z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct char3
{
 ;
signed char x;
signed char y;
signed char z;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct char3
{
signed char x;
signed char y;
signed char z;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct char3
{
signed char x;
signed char y;
signed char z;
};

------Done with eliminateMultipleDeclarators, d now is: signed char x, y, z
-------------working on eliminating: unsigned char x, y, z
------eliminating: unsigned char x, y, z its child is: unsigned char x, y, z its parent is: unsigned char x, y, z;
------parent is instance of declaration statement, child was: unsigned char x, y, z parent was: unsigned char x, y, z; outer was: null
------now child becomes: unsigned char x, y, z; parent becomes: struct uchar3
{
unsigned char x, y, z;
};
 outer becomes: struct uchar3
{
unsigned char x, y, z;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct uchar3
{
unsigned char x, y, z;
 ;
};

------after parent.removeChild(child), parent is: struct uchar3
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uchar3
{
 ;
unsigned char z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uchar3
{
 ;
unsigned char z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uchar3
{
 ;
unsigned char y;
unsigned char z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uchar3
{
 ;
unsigned char y;
unsigned char z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uchar3
{
 ;
unsigned char x;
unsigned char y;
unsigned char z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uchar3
{
 ;
unsigned char x;
unsigned char y;
unsigned char z;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct uchar3
{
unsigned char x;
unsigned char y;
unsigned char z;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct uchar3
{
unsigned char x;
unsigned char y;
unsigned char z;
};

------Done with eliminateMultipleDeclarators, d now is: unsigned char x, y, z
-------------working on eliminating: signed char x, y, z, w
------eliminating: signed char x, y, z, w its child is: signed char x, y, z, w its parent is: signed char x, y, z, w;
------parent is instance of declaration statement, child was: signed char x, y, z, w parent was: signed char x, y, z, w; outer was: null
------now child becomes: signed char x, y, z, w; parent becomes: struct char4
{
signed char x, y, z, w;
};
 outer becomes: struct char4
{
signed char x, y, z, w;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct char4
{
signed char x, y, z, w;
 ;
};

------after parent.removeChild(child), parent is: struct char4
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 3
------after, Declarator d = decl.getDeclarator(i), d is: w
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct char4
{
 ;
signed char w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct char4
{
 ;
signed char w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct char4
{
 ;
signed char z;
signed char w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct char4
{
 ;
signed char z;
signed char w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct char4
{
 ;
signed char y;
signed char z;
signed char w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct char4
{
 ;
signed char y;
signed char z;
signed char w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct char4
{
 ;
signed char x;
signed char y;
signed char z;
signed char w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct char4
{
 ;
signed char x;
signed char y;
signed char z;
signed char w;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct char4
{
signed char x;
signed char y;
signed char z;
signed char w;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct char4
{
signed char x;
signed char y;
signed char z;
signed char w;
};

------Done with eliminateMultipleDeclarators, d now is: signed char x, y, z, w
-------------working on eliminating: unsigned char x, y, z, w
------eliminating: unsigned char x, y, z, w its child is: unsigned char x, y, z, w its parent is: unsigned char x, y, z, w;
------parent is instance of declaration statement, child was: unsigned char x, y, z, w parent was: unsigned char x, y, z, w; outer was: null
------now child becomes: unsigned char x, y, z, w; parent becomes: struct uchar4
{
unsigned char x, y, z, w;
};
 outer becomes: struct uchar4
{
unsigned char x, y, z, w;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct uchar4
{
unsigned char x, y, z, w;
 ;
};

------after parent.removeChild(child), parent is: struct uchar4
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 3
------after, Declarator d = decl.getDeclarator(i), d is: w
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uchar4
{
 ;
unsigned char w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uchar4
{
 ;
unsigned char w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uchar4
{
 ;
unsigned char z;
unsigned char w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uchar4
{
 ;
unsigned char z;
unsigned char w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uchar4
{
 ;
unsigned char y;
unsigned char z;
unsigned char w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uchar4
{
 ;
unsigned char y;
unsigned char z;
unsigned char w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uchar4
{
 ;
unsigned char x;
unsigned char y;
unsigned char z;
unsigned char w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uchar4
{
 ;
unsigned char x;
unsigned char y;
unsigned char z;
unsigned char w;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct uchar4
{
unsigned char x;
unsigned char y;
unsigned char z;
unsigned char w;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct uchar4
{
unsigned char x;
unsigned char y;
unsigned char z;
unsigned char w;
};

------Done with eliminateMultipleDeclarators, d now is: unsigned char x, y, z, w
-------------working on eliminating: short x, y
------eliminating: short x, y its child is: short x, y its parent is: short x, y;
------parent is instance of declaration statement, child was: short x, y parent was: short x, y; outer was: null
------now child becomes: short x, y; parent becomes: struct short2
{
short x, y;
};
 outer becomes: struct short2
{
short x, y;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct short2
{
short x, y;
 ;
};

------after parent.removeChild(child), parent is: struct short2
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct short2
{
 ;
short y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct short2
{
 ;
short y;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct short2
{
 ;
short x;
short y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct short2
{
 ;
short x;
short y;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct short2
{
short x;
short y;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct short2
{
short x;
short y;
};

------Done with eliminateMultipleDeclarators, d now is: short x, y
-------------working on eliminating: unsigned short x, y
------eliminating: unsigned short x, y its child is: unsigned short x, y its parent is: unsigned short x, y;
------parent is instance of declaration statement, child was: unsigned short x, y parent was: unsigned short x, y; outer was: null
------now child becomes: unsigned short x, y; parent becomes: struct ushort2
{
unsigned short x, y;
};
 outer becomes: struct ushort2
{
unsigned short x, y;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct ushort2
{
unsigned short x, y;
 ;
};

------after parent.removeChild(child), parent is: struct ushort2
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct ushort2
{
 ;
unsigned short y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct ushort2
{
 ;
unsigned short y;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct ushort2
{
 ;
unsigned short x;
unsigned short y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct ushort2
{
 ;
unsigned short x;
unsigned short y;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct ushort2
{
unsigned short x;
unsigned short y;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct ushort2
{
unsigned short x;
unsigned short y;
};

------Done with eliminateMultipleDeclarators, d now is: unsigned short x, y
-------------working on eliminating: short x, y, z
------eliminating: short x, y, z its child is: short x, y, z its parent is: short x, y, z;
------parent is instance of declaration statement, child was: short x, y, z parent was: short x, y, z; outer was: null
------now child becomes: short x, y, z; parent becomes: struct short3
{
short x, y, z;
};
 outer becomes: struct short3
{
short x, y, z;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct short3
{
short x, y, z;
 ;
};

------after parent.removeChild(child), parent is: struct short3
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct short3
{
 ;
short z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct short3
{
 ;
short z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct short3
{
 ;
short y;
short z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct short3
{
 ;
short y;
short z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct short3
{
 ;
short x;
short y;
short z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct short3
{
 ;
short x;
short y;
short z;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct short3
{
short x;
short y;
short z;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct short3
{
short x;
short y;
short z;
};

------Done with eliminateMultipleDeclarators, d now is: short x, y, z
-------------working on eliminating: unsigned short x, y, z
------eliminating: unsigned short x, y, z its child is: unsigned short x, y, z its parent is: unsigned short x, y, z;
------parent is instance of declaration statement, child was: unsigned short x, y, z parent was: unsigned short x, y, z; outer was: null
------now child becomes: unsigned short x, y, z; parent becomes: struct ushort3
{
unsigned short x, y, z;
};
 outer becomes: struct ushort3
{
unsigned short x, y, z;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct ushort3
{
unsigned short x, y, z;
 ;
};

------after parent.removeChild(child), parent is: struct ushort3
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct ushort3
{
 ;
unsigned short z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct ushort3
{
 ;
unsigned short z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct ushort3
{
 ;
unsigned short y;
unsigned short z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct ushort3
{
 ;
unsigned short y;
unsigned short z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct ushort3
{
 ;
unsigned short x;
unsigned short y;
unsigned short z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct ushort3
{
 ;
unsigned short x;
unsigned short y;
unsigned short z;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct ushort3
{
unsigned short x;
unsigned short y;
unsigned short z;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct ushort3
{
unsigned short x;
unsigned short y;
unsigned short z;
};

------Done with eliminateMultipleDeclarators, d now is: unsigned short x, y, z
-------------working on eliminating: short x, y, z, w
------eliminating: short x, y, z, w its child is: short x, y, z, w its parent is: short x, y, z, w;
------parent is instance of declaration statement, child was: short x, y, z, w parent was: short x, y, z, w; outer was: null
------now child becomes: short x, y, z, w; parent becomes: struct short4
{
short x, y, z, w;
};
 outer becomes: struct short4
{
short x, y, z, w;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct short4
{
short x, y, z, w;
 ;
};

------after parent.removeChild(child), parent is: struct short4
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 3
------after, Declarator d = decl.getDeclarator(i), d is: w
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct short4
{
 ;
short w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct short4
{
 ;
short w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct short4
{
 ;
short z;
short w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct short4
{
 ;
short z;
short w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct short4
{
 ;
short y;
short z;
short w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct short4
{
 ;
short y;
short z;
short w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct short4
{
 ;
short x;
short y;
short z;
short w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct short4
{
 ;
short x;
short y;
short z;
short w;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct short4
{
short x;
short y;
short z;
short w;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct short4
{
short x;
short y;
short z;
short w;
};

------Done with eliminateMultipleDeclarators, d now is: short x, y, z, w
-------------working on eliminating: unsigned short x, y, z, w
------eliminating: unsigned short x, y, z, w its child is: unsigned short x, y, z, w its parent is: unsigned short x, y, z, w;
------parent is instance of declaration statement, child was: unsigned short x, y, z, w parent was: unsigned short x, y, z, w; outer was: null
------now child becomes: unsigned short x, y, z, w; parent becomes: struct ushort4
{
unsigned short x, y, z, w;
};
 outer becomes: struct ushort4
{
unsigned short x, y, z, w;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct ushort4
{
unsigned short x, y, z, w;
 ;
};

------after parent.removeChild(child), parent is: struct ushort4
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 3
------after, Declarator d = decl.getDeclarator(i), d is: w
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct ushort4
{
 ;
unsigned short w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct ushort4
{
 ;
unsigned short w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct ushort4
{
 ;
unsigned short z;
unsigned short w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct ushort4
{
 ;
unsigned short z;
unsigned short w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct ushort4
{
 ;
unsigned short y;
unsigned short z;
unsigned short w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct ushort4
{
 ;
unsigned short y;
unsigned short z;
unsigned short w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct ushort4
{
 ;
unsigned short x;
unsigned short y;
unsigned short z;
unsigned short w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct ushort4
{
 ;
unsigned short x;
unsigned short y;
unsigned short z;
unsigned short w;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct ushort4
{
unsigned short x;
unsigned short y;
unsigned short z;
unsigned short w;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct ushort4
{
unsigned short x;
unsigned short y;
unsigned short z;
unsigned short w;
};

------Done with eliminateMultipleDeclarators, d now is: unsigned short x, y, z, w
-------------working on eliminating: int x, y
------eliminating: int x, y its child is: int x, y its parent is: int x, y;
------parent is instance of declaration statement, child was: int x, y parent was: int x, y; outer was: null
------now child becomes: int x, y; parent becomes: struct int2
{
int x, y;
};
 outer becomes: struct int2
{
int x, y;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct int2
{
int x, y;
 ;
};

------after parent.removeChild(child), parent is: struct int2
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct int2
{
 ;
int y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct int2
{
 ;
int y;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct int2
{
 ;
int x;
int y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct int2
{
 ;
int x;
int y;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct int2
{
int x;
int y;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct int2
{
int x;
int y;
};

------Done with eliminateMultipleDeclarators, d now is: int x, y
-------------working on eliminating: unsigned int x, y
------eliminating: unsigned int x, y its child is: unsigned int x, y its parent is: unsigned int x, y;
------parent is instance of declaration statement, child was: unsigned int x, y parent was: unsigned int x, y; outer was: null
------now child becomes: unsigned int x, y; parent becomes: struct uint2
{
unsigned int x, y;
};
 outer becomes: struct uint2
{
unsigned int x, y;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct uint2
{
unsigned int x, y;
 ;
};

------after parent.removeChild(child), parent is: struct uint2
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uint2
{
 ;
unsigned int y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uint2
{
 ;
unsigned int y;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uint2
{
 ;
unsigned int x;
unsigned int y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uint2
{
 ;
unsigned int x;
unsigned int y;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct uint2
{
unsigned int x;
unsigned int y;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct uint2
{
unsigned int x;
unsigned int y;
};

------Done with eliminateMultipleDeclarators, d now is: unsigned int x, y
-------------working on eliminating: int x, y, z
------eliminating: int x, y, z its child is: int x, y, z its parent is: int x, y, z;
------parent is instance of declaration statement, child was: int x, y, z parent was: int x, y, z; outer was: null
------now child becomes: int x, y, z; parent becomes: struct int3
{
int x, y, z;
};
 outer becomes: struct int3
{
int x, y, z;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct int3
{
int x, y, z;
 ;
};

------after parent.removeChild(child), parent is: struct int3
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct int3
{
 ;
int z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct int3
{
 ;
int z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct int3
{
 ;
int y;
int z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct int3
{
 ;
int y;
int z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct int3
{
 ;
int x;
int y;
int z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct int3
{
 ;
int x;
int y;
int z;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct int3
{
int x;
int y;
int z;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct int3
{
int x;
int y;
int z;
};

------Done with eliminateMultipleDeclarators, d now is: int x, y, z
-------------working on eliminating: unsigned int x, y, z
------eliminating: unsigned int x, y, z its child is: unsigned int x, y, z its parent is: unsigned int x, y, z;
------parent is instance of declaration statement, child was: unsigned int x, y, z parent was: unsigned int x, y, z; outer was: null
------now child becomes: unsigned int x, y, z; parent becomes: struct uint3
{
unsigned int x, y, z;
};
 outer becomes: struct uint3
{
unsigned int x, y, z;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct uint3
{
unsigned int x, y, z;
 ;
};

------after parent.removeChild(child), parent is: struct uint3
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uint3
{
 ;
unsigned int z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uint3
{
 ;
unsigned int z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uint3
{
 ;
unsigned int y;
unsigned int z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uint3
{
 ;
unsigned int y;
unsigned int z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uint3
{
 ;
unsigned int x;
unsigned int y;
unsigned int z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uint3
{
 ;
unsigned int x;
unsigned int y;
unsigned int z;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct uint3
{
unsigned int x;
unsigned int y;
unsigned int z;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct uint3
{
unsigned int x;
unsigned int y;
unsigned int z;
};

------Done with eliminateMultipleDeclarators, d now is: unsigned int x, y, z
-------------working on eliminating: int x, y, z, w
------eliminating: int x, y, z, w its child is: int x, y, z, w its parent is: int x, y, z, w;
------parent is instance of declaration statement, child was: int x, y, z, w parent was: int x, y, z, w; outer was: null
------now child becomes: int x, y, z, w; parent becomes: struct int4
{
int x, y, z, w;
};
 outer becomes: struct int4
{
int x, y, z, w;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct int4
{
int x, y, z, w;
 ;
};

------after parent.removeChild(child), parent is: struct int4
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 3
------after, Declarator d = decl.getDeclarator(i), d is: w
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct int4
{
 ;
int w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct int4
{
 ;
int w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct int4
{
 ;
int z;
int w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct int4
{
 ;
int z;
int w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct int4
{
 ;
int y;
int z;
int w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct int4
{
 ;
int y;
int z;
int w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct int4
{
 ;
int x;
int y;
int z;
int w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct int4
{
 ;
int x;
int y;
int z;
int w;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct int4
{
int x;
int y;
int z;
int w;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct int4
{
int x;
int y;
int z;
int w;
};

------Done with eliminateMultipleDeclarators, d now is: int x, y, z, w
-------------working on eliminating: unsigned int x, y, z, w
------eliminating: unsigned int x, y, z, w its child is: unsigned int x, y, z, w its parent is: unsigned int x, y, z, w;
------parent is instance of declaration statement, child was: unsigned int x, y, z, w parent was: unsigned int x, y, z, w; outer was: null
------now child becomes: unsigned int x, y, z, w; parent becomes: struct uint4
{
unsigned int x, y, z, w;
};
 outer becomes: struct uint4
{
unsigned int x, y, z, w;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct uint4
{
unsigned int x, y, z, w;
 ;
};

------after parent.removeChild(child), parent is: struct uint4
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 3
------after, Declarator d = decl.getDeclarator(i), d is: w
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uint4
{
 ;
unsigned int w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uint4
{
 ;
unsigned int w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uint4
{
 ;
unsigned int z;
unsigned int w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uint4
{
 ;
unsigned int z;
unsigned int w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uint4
{
 ;
unsigned int y;
unsigned int z;
unsigned int w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uint4
{
 ;
unsigned int y;
unsigned int z;
unsigned int w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct uint4
{
 ;
unsigned int x;
unsigned int y;
unsigned int z;
unsigned int w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct uint4
{
 ;
unsigned int x;
unsigned int y;
unsigned int z;
unsigned int w;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct uint4
{
unsigned int x;
unsigned int y;
unsigned int z;
unsigned int w;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct uint4
{
unsigned int x;
unsigned int y;
unsigned int z;
unsigned int w;
};

------Done with eliminateMultipleDeclarators, d now is: unsigned int x, y, z, w
-------------working on eliminating: long int x, y
------eliminating: long int x, y its child is: long int x, y its parent is: long int x, y;
------parent is instance of declaration statement, child was: long int x, y parent was: long int x, y; outer was: null
------now child becomes: long int x, y; parent becomes: struct long2
{
long int x, y;
};
 outer becomes: struct long2
{
long int x, y;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct long2
{
long int x, y;
 ;
};

------after parent.removeChild(child), parent is: struct long2
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct long2
{
 ;
long int y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct long2
{
 ;
long int y;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct long2
{
 ;
long int x;
long int y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct long2
{
 ;
long int x;
long int y;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct long2
{
long int x;
long int y;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct long2
{
long int x;
long int y;
};

------Done with eliminateMultipleDeclarators, d now is: long int x, y
-------------working on eliminating: unsigned long int x, y
------eliminating: unsigned long int x, y its child is: unsigned long int x, y its parent is: unsigned long int x, y;
------parent is instance of declaration statement, child was: unsigned long int x, y parent was: unsigned long int x, y; outer was: null
------now child becomes: unsigned long int x, y; parent becomes: struct ulong2
{
unsigned long int x, y;
};
 outer becomes: struct ulong2
{
unsigned long int x, y;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct ulong2
{
unsigned long int x, y;
 ;
};

------after parent.removeChild(child), parent is: struct ulong2
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct ulong2
{
 ;
unsigned long int y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct ulong2
{
 ;
unsigned long int y;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct ulong2
{
 ;
unsigned long int x;
unsigned long int y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct ulong2
{
 ;
unsigned long int x;
unsigned long int y;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct ulong2
{
unsigned long int x;
unsigned long int y;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct ulong2
{
unsigned long int x;
unsigned long int y;
};

------Done with eliminateMultipleDeclarators, d now is: unsigned long int x, y
-------------working on eliminating: float x, y
------eliminating: float x, y its child is: float x, y its parent is: float x, y;
------parent is instance of declaration statement, child was: float x, y parent was: float x, y; outer was: null
------now child becomes: float x, y; parent becomes: struct float2
{
float x, y;
};
 outer becomes: struct float2
{
float x, y;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct float2
{
float x, y;
 ;
};

------after parent.removeChild(child), parent is: struct float2
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct float2
{
 ;
float y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct float2
{
 ;
float y;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct float2
{
 ;
float x;
float y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct float2
{
 ;
float x;
float y;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct float2
{
float x;
float y;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct float2
{
float x;
float y;
};

------Done with eliminateMultipleDeclarators, d now is: float x, y
-------------working on eliminating: float x, y, z
------eliminating: float x, y, z its child is: float x, y, z its parent is: float x, y, z;
------parent is instance of declaration statement, child was: float x, y, z parent was: float x, y, z; outer was: null
------now child becomes: float x, y, z; parent becomes: struct float3
{
float x, y, z;
};
 outer becomes: struct float3
{
float x, y, z;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct float3
{
float x, y, z;
 ;
};

------after parent.removeChild(child), parent is: struct float3
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct float3
{
 ;
float z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct float3
{
 ;
float z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct float3
{
 ;
float y;
float z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct float3
{
 ;
float y;
float z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct float3
{
 ;
float x;
float y;
float z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct float3
{
 ;
float x;
float y;
float z;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct float3
{
float x;
float y;
float z;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct float3
{
float x;
float y;
float z;
};

------Done with eliminateMultipleDeclarators, d now is: float x, y, z
-------------working on eliminating: float x, y, z, w
------eliminating: float x, y, z, w its child is: float x, y, z, w its parent is: float x, y, z, w;
------parent is instance of declaration statement, child was: float x, y, z, w parent was: float x, y, z, w; outer was: null
------now child becomes: float x, y, z, w; parent becomes: struct float4
{
float x, y, z, w;
};
 outer becomes: struct float4
{
float x, y, z, w;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct float4
{
float x, y, z, w;
 ;
};

------after parent.removeChild(child), parent is: struct float4
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 3
------after, Declarator d = decl.getDeclarator(i), d is: w
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct float4
{
 ;
float w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct float4
{
 ;
float w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct float4
{
 ;
float z;
float w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct float4
{
 ;
float z;
float w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct float4
{
 ;
float y;
float z;
float w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct float4
{
 ;
float y;
float z;
float w;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct float4
{
 ;
float x;
float y;
float z;
float w;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct float4
{
 ;
float x;
float y;
float z;
float w;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct float4
{
float x;
float y;
float z;
float w;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct float4
{
float x;
float y;
float z;
float w;
};

------Done with eliminateMultipleDeclarators, d now is: float x, y, z, w
-------------working on eliminating: long long int x, y
------eliminating: long long int x, y its child is: long long int x, y its parent is: long long int x, y;
------parent is instance of declaration statement, child was: long long int x, y parent was: long long int x, y; outer was: null
------now child becomes: long long int x, y; parent becomes: struct longlong2
{
long long int x, y;
};
 outer becomes: struct longlong2
{
long long int x, y;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct longlong2
{
long long int x, y;
 ;
};

------after parent.removeChild(child), parent is: struct longlong2
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct longlong2
{
 ;
long long int y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct longlong2
{
 ;
long long int y;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct longlong2
{
 ;
long long int x;
long long int y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct longlong2
{
 ;
long long int x;
long long int y;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct longlong2
{
long long int x;
long long int y;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct longlong2
{
long long int x;
long long int y;
};

------Done with eliminateMultipleDeclarators, d now is: long long int x, y
-------------working on eliminating: unsigned long long int x, y
------eliminating: unsigned long long int x, y its child is: unsigned long long int x, y its parent is: unsigned long long int x, y;
------parent is instance of declaration statement, child was: unsigned long long int x, y parent was: unsigned long long int x, y; outer was: null
------now child becomes: unsigned long long int x, y; parent becomes: struct ulonglong2
{
unsigned long long int x, y;
};
 outer becomes: struct ulonglong2
{
unsigned long long int x, y;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct ulonglong2
{
unsigned long long int x, y;
 ;
};

------after parent.removeChild(child), parent is: struct ulonglong2
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct ulonglong2
{
 ;
unsigned long long int y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct ulonglong2
{
 ;
unsigned long long int y;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct ulonglong2
{
 ;
unsigned long long int x;
unsigned long long int y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct ulonglong2
{
 ;
unsigned long long int x;
unsigned long long int y;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct ulonglong2
{
unsigned long long int x;
unsigned long long int y;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct ulonglong2
{
unsigned long long int x;
unsigned long long int y;
};

------Done with eliminateMultipleDeclarators, d now is: unsigned long long int x, y
-------------working on eliminating: double x, y
------eliminating: double x, y its child is: double x, y its parent is: double x, y;
------parent is instance of declaration statement, child was: double x, y parent was: double x, y; outer was: null
------now child becomes: double x, y; parent becomes: struct double2
{
double x, y;
};
 outer becomes: struct double2
{
double x, y;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct double2
{
double x, y;
 ;
};

------after parent.removeChild(child), parent is: struct double2
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct double2
{
 ;
double y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct double2
{
 ;
double y;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct double2
{
 ;
double x;
double y;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct double2
{
 ;
double x;
double y;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct double2
{
double x;
double y;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct double2
{
double x;
double y;
};

------Done with eliminateMultipleDeclarators, d now is: double x, y
-------------working on eliminating: double x, y, z
------eliminating: double x, y, z its child is: double x, y, z its parent is: double x, y, z;
------parent is instance of declaration statement, child was: double x, y, z parent was: double x, y, z; outer was: null
------now child becomes: double x, y, z; parent becomes: struct double3
{
double x, y, z;
};
 outer becomes: struct double3
{
double x, y, z;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct double3
{
double x, y, z;
 ;
};

------after parent.removeChild(child), parent is: struct double3
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct double3
{
 ;
double z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct double3
{
 ;
double z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct double3
{
 ;
double y;
double z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct double3
{
 ;
double y;
double z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct double3
{
 ;
double x;
double y;
double z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct double3
{
 ;
double x;
double y;
double z;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct double3
{
double x;
double y;
double z;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct double3
{
double x;
double y;
double z;
};

------Done with eliminateMultipleDeclarators, d now is: double x, y, z
-------------working on eliminating: unsigned int x, y, z
------eliminating: unsigned int x, y, z its child is: unsigned int x, y, z its parent is: unsigned int x, y, z;
------parent is instance of declaration statement, child was: unsigned int x, y, z parent was: unsigned int x, y, z; outer was: null
------now child becomes: unsigned int x, y, z; parent becomes: struct dim3
{
unsigned int x, y, z;
};
 outer becomes: struct dim3
{
unsigned int x, y, z;
};

------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: struct dim3
{
unsigned int x, y, z;
 ;
};

------after parent.removeChild(child), parent is: struct dim3
{
 ;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: z
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct dim3
{
 ;
unsigned int z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct dim3
{
 ;
unsigned int z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: y
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct dim3
{
 ;
unsigned int y;
unsigned int z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct dim3
{
 ;
unsigned int y;
unsigned int z;
};

------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: x
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: struct dim3
{
 ;
unsigned int x;
unsigned int y;
unsigned int z;
};

------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: struct dim3
{
 ;
unsigned int x;
unsigned int y;
unsigned int z;
};

------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: struct dim3
{
unsigned int x;
unsigned int y;
unsigned int z;
};

------after parent.removeChild(placeholder.getParent()), outer is: struct dim3
{
unsigned int x;
unsigned int y;
unsigned int z;
};

------Done with eliminateMultipleDeclarators, d now is: unsigned int x, y, z
-------------d is instance of procedure: void __syncthreads()
{
;
}

-------------d is instance of procedure: #pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0, b = 0, k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}

-------------working on eliminating: int a = 0, b = 0, k = 0
------eliminating: int a = 0, b = 0, k = 0 its child is: int a = 0, b = 0, k = 0 its parent is: int a = 0, b = 0, k = 0;
------parent is instance of declaration statement, child was: int a = 0, b = 0, k = 0 parent was: int a = 0, b = 0, k = 0; outer was: null
------now child becomes: int a = 0, b = 0, k = 0; parent becomes: {
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0, b = 0, k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
} outer becomes: {
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0, b = 0, k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}
------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
------after outer.addDeclarationAfter(decl, placeholder), outer is: {
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0, b = 0, k = 0;
 ;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}
------after parent.removeChild(child), parent is: {
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
 ;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}
------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: k = 0
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: {
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
 ;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: {
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
 ;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}
------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: b = 0
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: {
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
 ;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: {
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
 ;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}
------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: a = 0
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: {
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
 ;
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: {
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
 ;
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}
------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: {
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}
------after parent.removeChild(placeholder.getParent()), outer is: {
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}
------Done with eliminateMultipleDeclarators, d now is: int a = 0, b = 0, k = 0
[SingleDeclarator] end in 0.13 seconds
[LinkSymbol] 62 updates in 0.00 seconds

*** After SingleDeclarator  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}



===========================================
[SeparateInitializers] begin
[SeparateInitializers] examining procedure matrixMul
00-----if Driver.getoptionvvalue fcuda != null-----
00-----after List<Procedure> tskLst = FCUDAutils.getTaskMapping(proc.getSymbolName()); tskLst is: null-----
1111-----If tskLst == null-----
00-----in splitInitialization, proc is: #pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx = blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}
-----
1111-----enter while loop, declStmt is: int bx = blockIdx.x;-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: int bx = blockIdx.x-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: bx = blockIdx.x-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is:  = blockIdx.x-----
1111-----after variable.setInitializer(null), variable is: bx-----
1111-----vDecl.getSpecifiers().remove(Specifier.CONST), vDecl is: int bx-----
1111-----variable.getSpecifiers().remove(Specifier.CONST), variable is: bx-----
1111-----List<Traversable> children = vInit.getChildren(), children is: [blockIdx.x]-----
1111-----Expression initExpr = (Expression)((Expression)children.get(0)).clone(), initExpr is: blockIdx.x-----
1111-----IDExpression vID = new Identifier(variable), vID is: bx-----
1111-----AssignmentExpression vAssign = new AssignmentExpression(vID, AssignmentOperator.NORMAL, initExpr), vAssign is: (bx=blockIdx.x)-----
1111-----ExpressionStatement vStmt = new ExpressionStatement(vAssign), vStmt is: bx=blockIdx.x;-----
1111-----CompoundStatement scope = (CompoundStatement)declStmt.getParent(), scope is: {
int bx;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
int bx;
bx=blockIdx.x;
int by = blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----enter while loop, declStmt is: int by = blockIdx.y;-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: int by = blockIdx.y-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: by = blockIdx.y-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is:  = blockIdx.y-----
1111-----after variable.setInitializer(null), variable is: by-----
1111-----vDecl.getSpecifiers().remove(Specifier.CONST), vDecl is: int by-----
1111-----variable.getSpecifiers().remove(Specifier.CONST), variable is: by-----
1111-----List<Traversable> children = vInit.getChildren(), children is: [blockIdx.y]-----
1111-----Expression initExpr = (Expression)((Expression)children.get(0)).clone(), initExpr is: blockIdx.y-----
1111-----IDExpression vID = new Identifier(variable), vID is: by-----
1111-----AssignmentExpression vAssign = new AssignmentExpression(vID, AssignmentOperator.NORMAL, initExpr), vAssign is: (by=blockIdx.y)-----
1111-----ExpressionStatement vStmt = new ExpressionStatement(vAssign), vStmt is: by=blockIdx.y;-----
1111-----CompoundStatement scope = (CompoundStatement)declStmt.getParent(), scope is: {
int bx;
bx=blockIdx.x;
int by;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx = threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----enter while loop, declStmt is: int tx = threadIdx.x;-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: int tx = threadIdx.x-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: tx = threadIdx.x-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is:  = threadIdx.x-----
1111-----after variable.setInitializer(null), variable is: tx-----
1111-----vDecl.getSpecifiers().remove(Specifier.CONST), vDecl is: int tx-----
1111-----variable.getSpecifiers().remove(Specifier.CONST), variable is: tx-----
1111-----List<Traversable> children = vInit.getChildren(), children is: [threadIdx.x]-----
1111-----Expression initExpr = (Expression)((Expression)children.get(0)).clone(), initExpr is: threadIdx.x-----
1111-----IDExpression vID = new Identifier(variable), vID is: tx-----
1111-----AssignmentExpression vAssign = new AssignmentExpression(vID, AssignmentOperator.NORMAL, initExpr), vAssign is: (tx=threadIdx.x)-----
1111-----ExpressionStatement vStmt = new ExpressionStatement(vAssign), vStmt is: tx=threadIdx.x;-----
1111-----CompoundStatement scope = (CompoundStatement)declStmt.getParent(), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty = threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----enter while loop, declStmt is: int ty = threadIdx.y;-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: int ty = threadIdx.y-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: ty = threadIdx.y-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is:  = threadIdx.y-----
1111-----after variable.setInitializer(null), variable is: ty-----
1111-----vDecl.getSpecifiers().remove(Specifier.CONST), vDecl is: int ty-----
1111-----variable.getSpecifiers().remove(Specifier.CONST), variable is: ty-----
1111-----List<Traversable> children = vInit.getChildren(), children is: [threadIdx.y]-----
1111-----Expression initExpr = (Expression)((Expression)children.get(0)).clone(), initExpr is: threadIdx.y-----
1111-----IDExpression vID = new Identifier(variable), vID is: ty-----
1111-----AssignmentExpression vAssign = new AssignmentExpression(vID, AssignmentOperator.NORMAL, initExpr), vAssign is: (ty=threadIdx.y)-----
1111-----ExpressionStatement vStmt = new ExpressionStatement(vAssign), vStmt is: ty=threadIdx.y;-----
1111-----CompoundStatement scope = (CompoundStatement)declStmt.getParent(), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----enter while loop, declStmt is: int aBegin = ((wA*16)*by);-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: int aBegin = ((wA*16)*by)-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: aBegin = ((wA*16)*by)-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is:  = ((wA*16)*by)-----
1111-----after variable.setInitializer(null), variable is: aBegin-----
1111-----vDecl.getSpecifiers().remove(Specifier.CONST), vDecl is: int aBegin-----
1111-----variable.getSpecifiers().remove(Specifier.CONST), variable is: aBegin-----
1111-----List<Traversable> children = vInit.getChildren(), children is: [((wA*16)*by)]-----
1111-----Expression initExpr = (Expression)((Expression)children.get(0)).clone(), initExpr is: ((wA*16)*by)-----
1111-----IDExpression vID = new Identifier(variable), vID is: aBegin-----
1111-----AssignmentExpression vAssign = new AssignmentExpression(vID, AssignmentOperator.NORMAL, initExpr), vAssign is: (aBegin=((wA*16)*by))-----
1111-----ExpressionStatement vStmt = new ExpressionStatement(vAssign), vStmt is: aBegin=((wA*16)*by);-----
1111-----CompoundStatement scope = (CompoundStatement)declStmt.getParent(), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----enter while loop, declStmt is: int aEnd = ((aBegin+wA)-1);-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: int aEnd = ((aBegin+wA)-1)-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: aEnd = ((aBegin+wA)-1)-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is:  = ((aBegin+wA)-1)-----
1111-----after variable.setInitializer(null), variable is: aEnd-----
1111-----vDecl.getSpecifiers().remove(Specifier.CONST), vDecl is: int aEnd-----
1111-----variable.getSpecifiers().remove(Specifier.CONST), variable is: aEnd-----
1111-----List<Traversable> children = vInit.getChildren(), children is: [((aBegin+wA)-1)]-----
1111-----Expression initExpr = (Expression)((Expression)children.get(0)).clone(), initExpr is: ((aBegin+wA)-1)-----
1111-----IDExpression vID = new Identifier(variable), vID is: aEnd-----
1111-----AssignmentExpression vAssign = new AssignmentExpression(vID, AssignmentOperator.NORMAL, initExpr), vAssign is: (aEnd=((aBegin+wA)-1))-----
1111-----ExpressionStatement vStmt = new ExpressionStatement(vAssign), vStmt is: aEnd=((aBegin+wA)-1);-----
1111-----CompoundStatement scope = (CompoundStatement)declStmt.getParent(), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----enter while loop, declStmt is: int aStep = 16;-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: int aStep = 16-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: aStep = 16-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is:  = 16-----
1111-----after variable.setInitializer(null), variable is: aStep-----
1111-----vDecl.getSpecifiers().remove(Specifier.CONST), vDecl is: int aStep-----
1111-----variable.getSpecifiers().remove(Specifier.CONST), variable is: aStep-----
1111-----List<Traversable> children = vInit.getChildren(), children is: [16]-----
1111-----Expression initExpr = (Expression)((Expression)children.get(0)).clone(), initExpr is: 16-----
1111-----IDExpression vID = new Identifier(variable), vID is: aStep-----
1111-----AssignmentExpression vAssign = new AssignmentExpression(vID, AssignmentOperator.NORMAL, initExpr), vAssign is: (aStep=16)-----
1111-----ExpressionStatement vStmt = new ExpressionStatement(vAssign), vStmt is: aStep=16;-----
1111-----CompoundStatement scope = (CompoundStatement)declStmt.getParent(), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin = (16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----enter while loop, declStmt is: int bBegin = (16*bx);-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: int bBegin = (16*bx)-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: bBegin = (16*bx)-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is:  = (16*bx)-----
1111-----after variable.setInitializer(null), variable is: bBegin-----
1111-----vDecl.getSpecifiers().remove(Specifier.CONST), vDecl is: int bBegin-----
1111-----variable.getSpecifiers().remove(Specifier.CONST), variable is: bBegin-----
1111-----List<Traversable> children = vInit.getChildren(), children is: [(16*bx)]-----
1111-----Expression initExpr = (Expression)((Expression)children.get(0)).clone(), initExpr is: (16*bx)-----
1111-----IDExpression vID = new Identifier(variable), vID is: bBegin-----
1111-----AssignmentExpression vAssign = new AssignmentExpression(vID, AssignmentOperator.NORMAL, initExpr), vAssign is: (bBegin=(16*bx))-----
1111-----ExpressionStatement vStmt = new ExpressionStatement(vAssign), vStmt is: bBegin=(16*bx);-----
1111-----CompoundStatement scope = (CompoundStatement)declStmt.getParent(), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep = (16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----enter while loop, declStmt is: int bStep = (16*wB);-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: int bStep = (16*wB)-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: bStep = (16*wB)-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is:  = (16*wB)-----
1111-----after variable.setInitializer(null), variable is: bStep-----
1111-----vDecl.getSpecifiers().remove(Specifier.CONST), vDecl is: int bStep-----
1111-----variable.getSpecifiers().remove(Specifier.CONST), variable is: bStep-----
1111-----List<Traversable> children = vInit.getChildren(), children is: [(16*wB)]-----
1111-----Expression initExpr = (Expression)((Expression)children.get(0)).clone(), initExpr is: (16*wB)-----
1111-----IDExpression vID = new Identifier(variable), vID is: bStep-----
1111-----AssignmentExpression vAssign = new AssignmentExpression(vID, AssignmentOperator.NORMAL, initExpr), vAssign is: (bStep=(16*wB))-----
1111-----ExpressionStatement vStmt = new ExpressionStatement(vAssign), vStmt is: bStep=(16*wB);-----
1111-----CompoundStatement scope = (CompoundStatement)declStmt.getParent(), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub = 0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----enter while loop, declStmt is: DATATYPE Csub = 0;-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: DATATYPE Csub = 0-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: Csub = 0-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is:  = 0-----
1111-----after variable.setInitializer(null), variable is: Csub-----
1111-----vDecl.getSpecifiers().remove(Specifier.CONST), vDecl is: DATATYPE Csub-----
1111-----variable.getSpecifiers().remove(Specifier.CONST), variable is: Csub-----
1111-----List<Traversable> children = vInit.getChildren(), children is: [0]-----
1111-----Expression initExpr = (Expression)((Expression)children.get(0)).clone(), initExpr is: 0-----
1111-----IDExpression vID = new Identifier(variable), vID is: Csub-----
1111-----AssignmentExpression vAssign = new AssignmentExpression(vID, AssignmentOperator.NORMAL, initExpr), vAssign is: (Csub=0)-----
1111-----ExpressionStatement vStmt = new ExpressionStatement(vAssign), vStmt is: Csub=0;-----
1111-----CompoundStatement scope = (CompoundStatement)declStmt.getParent(), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a = 0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----enter while loop, declStmt is: int a = 0;-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: int a = 0-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: a = 0-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is:  = 0-----
1111-----after variable.setInitializer(null), variable is: a-----
1111-----vDecl.getSpecifiers().remove(Specifier.CONST), vDecl is: int a-----
1111-----variable.getSpecifiers().remove(Specifier.CONST), variable is: a-----
1111-----List<Traversable> children = vInit.getChildren(), children is: [0]-----
1111-----Expression initExpr = (Expression)((Expression)children.get(0)).clone(), initExpr is: 0-----
1111-----IDExpression vID = new Identifier(variable), vID is: a-----
1111-----AssignmentExpression vAssign = new AssignmentExpression(vID, AssignmentOperator.NORMAL, initExpr), vAssign is: (a=0)-----
1111-----ExpressionStatement vStmt = new ExpressionStatement(vAssign), vStmt is: a=0;-----
1111-----CompoundStatement scope = (CompoundStatement)declStmt.getParent(), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b = 0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----enter while loop, declStmt is: int b = 0;-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: int b = 0-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: b = 0-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is:  = 0-----
1111-----after variable.setInitializer(null), variable is: b-----
1111-----vDecl.getSpecifiers().remove(Specifier.CONST), vDecl is: int b-----
1111-----variable.getSpecifiers().remove(Specifier.CONST), variable is: b-----
1111-----List<Traversable> children = vInit.getChildren(), children is: [0]-----
1111-----Expression initExpr = (Expression)((Expression)children.get(0)).clone(), initExpr is: 0-----
1111-----IDExpression vID = new Identifier(variable), vID is: b-----
1111-----AssignmentExpression vAssign = new AssignmentExpression(vID, AssignmentOperator.NORMAL, initExpr), vAssign is: (b=0)-----
1111-----ExpressionStatement vStmt = new ExpressionStatement(vAssign), vStmt is: b=0;-----
1111-----CompoundStatement scope = (CompoundStatement)declStmt.getParent(), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
b=0;
int k = 0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----enter while loop, declStmt is: int k = 0;-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: int k = 0-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: k = 0-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is:  = 0-----
1111-----after variable.setInitializer(null), variable is: k-----
1111-----vDecl.getSpecifiers().remove(Specifier.CONST), vDecl is: int k-----
1111-----variable.getSpecifiers().remove(Specifier.CONST), variable is: k-----
1111-----List<Traversable> children = vInit.getChildren(), children is: [0]-----
1111-----Expression initExpr = (Expression)((Expression)children.get(0)).clone(), initExpr is: 0-----
1111-----IDExpression vID = new Identifier(variable), vID is: k-----
1111-----AssignmentExpression vAssign = new AssignmentExpression(vID, AssignmentOperator.NORMAL, initExpr), vAssign is: (k=0)-----
1111-----ExpressionStatement vStmt = new ExpressionStatement(vAssign), vStmt is: k=0;-----
1111-----CompoundStatement scope = (CompoundStatement)declStmt.getParent(), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
b=0;
int k;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
b=0;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
1111-----enter while loop, declStmt is: int c;-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: int c-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: c-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is: null-----
1111-----after variable.setInitializer(null), variable is: c-----
222222-----if(vInit == null)
1111-----enter while loop, declStmt is: __shared__ DATATYPE As[16][16];-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: __shared__ DATATYPE As[16][16]-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: As[16][16]-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is: null-----
1111-----after variable.setInitializer(null), variable is: As[16][16]-----
222222-----if(vInit == null)
1111-----enter while loop, declStmt is: __shared__ DATATYPE Bs[16][16];-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: __shared__ DATATYPE Bs[16][16]-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: Bs[16][16]-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is: null-----
1111-----after variable.setInitializer(null), variable is: Bs[16][16]-----
222222-----if(vInit == null)
[SeparateInitializers] end in 0.10 seconds
[LinkSymbol] 75 updates in 0.00 seconds

*** After SeparateInitializers  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
b=0;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}



===========================================
[AnsiDeclarations] begin
00-----List<Traversable> statements = scope.getChildren()
00-----statements is: [;]-----
00-----List<Statement> nonDeclarations = new LinkedList<Statement>()
00-----statements is: [;]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: ;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: ;-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [;]-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: ;-----
222222-----d.detach()
222222-----d is: ;-----
222222-----scope.addStatement(d)
222222-----scope is: {
;
}-----
00-----List<Traversable> statements = scope.getChildren()
00-----statements is: [int bx;, bx=blockIdx.x;, int by;, by=blockIdx.y;, int tx;, tx=threadIdx.x;, int ty;, ty=threadIdx.y;, int aBegin;, aBegin=((wA*16)*by);, int aEnd;, aEnd=((aBegin+wA)-1);, int aStep;, aStep=16;, int bBegin;, bBegin=(16*bx);, int bStep;, bStep=(16*wB);, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true , DATATYPE Csub;, Csub=0;, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false , int a;, a=0;, int b;, b=0;, int k;, k=0;, int c;, for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}, c=(((wB*16)*by)+(16*bx));, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true , C[((c+(wB*ty))+tx)]=Csub;, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false ]-----
00-----List<Statement> nonDeclarations = new LinkedList<Statement>()
00-----statements is: [int bx;, bx=blockIdx.x;, int by;, by=blockIdx.y;, int tx;, tx=threadIdx.x;, int ty;, ty=threadIdx.y;, int aBegin;, aBegin=((wA*16)*by);, int aEnd;, aEnd=((aBegin+wA)-1);, int aStep;, aStep=16;, int bBegin;, bBegin=(16*bx);, int bStep;, bStep=(16*wB);, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true , DATATYPE Csub;, Csub=0;, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false , int a;, a=0;, int b;, b=0;, int k;, k=0;, int c;, for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}, c=(((wB*16)*by)+(16*bx));, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true , C[((c+(wB*ty))+tx)]=Csub;, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false ]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: int bx;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: int bx;-----
222222-----nonDeclarations.add(stmt)
222222-----i is: bx=blockIdx.x;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: bx=blockIdx.x;-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: int by;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: int by;-----
222222-----nonDeclarations.add(stmt)
222222-----i is: by=blockIdx.y;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: by=blockIdx.y;-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: int tx;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: int tx;-----
222222-----nonDeclarations.add(stmt)
222222-----i is: tx=threadIdx.x;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: tx=threadIdx.x;-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: int ty;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: int ty;-----
222222-----nonDeclarations.add(stmt)
222222-----i is: ty=threadIdx.y;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: ty=threadIdx.y;-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: int aBegin;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: int aBegin;-----
222222-----nonDeclarations.add(stmt)
222222-----i is: aBegin=((wA*16)*by);-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: aBegin=((wA*16)*by);-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: int aEnd;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: int aEnd;-----
222222-----nonDeclarations.add(stmt)
222222-----i is: aEnd=((aBegin+wA)-1);-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: aEnd=((aBegin+wA)-1);-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: int aStep;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: int aStep;-----
222222-----nonDeclarations.add(stmt)
222222-----i is: aStep=16;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: aStep=16;-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: int bBegin;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: int bBegin;-----
222222-----nonDeclarations.add(stmt)
222222-----i is: bBegin=(16*bx);-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: bBegin=(16*bx);-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: int bStep;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: int bStep;-----
222222-----nonDeclarations.add(stmt)
222222-----i is: bStep=(16*wB);-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: bStep=(16*wB);-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true -----
1111-----Statement stmt = (Statement)i
1111-----stmt is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true -----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true ]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: DATATYPE Csub;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: DATATYPE Csub;-----
222222-----nonDeclarations.add(stmt)
222222-----i is: Csub=0;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: Csub=0;-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true , Csub=0;]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false -----
1111-----Statement stmt = (Statement)i
1111-----stmt is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false -----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true , Csub=0;, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false ]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: int a;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: int a;-----
222222-----nonDeclarations.add(stmt)
222222-----i is: a=0;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: a=0;-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true , Csub=0;, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false , a=0;]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: int b;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: int b;-----
222222-----nonDeclarations.add(stmt)
222222-----i is: b=0;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: b=0;-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true , Csub=0;, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false , a=0;, b=0;]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: int k;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: int k;-----
222222-----nonDeclarations.add(stmt)
222222-----i is: k=0;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: k=0;-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true , Csub=0;, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false , a=0;, b=0;, k=0;]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: int c;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: int c;-----
222222-----nonDeclarations.add(stmt)
222222-----i is: for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true , Csub=0;, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false , a=0;, b=0;, k=0;, for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: c=(((wB*16)*by)+(16*bx));-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: c=(((wB*16)*by)+(16*bx));-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true , Csub=0;, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false , a=0;, b=0;, k=0;, for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}, c=(((wB*16)*by)+(16*bx));]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true -----
1111-----Statement stmt = (Statement)i
1111-----stmt is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true -----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true , Csub=0;, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false , a=0;, b=0;, k=0;, for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}, c=(((wB*16)*by)+(16*bx));, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true ]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: C[((c+(wB*ty))+tx)]=Csub;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: C[((c+(wB*ty))+tx)]=Csub;-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true , Csub=0;, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false , a=0;, b=0;, k=0;, for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}, c=(((wB*16)*by)+(16*bx));, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true , C[((c+(wB*ty))+tx)]=Csub;]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false -----
1111-----Statement stmt = (Statement)i
1111-----stmt is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false -----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [bx=blockIdx.x;, by=blockIdx.y;, tx=threadIdx.x;, ty=threadIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true , Csub=0;, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false , a=0;, b=0;, k=0;, for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}, c=(((wB*16)*by)+(16*bx));, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true , C[((c+(wB*ty))+tx)]=Csub;, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false ]-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: bx=blockIdx.x;-----
222222-----d.detach()
222222-----d is: bx=blockIdx.x;-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
by=blockIdx.y;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
b=0;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: by=blockIdx.y;-----
222222-----d.detach()
222222-----d is: by=blockIdx.y;-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
tx=threadIdx.x;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
b=0;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: tx=threadIdx.x;-----
222222-----d.detach()
222222-----d is: tx=threadIdx.x;-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
ty=threadIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
b=0;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: ty=threadIdx.y;-----
222222-----d.detach()
222222-----d is: ty=threadIdx.y;-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
b=0;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: aBegin=((wA*16)*by);-----
222222-----d.detach()
222222-----d is: aBegin=((wA*16)*by);-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
b=0;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: aEnd=((aBegin+wA)-1);-----
222222-----d.detach()
222222-----d is: aEnd=((aBegin+wA)-1);-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
b=0;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: aStep=16;-----
222222-----d.detach()
222222-----d is: aStep=16;-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
b=0;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: bBegin=(16*bx);-----
222222-----d.detach()
222222-----d is: bBegin=(16*bx);-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
b=0;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: bStep=(16*wB);-----
222222-----d.detach()
222222-----d is: bStep=(16*wB);-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
b=0;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true -----
222222-----d.detach()
222222-----d is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true -----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
b=0;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: Csub=0;-----
222222-----d.detach()
222222-----d is: Csub=0;-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
int a;
a=0;
int b;
b=0;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false -----
222222-----d.detach()
222222-----d is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false -----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
a=0;
int b;
b=0;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: a=0;-----
222222-----d.detach()
222222-----d is: a=0;-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
b=0;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: b=0;-----
222222-----d.detach()
222222-----d is: b=0;-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
k=0;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
b=0;
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: k=0;-----
222222-----d.detach()
222222-----d is: k=0;-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
int c;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
b=0;
k=0;
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}-----
222222-----d.detach()
222222-----d is: for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
int c;
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: c=(((wB*16)*by)+(16*bx));-----
222222-----d.detach()
222222-----d is: c=(((wB*16)*by)+(16*bx));-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
int c;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true -----
222222-----d.detach()
222222-----d is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true -----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
int c;
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: C[((c+(wB*ty))+tx)]=Csub;-----
222222-----d.detach()
222222-----d is: C[((c+(wB*ty))+tx)]=Csub;-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
int c;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false -----
222222-----d.detach()
222222-----d is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false -----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
int c;
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}-----
00-----List<Traversable> statements = scope.getChildren()
00-----statements is: [__shared__ DATATYPE As[16][16];, __shared__ DATATYPE Bs[16][16];, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true , As[ty][tx]=A[((a+(wA*ty))+tx)];, Bs[ty][tx]=B[((b+(wB*ty))+tx)];, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false , __syncthreads();, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true , {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false , __syncthreads();]-----
00-----List<Statement> nonDeclarations = new LinkedList<Statement>()
00-----statements is: [__shared__ DATATYPE As[16][16];, __shared__ DATATYPE Bs[16][16];, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true , As[ty][tx]=A[((a+(wA*ty))+tx)];, Bs[ty][tx]=B[((b+(wB*ty))+tx)];, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false , __syncthreads();, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true , {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false , __syncthreads();]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: __shared__ DATATYPE As[16][16];-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: __shared__ DATATYPE As[16][16];-----
222222-----nonDeclarations.add(stmt)
222222-----i is: __shared__ DATATYPE Bs[16][16];-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: __shared__ DATATYPE Bs[16][16];-----
222222-----nonDeclarations.add(stmt)
222222-----i is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true -----
1111-----Statement stmt = (Statement)i
1111-----stmt is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true -----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true ]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: As[ty][tx]=A[((a+(wA*ty))+tx)];-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: As[ty][tx]=A[((a+(wA*ty))+tx)];-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true , As[ty][tx]=A[((a+(wA*ty))+tx)];]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: Bs[ty][tx]=B[((b+(wB*ty))+tx)];-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: Bs[ty][tx]=B[((b+(wB*ty))+tx)];-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true , As[ty][tx]=A[((a+(wA*ty))+tx)];, Bs[ty][tx]=B[((b+(wB*ty))+tx)];]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false -----
1111-----Statement stmt = (Statement)i
1111-----stmt is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false -----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true , As[ty][tx]=A[((a+(wA*ty))+tx)];, Bs[ty][tx]=B[((b+(wB*ty))+tx)];, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false ]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: __syncthreads();-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: __syncthreads();-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true , As[ty][tx]=A[((a+(wA*ty))+tx)];, Bs[ty][tx]=B[((b+(wB*ty))+tx)];, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false , __syncthreads();]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true -----
1111-----Statement stmt = (Statement)i
1111-----stmt is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true -----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true , As[ty][tx]=A[((a+(wA*ty))+tx)];, Bs[ty][tx]=B[((b+(wB*ty))+tx)];, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false , __syncthreads();, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true ]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true , As[ty][tx]=A[((a+(wA*ty))+tx)];, Bs[ty][tx]=B[((b+(wB*ty))+tx)];, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false , __syncthreads();, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true , {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false -----
1111-----Statement stmt = (Statement)i
1111-----stmt is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false -----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true , As[ty][tx]=A[((a+(wA*ty))+tx)];, Bs[ty][tx]=B[((b+(wB*ty))+tx)];, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false , __syncthreads();, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true , {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false ]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: __syncthreads();-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: __syncthreads();-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true , As[ty][tx]=A[((a+(wA*ty))+tx)];, Bs[ty][tx]=B[((b+(wB*ty))+tx)];, #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false , __syncthreads();, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true , {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}, #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false , __syncthreads();]-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true -----
222222-----d.detach()
222222-----d is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true -----
222222-----scope.addStatement(d)
222222-----scope is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: As[ty][tx]=A[((a+(wA*ty))+tx)];-----
222222-----d.detach()
222222-----d is: As[ty][tx]=A[((a+(wA*ty))+tx)];-----
222222-----scope.addStatement(d)
222222-----scope is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: Bs[ty][tx]=B[((b+(wB*ty))+tx)];-----
222222-----d.detach()
222222-----d is: Bs[ty][tx]=B[((b+(wB*ty))+tx)];-----
222222-----scope.addStatement(d)
222222-----scope is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false -----
222222-----d.detach()
222222-----d is: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false -----
222222-----scope.addStatement(d)
222222-----scope is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: __syncthreads();-----
222222-----d.detach()
222222-----d is: __syncthreads();-----
222222-----scope.addStatement(d)
222222-----scope is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true -----
222222-----d.detach()
222222-----d is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true -----
222222-----scope.addStatement(d)
222222-----scope is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}-----
222222-----d.detach()
222222-----d is: {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}-----
222222-----scope.addStatement(d)
222222-----scope is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false -----
222222-----d.detach()
222222-----d is: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false -----
222222-----scope.addStatement(d)
222222-----scope is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
__syncthreads();
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: __syncthreads();-----
222222-----d.detach()
222222-----d is: __syncthreads();-----
222222-----scope.addStatement(d)
222222-----scope is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}-----
00-----List<Traversable> statements = scope.getChildren()
00-----statements is: [lp1:, for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}]-----
00-----List<Statement> nonDeclarations = new LinkedList<Statement>()
00-----statements is: [lp1:, for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: lp1:-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: lp1:-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [lp1:]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [lp1:, for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}]-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: lp1:-----
222222-----d.detach()
222222-----d is: lp1:-----
222222-----scope.addStatement(d)
222222-----scope is: {
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
lp1:
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}-----
222222-----d.detach()
222222-----d is: for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}-----
222222-----scope.addStatement(d)
222222-----scope is: {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}-----
00-----List<Traversable> statements = scope.getChildren()
00-----statements is: [Csub+=(As[ty][k]*Bs[k][tx]);]-----
00-----List<Statement> nonDeclarations = new LinkedList<Statement>()
00-----statements is: [Csub+=(As[ty][k]*Bs[k][tx]);]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: Csub+=(As[ty][k]*Bs[k][tx]);-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: Csub+=(As[ty][k]*Bs[k][tx]);-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [Csub+=(As[ty][k]*Bs[k][tx]);]-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: Csub+=(As[ty][k]*Bs[k][tx]);-----
222222-----d.detach()
222222-----d is: Csub+=(As[ty][k]*Bs[k][tx]);-----
222222-----scope.addStatement(d)
222222-----scope is: {
Csub+=(As[ty][k]*Bs[k][tx]);
}-----
[AnsiDeclarations] end in 0.08 seconds
[LinkSymbol] 75 updates in 0.00 seconds

*** After AnsiDeclarations  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
int c;
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}



===========================================
[StreamInsertion-FCUDA] begin
[StreamInsertion-FCUDA] examining procedure matrixMul
[StreamInsertion-FCUDA] end in 0.03 seconds
[LinkSymbol] 75 updates in 0.00 seconds

*** After StreamInsertion ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
int c;
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
}



===========================================
[CreateTaskRegions-FCUDA] begin
[CreateTaskRegions-FCUDA] examining procedure matrixMul
001
002
003---------------------------------------------------------------------------------------------------------------------------------------------------
----Collect global-memory arrays/pointers symbols (includes __constant__ symbols): glMemArraySet = GlobalMemUtils.getGlobMemSymbols(mProcedure)-------
------------------------------------------------------------------------------------------------------------------------------------------------------
----[* A, * B, * C]----
Global-Mem Arrays: [* A, * B, * C]
PointerSet: [* A, * B, * C]
findGMrefs for: A
findGMrefs for: B
findGMrefs for: C
AliasSet: []
derefAccs: []
004---------------------------------------------------------------------------------------------------------------------------------------------------
----Convert dereference-based global-mem accesses to array-accesses and find global-mem aliases: identifyGlMemAccs();-------
------------------------------------------------------------------------------------------------------------------------------------------------------
getMixdStmts Symbols: [* A, * B, * C]
getMixdStmts Global Symbols: [* A, * B, * C]
getMixdStmts Alias Symbols: []
symUses: [A]
Contained GM Ref: A[((a+(wA*ty))+tx)]
Candidate MIXED stmt: As[ty][tx]=A[((a+(wA*ty))+tx)];
symUses: [B]
Contained GM Ref: B[((b+(wB*ty))+tx)]
Candidate MIXED stmt: Bs[ty][tx]=B[((b+(wB*ty))+tx)];
symUses: [C]
Contained GM Ref: C[((c+(wB*ty))+tx)]
Candidate MIXED stmt: C[((c+(wB*ty))+tx)]=Csub;
mixdStmts: []
005---------------------------------------------------------------------------------------------------------------------------------------------------
----Eliminate MIXED statements (i.e. statements that contain both COMPUTE & TRANSFER parts): handleMixStmts();-------
------------------------------------------------------------------------------------------------------------------------------------------------------
00a
----000a----
----000b----
0000 Perform Alias Analysis 0
00000000   IPAnalysis 1
00000000   IPAnalysis 2
[NormalizeReturn] begin
*AP* procedure: __syncthreads
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul
*AP* is_void=true
*AP* ret_expr= null
[NormalizeReturn] end in 0.00 seconds
[LinkSymbol] 75 updates in 0.00 seconds
[IPA] Stops due to no flow entry
000000   IPpointsToAnalysis 1
000000   IPpointsToAnalysis 2
000000   IPpointsToAnalysis 3
0000 Perform Alias Analysis 1
0000IPpointsToAnalysis
[IPA:PointsTo] Stops due to no flow entry
0000 Perform Alias Analysis 2
----000c----
----000d----
----------------------------------------------
----start to generate CF graph with thread----
----------------------------------------------
proc now is: void __syncthreads()
{
;
return ;
}
=====
proc now is: #pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
int c;
bx=blockIdx.x;
by=blockIdx.y;
tx=threadIdx.x;
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
return ;
}
=====
----000e----
--------------------------------------------------------
----start to generate generate Program Summary Graph----
--------------------------------------------------------
############### PSG Summary Detail[__syncthreads()] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  psg_entry_ref is null
  # Global Info (psg_entry_global, UseOutSet)
  psg_entry_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  psg_exit_ref is null
  # Global Info (psg_exit_global, DefInSet)
  psg_exit_global is null
############### PSG Summary Detail[matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  # Global Info (psg_entry_global, UseOutSet)
## Call Node ## IR: __syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: __syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Call Node ## IR: __syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: __syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: C, NODE: C[((c+(wB*ty))+tx)]=Csub;
  -DEF: B, NODE: * B
  -DEF: A, NODE: * A
  # Global Info (psg_exit_global, DefInSet)
############### PSG Propagated Detail[__syncthreads()] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  psg_entry_ref is null
  # Global Info (psg_entry_global)
  psg_entry_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref)
  psg_exit_ref is null
  # Global Info (psg_exit_global)
  psg_exit_global is null
############### PSG Propagated Detail[matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  # parameter: C
  # parameter: B
  # parameter: A
  # Global Info (psg_entry_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Call Node ## IR: __syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: __syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Call Node ## IR: __syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: __syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref)
  -OUTdef: C, NODE: C[((c+(wB*ty))+tx)]=Csub;
  -OUTdef: B, NODE: * B
  -OUTdef: A, NODE: * A
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
----000f----
----000g----
----000h----
00b
006
Instances of tidx: [threadIdx, threadIdx]
defIDs: [tx, ty]
Looking for uses of: tx
... in: C[((c+(wB*ty))+tx)]=Csub;
... useID: tx
... in: Csub+=(As[ty][k]*Bs[k][tx]);
... useID: tx
... in: Bs[ty][tx]=B[((b+(wB*ty))+tx)];
... useID: tx
... useID: tx
... in: #pragma fcuda stmt tdep_vars=[tx] 
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
... in: As[ty][tx]=A[((a+(wA*ty))+tx)];
... useID: tx
... useID: tx
... in: #pragma fcuda stmt tdep_vars=[tx] 
As[ty][tx]=A[((a+(wA*ty))+tx)];
Looking for uses of: ty
... in: #pragma fcuda stmt tdep_vars=[tx] 
C[((c+(wB*ty))+tx)]=Csub;
... useID: ty
... in: #pragma fcuda stmt tdep_vars=[tx] 
Csub+=(As[ty][k]*Bs[k][tx]);
... useID: ty
... in: #pragma fcuda stmt tdep_vars=[tx] 
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
... useID: ty
... useID: ty
... in: #pragma fcuda stmt tdep_vars=[ty, tx] 
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
... in: #pragma fcuda stmt tdep_vars=[tx] 
As[ty][tx]=A[((a+(wA*ty))+tx)];
... useID: ty
... useID: ty
... in: #pragma fcuda stmt tdep_vars=[ty, tx] 
As[ty][tx]=A[((a+(wA*ty))+tx)];
defIDs: [C, Csub, Bs, Bs, As, As, C, Csub, Bs, Bs, As, As]
Looking for uses of: C
Looking for uses of: Csub
... in: #pragma fcuda stmt tdep_vars=[ty, tx] 
C[((c+(wB*ty))+tx)]=Csub;
... useID: Csub
... in: #pragma fcuda stmt tdep_vars=[ty, tx] 
Csub+=(As[ty][k]*Bs[k][tx]);
... useID: Csub
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Csub] 
Csub+=(As[ty][k]*Bs[k][tx]);
... useID: Bs
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Bs, Csub] 
Csub+=(As[ty][k]*Bs[k][tx]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Bs, Csub] 
Csub+=(As[ty][k]*Bs[k][tx]);
... useID: As
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Bs, As, Csub] 
Csub+=(As[ty][k]*Bs[k][tx]);
Looking for uses of: C
Looking for uses of: Csub
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Csub] 
C[((c+(wB*ty))+tx)]=Csub;
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Bs, As, Csub] 
Csub+=(As[ty][k]*Bs[k][tx]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Bs, As, Csub] 
Csub+=(As[ty][k]*Bs[k][tx]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Bs, As, Csub] 
Csub+=(As[ty][k]*Bs[k][tx]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Bs, As, Csub] 
Csub+=(As[ty][k]*Bs[k][tx]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Bs, As, Csub] 
Csub+=(As[ty][k]*Bs[k][tx]);
defIDs: [C, Csub, Csub, Csub]
Looking for uses of: C
Looking for uses of: Csub
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Csub] 
C[((c+(wB*ty))+tx)]=Csub;
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Bs, As, Csub] 
Csub+=(As[ty][k]*Bs[k][tx]);
Looking for uses of: Csub
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Csub] 
C[((c+(wB*ty))+tx)]=Csub;
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Bs, As, Csub] 
Csub+=(As[ty][k]*Bs[k][tx]);
Looking for uses of: Csub
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Csub] 
C[((c+(wB*ty))+tx)]=Csub;
... in: #pragma fcuda stmt tdep_vars=[ty, tx, Bs, As, Csub] 
Csub+=(As[ty][k]*Bs[k][tx]);
007
findTransferStmts Symbols: [* A, * B, * C]
findTransferStmts non-Const Symbols: [* A, * B, * C]
findTransferStmts for: A
findTransferStmts for: B
findTransferStmts for: C
INFO - findTransferStmts:  12 address index IDs
INFO - findTransferStmts: 2 defStmts for addrID: a
WARNING - findTransferStmts: Definition of class: class cetus.hir.CommaExpression
          ((a+=aStep), (b+=bStep))
INFO - findTransferStmts: Corner case forloop definition: ((a=aBegin), (b=bBegin));
INFO - findTransferStmts: 1 defStmts for addrID: wA
WARNING - findTransferStmts: Definition of class: class cetus.hir.VariableDeclarator
          wA
INFO - findTransferStmts: 1 defStmts for addrID: ty
INFO - findTransferStmts: 1 defStmts for addrID: tx
INFO - findTransferStmts: 2 defStmts for addrID: b
WARNING - findTransferStmts: Definition of class: class cetus.hir.CommaExpression
          ((a+=aStep), (b+=bStep))
INFO - findTransferStmts: Corner case forloop definition: ((a=aBegin), (b=bBegin));
INFO - findTransferStmts: 1 defStmts for addrID: wB
WARNING - findTransferStmts: Definition of class: class cetus.hir.VariableDeclarator
          wB
INFO - findTransferStmts: 1 defStmts for addrID: ty
INFO - findTransferStmts: 1 defStmts for addrID: tx
INFO - findTransferStmts: 1 defStmts for addrID: c
INFO - findTransferStmts: 1 defStmts for addrID: wB
WARNING - findTransferStmts: Definition of class: class cetus.hir.VariableDeclarator
          wB
INFO - findTransferStmts: 1 defStmts for addrID: ty
INFO - findTransferStmts: 1 defStmts for addrID: tx
008
009_finish
[CreateTaskRegions-FCUDA] end in 0.51 seconds
[LinkSymbol] 75 updates in 0.00 seconds

*** After CreateTaskRegions  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
int c;
bx=blockIdx.x;
by=blockIdx.y;
#pragma fcuda stmt tdep=true name=CMP_0 CMPtask=true seqID=0 ADRtask=true 
tx=threadIdx.x;
#pragma fcuda stmt tdep=true name=CMP_0 CMPtask=true seqID=0 ADRtask=true 
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true name=TRN_1 tdep_vars=[ty, tx] seqID=1 TRNtask=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true name=TRN_1 tdep_vars=[ty, tx] seqID=1 TRNtask=true 
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
#pragma fcuda stmt tdep=true name=SNC_2 seqID=2 SNCtask=true 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt tdep=true name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
#pragma fcuda stmt tdep=true name=SNC_4 seqID=4 SNCtask=true 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true name=TRN_5 tdep_vars=[ty, tx, Csub] seqID=5 TRNtask=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
return ;
}



===========================================
[UniformCFstructs-FCUDA] begin
[UniformCFstructs-FCUDA] examining procedure matrixMul


HTG PRINT-OUT

	 ====================
	| Graph: matrixMul  L1
		 |
		 V
	 --------------------
	| CMP_0
	|  type: CMP
	|  Addr-Use: true
	 --------------------
		 |
		 V
	 --------------------
	| FOR_HTG_TRN_1
	|  type: FOR
	|  tdep: false
	 --------------------

		 ====================
		| Graph: HTG_TRN_1  L2
			 |
			 V
		 --------------------
		| TRN_1
		|  ParentNode: FOR_HTG_TRN_1
		|  type: TRN
		 --------------------
			 |
			 V
		 --------------------
		| SNC_2
		|  ParentNode: FOR_HTG_TRN_1
		|  type: SNC
		 --------------------
			 |
			 V
		 --------------------
		| FOR_HTG_CMP_3
		|  ParentNode: FOR_HTG_TRN_1
		|  type: FOR
		|  tdep: false
		 --------------------

			 ====================
			| Graph: HTG_CMP_3  L3
				 |
				 V
			 --------------------
			| CMP_3
			|  ParentNode: FOR_HTG_CMP_3
			|  type: CMP
			|  Addr-Use: false
			 --------------------
			\===== HTG_CMP_3 =====/

			 |
			 V
		 --------------------
		| SNC_4
		|  ParentNode: FOR_HTG_TRN_1
		|  type: SNC
		 --------------------
		\===== HTG_TRN_1 =====/

		 |
		 V
	 --------------------
	| TRN_5
	|  type: TRN
	 --------------------
	\===== matrixMul =====/

[UniformCFstructs-FCUDA] end in 0.02 seconds
[LinkSymbol] 75 updates in 0.00 seconds

*** After UniformCFstructs  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
int c;
bx=blockIdx.x;
by=blockIdx.y;
#pragma fcuda stmt tdep=true name=CMP_0 CMPtask=true seqID=0 ADRtask=true HTGNode=CMP_0 
tx=threadIdx.x;
#pragma fcuda stmt tdep=true name=CMP_0 CMPtask=true seqID=0 ADRtask=true HTGNode=CMP_0 
ty=threadIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_1 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
#pragma fcuda stmt tdep=true name=SNC_2 seqID=2 SNCtask=true HTGNode=SNC_2 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_3 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt tdep=true name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);
}
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
#pragma fcuda stmt tdep=true name=SNC_4 seqID=4 SNCtask=true HTGNode=SNC_4 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true name=TRN_5 tdep_vars=[ty, tx, Csub] seqID=5 HTGNode=TRN_5 TRNtask=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
return ;
}



===========================================
[AnnotateTasks-FCUDA] begin
[AnnotateTasks-FCUDA] examining procedure matrixMul


PRINT-GRAPH OUTPUT

	 ====================
	| Graph: matrixMul  L1
		 |
		 V
	 --------------------
	| CMP_0
	|  type: CMP
	|  Addr-Use: true
	 --------------------
		 |
		 V
	 --------------------
	| FOR_HTG_TRN_1
	|  type: FOR
	|  tdep: false
	 --------------------

		 ====================
		| Graph: HTG_TRN_1  L2
			 |
			 V
		 --------------------
		| TRN_1
		|  ParentNode: FOR_HTG_TRN_1
		|  type: TRN
		 --------------------
			 |
			 V
		 --------------------
		| SNC_2
		|  ParentNode: FOR_HTG_TRN_1
		|  type: SNC
		 --------------------
			 |
			 V
		 --------------------
		| FOR_HTG_CMP_3
		|  ParentNode: FOR_HTG_TRN_1
		|  type: FOR
		|  tdep: false
		 --------------------

			 ====================
			| Graph: HTG_CMP_3  L3
				 |
				 V
			 --------------------
			| CMP_3
			|  ParentNode: FOR_HTG_CMP_3
			|  type: CMP
			|  Addr-Use: false
			 --------------------
			\===== HTG_CMP_3 =====/

			 |
			 V
		 --------------------
		| SNC_4
		|  ParentNode: FOR_HTG_TRN_1
		|  type: SNC
		 --------------------
		\===== HTG_TRN_1 =====/

		 |
		 V
	 --------------------
	| TRN_5
	|  type: TRN
	 --------------------
	\===== matrixMul =====/

*** CF Node Info Begin ***
FOR_HTG_TRN_1 info:
     - uniform: false     - SubTypes: [TRN, SNC, CMP]
*** CF Node Info End ***
*** Number of Tasks in matrixMul :4
---- Target: CMP_0 ----
    nodes #: 1
       CMP_0
       Node Types: [CMP]
       uniform: true

 **** TLOOPS(1) ****
 TLOOP 0
---- Target: CMP_0 ----
    nodes #: 1
       CMP_0
       Node Types: [CMP]
       uniform: true



---- Target: TRN_1 ----
    nodes #: 1
       TRN_1
       Node Types: [TRN]
       uniform: true

 **** TLOOPS(1) ****
 TLOOP 0
---- Target: TRN_1 ----
    nodes #: 1
       TRN_1
       Node Types: [TRN]
       uniform: true



---- Target: SNC_2 ----
    nodes #: 3
       SNC_2
       FOR_HTG_CMP_3
       SNC_4
       Node Types: [SNC, CMP]
       uniform: true

 **** TLOOPS(1) ****
 TLOOP 0
---- Target: FOR_HTG_CMP_3 ----
    nodes #: 1
       FOR_HTG_CMP_3
       Node Types: [CMP]
       uniform: true



---- Target: TRN_5 ----
    nodes #: 1
       TRN_5
       Node Types: [TRN]
       uniform: true

 **** TLOOPS(1) ****
 TLOOP 0
---- Target: TRN_5 ----
    nodes #: 1
       TRN_5
       Node Types: [TRN]
       uniform: true



[AnnotateTasks-FCUDA] end in 0.01 seconds
[LinkSymbol] 75 updates in 0.00 seconds

*** After AnnotateTasks  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
int c;
bx=blockIdx.x;
by=blockIdx.y;
#pragma fcuda compute name=CMP_0 cores=1 end=false begin=true 
#pragma fcuda tloop name=CMP_0 end=false begin=true 
#pragma fcuda stmt tdep=true tlpName=CMP_0 name=CMP_0 CMPtask=true seqID=0 ADRtask=true HTGNode=CMP_0 
tx=threadIdx.x;
#pragma fcuda stmt tdep=true tlpName=CMP_0 name=CMP_0 CMPtask=true seqID=0 ADRtask=true HTGNode=CMP_0 
ty=threadIdx.y;
#pragma fcuda tloop name=CMP_0 end=true begin=false 
#pragma fcuda compute name=CMP_0 cores=1 end=true begin=false 
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_1 
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_1 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
#pragma fcuda transfer name=TRN_1 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_1 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda tloop name=TRN_1 end=true begin=false 
#pragma fcuda transfer name=TRN_1 cores=1 end=true size=[BLOCKDIM_X] begin=false 
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
#pragma fcuda compute name=SNC_2 cores=1 end=false begin=true 
#pragma fcuda stmt tdep=true name=SNC_2 seqID=2 SNCtask=true HTGNode=SNC_2 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
#pragma fcuda tloop name=FOR_HTG_CMP_3 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 HTGNode=FOR_HTG_CMP_3 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_3 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_3 end=true begin=false 
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
#pragma fcuda stmt tdep=true name=SNC_4 seqID=4 SNCtask=true HTGNode=SNC_4 
__syncthreads();
#pragma fcuda compute name=SNC_2 cores=1 end=true begin=false 
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
#pragma fcuda transfer name=TRN_5 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_5 end=false begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_5 name=TRN_5 tdep_vars=[ty, tx, Csub] seqID=5 HTGNode=TRN_5 TRNtask=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda tloop name=TRN_5 end=true begin=false 
#pragma fcuda transfer name=TRN_5 cores=1 end=true size=[BLOCKDIM_X] begin=false 
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
return ;
}



===========================================
[PrivatizeScalars-FCUDA] begin
[PrivatizeScalars-FCUDA] examining procedure matrixMul
00a
----000a----
----000b----
0000 Perform Alias Analysis 0
00000000   IPAnalysis 1
00000000   IPAnalysis 2
[NormalizeReturn] begin
*AP* procedure: __syncthreads
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul
*AP* is_void=true
*AP* ret_expr= null
[NormalizeReturn] end in 0.00 seconds
[LinkSymbol] 75 updates in 0.00 seconds
[IPA] Stops due to no flow entry
000000   IPpointsToAnalysis 1
000000   IPpointsToAnalysis 2
000000   IPpointsToAnalysis 3
0000 Perform Alias Analysis 1
0000IPpointsToAnalysis
[IPA:PointsTo] Stops due to no flow entry
0000 Perform Alias Analysis 2
----000c----
----000d----
----------------------------------------------
----start to generate CF graph with thread----
----------------------------------------------
proc now is: void __syncthreads()
{
;
return ;
}
=====
proc now is: #pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
int c;
bx=blockIdx.x;
by=blockIdx.y;
#pragma fcuda compute name=CMP_0 cores=1 end=false begin=true 
#pragma fcuda tloop name=CMP_0 end=false begin=true 
#pragma fcuda stmt tdep=true tlpName=CMP_0 name=CMP_0 CMPtask=true seqID=0 ADRtask=true HTGNode=CMP_0 
tx=threadIdx.x;
#pragma fcuda stmt tdep=true tlpName=CMP_0 name=CMP_0 CMPtask=true seqID=0 ADRtask=true HTGNode=CMP_0 
ty=threadIdx.y;
#pragma fcuda tloop name=CMP_0 end=true begin=false 
#pragma fcuda compute name=CMP_0 cores=1 end=true begin=false 
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_1 
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_1 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
#pragma fcuda transfer name=TRN_1 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_1 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda tloop name=TRN_1 end=true begin=false 
#pragma fcuda transfer name=TRN_1 cores=1 end=true size=[BLOCKDIM_X] begin=false 
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
#pragma fcuda compute name=SNC_2 cores=1 end=false begin=true 
#pragma fcuda stmt tdep=true name=SNC_2 seqID=2 SNCtask=true HTGNode=SNC_2 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
#pragma fcuda tloop name=FOR_HTG_CMP_3 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 HTGNode=FOR_HTG_CMP_3 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_3 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_3 end=true begin=false 
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
#pragma fcuda stmt tdep=true name=SNC_4 seqID=4 SNCtask=true HTGNode=SNC_4 
__syncthreads();
#pragma fcuda compute name=SNC_2 cores=1 end=true begin=false 
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
#pragma fcuda transfer name=TRN_5 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_5 end=false begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_5 name=TRN_5 tdep_vars=[ty, tx, Csub] seqID=5 HTGNode=TRN_5 TRNtask=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda tloop name=TRN_5 end=true begin=false 
#pragma fcuda transfer name=TRN_5 cores=1 end=true size=[BLOCKDIM_X] begin=false 
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
return ;
}
=====
----000e----
--------------------------------------------------------
----start to generate generate Program Summary Graph----
--------------------------------------------------------
############### PSG Summary Detail[__syncthreads()] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  psg_entry_ref is null
  # Global Info (psg_entry_global, UseOutSet)
  psg_entry_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  psg_exit_ref is null
  # Global Info (psg_exit_global, DefInSet)
  psg_exit_global is null
############### PSG Summary Detail[matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  # Global Info (psg_entry_global, UseOutSet)
## Call Node ## IR: #pragma fcuda stmt tdep=true name=SNC_2 seqID=2 SNCtask=true HTGNode=SNC_2 
__syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt tdep=true name=SNC_2 seqID=2 SNCtask=true HTGNode=SNC_2 
__syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Call Node ## IR: #pragma fcuda stmt tdep=true name=SNC_4 seqID=4 SNCtask=true HTGNode=SNC_4 
__syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt tdep=true name=SNC_4 seqID=4 SNCtask=true HTGNode=SNC_4 
__syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: C, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_5 name=TRN_5 tdep_vars=[ty, tx, Csub] seqID=5 HTGNode=TRN_5 TRNtask=true 
C[((c+(wB*ty))+tx)]=Csub;
  -DEF: B, NODE: * B
  -DEF: A, NODE: * A
  # Global Info (psg_exit_global, DefInSet)
############### PSG Propagated Detail[__syncthreads()] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  psg_entry_ref is null
  # Global Info (psg_entry_global)
  psg_entry_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref)
  psg_exit_ref is null
  # Global Info (psg_exit_global)
  psg_exit_global is null
############### PSG Propagated Detail[matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  # parameter: A
  # parameter: B
  # parameter: C
  # Global Info (psg_entry_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Call Node ## IR: #pragma fcuda stmt tdep=true name=SNC_2 seqID=2 SNCtask=true HTGNode=SNC_2 
__syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt tdep=true name=SNC_2 seqID=2 SNCtask=true HTGNode=SNC_2 
__syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Call Node ## IR: #pragma fcuda stmt tdep=true name=SNC_4 seqID=4 SNCtask=true HTGNode=SNC_4 
__syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt tdep=true name=SNC_4 seqID=4 SNCtask=true HTGNode=SNC_4 
__syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref)
  -OUTdef: C, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_5 name=TRN_5 tdep_vars=[ty, tx, Csub] seqID=5 HTGNode=TRN_5 TRNtask=true 
C[((c+(wB*ty))+tx)]=Csub;
  -OUTdef: B, NODE: * B
  -OUTdef: A, NODE: * A
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
----000f----
----000g----
----000h----
00b
*** bfi: {
int bx;
int by;
int tx;
int ty;
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
int c;
bx=blockIdx.x;
by=blockIdx.y;
#pragma fcuda compute name=CMP_0 cores=1 end=false begin=true 
#pragma fcuda tloop name=CMP_0 end=false begin=true 
#pragma fcuda stmt tdep=true tlpName=CMP_0 name=CMP_0 CMPtask=true seqID=0 ADRtask=true HTGNode=CMP_0 
tx=threadIdx.x;
#pragma fcuda stmt tdep=true tlpName=CMP_0 name=CMP_0 CMPtask=true seqID=0 ADRtask=true HTGNode=CMP_0 
ty=threadIdx.y;
#pragma fcuda tloop name=CMP_0 end=true begin=false 
#pragma fcuda compute name=CMP_0 cores=1 end=true begin=false 
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
Csub=0;
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_1 
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_1 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
#pragma fcuda transfer name=TRN_1 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_1 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda tloop name=TRN_1 end=true begin=false 
#pragma fcuda transfer name=TRN_1 cores=1 end=true size=[BLOCKDIM_X] begin=false 
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
#pragma fcuda compute name=SNC_2 cores=1 end=false begin=true 
#pragma fcuda stmt tdep=true name=SNC_2 seqID=2 SNCtask=true HTGNode=SNC_2 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
#pragma fcuda tloop name=FOR_HTG_CMP_3 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 HTGNode=FOR_HTG_CMP_3 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_3 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_3 end=true begin=false 
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
#pragma fcuda stmt tdep=true name=SNC_4 seqID=4 SNCtask=true HTGNode=SNC_4 
__syncthreads();
#pragma fcuda compute name=SNC_2 cores=1 end=true begin=false 
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
#pragma fcuda transfer name=TRN_5 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_5 end=false begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_5 name=TRN_5 tdep_vars=[ty, tx, Csub] seqID=5 HTGNode=TRN_5 TRNtask=true 
C[((c+(wB*ty))+tx)]=Csub;
#pragma fcuda tloop name=TRN_5 end=true begin=false 
#pragma fcuda transfer name=TRN_5 cores=1 end=true size=[BLOCKDIM_X] begin=false 
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
return ;
}
*** bfi: int bx;
*** bfi: int by;
*** bfi: int tx;
*** bfi: int ty;
*** bfi: int aBegin;
*** bfi: int aEnd;
*** bfi: int aStep;
*** bfi: int bBegin;
*** bfi: int bStep;
*** bfi: DATATYPE Csub;
*** bfi: int a;
*** bfi: int b;
*** bfi: int k;
*** bfi: int c;
*** bfi: bx=blockIdx.x;
*** bfi: by=blockIdx.y;
*** bfi: #pragma fcuda compute name=CMP_0 cores=1 end=false begin=true 
*** bfi: #pragma fcuda tloop name=CMP_0 end=false begin=true 
*** tloop pragma: #pragma fcuda tloop name=CMP_0 end=false begin=true 
*** entering: CMP_0
*** bfi: #pragma fcuda stmt tdep=true tlpName=CMP_0 name=CMP_0 CMPtask=true seqID=0 ADRtask=true HTGNode=CMP_0 
tx=threadIdx.x;
 - defs: [tx]
 - Is DefID:tx candidate?
     - with TRV USE:#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_5 name=TRN_5 tdep_vars=[ty, tx, Csub] seqID=5 HTGNode=TRN_5 TRNtask=true 
C[((c+(wB*ty))+tx)]=Csub;
 - Candidate defId: tx
*** bfi: #pragma fcuda stmt tdep=true tlpName=CMP_0 name=CMP_0 CMPtask=true seqID=0 ADRtask=true HTGNode=CMP_0 
ty=threadIdx.y;
 - defs: [ty]
 - Is DefID:ty candidate?
     - with TRV USE:#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_5 name=TRN_5 tdep_vars=[ty, tx, Csub] seqID=5 HTGNode=TRN_5 TRNtask=true 
C[((c+(wB*ty))+tx)]=Csub;
 - Candidate defId: ty
*** bfi: #pragma fcuda tloop name=CMP_0 end=true begin=false 
*** tloop pragma: #pragma fcuda tloop name=CMP_0 end=true begin=false 
*** exiting: CMP_0
*** bfi: #pragma fcuda compute name=CMP_0 cores=1 end=true begin=false 
*** bfi: aBegin=((wA*16)*by);
*** bfi: aEnd=((aBegin+wA)-1);
*** bfi: aStep=16;
*** bfi: bBegin=(16*bx);
*** bfi: bStep=(16*wB);
*** bfi: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=false unroll=1 begin=true 
*** bfi: Csub=0;
*** bfi: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_init cores=[1] end=true unroll=1 begin=false 
*** bfi: a=0;
*** bfi: b=0;
*** bfi: k=0;
*** bfi: #pragma fcuda stmt HTGNode=FOR_HTG_TRN_1 
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_1 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
#pragma fcuda transfer name=TRN_1 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_1 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda tloop name=TRN_1 end=true begin=false 
#pragma fcuda transfer name=TRN_1 cores=1 end=true size=[BLOCKDIM_X] begin=false 
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
#pragma fcuda compute name=SNC_2 cores=1 end=false begin=true 
#pragma fcuda stmt tdep=true name=SNC_2 seqID=2 SNCtask=true HTGNode=SNC_2 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
#pragma fcuda tloop name=FOR_HTG_CMP_3 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 HTGNode=FOR_HTG_CMP_3 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_3 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_3 end=true begin=false 
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
#pragma fcuda stmt tdep=true name=SNC_4 seqID=4 SNCtask=true HTGNode=SNC_4 
__syncthreads();
#pragma fcuda compute name=SNC_2 cores=1 end=true begin=false 
}
*** bfi: c=(((wB*16)*by)+(16*bx));
*** bfi: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=false unroll=1 size=[16] begin=true 
*** bfi: #pragma fcuda transfer name=TRN_5 cores=1 end=false size=[BLOCKDIM_X] begin=true 
*** bfi: #pragma fcuda tloop name=TRN_5 end=false begin=true 
*** tloop pragma: #pragma fcuda tloop name=TRN_5 end=false begin=true 
*** entering: TRN_5
*** bfi: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_5 name=TRN_5 tdep_vars=[ty, tx, Csub] seqID=5 HTGNode=TRN_5 TRNtask=true 
C[((c+(wB*ty))+tx)]=Csub;
 - defs: [C[((c+(wB*ty))+tx)]]
 - Is DefID:C candidate?
 - Non-Candidate defId: C
*** bfi: #pragma fcuda tloop name=TRN_5 end=true begin=false 
*** tloop pragma: #pragma fcuda tloop name=TRN_5 end=true begin=false 
*** exiting: TRN_5
*** bfi: #pragma fcuda transfer name=TRN_5 cores=1 end=true size=[BLOCKDIM_X] begin=false 
*** bfi: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[1] name=write pointer=[C] type=burst cores=[1] end=true unroll=1 size=[16] begin=false 
*** bfi: return ;
*** bfi: ((a=aBegin), (b=bBegin));
*** bfi: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
#pragma fcuda transfer name=TRN_1 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_1 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
#pragma fcuda tloop name=TRN_1 end=true begin=false 
#pragma fcuda transfer name=TRN_1 cores=1 end=true size=[BLOCKDIM_X] begin=false 
#pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
#pragma fcuda compute name=SNC_2 cores=1 end=false begin=true 
#pragma fcuda stmt tdep=true name=SNC_2 seqID=2 SNCtask=true HTGNode=SNC_2 
__syncthreads();
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
{
lp1:
#pragma fcuda tloop name=FOR_HTG_CMP_3 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 HTGNode=FOR_HTG_CMP_3 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_3 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_3 end=true begin=false 
}
#pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
#pragma fcuda stmt tdep=true name=SNC_4 seqID=4 SNCtask=true HTGNode=SNC_4 
__syncthreads();
#pragma fcuda compute name=SNC_2 cores=1 end=true begin=false 
}
*** bfi: __shared__ DATATYPE As[16][16];
*** bfi: __shared__ DATATYPE Bs[16][16];
*** bfi: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=false unroll=1 size=[16|16] begin=true 
*** bfi: #pragma fcuda transfer name=TRN_1 cores=1 end=false size=[BLOCKDIM_X] begin=true 
*** bfi: #pragma fcuda tloop name=TRN_1 end=false begin=true 
*** tloop pragma: #pragma fcuda tloop name=TRN_1 end=false begin=true 
*** entering: TRN_1
*** bfi: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];
 - defs: [As[ty][tx]]
 - Is DefID:As candidate?
 - Non-Candidate defId: As
*** bfi: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
Bs[ty][tx]=B[((b+(wB*ty))+tx)];
 - defs: [Bs[ty][tx]]
 - Is DefID:Bs candidate?
 - Non-Candidate defId: Bs
*** bfi: #pragma fcuda tloop name=TRN_1 end=true begin=false 
*** tloop pragma: #pragma fcuda tloop name=TRN_1 end=true begin=false 
*** exiting: TRN_1
*** bfi: #pragma fcuda transfer name=TRN_1 cores=1 end=true size=[BLOCKDIM_X] begin=false 
*** bfi: #pragma fcuda transfer array_split=[Csub_block|As] mpart=1 dir=[0|0] name=fetch pointer=[A|B] type=burst cores=[1] end=true unroll=1 size=[16|16] begin=false 
*** bfi: #pragma fcuda compute name=SNC_2 cores=1 end=false begin=true 
*** bfi: #pragma fcuda stmt tdep=true name=SNC_2 seqID=2 SNCtask=true HTGNode=SNC_2 
__syncthreads();
*** bfi: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=false unroll=1 begin=true 
*** bfi: {
lp1:
#pragma fcuda tloop name=FOR_HTG_CMP_3 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 HTGNode=FOR_HTG_CMP_3 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_3 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_3 end=true begin=false 
}
*** bfi: #pragma fcuda compute array_split=[Csub_block|As] mpart=1 name=vec_blk cores=[1] end=true unroll=1 begin=false 
*** bfi: #pragma fcuda stmt tdep=true name=SNC_4 seqID=4 SNCtask=true HTGNode=SNC_4 
__syncthreads();
*** bfi: #pragma fcuda compute name=SNC_2 cores=1 end=true begin=false 
*** bfi: lp1:
*** bfi: #pragma fcuda tloop name=FOR_HTG_CMP_3 end=false begin=true 
*** tloop pragma: #pragma fcuda tloop name=FOR_HTG_CMP_3 end=false begin=true 
*** entering: FOR_HTG_CMP_3
*** bfi: #pragma fcuda stmt tlpName=FOR_HTG_CMP_3 HTGNode=FOR_HTG_CMP_3 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_3 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);
}
 - defs: [k, k, Csub]
 - Is DefID:k candidate?
     - with TRV USE: ++ k
     - with TRV USE:#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);
     - with TRV USE:#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);
     - with TRV USE:k<16
 - Non-Candidate defId: k
 - Is DefID:k candidate?
     - with TRV USE: ++ k
     - with TRV USE:#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);
     - with TRV USE:#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);
     - with TRV USE:k<16
 - Non-Candidate defId: k
 - Is DefID:Csub candidate?
     - with TRV USE:#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_5 name=TRN_5 tdep_vars=[ty, tx, Csub] seqID=5 HTGNode=TRN_5 TRNtask=true 
C[((c+(wB*ty))+tx)]=Csub;
 - Candidate defId: Csub
*** bfi: #pragma fcuda tloop name=FOR_HTG_CMP_3 end=true begin=false 
*** tloop pragma: #pragma fcuda tloop name=FOR_HTG_CMP_3 end=true begin=false 
*** exiting: FOR_HTG_CMP_3
*** bfi: #pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
k=0;
*** bfi: #pragma fcuda stmt tlpName=FOR_HTG_CMP_3 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);
}
*** bfi: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);
Privatization candidates for matrixMul: [tx, ty, Csub]
 - Privatizing SymTarget:
---- Symbol: Csub ----
 ***   mDefUses: 
{1125037394=[405519671, 1006590326], 625795457=[405519671, 1006590326]}
 ***   Candidate Defs: 1  [1125037394]
 - 1125037394 : #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);
 ***   non-Candidate Defs: 1
 - 625795457 : Csub=0;
 ***   Symbol Uses: 
[#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_5 name=TRN_5 tdep_vars=[ty, tx, Csub] seqID=5 HTGNode=TRN_5 TRNtask=true 
C[((c+(wB*ty))+tx)]=Csub;, #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub+=(As[ty][k]*Bs[k][tx]);]
  *** Using clone for tIdx.y ***
  *** Using clone for tIdx.x ***
Replaced 1 candidate defs
Replaced 2 candidate uses
Replaced 1 non-candidate defs with cand uses
Replaced 0 non-candidate uses
 - Privatizing SymTarget:
---- Symbol: tx ----
 ***   mDefUses: 
{1269051511=[405519671, 1006590326, 1483514863, 1149160771]}
 ***   Candidate Defs: 1  [1269051511]
 - 1269051511 : #pragma fcuda stmt tdep=true tlpName=CMP_0 name=CMP_0 CMPtask=true seqID=0 ADRtask=true HTGNode=CMP_0 
tx=threadIdx.x;
 ***   non-Candidate Defs: 0
 ***   Symbol Uses: 
[#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_5 name=TRN_5 tdep_vars=[ty, tx, Csub] seqID=5 HTGNode=TRN_5 TRNtask=true 
C[((c+(wB*ty))+tx)]=Csub_block[threadIdx.y][threadIdx.x];, #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty][k]*Bs[k][tx]);, #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
Bs[ty][tx]=B[((b+(wB*ty))+tx)];, #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
Bs[ty][tx]=B[((b+(wB*ty))+tx)];, #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];, #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
As[ty][tx]=A[((a+(wA*ty))+tx)];]
  *** Using clone for tIdx.y ***
  *** Using clone for tIdx.x ***
Replaced 1 candidate defs
Replaced 10 candidate uses
Replaced 0 non-candidate defs with cand uses
Replaced 0 non-candidate uses
 - Privatizing SymTarget:
---- Symbol: ty ----
 ***   mDefUses: 
{141163373=[405519671, 1006590326, 1483514863, 1149160771]}
 ***   Candidate Defs: 1  [141163373]
 - 141163373 : #pragma fcuda stmt tdep=true tlpName=CMP_0 name=CMP_0 CMPtask=true seqID=0 ADRtask=true HTGNode=CMP_0 
ty=threadIdx.y;
 ***   non-Candidate Defs: 0
 ***   Symbol Uses: 
[#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_5 name=TRN_5 tdep_vars=[ty, tx, Csub] seqID=5 HTGNode=TRN_5 TRNtask=true 
C[((c+(wB*ty))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];, #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_3 name=CMP_3 tdep_vars=[ty, tx, Bs, As, Csub] CMPtask=true seqID=3 HTGNode=CMP_3 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
Bs[ty][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty))+tx_block[threadIdx.y][threadIdx.x])];, #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
Bs[ty][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty))+tx_block[threadIdx.y][threadIdx.x])];, #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
As[ty][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty))+tx_block[threadIdx.y][threadIdx.x])];, #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_1 name=TRN_1 tdep_vars=[ty, tx] seqID=1 HTGNode=TRN_1 TRNtask=true 
As[ty][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty))+tx_block[threadIdx.y][threadIdx.x])];]
  *** Using clone for tIdx.y ***
  *** Using clone for tIdx.x ***
Replaced 1 candidate defs
Replaced 10 candidate uses
Replaced 0 non-candidate defs with cand uses
Replaced 0 non-candidate uses
001
002
003---------------------------------------------------------------------------------------------------------------------------------------------------
----Collect global-memory arrays/pointers symbols (includes __constant__ symbols): glMemArraySet = GlobalMemUtils.getGlobMemSymbols(mProcedure)-------
------------------------------------------------------------------------------------------------------------------------------------------------------
----[* A, * B, * C]----
Global-Mem Arrays: [* A, * B, * C]
PointerSet: [* A, * B, * C]
findGMrefs for: A
findGMrefs for: B
findGMrefs for: C
AliasSet: []
derefAccs: []
004---------------------------------------------------------------------------------------------------------------------------------------------------
----Convert dereference-based global-mem accesses to array-accesses and find global-mem aliases: identifyGlMemAccs();-------
------------------------------------------------------------------------------------------------------------------------------------------------------
getMixdStmts Symbols: [* A, * B, * C]
getMixdStmts Global Symbols: [* A, * B, * C]
getMixdStmts Alias Symbols: []
symUses: [A]
Contained GM Ref: A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]
Candidate MIXED stmt: As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
symUses: [B]
Contained GM Ref: B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]
Candidate MIXED stmt: Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
symUses: [C]
Contained GM Ref: C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]
Candidate MIXED stmt: C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
mixdStmts: []
005---------------------------------------------------------------------------------------------------------------------------------------------------
----Eliminate MIXED statements (i.e. statements that contain both COMPUTE & TRANSFER parts): handleMixStmts();-------
------------------------------------------------------------------------------------------------------------------------------------------------------
00a
----000a----
----000b----
0000 Perform Alias Analysis 0
00000000   IPAnalysis 1
00000000   IPAnalysis 2
[NormalizeReturn] begin
*AP* procedure: __syncthreads
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul
*AP* is_void=true
*AP* ret_expr= null
[NormalizeReturn] end in 0.00 seconds
[LinkSymbol] 143 updates in 0.00 seconds
[IPA] Stops due to no flow entry
000000   IPpointsToAnalysis 1
000000   IPpointsToAnalysis 2
000000   IPpointsToAnalysis 3
0000 Perform Alias Analysis 1
0000IPpointsToAnalysis
[IPA:PointsTo] Stops due to no flow entry
0000 Perform Alias Analysis 2
----000c----
----000d----
----------------------------------------------
----start to generate CF graph with thread----
----------------------------------------------
proc now is: void __syncthreads()
{
;
return ;
}
=====
proc now is: #pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
__shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X];
__shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X];
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
__shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];
int a;
int b;
int k;
int c;
bx=blockIdx.x;
by=blockIdx.y;


tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;


aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);

Csub_block[threadIdx.y][threadIdx.x]=0;

a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];



As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];




__syncthreads();

{
lp1:

for (k=0; k<16;  ++ k)
{
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
}

}

__syncthreads();

}
c=(((wB*16)*by)+(16*bx));



C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];



return ;
}
=====
----000e----
--------------------------------------------------------
----start to generate generate Program Summary Graph----
--------------------------------------------------------
############### PSG Summary Detail[__syncthreads()] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  psg_entry_ref is null
  # Global Info (psg_entry_global, UseOutSet)
  psg_entry_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  psg_exit_ref is null
  # Global Info (psg_exit_global, DefInSet)
  psg_exit_global is null
############### PSG Summary Detail[matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  # Global Info (psg_entry_global, UseOutSet)
## Call Node ## IR: __syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: __syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Call Node ## IR: __syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: __syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: B, NODE: * B
  -DEF: A, NODE: * A
  -DEF: C, NODE: C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_exit_global, DefInSet)
############### PSG Propagated Detail[__syncthreads()] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  psg_entry_ref is null
  # Global Info (psg_entry_global)
  psg_entry_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref)
  psg_exit_ref is null
  # Global Info (psg_exit_global)
  psg_exit_global is null
############### PSG Propagated Detail[matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  # parameter: B
  # parameter: C
  # parameter: A
  # Global Info (psg_entry_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Call Node ## IR: __syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: __syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Call Node ## IR: __syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: __syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref)
  -OUTdef: B, NODE: * B
  -OUTdef: A, NODE: * A
  -OUTdef: C, NODE: C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
----000f----
----000g----
----000h----
00b
006
Instances of tidx: [threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx]
defIDs: [tx_block, tx_block, tx_block, ty_block, ty_block, ty_block, Csub_block, Csub_block, As, As, As, As, As, As, As, As, Bs, Bs, Bs, Bs, Bs, Bs, Bs, Bs, Csub_block, Csub_block, Csub_block, Csub_block, Csub_block, Csub_block, C, C, C, C, C, C]
Looking for uses of: tx_block
... in: C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... useID: tx_block
... in: Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
... useID: tx_block
... in: Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... useID: tx_block
... useID: tx_block
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... in: As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... useID: tx_block
... useID: tx_block
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
Looking for uses of: tx_block
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
Looking for uses of: tx_block
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
Looking for uses of: ty_block
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... useID: ty_block
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
... useID: ty_block
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... useID: ty_block
... useID: ty_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... in: #pragma fcuda stmt tdep_vars=[tx_block] 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... useID: ty_block
... useID: ty_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
Looking for uses of: ty_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
Looking for uses of: ty_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... useID: Csub_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
... useID: Csub_block
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
... useID: As
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block, As] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block, As] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block, As] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block, As] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block, As] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block, As] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block, As] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block, As] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
... useID: Bs
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: C
Looking for uses of: C
Looking for uses of: C
Looking for uses of: C
Looking for uses of: C
Looking for uses of: C
defIDs: [C, Csub_block, Bs, Bs, As, As, C, Csub_block, Bs, Bs, As, As, C, Csub_block, Csub_block, Csub_block]
Looking for uses of: C
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: C
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: C
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, ty_block] 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
... in: #pragma fcuda stmt tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
007
findTransferStmts Symbols: [* A, * B, * C]
findTransferStmts non-Const Symbols: [* A, * B, * C]
findTransferStmts for: A
findTransferStmts for: B
findTransferStmts for: C
INFO - findTransferStmts:  24 address index IDs
INFO - findTransferStmts: 2 defStmts for addrID: a
WARNING - findTransferStmts: Definition of class: class cetus.hir.CommaExpression
          ((a+=aStep), (b+=bStep))
INFO - findTransferStmts: Corner case forloop definition: ((a=aBegin), (b=bBegin));
INFO - findTransferStmts: 1 defStmts for addrID: wA
WARNING - findTransferStmts: Definition of class: class cetus.hir.VariableDeclarator
          wA
INFO - findTransferStmts: 1 defStmts for addrID: ty_block
INFO - findTransferStmts: 1 defStmts for addrID: tx_block
INFO - findTransferStmts: 2 defStmts for addrID: b
WARNING - findTransferStmts: Definition of class: class cetus.hir.CommaExpression
          ((a+=aStep), (b+=bStep))
INFO - findTransferStmts: Corner case forloop definition: ((a=aBegin), (b=bBegin));
INFO - findTransferStmts: 1 defStmts for addrID: wB
WARNING - findTransferStmts: Definition of class: class cetus.hir.VariableDeclarator
          wB
INFO - findTransferStmts: 1 defStmts for addrID: ty_block
INFO - findTransferStmts: 1 defStmts for addrID: tx_block
INFO - findTransferStmts: 1 defStmts for addrID: c
INFO - findTransferStmts: 1 defStmts for addrID: wB
WARNING - findTransferStmts: Definition of class: class cetus.hir.VariableDeclarator
          wB
INFO - findTransferStmts: 1 defStmts for addrID: ty_block
INFO - findTransferStmts: 1 defStmts for addrID: tx_block
008
009_finish


PRINT-GRAPH OUTPUT

	 ====================
	| Graph: matrixMul  L1
		 |
		 V
	 --------------------
	| CMP_6
	|  type: CMP
	|  Addr-Use: true
	 --------------------
		 |
		 V
	 --------------------
	| FOR_HTG_TRN_7
	|  type: FOR
	|  tdep: false
	 --------------------

		 ====================
		| Graph: HTG_TRN_7  L2
			 |
			 V
		 --------------------
		| TRN_7
		|  ParentNode: FOR_HTG_TRN_7
		|  type: TRN
		 --------------------
			 |
			 V
		 --------------------
		| SNC_8
		|  ParentNode: FOR_HTG_TRN_7
		|  type: SNC
		 --------------------
			 |
			 V
		 --------------------
		| FOR_HTG_CMP_9
		|  ParentNode: FOR_HTG_TRN_7
		|  type: FOR
		|  tdep: false
		 --------------------

			 ====================
			| Graph: HTG_CMP_9  L3
				 |
				 V
			 --------------------
			| CMP_9
			|  ParentNode: FOR_HTG_CMP_9
			|  type: CMP
			|  Addr-Use: false
			 --------------------
			\===== HTG_CMP_9 =====/

			 |
			 V
		 --------------------
		| SNC_10
		|  ParentNode: FOR_HTG_TRN_7
		|  type: SNC
		 --------------------
		\===== HTG_TRN_7 =====/

		 |
		 V
	 --------------------
	| TRN_11
	|  type: TRN
	 --------------------
	\===== matrixMul =====/

*** CF Node Info Begin ***
FOR_HTG_TRN_7 info:
     - uniform: false     - SubTypes: [TRN, SNC, CMP]
*** CF Node Info End ***
*** Number of Tasks in matrixMul :4
---- Target: CMP_6 ----
    nodes #: 1
       CMP_6
       Node Types: [CMP]
       uniform: true

 **** TLOOPS(1) ****
 TLOOP 0
---- Target: CMP_6 ----
    nodes #: 1
       CMP_6
       Node Types: [CMP]
       uniform: true



---- Target: TRN_7 ----
    nodes #: 1
       TRN_7
       Node Types: [TRN]
       uniform: true

 **** TLOOPS(1) ****
 TLOOP 0
---- Target: TRN_7 ----
    nodes #: 1
       TRN_7
       Node Types: [TRN]
       uniform: true



---- Target: SNC_8 ----
    nodes #: 3
       SNC_8
       FOR_HTG_CMP_9
       SNC_10
       Node Types: [SNC, CMP]
       uniform: true

 **** TLOOPS(1) ****
 TLOOP 0
---- Target: FOR_HTG_CMP_9 ----
    nodes #: 1
       FOR_HTG_CMP_9
       Node Types: [CMP]
       uniform: true



---- Target: TRN_11 ----
    nodes #: 1
       TRN_11
       Node Types: [TRN]
       uniform: true

 **** TLOOPS(1) ****
 TLOOP 0
---- Target: TRN_11 ----
    nodes #: 1
       TRN_11
       Node Types: [TRN]
       uniform: true



[PrivatizeScalars-FCUDA] end in 0.67 seconds
[LinkSymbol] 143 updates in 0.00 seconds

*** After PrivatizeScalars  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
__shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X];
__shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X];
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
__shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];
int a;
int b;
int k;
int c;
bx=blockIdx.x;
by=blockIdx.y;


#pragma fcuda compute name=CMP_6 cores=1 end=false begin=true 
#pragma fcuda tloop name=CMP_6 end=false begin=true 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);
#pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);
#pragma fcuda stmt tlpName=CMP_6 
aStep=16;
#pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);
#pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_6 end=true begin=false 
#pragma fcuda compute name=CMP_6 cores=1 end=true begin=false 

a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_7 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];



#pragma fcuda transfer name=TRN_7 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_7 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda tloop name=TRN_7 end=true begin=false 
#pragma fcuda transfer name=TRN_7 cores=1 end=true size=[BLOCKDIM_X] begin=false 




#pragma fcuda compute name=SNC_8 cores=1 end=false begin=true 
#pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();

{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_9 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 HTGNode=FOR_HTG_CMP_9 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=true begin=false 

}

#pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
#pragma fcuda compute name=SNC_8 cores=1 end=true begin=false 

}
c=(((wB*16)*by)+(16*bx));



#pragma fcuda transfer name=TRN_11 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_11 end=false begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_11 end=true begin=false 
#pragma fcuda transfer name=TRN_11 cores=1 end=true size=[BLOCKDIM_X] begin=false 



return ;
}



===========================================
00a
----000a----
----000b----
0000 Perform Alias Analysis 0
00000000   IPAnalysis 1
00000000   IPAnalysis 2
[NormalizeReturn] begin
*AP* procedure: __syncthreads
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul
*AP* is_void=true
*AP* ret_expr= null
[NormalizeReturn] end in 0.00 seconds
[LinkSymbol] 143 updates in 0.00 seconds
[IPA] Stops due to no flow entry
000000   IPpointsToAnalysis 1
000000   IPpointsToAnalysis 2
000000   IPpointsToAnalysis 3
0000 Perform Alias Analysis 1
0000IPpointsToAnalysis
[IPA:PointsTo] Stops due to no flow entry
0000 Perform Alias Analysis 2
----000c----
----000d----
----------------------------------------------
----start to generate CF graph with thread----
----------------------------------------------
proc now is: void __syncthreads()
{
;
return ;
}
=====
proc now is: #pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
__shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X];
__shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X];
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
__shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];
int a;
int b;
int k;
int c;
bx=blockIdx.x;
by=blockIdx.y;


#pragma fcuda compute name=CMP_6 cores=1 end=false begin=true 
#pragma fcuda tloop name=CMP_6 end=false begin=true 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);
#pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);
#pragma fcuda stmt tlpName=CMP_6 
aStep=16;
#pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);
#pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_6 end=true begin=false 
#pragma fcuda compute name=CMP_6 cores=1 end=true begin=false 

a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_7 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];



#pragma fcuda transfer name=TRN_7 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_7 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda tloop name=TRN_7 end=true begin=false 
#pragma fcuda transfer name=TRN_7 cores=1 end=true size=[BLOCKDIM_X] begin=false 




#pragma fcuda compute name=SNC_8 cores=1 end=false begin=true 
#pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();

{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_9 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 HTGNode=FOR_HTG_CMP_9 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=true begin=false 

}

#pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
#pragma fcuda compute name=SNC_8 cores=1 end=true begin=false 

}
c=(((wB*16)*by)+(16*bx));



#pragma fcuda transfer name=TRN_11 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_11 end=false begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_11 end=true begin=false 
#pragma fcuda transfer name=TRN_11 cores=1 end=true size=[BLOCKDIM_X] begin=false 



return ;
}
=====
----000e----
--------------------------------------------------------
----start to generate generate Program Summary Graph----
--------------------------------------------------------
############### PSG Summary Detail[__syncthreads()] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  psg_entry_ref is null
  # Global Info (psg_entry_global, UseOutSet)
  psg_entry_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  psg_exit_ref is null
  # Global Info (psg_exit_global, DefInSet)
  psg_exit_global is null
############### PSG Summary Detail[matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  # Global Info (psg_entry_global, UseOutSet)
## Call Node ## IR: #pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Call Node ## IR: #pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: C, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -DEF: A, NODE: * A
  -DEF: B, NODE: * B
  # Global Info (psg_exit_global, DefInSet)
############### PSG Propagated Detail[__syncthreads()] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  psg_entry_ref is null
  # Global Info (psg_entry_global)
  psg_entry_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref)
  psg_exit_ref is null
  # Global Info (psg_exit_global)
  psg_exit_global is null
############### PSG Propagated Detail[matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  # parameter: B
  # parameter: C
  # parameter: A
  # Global Info (psg_entry_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Call Node ## IR: #pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Call Node ## IR: #pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref)
  -OUTdef: C, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTdef: A, NODE: * A
  -OUTdef: B, NODE: * B
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
----000f----
----000g----
----000h----
00b
DEF::
########################## (printDefUseChain) Procedure: __syncthreads
#######################################################################
########################## (printDefUseChain) Procedure: matrixMul
Def[0]: C, IR: * C
Def[1]: A, IR: * A
  --> Use: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
Def[2]: B, IR: * B
  --> Use: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
Def[3]: wA, IR: wA
  --> Use: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
  --> Use: #pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);, proc: matrixMul
  --> Use: #pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);, proc: matrixMul
Def[4]: wB, IR: wB
  --> Use: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];, proc: matrixMul
  --> Use: c=(((wB*16)*by)+(16*bx));, proc: matrixMul
  --> Use: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
  --> Use: #pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);, proc: matrixMul
Def[5]: bx, IR: bx=blockIdx.x;
  --> Use: c=(((wB*16)*by)+(16*bx));, proc: matrixMul
  --> Use: #pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);, proc: matrixMul
Def[6]: by, IR: by=blockIdx.y;
  --> Use: c=(((wB*16)*by)+(16*bx));, proc: matrixMul
  --> Use: #pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);, proc: matrixMul
Def[7]: tx_block, IR: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  --> Use: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];, proc: matrixMul
  --> Use: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, proc: matrixMul
  --> Use: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
  --> Use: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
  --> Use: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
  --> Use: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
Def[8]: ty_block, IR: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  --> Use: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];, proc: matrixMul
  --> Use: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, proc: matrixMul
  --> Use: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
  --> Use: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
  --> Use: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
  --> Use: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
Def[9]: aBegin, IR: #pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);
  --> Use: ((a=aBegin), (b=bBegin));, proc: matrixMul
  --> Use: #pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);, proc: matrixMul
Def[10]: aEnd, IR: #pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);
  --> Use: a<=aEnd, proc: matrixMul
Def[11]: aStep, IR: #pragma fcuda stmt tlpName=CMP_6 
aStep=16;
  --> Use: ((a+=aStep), (b+=bStep)), proc: matrixMul
Def[12]: bBegin, IR: #pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);
  --> Use: ((a=aBegin), (b=bBegin));, proc: matrixMul
Def[13]: bStep, IR: #pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);
  --> Use: ((a+=aStep), (b+=bStep)), proc: matrixMul
Def[14]: Csub_block, IR: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  --> Use: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];, proc: matrixMul
  --> Use: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, proc: matrixMul
Def[15]: a, IR: a=0;
Def[16]: b, IR: b=0;
Def[17]: k, IR: k=0;
Def[18]: a, IR: ((a=aBegin), (b=bBegin));
  --> Use: ((a+=aStep), (b+=bStep)), proc: matrixMul
  --> Use: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
  --> Use: a<=aEnd, proc: matrixMul
Def[19]: b, IR: ((a=aBegin), (b=bBegin));
  --> Use: ((a+=aStep), (b+=bStep)), proc: matrixMul
  --> Use: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
Def[20]: As, IR: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Use: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, proc: matrixMul
Def[21]: Bs, IR: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Use: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, proc: matrixMul
Def[22]: k, IR: #pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0;
  --> Use:  ++ k, proc: matrixMul
  --> Use: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, proc: matrixMul
  --> Use: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, proc: matrixMul
  --> Use: k<16, proc: matrixMul
Def[23]: Csub_block, IR: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  --> Use: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];, proc: matrixMul
  --> Use: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, proc: matrixMul
Def[24]: k, IR:  ++ k
  --> Use:  ++ k, proc: matrixMul
  --> Use: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, proc: matrixMul
  --> Use: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, proc: matrixMul
  --> Use: k<16, proc: matrixMul
Def[25]: a, IR: ((a+=aStep), (b+=bStep))
  --> Use: ((a+=aStep), (b+=bStep)), proc: matrixMul
  --> Use: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
  --> Use: a<=aEnd, proc: matrixMul
Def[26]: b, IR: ((a+=aStep), (b+=bStep))
  --> Use: ((a+=aStep), (b+=bStep)), proc: matrixMul
  --> Use: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
Def[27]: c, IR: c=(((wB*16)*by)+(16*bx));
  --> Use: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];, proc: matrixMul
Def[28]: C, IR: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
#######################################################################
USE::
########################## (printUseDefChain) Procedure: __syncthreads
#######################################################################
########################## (printUseDefChain) Procedure: matrixMul
Use[0]: wA, IR: #pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);
  --> Def: wA, proc: matrixMul
Use[1]: by, IR: #pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);
  --> Def: by=blockIdx.y;, proc: matrixMul
Use[2]: aBegin, IR: #pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);
  --> Def: #pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);, proc: matrixMul
Use[3]: wA, IR: #pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);
  --> Def: wA, proc: matrixMul
Use[4]: bx, IR: #pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);
  --> Def: bx=blockIdx.x;, proc: matrixMul
Use[5]: wB, IR: #pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);
  --> Def: wB, proc: matrixMul
Use[6]: aBegin, IR: ((a=aBegin), (b=bBegin));
  --> Def: #pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);, proc: matrixMul
Use[7]: bBegin, IR: ((a=aBegin), (b=bBegin));
  --> Def: #pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);, proc: matrixMul
Use[8]: a, IR: a<=aEnd
  --> Def: ((a+=aStep), (b+=bStep)), proc: matrixMul
  --> Def: ((a=aBegin), (b=bBegin));, proc: matrixMul
Use[9]: aEnd, IR: a<=aEnd
  --> Def: #pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);, proc: matrixMul
Use[10]: a, IR: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Def: ((a+=aStep), (b+=bStep)), proc: matrixMul
  --> Def: ((a=aBegin), (b=bBegin));, proc: matrixMul
Use[11]: wA, IR: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Def: wA, proc: matrixMul
Use[12]: ty_block, IR: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Def: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;, proc: matrixMul
Use[13]: tx_block, IR: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Def: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;, proc: matrixMul
Use[14]: A, IR: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Def: * A, proc: matrixMul
Use[15]: ty_block, IR: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Def: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;, proc: matrixMul
Use[16]: tx_block, IR: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Def: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;, proc: matrixMul
Use[17]: b, IR: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Def: ((a+=aStep), (b+=bStep)), proc: matrixMul
  --> Def: ((a=aBegin), (b=bBegin));, proc: matrixMul
Use[18]: wB, IR: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Def: wB, proc: matrixMul
Use[19]: ty_block, IR: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Def: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;, proc: matrixMul
Use[20]: tx_block, IR: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Def: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;, proc: matrixMul
Use[21]: B, IR: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Def: * B, proc: matrixMul
Use[22]: ty_block, IR: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Def: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;, proc: matrixMul
Use[23]: tx_block, IR: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  --> Def: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;, proc: matrixMul
Use[24]: k, IR: k<16
  --> Def:  ++ k, proc: matrixMul
  --> Def: #pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0;, proc: matrixMul
Use[25]: ty_block, IR: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  --> Def: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;, proc: matrixMul
Use[26]: k, IR: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  --> Def:  ++ k, proc: matrixMul
  --> Def: #pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0;, proc: matrixMul
Use[27]: As, IR: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  --> Def: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
Use[28]: k, IR: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  --> Def:  ++ k, proc: matrixMul
  --> Def: #pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0;, proc: matrixMul
Use[29]: tx_block, IR: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  --> Def: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;, proc: matrixMul
Use[30]: Bs, IR: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  --> Def: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, proc: matrixMul
Use[31]: Csub_block, IR: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  --> Def: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, proc: matrixMul
  --> Def: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;, proc: matrixMul
Use[32]: k, IR:  ++ k
  --> Def:  ++ k, proc: matrixMul
  --> Def: #pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0;, proc: matrixMul
Use[33]: aStep, IR: ((a+=aStep), (b+=bStep))
  --> Def: #pragma fcuda stmt tlpName=CMP_6 
aStep=16;, proc: matrixMul
Use[34]: a, IR: ((a+=aStep), (b+=bStep))
  --> Def: ((a+=aStep), (b+=bStep)), proc: matrixMul
  --> Def: ((a=aBegin), (b=bBegin));, proc: matrixMul
Use[35]: bStep, IR: ((a+=aStep), (b+=bStep))
  --> Def: #pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);, proc: matrixMul
Use[36]: b, IR: ((a+=aStep), (b+=bStep))
  --> Def: ((a+=aStep), (b+=bStep)), proc: matrixMul
  --> Def: ((a=aBegin), (b=bBegin));, proc: matrixMul
Use[37]: wB, IR: c=(((wB*16)*by)+(16*bx));
  --> Def: wB, proc: matrixMul
Use[38]: by, IR: c=(((wB*16)*by)+(16*bx));
  --> Def: by=blockIdx.y;, proc: matrixMul
Use[39]: bx, IR: c=(((wB*16)*by)+(16*bx));
  --> Def: bx=blockIdx.x;, proc: matrixMul
Use[40]: Csub_block, IR: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  --> Def: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, proc: matrixMul
  --> Def: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;, proc: matrixMul
Use[41]: c, IR: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  --> Def: c=(((wB*16)*by)+(16*bx));, proc: matrixMul
Use[42]: wB, IR: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  --> Def: wB, proc: matrixMul
Use[43]: ty_block, IR: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  --> Def: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;, proc: matrixMul
Use[44]: tx_block, IR: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  --> Def: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;, proc: matrixMul
#######################################################################
[SplitFcudaTasks2-FCUDA] begin
[SplitFcudaTasks2-FCUDA] examining procedure matrixMul
----SFT2_entered transformProcedure----
-----SFT2 enter new flow-----
-----SFT2 finished addAllSharedToBRAMSet(proc)-----
-----SFT2 finished FCUDAGlobalData2.setBRAMSet(mBRAMSet);-----
-----SFT2 finished proc.getBody().addANSIDeclaration(MCUDAUtils.Bidx.getDecl().get(0));-----
----SFT2-decompose-before sanity check, inCMP is: false, inTRN is: false, tskName is: null

 ... Prelim task handling: matrixMul_CMP_6
Creating new FcudaCoreData for core: matrixMul_CMP_6()
Marking Statements 19 - 33 for task: matrixMul_CMP_6
Starting to collect parameters for procedure: matrixMul_CMP_6
Task Statement: #pragma fcuda compute name=CMP_6 cores=1 end=false begin=true   of task: matrixMul_CMP_6
Task Statement: #pragma fcuda tloop name=CMP_6 end=false begin=true   of task: matrixMul_CMP_6
Task Statement: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;  of task: matrixMul_CMP_6
Task defExp: tx_block[threadIdx.y][threadIdx.x]  of task: matrixMul_CMP_6
Task def: tx_block  of task: matrixMul_CMP_6
     ... has # of chain uses: 6
Check Uses: [#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];, #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];]
      ... has Use out of task
      > #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
Task useExp: threadIdx.x  of task: matrixMul_CMP_6
Task useExp: threadIdx.y  of task: matrixMul_CMP_6
Task Statement: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;  of task: matrixMul_CMP_6
Task defExp: ty_block[threadIdx.y][threadIdx.x]  of task: matrixMul_CMP_6
Task def: ty_block  of task: matrixMul_CMP_6
     ... has # of chain uses: 6
Check Uses: [#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];, #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];, #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];]
      ... has Use out of task
      > #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
Task useExp: threadIdx.x  of task: matrixMul_CMP_6
Task useExp: threadIdx.y  of task: matrixMul_CMP_6
Task Statement: #pragma fcuda stmt tlpName=CMP_6   of task: matrixMul_CMP_6
Task Statement: #pragma fcuda stmt tlpName=CMP_6   of task: matrixMul_CMP_6
Task Statement: #pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);  of task: matrixMul_CMP_6
Task defExp: aBegin  of task: matrixMul_CMP_6
Task def: aBegin  of task: matrixMul_CMP_6
     ... has # of chain uses: 2
Check Uses: [((a=aBegin), (b=bBegin));, #pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);]
      ... has Use out of task
      > ((a=aBegin), (b=bBegin));
Task useExp: by  of task: matrixMul_CMP_6
Task use: by  of task: matrixMul_CMP_6
     ... has # of chain defs: 1
Check Defs: [by=blockIdx.y;]
      ... has Def out of task
      > by=blockIdx.y;
Task useExp: wA  of task: matrixMul_CMP_6
Task use: wA  of task: matrixMul_CMP_6
     ... has # of chain defs: 1
Check Defs: [wA]
      ... has Def out of task
      > wA
Task Statement: #pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);  of task: matrixMul_CMP_6
Task defExp: aEnd  of task: matrixMul_CMP_6
Task def: aEnd  of task: matrixMul_CMP_6
     ... has # of chain uses: 1
Check Uses: [a<=aEnd]
      ... has Use out of task
      > a<=aEnd
Task useExp: aBegin  of task: matrixMul_CMP_6
Task use: aBegin  of task: matrixMul_CMP_6
Task useExp: wA  of task: matrixMul_CMP_6
Task use: wA  of task: matrixMul_CMP_6
Task Statement: #pragma fcuda stmt tlpName=CMP_6 
aStep=16;  of task: matrixMul_CMP_6
Task defExp: aStep  of task: matrixMul_CMP_6
Task def: aStep  of task: matrixMul_CMP_6
     ... has # of chain uses: 1
Check Uses: [((a+=aStep), (b+=bStep))]
      ... has Use out of task
      > ((a+=aStep), (b+=bStep))
Task Statement: #pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);  of task: matrixMul_CMP_6
Task defExp: bBegin  of task: matrixMul_CMP_6
Task def: bBegin  of task: matrixMul_CMP_6
     ... has # of chain uses: 1
Check Uses: [((a=aBegin), (b=bBegin));]
      ... has Use out of task
      > ((a=aBegin), (b=bBegin));
Task useExp: bx  of task: matrixMul_CMP_6
Task use: bx  of task: matrixMul_CMP_6
     ... has # of chain defs: 1
Check Defs: [bx=blockIdx.x;]
      ... has Def out of task
      > bx=blockIdx.x;
Task Statement: #pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);  of task: matrixMul_CMP_6
Task defExp: bStep  of task: matrixMul_CMP_6
Task def: bStep  of task: matrixMul_CMP_6
     ... has # of chain uses: 1
Check Uses: [((a+=aStep), (b+=bStep))]
      ... has Use out of task
      > ((a+=aStep), (b+=bStep))
Task useExp: wB  of task: matrixMul_CMP_6
Task use: wB  of task: matrixMul_CMP_6
     ... has # of chain defs: 1
Check Defs: [wB]
      ... has Def out of task
      > wB
Task Statement: #pragma fcuda stmt tlpName=CMP_6   of task: matrixMul_CMP_6
Task Statement: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;  of task: matrixMul_CMP_6
Task defExp: Csub_block[threadIdx.y][threadIdx.x]  of task: matrixMul_CMP_6
Task def: Csub_block  of task: matrixMul_CMP_6
     ... has # of chain uses: 2
Check Uses: [#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];, #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);]
      ... has Use out of task
      > #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
Task useExp: threadIdx.x  of task: matrixMul_CMP_6
Task useExp: threadIdx.y  of task: matrixMul_CMP_6
Task Statement: #pragma fcuda tloop name=CMP_6 end=true begin=false   of task: matrixMul_CMP_6
Task Statement: #pragma fcuda compute name=CMP_6 cores=1 end=true begin=false   of task: matrixMul_CMP_6
----SFT2-decompose-before sanity check, inCMP is: false, inTRN is: false, tskName is: null

 ... Prelim task handling: matrixMul_TRN_11
Creating new FcudaCoreData for core: matrixMul_TRN_11()
Marking Statements 46 - 50 for task: matrixMul_TRN_11
Starting to collect parameters for procedure: matrixMul_TRN_11
Task Statement: #pragma fcuda transfer name=TRN_11 cores=1 end=false size=[BLOCKDIM_X] begin=true   of task: matrixMul_TRN_11
Task Statement: #pragma fcuda tloop name=TRN_11 end=false begin=true   of task: matrixMul_TRN_11
Task Statement: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];  of task: matrixMul_TRN_11
Task defExp: C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]  of task: matrixMul_TRN_11
Task def: C  of task: matrixMul_TRN_11
     ... has # of chain uses: 0
Task useExp: Csub_block[threadIdx.y][threadIdx.x]  of task: matrixMul_TRN_11
Task use: Csub_block  of task: matrixMul_TRN_11
     ... has # of chain defs: 2
      ... has Def out of task
      > #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Task useExp: c  of task: matrixMul_TRN_11
Task use: c  of task: matrixMul_TRN_11
     ... has # of chain defs: 1
      ... has Def out of task
      > c=(((wB*16)*by)+(16*bx));
Task useExp: threadIdx.x  of task: matrixMul_TRN_11
Task useExp: threadIdx.y  of task: matrixMul_TRN_11
Task useExp: tx_block[threadIdx.y][threadIdx.x]  of task: matrixMul_TRN_11
Task use: tx_block  of task: matrixMul_TRN_11
     ... has # of chain defs: 1
      ... has Def out of task
      > #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
Task useExp: ty_block[threadIdx.y][threadIdx.x]  of task: matrixMul_TRN_11
Task use: ty_block  of task: matrixMul_TRN_11
     ... has # of chain defs: 1
      ... has Def out of task
      > #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
Task useExp: wB  of task: matrixMul_TRN_11
Task use: wB  of task: matrixMul_TRN_11
     ... has # of chain defs: 1
      ... has Def out of task
      > wB
Task Statement: #pragma fcuda tloop name=TRN_11 end=true begin=false   of task: matrixMul_TRN_11
Task Statement: #pragma fcuda transfer name=TRN_11 cores=1 end=true size=[BLOCKDIM_X] begin=false   of task: matrixMul_TRN_11
----SFT2-decompose-before sanity check, inCMP is: false, inTRN is: false, tskName is: null

 ... Prelim task handling: matrixMul_TRN_7
Creating new FcudaCoreData for core: matrixMul_TRN_7()
Marking Statements 5 - 10 for task: matrixMul_TRN_7
Starting to collect parameters for procedure: matrixMul_TRN_7
Task Statement: #pragma fcuda transfer name=TRN_7 cores=1 end=false size=[BLOCKDIM_X] begin=true   of task: matrixMul_TRN_7
Task Statement: #pragma fcuda tloop name=TRN_7 end=false begin=true   of task: matrixMul_TRN_7
Task Statement: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];  of task: matrixMul_TRN_7
Task defExp: As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]  of task: matrixMul_TRN_7
Task def: As  of task: matrixMul_TRN_7
     ... has # of chain uses: 1
      ... has Use out of task
      > #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Task useExp: A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]  of task: matrixMul_TRN_7
Task use: A  of task: matrixMul_TRN_7
     ... has # of chain defs: 1
      ... has Def out of task
      > * A
Task useExp: a  of task: matrixMul_TRN_7
Task use: a  of task: matrixMul_TRN_7
     ... has # of chain defs: 2
      ... has Def out of task
      > ((a+=aStep), (b+=bStep))
Task useExp: threadIdx.x  of task: matrixMul_TRN_7
Task useExp: threadIdx.y  of task: matrixMul_TRN_7
Task useExp: tx_block[threadIdx.y][threadIdx.x]  of task: matrixMul_TRN_7
Task use: tx_block  of task: matrixMul_TRN_7
     ... has # of chain defs: 1
      ... has Def out of task
      > #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
Task useExp: ty_block[threadIdx.y][threadIdx.x]  of task: matrixMul_TRN_7
Task use: ty_block  of task: matrixMul_TRN_7
     ... has # of chain defs: 1
      ... has Def out of task
      > #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
Task useExp: wA  of task: matrixMul_TRN_7
Task use: wA  of task: matrixMul_TRN_7
     ... has # of chain defs: 1
      ... has Def out of task
      > wA
Task Statement: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];  of task: matrixMul_TRN_7
Task defExp: Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]  of task: matrixMul_TRN_7
Task def: Bs  of task: matrixMul_TRN_7
     ... has # of chain uses: 1
      ... has Use out of task
      > #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
Task useExp: B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]  of task: matrixMul_TRN_7
Task use: B  of task: matrixMul_TRN_7
     ... has # of chain defs: 1
      ... has Def out of task
      > * B
Task useExp: b  of task: matrixMul_TRN_7
Task use: b  of task: matrixMul_TRN_7
     ... has # of chain defs: 2
      ... has Def out of task
      > ((a+=aStep), (b+=bStep))
Task useExp: threadIdx.x  of task: matrixMul_TRN_7
Task useExp: threadIdx.y  of task: matrixMul_TRN_7
Task useExp: tx_block[threadIdx.y][threadIdx.x]  of task: matrixMul_TRN_7
Task use: tx_block  of task: matrixMul_TRN_7
Task useExp: ty_block[threadIdx.y][threadIdx.x]  of task: matrixMul_TRN_7
Task use: ty_block  of task: matrixMul_TRN_7
Task useExp: wB  of task: matrixMul_TRN_7
Task use: wB  of task: matrixMul_TRN_7
     ... has # of chain defs: 1
      ... has Def out of task
      > wB
Task Statement: #pragma fcuda tloop name=TRN_7 end=true begin=false   of task: matrixMul_TRN_7
Task Statement: #pragma fcuda transfer name=TRN_7 cores=1 end=true size=[BLOCKDIM_X] begin=false   of task: matrixMul_TRN_7
----SFT2-decompose-before sanity check, inCMP is: false, inTRN is: false, tskName is: null

 ... Prelim task handling: matrixMul_SNC_8
Creating new FcudaCoreData for core: matrixMul_SNC_8()
Marking Statements 16 - 22 for task: matrixMul_SNC_8
Starting to collect parameters for procedure: matrixMul_SNC_8
Task Statement: #pragma fcuda compute name=SNC_8 cores=1 end=false begin=true   of task: matrixMul_SNC_8
Task Statement: #pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();  of task: matrixMul_SNC_8
Task Statement:   of task: matrixMul_SNC_8
Task Statement: {
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_9 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 HTGNode=FOR_HTG_CMP_9 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=true begin=false 

}  of task: matrixMul_SNC_8
Task defExp: Csub_block[threadIdx.y][threadIdx.x]  of task: matrixMul_SNC_8
Task def: Csub_block  of task: matrixMul_SNC_8
     ... has # of chain uses: 2
Check Uses: [#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];, #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);]
      ... has Use out of task
      > #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
Task defExp: k  of task: matrixMul_SNC_8
Task def: k  of task: matrixMul_SNC_8
     ... has # of chain uses: 4
Check Uses: [ ++ k, #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);, k<16]
Task useExp: As[ty_block[threadIdx.y][threadIdx.x]][k]  of task: matrixMul_SNC_8
Task use: As  of task: matrixMul_SNC_8
     ... has # of chain defs: 1
Check Defs: [#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];]
      ... has Def out of task
      > #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
Task useExp: Bs[k][tx_block[threadIdx.y][threadIdx.x]]  of task: matrixMul_SNC_8
Task use: Bs  of task: matrixMul_SNC_8
     ... has # of chain defs: 1
Check Defs: [#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];]
      ... has Def out of task
      > #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
Task useExp: Csub_block[threadIdx.y][threadIdx.x]  of task: matrixMul_SNC_8
Task use: Csub_block  of task: matrixMul_SNC_8
Task useExp: k  of task: matrixMul_SNC_8
Task use: k  of task: matrixMul_SNC_8
     ... has # of chain defs: 2
Check Defs: [ ++ k, #pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0;]
Task useExp: threadIdx.x  of task: matrixMul_SNC_8
Task useExp: threadIdx.y  of task: matrixMul_SNC_8
Task useExp: tx_block[threadIdx.y][threadIdx.x]  of task: matrixMul_SNC_8
Task use: tx_block  of task: matrixMul_SNC_8
     ... has # of chain defs: 1
Check Defs: [#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;]
      ... has Def out of task
      > #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
Task useExp: ty_block[threadIdx.y][threadIdx.x]  of task: matrixMul_SNC_8
Task use: ty_block  of task: matrixMul_SNC_8
     ... has # of chain defs: 1
Check Defs: [#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;]
      ... has Def out of task
      > #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
Task Statement:   of task: matrixMul_SNC_8
Task Statement: #pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();  of task: matrixMul_SNC_8
Task Statement: #pragma fcuda compute name=SNC_8 cores=1 end=true begin=false   of task: matrixMul_SNC_8
Shift Decl: int k  to proc: matrixMul_SNC_8
-----SFT2 finished decomposeKernel();-----
Moving task statement: #pragma fcuda compute name=CMP_6 cores=1 end=false begin=true 
Moving task statement: #pragma fcuda tloop name=CMP_6 end=false begin=true 
Moving task statement: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
Moving task statement: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
Moving task statement: #pragma fcuda stmt tlpName=CMP_6 
Moving task statement: #pragma fcuda stmt tlpName=CMP_6 
Moving task statement: #pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);
Moving task statement: #pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);
Moving task statement: #pragma fcuda stmt tlpName=CMP_6 
aStep=16;
Moving task statement: #pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);
Moving task statement: #pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);
Moving task statement: #pragma fcuda stmt tlpName=CMP_6 
Moving task statement: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
Moving task statement: #pragma fcuda tloop name=CMP_6 end=true begin=false 
Moving task statement: #pragma fcuda compute name=CMP_6 cores=1 end=true begin=false 
Moving task statement: #pragma fcuda compute name=SNC_8 cores=1 end=false begin=true 
Moving task statement: #pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();
Moving task statement: 
Moving task statement: {
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_9 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 HTGNode=FOR_HTG_CMP_9 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=true begin=false 

}
Moving task statement: 
Moving task statement: #pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
Moving task statement: #pragma fcuda compute name=SNC_8 cores=1 end=true begin=false 
Moving task statement: #pragma fcuda transfer name=TRN_7 cores=1 end=false size=[BLOCKDIM_X] begin=true 
Moving task statement: #pragma fcuda tloop name=TRN_7 end=false begin=true 
Moving task statement: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
Moving task statement: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
Moving task statement: #pragma fcuda tloop name=TRN_7 end=true begin=false 
Moving task statement: #pragma fcuda transfer name=TRN_7 cores=1 end=true size=[BLOCKDIM_X] begin=false 
Moving task statement: #pragma fcuda transfer name=TRN_11 cores=1 end=false size=[BLOCKDIM_X] begin=true 
Moving task statement: #pragma fcuda tloop name=TRN_11 end=false begin=true 
Moving task statement: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
Moving task statement: #pragma fcuda tloop name=TRN_11 end=true begin=false 
Moving task statement: #pragma fcuda transfer name=TRN_11 cores=1 end=true size=[BLOCKDIM_X] begin=false 
-----SFT2 finished fillDecomposedTasks();-----
00a
----000a----
----000b----
0000 Perform Alias Analysis 0
00000000   IPAnalysis 1
00000000   IPAnalysis 2
[NormalizeReturn] begin
*AP* procedure: __syncthreads
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul_CMP_6
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul_TRN_11
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul_TRN_7
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul_SNC_8
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul
*AP* is_void=true
*AP* ret_expr= null
[NormalizeReturn] end in 0.00 seconds
[WARNING] Undeclared symbol k from k=0
[WARNING] Undeclared symbol k from k<16
[WARNING] Undeclared symbol k from  ++ k
[WARNING] Undeclared symbol k from As[ty_block[threadIdx.y][threadIdx.x]][k]
[WARNING] Undeclared symbol k from Bs[k][tx_block[threadIdx.y][threadIdx.x]]
[LinkSymbol] 183 updates in 0.00 seconds
[IPA] Stops due to no flow entry
000000   IPpointsToAnalysis 1
000000   IPpointsToAnalysis 2
000000   IPpointsToAnalysis 3
0000 Perform Alias Analysis 1
0000IPpointsToAnalysis
[IPA:PointsTo] Stops due to no flow entry
0000 Perform Alias Analysis 2
----000c----
----000d----
----------------------------------------------
----start to generate CF graph with thread----
----------------------------------------------
proc now is: void __syncthreads()
{
;
return ;
}
=====
proc now is: #pragma fcuda compute end=false cores=1 begin=true name=CMP_6 
void matrixMul_CMP_6(int guard_matrixMul_CMP_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int &aBegin, int by, int wA, int &aEnd, int &aStep, int &bBegin, int bx, int &bStep, int wB, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_CMP_6)
{
#pragma fcuda compute name=CMP_6 cores=1 end=false begin=true 
#pragma fcuda tloop name=CMP_6 end=false begin=true 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);
#pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);
#pragma fcuda stmt tlpName=CMP_6 
aStep=16;
#pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);
#pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_6 end=true begin=false 
#pragma fcuda compute name=CMP_6 cores=1 end=true begin=false 
}
return ;
}
=====
proc now is: #pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_11 
void matrixMul_TRN_11(int guard_matrixMul_TRN_11, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wB)
{
if (guard_matrixMul_TRN_11)
{
#pragma fcuda transfer name=TRN_11 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_11 end=false begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_11 end=true begin=false 
#pragma fcuda transfer name=TRN_11 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}
=====
proc now is: #pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_7 
void matrixMul_TRN_7(int guard_matrixMul_TRN_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
if (guard_matrixMul_TRN_7)
{
#pragma fcuda transfer name=TRN_7 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_7 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda tloop name=TRN_7 end=true begin=false 
#pragma fcuda transfer name=TRN_7 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}
=====
proc now is: #pragma fcuda compute end=false cores=1 begin=true name=SNC_8 
void matrixMul_SNC_8(int guard_matrixMul_SNC_8, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16], __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_SNC_8)
{
#pragma fcuda compute name=SNC_8 cores=1 end=false begin=true 
#pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();

{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_9 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 HTGNode=FOR_HTG_CMP_9 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=true begin=false 

}

#pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
#pragma fcuda compute name=SNC_8 cores=1 end=true begin=false 
}
return ;
}
=====
proc now is: #pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
__shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X];
__shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X];
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
__shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];
int a;
int b;
int k;
int c;
dim3 blockIdx;
int guard_matrixMul_CMP_6;
int guard_matrixMul_TRN_11;
int guard_matrixMul_TRN_7;
int guard_matrixMul_SNC_8;
guard_matrixMul_SNC_8=1;
guard_matrixMul_TRN_7=1;
guard_matrixMul_TRN_11=1;
guard_matrixMul_CMP_6=1;
bx=blockIdx.x;
by=blockIdx.y;


matrixMul_CMP_6(guard_matrixMul_CMP_6, blockDim, gridDim, blockIdx, tx_block, ty_block, aBegin, by, wA, aEnd, aStep, bBegin, bx, bStep, wB, Csub_block);

a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_7 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];



matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);




matrixMul_SNC_8(guard_matrixMul_SNC_8, blockDim, gridDim, blockIdx, Csub_block, As, Bs, tx_block, ty_block);

}
c=(((wB*16)*by)+(16*bx));



matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB);



return ;
}
=====
----000e----
--------------------------------------------------------
----start to generate generate Program Summary Graph----
--------------------------------------------------------
############### PSG Summary Detail[__syncthreads()] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  psg_entry_ref is null
  # Global Info (psg_entry_global, UseOutSet)
  psg_entry_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  psg_exit_ref is null
  # Global Info (psg_exit_global, DefInSet)
  psg_exit_global is null
############### PSG Summary Detail[matrixMul_CMP_6(int guard_matrixMul_CMP_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int &aBegin, int by, int wA, int &aEnd, int &aStep, int &bBegin, int bx, int &bStep, int wB, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  # Global Info (psg_entry_global, UseOutSet)
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -DEF: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -DEF: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -DEF: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -DEF: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -DEF: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  # Global Info (psg_exit_global, DefInSet)
############### PSG Summary Detail[matrixMul_TRN_11(int guard_matrixMul_TRN_11, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  -USE: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -USE: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -USE: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_entry_global, UseOutSet)
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -DEF: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -DEF: C, NODE: * C
  -DEF: C, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -DEF: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  # Global Info (psg_exit_global, DefInSet)
############### PSG Summary Detail[matrixMul_TRN_7(int guard_matrixMul_TRN_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  -USE: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -USE: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -USE: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -USE: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -USE: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -USE: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -USE: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -USE: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  # Global Info (psg_entry_global, UseOutSet)
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -DEF: A, NODE: * A
  -DEF: Bs, NODE: Bs[16][16]
  -DEF: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -DEF: As, NODE: As[16][16]
  -DEF: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -DEF: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -DEF: B, NODE: * B
  # Global Info (psg_exit_global, DefInSet)
############### PSG Summary Detail[matrixMul_SNC_8(int guard_matrixMul_SNC_8, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16], __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X])] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  -USE: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -USE: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -USE: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -USE: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -USE: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  # Global Info (psg_entry_global, UseOutSet)
## Call Node ## IR: #pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Call Node ## IR: #pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: Bs, NODE: Bs[16][16]
  -DEF: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -DEF: As, NODE: As[16][16]
  -DEF: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -DEF: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -DEF: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  # Global Info (psg_exit_global, DefInSet)
############### PSG Summary Detail[matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  -USE: B, NODE: matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);
  -USE: C, NODE: matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB);
  -USE: A, NODE: matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);
  # Global Info (psg_entry_global, UseOutSet)
## Call Node ## IR: matrixMul_CMP_6(guard_matrixMul_CMP_6, blockDim, gridDim, blockIdx, tx_block, ty_block, aBegin, by, wA, aEnd, aStep, bBegin, bx, bStep, wB, Csub_block);
  # Ref Info (psg_call_ref, def)
  # Global Info (psg_call_global, DefInSet)
## Return Node ## IR: matrixMul_CMP_6(guard_matrixMul_CMP_6, blockDim, gridDim, blockIdx, tx_block, ty_block, aBegin, by, wA, aEnd, aStep, bBegin, bx, bStep, wB, Csub_block);
  # Ref Info (psg_return_ref, use)
  # Global Info (psg_return_global, UseOutSet)
## Call Node ## IR: matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);
  # Ref Info (psg_call_ref, def)
  # Global Info (psg_call_global, DefInSet)
## Return Node ## IR: matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);
  # Ref Info (psg_return_ref, use)
  # Global Info (psg_return_global, UseOutSet)
## Call Node ## IR: matrixMul_SNC_8(guard_matrixMul_SNC_8, blockDim, gridDim, blockIdx, Csub_block, As, Bs, tx_block, ty_block);
  # Ref Info (psg_call_ref, def)
  # Global Info (psg_call_global, DefInSet)
## Return Node ## IR: matrixMul_SNC_8(guard_matrixMul_SNC_8, blockDim, gridDim, blockIdx, Csub_block, As, Bs, tx_block, ty_block);
  # Ref Info (psg_return_ref, use)
  # Global Info (psg_return_global, UseOutSet)
## Call Node ## IR: matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB);
  # Ref Info (psg_call_ref, def)
  # Global Info (psg_call_global, DefInSet)
## Return Node ## IR: matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB);
  # Ref Info (psg_return_ref, use)
  # Global Info (psg_return_global, UseOutSet)
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: C, NODE: matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB);
  -DEF: A, NODE: * A
  -DEF: A, NODE: matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);
  -DEF: B, NODE: * B
  -DEF: B, NODE: matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);
  # Global Info (psg_exit_global, DefInSet)
############### PSG Propagated Detail[__syncthreads()] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  psg_entry_ref is null
  # Global Info (psg_entry_global)
  psg_entry_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref)
  psg_exit_ref is null
  # Global Info (psg_exit_global)
  psg_exit_global is null
############### PSG Propagated Detail[matrixMul_CMP_6(int guard_matrixMul_CMP_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int &aBegin, int by, int wA, int &aEnd, int &aStep, int &bBegin, int bx, int &bStep, int wB, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  # parameter: ty_block
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  # parameter: Csub_block
  -INuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  # parameter: tx_block
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  # Global Info (psg_entry_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Exit Node ##
  # Ref Info (psg_exit_ref)
  -OUTdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
############### PSG Propagated Detail[matrixMul_TRN_11(int guard_matrixMul_TRN_11, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  # parameter: Csub_block
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  # parameter: ty_block
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  # parameter: tx_block
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  # parameter: C
  # Global Info (psg_entry_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Exit Node ##
  # Ref Info (psg_exit_ref)
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: C, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTdef: C, NODE: * C
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
############### PSG Propagated Detail[matrixMul_TRN_7(int guard_matrixMul_TRN_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  # parameter: A
  -INdef: A, NODE: * A
  -OUTdef: A, NODE: * A
  # parameter: Bs
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: Bs[16][16]
  -INuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  # parameter: tx_block
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  # parameter: ty_block
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  # parameter: As
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: As[16][16]
  -INuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  # parameter: B
  -INdef: B, NODE: * B
  -OUTdef: B, NODE: * B
  # Global Info (psg_entry_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Exit Node ##
  # Ref Info (psg_exit_ref)
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: A, NODE: * A
  -OUTdef: A, NODE: * A
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: Bs, NODE: Bs[16][16]
  -INuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: As, NODE: As[16][16]
  -INuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: B, NODE: * B
  -OUTdef: B, NODE: * B
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
############### PSG Propagated Detail[matrixMul_SNC_8(int guard_matrixMul_SNC_8, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16], __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X])] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  # parameter: tx_block
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  # parameter: Bs
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: Bs, NODE: Bs[16][16]
  -INuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  # parameter: ty_block
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  # parameter: As
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: As, NODE: As[16][16]
  -INuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  # parameter: Csub_block
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_entry_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Call Node ## IR: #pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Call Node ## IR: #pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref)
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: Bs[16][16]
  -INuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: As[16][16]
  -INuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
############### PSG Propagated Detail[matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  # parameter: B
  -INuse: B, NODE: matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);
  # parameter: C
  -INuse: C, NODE: matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB);
  # parameter: A
  -INuse: A, NODE: matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);
  # Global Info (psg_entry_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Call Node ## IR: matrixMul_CMP_6(guard_matrixMul_CMP_6, blockDim, gridDim, blockIdx, tx_block, ty_block, aBegin, by, wA, aEnd, aStep, bBegin, bx, bStep, wB, Csub_block);
  # Ref Info (psg_call_ref)
  -INuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  # Global Info (psg_call_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Return Node ## IR: matrixMul_CMP_6(guard_matrixMul_CMP_6, blockDim, gridDim, blockIdx, tx_block, ty_block, aBegin, by, wA, aEnd, aStep, bBegin, bx, bStep, wB, Csub_block);
  # Ref Info (psg_return_ref)
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  # Global Info (psg_return_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Call Node ## IR: matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);
  # Ref Info (psg_call_ref)
  -INdef: B, NODE: * B
  -OUTdef: B, NODE: * B
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: Bs[16][16]
  -INuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: As[16][16]
  -INuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: A, NODE: * A
  -OUTdef: A, NODE: * A
  # Global Info (psg_call_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Return Node ## IR: matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);
  # Ref Info (psg_return_ref)
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: Bs, NODE: Bs[16][16]
  -INuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: As, NODE: As[16][16]
  -INuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: B, NODE: * B
  -OUTdef: B, NODE: * B
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INdef: A, NODE: * A
  -OUTdef: A, NODE: * A
  # Global Info (psg_return_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Call Node ## IR: matrixMul_SNC_8(guard_matrixMul_SNC_8, blockDim, gridDim, blockIdx, Csub_block, As, Bs, tx_block, ty_block);
  # Ref Info (psg_call_ref)
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: As, NODE: As[16][16]
  -INuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: Bs, NODE: Bs[16][16]
  -INuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  # Global Info (psg_call_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Return Node ## IR: matrixMul_SNC_8(guard_matrixMul_SNC_8, blockDim, gridDim, blockIdx, Csub_block, As, Bs, tx_block, ty_block);
  # Ref Info (psg_return_ref)
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: As[16][16]
  -INuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: As, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: Bs[16][16]
  -INuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -INuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
  # Global Info (psg_return_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Call Node ## IR: matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB);
  # Ref Info (psg_call_ref)
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: ty_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: tx_block, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_call_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Return Node ## IR: matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB);
  # Ref Info (psg_return_ref)
  -INdef: C, NODE: * C
  -INdef: C, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTdef: C, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTdef: C, NODE: * C
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -INdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: ty_block, NODE: ty_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -INdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: tx_block, NODE: tx_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  # Global Info (psg_return_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Exit Node ##
  # Ref Info (psg_exit_ref)
  -INdef: C, NODE: * C
  -INdef: C, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTdef: C, NODE: #pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTdef: C, NODE: * C
  -OUTdef: C, NODE: matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB);
  -INdef: A, NODE: * A
  -OUTdef: A, NODE: * A
  -OUTdef: A, NODE: matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);
  -OUTdef: A, NODE: * A
  -INdef: B, NODE: * B
  -OUTdef: B, NODE: * B
  -OUTdef: B, NODE: matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);
  -OUTdef: B, NODE: * B
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
----000f----
----000g----
----000h----
00b
Found def k with IR: k=0;
isExist? true
-----SFT2 finished shiftDeclarations();-----
[SplitFcudaTasks2-FCUDA] end in 0.38 seconds
[LinkSymbol] 188 updates in 0.00 seconds

*** After SplitFcudaTasks2  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute end=false cores=1 begin=true name=CMP_6 
void matrixMul_CMP_6(int guard_matrixMul_CMP_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int &aBegin, int by, int wA, int &aEnd, int &aStep, int &bBegin, int bx, int &bStep, int wB, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_CMP_6)
{
#pragma fcuda compute name=CMP_6 cores=1 end=false begin=true 
#pragma fcuda tloop name=CMP_6 end=false begin=true 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);
#pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);
#pragma fcuda stmt tlpName=CMP_6 
aStep=16;
#pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);
#pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_6 end=true begin=false 
#pragma fcuda compute name=CMP_6 cores=1 end=true begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_11 
void matrixMul_TRN_11(int guard_matrixMul_TRN_11, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wB)
{
if (guard_matrixMul_TRN_11)
{
#pragma fcuda transfer name=TRN_11 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_11 end=false begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_11 end=true begin=false 
#pragma fcuda transfer name=TRN_11 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_7 
void matrixMul_TRN_7(int guard_matrixMul_TRN_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
if (guard_matrixMul_TRN_7)
{
#pragma fcuda transfer name=TRN_7 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_7 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda tloop name=TRN_7 end=true begin=false 
#pragma fcuda transfer name=TRN_7 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda compute end=false cores=1 begin=true name=SNC_8 
void matrixMul_SNC_8(int guard_matrixMul_SNC_8, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16], __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_SNC_8)
{
#pragma fcuda compute name=SNC_8 cores=1 end=false begin=true 
int k;
#pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();

{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_9 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 HTGNode=FOR_HTG_CMP_9 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=true begin=false 

}

#pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
#pragma fcuda compute name=SNC_8 cores=1 end=true begin=false 
}
return ;
}

#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
__shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X];
__shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X];
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
__shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];
int a;
int b;
int k;
int c;
dim3 blockIdx;
int guard_matrixMul_CMP_6;
int guard_matrixMul_TRN_11;
int guard_matrixMul_TRN_7;
int guard_matrixMul_SNC_8;
guard_matrixMul_SNC_8=1;
guard_matrixMul_TRN_7=1;
guard_matrixMul_TRN_11=1;
guard_matrixMul_CMP_6=1;
bx=blockIdx.x;
by=blockIdx.y;


matrixMul_CMP_6(guard_matrixMul_CMP_6, blockDim, gridDim, blockIdx, tx_block, ty_block, aBegin, by, wA, aEnd, aStep, bBegin, bx, bStep, wB, Csub_block);

a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_7 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];



matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);




matrixMul_SNC_8(guard_matrixMul_SNC_8, blockDim, gridDim, blockIdx, Csub_block, As, Bs, tx_block, ty_block);

}
c=(((wB*16)*by)+(16*bx));



matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB);



return ;
}



===========================================
[CleanKernelDecls-FCUDA] begin
[CleanKernelDecls-FCUDA] examining procedure matrixMul
cur_level:0
Defs+Uses:[guard_matrixMul_SNC_8]
Defs+Uses:[guard_matrixMul_TRN_7]
Defs+Uses:[guard_matrixMul_TRN_11]
Defs+Uses:[guard_matrixMul_CMP_6]
Defs+Uses:[blockIdx, blockIdx.x, bx]
Defs+Uses:[blockIdx, blockIdx.y, by]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[Csub_block, aBegin, aEnd, aStep, bBegin, bStep, blockDim, blockIdx, bx, by, gridDim, guard_matrixMul_CMP_6, matrixMul_CMP_6, tx_block, ty_block, wA, wB]
Defs+Uses:[]
Defs+Uses:[a]
Defs+Uses:[b]
Defs+Uses:[k]
cur_level:1
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[A, As, B, Bs, a, b, blockDim, blockIdx, gridDim, guard_matrixMul_TRN_7, matrixMul_TRN_7, tx_block, ty_block, wA, wB]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[As, Bs, Csub_block, blockDim, blockIdx, gridDim, guard_matrixMul_SNC_8, matrixMul_SNC_8, tx_block, ty_block]
Defs+Uses:[]
cur_level:1
var2freqMap{As=2, Bs=2}
funcCallParams[A, As, B, Bs, Csub_block, a, aBegin, aEnd, aStep, b, bBegin, bStep, blockDim, blockIdx, bx, by, gridDim, guard_matrixMul_CMP_6, guard_matrixMul_SNC_8, guard_matrixMul_TRN_7, tx_block, ty_block, wA, wB]
Defs+Uses:[bx, by, c, wB]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[C, Csub_block, blockDim, blockIdx, c, gridDim, guard_matrixMul_TRN_11, matrixMul_TRN_11, tx_block, ty_block, wB]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[]
cur_level:0
var2freqMap{Csub_block=3, a=5, aBegin=2, aEnd=2, aStep=2, b=4, bBegin=2, bStep=2, bx=3, by=3, c=2, guard_matrixMul_CMP_6=2, guard_matrixMul_SNC_8=2, guard_matrixMul_TRN_11=2, guard_matrixMul_TRN_7=2, k=1, tx_block=4, ty_block=4}
funcCallParams[A, As, B, Bs, C, Csub_block, a, aBegin, aEnd, aStep, b, bBegin, bStep, blockDim, blockIdx, bx, by, c, gridDim, guard_matrixMul_CMP_6, guard_matrixMul_SNC_8, guard_matrixMul_TRN_11, guard_matrixMul_TRN_7, tx_block, ty_block, wA, wB]
[CleanKernelDecls-FCUDA] end in 0.02 seconds
[LinkSymbol] 188 updates in 0.00 seconds

*** After CleanKernelDecls  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute end=false cores=1 begin=true name=CMP_6 
void matrixMul_CMP_6(int guard_matrixMul_CMP_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int &aBegin, int by, int wA, int &aEnd, int &aStep, int &bBegin, int bx, int &bStep, int wB, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_CMP_6)
{
#pragma fcuda compute name=CMP_6 cores=1 end=false begin=true 
#pragma fcuda tloop name=CMP_6 end=false begin=true 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);
#pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);
#pragma fcuda stmt tlpName=CMP_6 
aStep=16;
#pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);
#pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_6 end=true begin=false 
#pragma fcuda compute name=CMP_6 cores=1 end=true begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_11 
void matrixMul_TRN_11(int guard_matrixMul_TRN_11, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wB)
{
if (guard_matrixMul_TRN_11)
{
#pragma fcuda transfer name=TRN_11 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_11 end=false begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_11 end=true begin=false 
#pragma fcuda transfer name=TRN_11 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_7 
void matrixMul_TRN_7(int guard_matrixMul_TRN_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
if (guard_matrixMul_TRN_7)
{
#pragma fcuda transfer name=TRN_7 cores=1 end=false size=[BLOCKDIM_X] begin=true 
#pragma fcuda tloop name=TRN_7 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda tloop name=TRN_7 end=true begin=false 
#pragma fcuda transfer name=TRN_7 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda compute end=false cores=1 begin=true name=SNC_8 
void matrixMul_SNC_8(int guard_matrixMul_SNC_8, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16], __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_SNC_8)
{
#pragma fcuda compute name=SNC_8 cores=1 end=false begin=true 
int k;
#pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();

{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_9 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 HTGNode=FOR_HTG_CMP_9 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=true begin=false 

}

#pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
#pragma fcuda compute name=SNC_8 cores=1 end=true begin=false 
}
return ;
}

#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
__shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X];
__shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X];
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
__shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];
int a;
int b;
int k;
int c;
dim3 blockIdx;
int guard_matrixMul_CMP_6;
int guard_matrixMul_TRN_11;
int guard_matrixMul_TRN_7;
int guard_matrixMul_SNC_8;
guard_matrixMul_SNC_8=1;
guard_matrixMul_TRN_7=1;
guard_matrixMul_TRN_11=1;
guard_matrixMul_CMP_6=1;
bx=blockIdx.x;
by=blockIdx.y;


matrixMul_CMP_6(guard_matrixMul_CMP_6, blockDim, gridDim, blockIdx, tx_block, ty_block, aBegin, by, wA, aEnd, aStep, bBegin, bx, bStep, wB, Csub_block);

a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_7 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];



matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);




matrixMul_SNC_8(guard_matrixMul_SNC_8, blockDim, gridDim, blockIdx, Csub_block, As, Bs, tx_block, ty_block);

}
c=(((wB*16)*by)+(16*bx));



matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB);



return ;
}



===========================================
[SerializeThreads2-MCUDA] begin
[SerializeThreads2-MCUDA] examining procedure matrixMul
[SerializeThreads2-MCUDA] end in 0.01 seconds
[LinkSymbol] 188 updates in 0.00 seconds

*** After SerializeThreads2  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute end=false cores=1 begin=true name=CMP_6 
void matrixMul_CMP_6(int guard_matrixMul_CMP_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int &aBegin, int by, int wA, int &aEnd, int &aStep, int &bBegin, int bx, int &bStep, int wB, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_CMP_6)
{
#pragma fcuda compute name=CMP_6 cores=1 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=CMP_6 end=false begin=true 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);
#pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);
#pragma fcuda stmt tlpName=CMP_6 
aStep=16;
#pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);
#pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_6 end=true begin=false 
}
#pragma fcuda compute name=CMP_6 cores=1 end=true begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_11 
void matrixMul_TRN_11(int guard_matrixMul_TRN_11, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_11)
{
#pragma fcuda transfer name=TRN_11 cores=1 end=false size=[BLOCKDIM_X] begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_11 end=false begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_11 end=true begin=false 
}
#pragma fcuda transfer name=TRN_11 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_7 
void matrixMul_TRN_7(int guard_matrixMul_TRN_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_7)
{
#pragma fcuda transfer name=TRN_7 cores=1 end=false size=[BLOCKDIM_X] begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_7 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda tloop name=TRN_7 end=true begin=false 
}
#pragma fcuda transfer name=TRN_7 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda compute end=false cores=1 begin=true name=SNC_8 
void matrixMul_SNC_8(int guard_matrixMul_SNC_8, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16], __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_SNC_8)
{
#pragma fcuda compute name=SNC_8 cores=1 end=false begin=true 
int k;
#pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();

{
lp1:

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 HTGNode=FOR_HTG_CMP_9 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=true begin=false 
}

}

#pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
#pragma fcuda compute name=SNC_8 cores=1 end=true begin=false 
}
return ;
}

#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
__shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X];
__shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X];
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
__shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];
int a;
int b;
int k;
int c;
dim3 blockIdx;
int guard_matrixMul_CMP_6;
int guard_matrixMul_TRN_11;
int guard_matrixMul_TRN_7;
int guard_matrixMul_SNC_8;
guard_matrixMul_SNC_8=1;
guard_matrixMul_TRN_7=1;
guard_matrixMul_TRN_11=1;
guard_matrixMul_CMP_6=1;
bx=blockIdx.x;
by=blockIdx.y;


matrixMul_CMP_6(guard_matrixMul_CMP_6, blockDim, gridDim, blockIdx, tx_block, ty_block, aBegin, by, wA, aEnd, aStep, bBegin, bx, bStep, wB, Csub_block);

a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_7 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];



matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);




matrixMul_SNC_8(guard_matrixMul_SNC_8, blockDim, gridDim, blockIdx, Csub_block, As, Bs, tx_block, ty_block);

}
c=(((wB*16)*by)+(16*bx));



matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB);



return ;
}



===========================================
[UnrollThreadLoops2-MCUDA] begin
[UnrollThreadLoops2-MCUDA] examining procedure matrixMul

[Unrolling] : matrixMul_CMP_6
[unrollFactor] 1

[Unrolling] : matrixMul_SNC_8
[unrollFactor] 1
mUnrolledIDs: 
{}
[UnrollThreadLoops2-MCUDA] end in 0.00 seconds
[LinkSymbol] 188 updates in 0.00 seconds

*** After UnrollThreadLoops2  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute end=false cores=1 begin=true name=CMP_6 
void matrixMul_CMP_6(int guard_matrixMul_CMP_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int &aBegin, int by, int wA, int &aEnd, int &aStep, int &bBegin, int bx, int &bStep, int wB, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_CMP_6)
{
#pragma fcuda compute name=CMP_6 cores=1 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=CMP_6 end=false begin=true 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);
#pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);
#pragma fcuda stmt tlpName=CMP_6 
aStep=16;
#pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);
#pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_6 end=true begin=false 
}
#pragma fcuda compute name=CMP_6 cores=1 end=true begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_11 
void matrixMul_TRN_11(int guard_matrixMul_TRN_11, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_11)
{
#pragma fcuda transfer name=TRN_11 cores=1 end=false size=[BLOCKDIM_X] begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_11 end=false begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_11 end=true begin=false 
}
#pragma fcuda transfer name=TRN_11 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_7 
void matrixMul_TRN_7(int guard_matrixMul_TRN_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_7)
{
#pragma fcuda transfer name=TRN_7 cores=1 end=false size=[BLOCKDIM_X] begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_7 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda tloop name=TRN_7 end=true begin=false 
}
#pragma fcuda transfer name=TRN_7 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda compute end=false cores=1 begin=true name=SNC_8 
void matrixMul_SNC_8(int guard_matrixMul_SNC_8, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16], __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_SNC_8)
{
#pragma fcuda compute name=SNC_8 cores=1 end=false begin=true 
int k;
#pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();

{
lp1:

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 HTGNode=FOR_HTG_CMP_9 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=true begin=false 
}

}

#pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
#pragma fcuda compute name=SNC_8 cores=1 end=true begin=false 
}
return ;
}

#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
__shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X];
__shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X];
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
__shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];
int a;
int b;
int k;
int c;
dim3 blockIdx;
int guard_matrixMul_CMP_6;
int guard_matrixMul_TRN_11;
int guard_matrixMul_TRN_7;
int guard_matrixMul_SNC_8;
guard_matrixMul_SNC_8=1;
guard_matrixMul_TRN_7=1;
guard_matrixMul_TRN_11=1;
guard_matrixMul_CMP_6=1;
bx=blockIdx.x;
by=blockIdx.y;


matrixMul_CMP_6(guard_matrixMul_CMP_6, blockDim, gridDim, blockIdx, tx_block, ty_block, aBegin, by, wA, aEnd, aStep, bBegin, bx, bStep, wB, Csub_block);

a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_7 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];



matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);




matrixMul_SNC_8(guard_matrixMul_SNC_8, blockDim, gridDim, blockIdx, Csub_block, As, Bs, tx_block, ty_block);

}
c=(((wB*16)*by)+(16*bx));



matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB);



return ;
}



===========================================
[PartitionArrays2-MCUDA] begin
[PartitionArrays2-MCUDA] examining procedure matrixMul
[Memory partition] : matrixMul_CMP_6

[mempartFactor]1
[Memory partition] : matrixMul_TRN_11

[mempartFactor]1
[Memory partition] : matrixMul_TRN_7

[mempartFactor]1
[Memory partition] : matrixMul_SNC_8

[mempartFactor]1
[Memory partition] : matrixMul

[PartitionArrays2-MCUDA] end in 0.00 seconds
[LinkSymbol] 188 updates in 0.00 seconds

*** After PartitionArrays2  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute end=false cores=1 begin=true name=CMP_6 
void matrixMul_CMP_6(int guard_matrixMul_CMP_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int &aBegin, int by, int wA, int &aEnd, int &aStep, int &bBegin, int bx, int &bStep, int wB, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_CMP_6)
{
#pragma fcuda compute name=CMP_6 cores=1 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=CMP_6 end=false begin=true 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);
#pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);
#pragma fcuda stmt tlpName=CMP_6 
aStep=16;
#pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);
#pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_6 end=true begin=false 
}
#pragma fcuda compute name=CMP_6 cores=1 end=true begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_11 
void matrixMul_TRN_11(int guard_matrixMul_TRN_11, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_11)
{
#pragma fcuda transfer name=TRN_11 cores=1 end=false size=[BLOCKDIM_X] begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_11 end=false begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_11 end=true begin=false 
}
#pragma fcuda transfer name=TRN_11 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_7 
void matrixMul_TRN_7(int guard_matrixMul_TRN_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_7)
{
#pragma fcuda transfer name=TRN_7 cores=1 end=false size=[BLOCKDIM_X] begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_7 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda tloop name=TRN_7 end=true begin=false 
}
#pragma fcuda transfer name=TRN_7 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda compute end=false cores=1 begin=true name=SNC_8 
void matrixMul_SNC_8(int guard_matrixMul_SNC_8, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16], __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_SNC_8)
{
#pragma fcuda compute name=SNC_8 cores=1 end=false begin=true 
int k;
#pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();

{
lp1:

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 HTGNode=FOR_HTG_CMP_9 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=true begin=false 
}

}

#pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
#pragma fcuda compute name=SNC_8 cores=1 end=true begin=false 
}
return ;
}

#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
__shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X];
__shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X];
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
__shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];
int a;
int b;
int k;
int c;
dim3 blockIdx;
int guard_matrixMul_CMP_6;
int guard_matrixMul_TRN_11;
int guard_matrixMul_TRN_7;
int guard_matrixMul_SNC_8;
guard_matrixMul_SNC_8=1;
guard_matrixMul_TRN_7=1;
guard_matrixMul_TRN_11=1;
guard_matrixMul_CMP_6=1;
bx=blockIdx.x;
by=blockIdx.y;


matrixMul_CMP_6(guard_matrixMul_CMP_6, blockDim, gridDim, blockIdx, tx_block, ty_block, aBegin, by, wA, aEnd, aStep, bBegin, bx, bStep, wB, Csub_block);

a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_7 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];



matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);




matrixMul_SNC_8(guard_matrixMul_SNC_8, blockDim, gridDim, blockIdx, Csub_block, As, Bs, tx_block, ty_block);

}
c=(((wB*16)*by)+(16*bx));



matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB);



return ;
}



===========================================
[WrapBlockIdxLoop2-FCUDA] begin
[WrapBlockIdxLoop2-FCUDA] examining procedure matrixMul
[WrapBlockIdxLoop2-FCUDA] end in 0.01 seconds
[LinkSymbol] 196 updates in 0.00 seconds

*** After WrapBlockIdxLoop2  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute end=false cores=1 begin=true name=CMP_6 
void matrixMul_CMP_6(int guard_matrixMul_CMP_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int &aBegin, int by, int wA, int &aEnd, int &aStep, int &bBegin, int bx, int &bStep, int wB, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_CMP_6)
{
#pragma fcuda compute name=CMP_6 cores=1 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=CMP_6 end=false begin=true 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);
#pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);
#pragma fcuda stmt tlpName=CMP_6 
aStep=16;
#pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);
#pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_6 end=true begin=false 
}
#pragma fcuda compute name=CMP_6 cores=1 end=true begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_11 
void matrixMul_TRN_11(int guard_matrixMul_TRN_11, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_11)
{
#pragma fcuda transfer name=TRN_11 cores=1 end=false size=[BLOCKDIM_X] begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_11 end=false begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_11 end=true begin=false 
}
#pragma fcuda transfer name=TRN_11 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_7 
void matrixMul_TRN_7(int guard_matrixMul_TRN_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_7)
{
#pragma fcuda transfer name=TRN_7 cores=1 end=false size=[BLOCKDIM_X] begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_7 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda tloop name=TRN_7 end=true begin=false 
}
#pragma fcuda transfer name=TRN_7 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda compute end=false cores=1 begin=true name=SNC_8 
void matrixMul_SNC_8(int guard_matrixMul_SNC_8, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16], __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_SNC_8)
{
#pragma fcuda compute name=SNC_8 cores=1 end=false begin=true 
int k;
#pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();

{
lp1:

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 HTGNode=FOR_HTG_CMP_9 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=true begin=false 
}

}

#pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
#pragma fcuda compute name=SNC_8 cores=1 end=true begin=false 
}
return ;
}

#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB, dim3 gridDim, dim3 blockDim)
{
int bx;
int by;
__shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X];
__shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X];
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
__shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];
int a;
int b;
int k;
int c;
dim3 blockIdx;
int guard_matrixMul_CMP_6;
int guard_matrixMul_TRN_11;
int guard_matrixMul_TRN_7;
int guard_matrixMul_SNC_8;
dim3 blockIdx_loop;
for (blockIdx_loop.y=0; (gridDim.y+(-1*blockIdx_loop.y))>0; blockIdx_loop.y+=1)
{
blockIdx.y=blockIdx_loop.y;
for (blockIdx_loop.x=0; (gridDim.x+(-1*blockIdx_loop.x))>0; blockIdx_loop.x+=1)
{
blockIdx.x=blockIdx_loop.x;
guard_matrixMul_SNC_8=1;
guard_matrixMul_TRN_7=1;
guard_matrixMul_TRN_11=1;
guard_matrixMul_CMP_6=1;
bx=blockIdx.x;
by=blockIdx.y;


matrixMul_CMP_6(guard_matrixMul_CMP_6, blockDim, gridDim, blockIdx, tx_block, ty_block, aBegin, by, wA, aEnd, aStep, bBegin, bx, bStep, wB, Csub_block);

a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_7 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];



matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB);




matrixMul_SNC_8(guard_matrixMul_SNC_8, blockDim, gridDim, blockIdx, Csub_block, As, Bs, tx_block, ty_block);

}
c=(((wB*16)*by)+(16*bx));



matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB);



}
}
}



===========================================
[DuplicateForFCUDA2-FCUDA] begin
[DuplicateForFCUDA2-FCUDA] examining procedure matrixMul
matrixMul is inStreamProc: false
fcudaCores:
[matrixMul_CMP_6(guard_matrixMul_CMP_6, blockDim, gridDim, blockIdx, tx_block, ty_block, aBegin, by, wA, aEnd, aStep, bBegin, bx, bStep, wB, Csub_block), matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB), matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB), matrixMul_SNC_8(guard_matrixMul_SNC_8, blockDim, gridDim, blockIdx, Csub_block, As, Bs, tx_block, ty_block)]
coreNames: 
[matrixMul_CMP_6(guard_matrixMul_CMP_6, blockDim, gridDim, blockIdx, tx_block, ty_block, aBegin, by, wA, aEnd, aStep, bBegin, bx, bStep, wB, Csub_block), matrixMul_SNC_8(guard_matrixMul_SNC_8, blockDim, gridDim, blockIdx, Csub_block, As, Bs, tx_block, ty_block), matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB), matrixMul_TRN_7(guard_matrixMul_TRN_7, blockDim, gridDim, blockIdx, As, A, a, tx_block, ty_block, wA, Bs, B, b, wB)]
------------------------
mVarsToDuplicate: []
mVarsToDuplicate: [guard_matrixMul_SNC_8, aStep, Csub_block, b, c, a, by, bx, k, aBegin, tx_block, guard_matrixMul_TRN_7, ty_block, guard_matrixMul_CMP_6, aEnd, bStep, guard_matrixMul_TRN_11, blockIdx, bBegin]
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, bx_block0=bx_block0, by_block0=by_block0, c_block0=c_block0, guard_matrixMul_CMP_6_block0=guard_matrixMul_CMP_6_block0, guard_matrixMul_SNC_8_block0=guard_matrixMul_SNC_8_block0, guard_matrixMul_TRN_11_block0=guard_matrixMul_TRN_11_block0, guard_matrixMul_TRN_7_block0=guard_matrixMul_TRN_7_block0, k_block0=k_block0, tx_block_block0=tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], ty_block_block0=ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X]}
mVarsToDuplicate: [guard_matrixMul_SNC_8, aStep, Csub_block, b, c, a, by, bx, k, aBegin, tx_block, guard_matrixMul_TRN_7, ty_block, guard_matrixMul_CMP_6, aEnd, bStep, guard_matrixMul_TRN_11, blockIdx, bBegin]
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, bx_block0=bx_block0, by_block0=by_block0, c_block0=c_block0, guard_matrixMul_CMP_6_block0=guard_matrixMul_CMP_6_block0, guard_matrixMul_SNC_8_block0=guard_matrixMul_SNC_8_block0, guard_matrixMul_TRN_11_block0=guard_matrixMul_TRN_11_block0, guard_matrixMul_TRN_7_block0=guard_matrixMul_TRN_7_block0, k_block0=k_block0, tx_block_block0=tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], ty_block_block0=ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X]}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, bx_block0=bx_block0, by_block0=by_block0, c_block0=c_block0, guard_matrixMul_CMP_6_block0=guard_matrixMul_CMP_6_block0, guard_matrixMul_SNC_8_block0=guard_matrixMul_SNC_8_block0, guard_matrixMul_TRN_11_block0=guard_matrixMul_TRN_11_block0, guard_matrixMul_TRN_7_block0=guard_matrixMul_TRN_7_block0, k_block0=k_block0, tx_block_block0=tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], ty_block_block0=ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X]}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, bx_block0=bx_block0, by_block0=by_block0, c_block0=c_block0, guard_matrixMul_CMP_6_block0=guard_matrixMul_CMP_6_block0, guard_matrixMul_SNC_8_block0=guard_matrixMul_SNC_8_block0, guard_matrixMul_TRN_11_block0=guard_matrixMul_TRN_11_block0, guard_matrixMul_TRN_7_block0=guard_matrixMul_TRN_7_block0, k_block0=k_block0, tx_block_block0=tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], ty_block_block0=ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X]}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, bx_block0=bx_block0, by_block0=by_block0, c_block0=c_block0, guard_matrixMul_CMP_6_block0=guard_matrixMul_CMP_6_block0, guard_matrixMul_SNC_8_block0=guard_matrixMul_SNC_8_block0, guard_matrixMul_TRN_11_block0=guard_matrixMul_TRN_11_block0, guard_matrixMul_TRN_7_block0=guard_matrixMul_TRN_7_block0, k_block0=k_block0, tx_block_block0=tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], ty_block_block0=ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X]}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, bx_block0=bx_block0, by_block0=by_block0, c_block0=c_block0, guard_matrixMul_CMP_6_block0=guard_matrixMul_CMP_6_block0, guard_matrixMul_SNC_8_block0=guard_matrixMul_SNC_8_block0, guard_matrixMul_TRN_11_block0=guard_matrixMul_TRN_11_block0, guard_matrixMul_TRN_7_block0=guard_matrixMul_TRN_7_block0, k_block0=k_block0, tx_block_block0=tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], ty_block_block0=ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X]}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, bx_block0=bx_block0, by_block0=by_block0, c_block0=c_block0, guard_matrixMul_CMP_6_block0=guard_matrixMul_CMP_6_block0, guard_matrixMul_SNC_8_block0=guard_matrixMul_SNC_8_block0, guard_matrixMul_TRN_11_block0=guard_matrixMul_TRN_11_block0, guard_matrixMul_TRN_7_block0=guard_matrixMul_TRN_7_block0, k_block0=k_block0, tx_block_block0=tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], ty_block_block0=ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X]}
   --- handleFcudaCore: matrixMul_CMP_6(guard_matrixMul_CMP_6, blockDim, gridDim, blockIdx, tx_block, ty_block, aBegin, by, wA, aEnd, aStep, bBegin, bx, bStep, wB, Csub_block)
getCoreType for matrixMul_CMP_6(guard_matrixMul_CMP_6, blockDim, gridDim, blockIdx, tx_block, ty_block, aBegin, by, wA, aEnd, aStep, bBegin, bx, bStep, wB, Csub_block)
   --- of type COMPUTE: 
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, bx_block0=bx_block0, by_block0=by_block0, c_block0=c_block0, guard_matrixMul_CMP_6_block0=guard_matrixMul_CMP_6_block0, guard_matrixMul_SNC_8_block0=guard_matrixMul_SNC_8_block0, guard_matrixMul_TRN_11_block0=guard_matrixMul_TRN_11_block0, guard_matrixMul_TRN_7_block0=guard_matrixMul_TRN_7_block0, k_block0=k_block0, tx_block_block0=tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], ty_block_block0=ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X]}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, bx_block0=bx_block0, by_block0=by_block0, c_block0=c_block0, guard_matrixMul_CMP_6_block0=guard_matrixMul_CMP_6_block0, guard_matrixMul_SNC_8_block0=guard_matrixMul_SNC_8_block0, guard_matrixMul_TRN_11_block0=guard_matrixMul_TRN_11_block0, guard_matrixMul_TRN_7_block0=guard_matrixMul_TRN_7_block0, k_block0=k_block0, tx_block_block0=tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], ty_block_block0=ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X]}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, bx_block0=bx_block0, by_block0=by_block0, c_block0=c_block0, guard_matrixMul_CMP_6_block0=guard_matrixMul_CMP_6_block0, guard_matrixMul_SNC_8_block0=guard_matrixMul_SNC_8_block0, guard_matrixMul_TRN_11_block0=guard_matrixMul_TRN_11_block0, guard_matrixMul_TRN_7_block0=guard_matrixMul_TRN_7_block0, k_block0=k_block0, tx_block_block0=tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], ty_block_block0=ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X]}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, bx_block0=bx_block0, by_block0=by_block0, c_block0=c_block0, guard_matrixMul_CMP_6_block0=guard_matrixMul_CMP_6_block0, guard_matrixMul_SNC_8_block0=guard_matrixMul_SNC_8_block0, guard_matrixMul_TRN_11_block0=guard_matrixMul_TRN_11_block0, guard_matrixMul_TRN_7_block0=guard_matrixMul_TRN_7_block0, k_block0=k_block0, tx_block_block0=tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], ty_block_block0=ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X]}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, bx_block0=bx_block0, by_block0=by_block0, c_block0=c_block0, guard_matrixMul_CMP_6_block0=guard_matrixMul_CMP_6_block0, guard_matrixMul_SNC_8_block0=guard_matrixMul_SNC_8_block0, guard_matrixMul_TRN_11_block0=guard_matrixMul_TRN_11_block0, guard_matrixMul_TRN_7_block0=guard_matrixMul_TRN_7_block0, k_block0=k_block0, tx_block_block0=tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], ty_block_block0=ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X]}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, bx_block0=bx_block0, by_block0=by_block0, c_block0=c_block0, guard_matrixMul_CMP_6_block0=guard_matrixMul_CMP_6_block0, guard_matrixMul_SNC_8_block0=guard_matrixMul_SNC_8_block0, guard_matrixMul_TRN_11_block0=guard_matrixMul_TRN_11_block0, guard_matrixMul_TRN_7_block0=guard_matrixMul_TRN_7_block0, k_block0=k_block0, tx_block_block0=tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], ty_block_block0=ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X]}
   --- handleFcudaCore: matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB)
getCoreType for matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB)
getCoreType for matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB)
   --- of typee TRANSFER: 
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, bx_block0=bx_block0, by_block0=by_block0, c_block0=c_block0, guard_matrixMul_CMP_6_block0=guard_matrixMul_CMP_6_block0, guard_matrixMul_SNC_8_block0=guard_matrixMul_SNC_8_block0, guard_matrixMul_TRN_11_block0=guard_matrixMul_TRN_11_block0, guard_matrixMul_TRN_7_block0=guard_matrixMul_TRN_7_block0, k_block0=k_block0, tx_block_block0=tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], ty_block_block0=ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X]}
Treating arguments of call: matrixMul_TRN_11(guard_matrixMul_TRN_11_block0, blockDim, gridDim, blockIdx_block0, C, Csub_block_block0, c_block0, tx_block_block0, ty_block_block0, wB)
Arg #0: guard_matrixMul_TRN_11_block0
getCoreName for matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB)
getCoreName for matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB)
Arg #1: blockDim
Arg #2: gridDim
Arg #3: blockIdx_block0
getCoreName for matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB)
getCoreName for matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB)
Arg #4: C
Arg #5: Csub_block_block0
Arg #6: c_block0
Arg #7: tx_block_block0
Arg #8: ty_block_block0
Arg #9: wB
getCommonArgsIndex for matrixMul_TRN_11(guard_matrixMul_TRN_11, blockDim, gridDim, blockIdx, C, Csub_block, c, tx_block, ty_block, wB)
... handleCompoundStatement finished! 
[DuplicateForFCUDA2-FCUDA] end in 0.02 seconds
[LinkSymbol] 207 updates in 0.00 seconds

*** After DuplicateForFCUDA2  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute end=false cores=1 begin=true name=CMP_6 
void matrixMul_CMP_6(int guard_matrixMul_CMP_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int &aBegin, int by, int wA, int &aEnd, int &aStep, int &bBegin, int bx, int &bStep, int wB, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_CMP_6)
{
#pragma fcuda compute name=CMP_6 cores=1 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=CMP_6 end=false begin=true 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);
#pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);
#pragma fcuda stmt tlpName=CMP_6 
aStep=16;
#pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);
#pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_6 end=true begin=false 
}
#pragma fcuda compute name=CMP_6 cores=1 end=true begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_11 
void matrixMul_TRN_11(int guard_matrixMul_TRN_11, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_11)
{
#pragma fcuda transfer name=TRN_11 cores=1 end=false size=[BLOCKDIM_X] begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_11 end=false begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_11 end=true begin=false 
}
#pragma fcuda transfer name=TRN_11 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_7 
void matrixMul_TRN_7(int guard_matrixMul_TRN_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_7)
{
#pragma fcuda transfer name=TRN_7 cores=1 end=false size=[BLOCKDIM_X] begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_7 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda tloop name=TRN_7 end=true begin=false 
}
#pragma fcuda transfer name=TRN_7 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda compute end=false cores=1 begin=true name=SNC_8 
void matrixMul_SNC_8(int guard_matrixMul_SNC_8, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16], __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_SNC_8)
{
#pragma fcuda compute name=SNC_8 cores=1 end=false begin=true 
int k;
#pragma fcuda stmt tdep=true name=SNC_8 seqID=8 SNCtask=true HTGNode=SNC_8 
__syncthreads();

{
lp1:

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 HTGNode=FOR_HTG_CMP_9 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=true begin=false 
}

}

#pragma fcuda stmt tdep=true name=SNC_10 seqID=10 SNCtask=true HTGNode=SNC_10 
__syncthreads();
#pragma fcuda compute name=SNC_8 cores=1 end=true begin=false 
}
return ;
}

void matrixMul_TRN_11_wrapper(int guard_matrixMul_TRN_11_block0, dim3 blockDim, dim3 gridDim, dim3 blockIdx_matrixMul_TRN_11_block0, DATATYPE * C, __shared__ DATATYPE Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], int c_block0, __shared__ int tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X], int wB)
{
matrixMul_TRN_11(guard_matrixMul_TRN_11_block0, blockDim, gridDim, blockIdx_matrixMul_TRN_11_block0, C, Csub_block_block0, c_block0, tx_block_block0, ty_block_block0, wB);
}

#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB, dim3 gridDim, dim3 blockDim)
{
int bx_block0;
int by_block0;
__shared__ int tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X];
__shared__ int ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X];
int aBegin_block0;
int aEnd_block0;
int aStep_block0;
int bBegin_block0;
int bStep_block0;
__shared__ DATATYPE Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X];
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
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];



matrixMul_TRN_7(guard_matrixMul_TRN_7_block0, blockDim, gridDim, blockIdx_block0, As, A, a_block0, tx_block_block0, ty_block_block0, wA, Bs, B, b_block0, wB);




matrixMul_SNC_8(guard_matrixMul_SNC_8_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0, As, Bs, tx_block_block0, ty_block_block0);

}
c_block0=(((wB*16)*by_block0)+(16*bx_block0));



matrixMul_TRN_11_wrapper(guard_matrixMul_TRN_11_block0, blockDim, gridDim, blockIdx_block0, C, Csub_block_block0, c_block0, tx_block_block0, ty_block_block0, wB);



}
}
}



===========================================
[CleanSyncFunc-MCUDA] begin
[CleanSyncFunc-MCUDA] examining procedure matrixMul
[CleanSyncFunc-MCUDA] end in 0.00 seconds
[LinkSymbol] 205 updates in 0.00 seconds

*** After CleanSyncFunc  ***
#include <fcuda.h>
#include "matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute end=false cores=1 begin=true name=CMP_6 
void matrixMul_CMP_6(int guard_matrixMul_CMP_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int &aBegin, int by, int wA, int &aEnd, int &aStep, int &bBegin, int bx, int &bStep, int wB, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_CMP_6)
{
#pragma fcuda compute name=CMP_6 cores=1 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=CMP_6 end=false begin=true 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
tx_block[threadIdx.y][threadIdx.x]=threadIdx.x;
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 ADRtask=true HTGNode=CMP_6 
ty_block[threadIdx.y][threadIdx.x]=threadIdx.y;
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tlpName=CMP_6 
aBegin=((wA*16)*by);
#pragma fcuda stmt tlpName=CMP_6 
aEnd=((aBegin+wA)-1);
#pragma fcuda stmt tlpName=CMP_6 
aStep=16;
#pragma fcuda stmt tlpName=CMP_6 
bBegin=(16*bx);
#pragma fcuda stmt tlpName=CMP_6 
bStep=(16*wB);
#pragma fcuda stmt tlpName=CMP_6 
#pragma fcuda stmt tdep=true tlpName=CMP_6 name=CMP_6 CMPtask=true seqID=6 HTGNode=CMP_6 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_6 end=true begin=false 
}
#pragma fcuda compute name=CMP_6 cores=1 end=true begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_11 
void matrixMul_TRN_11(int guard_matrixMul_TRN_11, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_11)
{
#pragma fcuda transfer name=TRN_11 cores=1 end=false size=[BLOCKDIM_X] begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_11 end=false begin=true 
#pragma fcuda stmt GLBpntr=C rdNwrt=false tdep=true tlpName=TRN_11 name=TRN_11 tdep_vars=[tx_block, Csub_block, ty_block] seqID=11 HTGNode=TRN_11 TRNtask=true 
C[((c+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_11 end=true begin=false 
}
#pragma fcuda transfer name=TRN_11 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda transfer end=false cores=1 begin=true size=[BLOCKDIM_X] name=TRN_7 
void matrixMul_TRN_7(int guard_matrixMul_TRN_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X], int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_7)
{
#pragma fcuda transfer name=TRN_7 cores=1 end=false size=[BLOCKDIM_X] begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_7 end=false begin=true 
#pragma fcuda stmt GLBpntr=A rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
As[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=A[((a+(wA*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda stmt GLBpntr=B rdNwrt=true tdep=true tlpName=TRN_7 name=TRN_7 tdep_vars=[tx_block, ty_block] seqID=7 HTGNode=TRN_7 TRNtask=true 
Bs[ty_block[threadIdx.y][threadIdx.x]][tx_block[threadIdx.y][threadIdx.x]]=B[((b+(wB*ty_block[threadIdx.y][threadIdx.x]))+tx_block[threadIdx.y][threadIdx.x])];
#pragma fcuda tloop name=TRN_7 end=true begin=false 
}
#pragma fcuda transfer name=TRN_7 cores=1 end=true size=[BLOCKDIM_X] begin=false 
}
return ;
}

#pragma fcuda compute end=false cores=1 begin=true name=SNC_8 
void matrixMul_SNC_8(int guard_matrixMul_SNC_8, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16], __shared__ int tx_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_SNC_8)
{
#pragma fcuda compute name=SNC_8 cores=1 end=false begin=true 
int k;

{
lp1:

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=false begin=true 
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 HTGNode=FOR_HTG_CMP_9 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_9 
{
#pragma fcuda stmt tdep=true tlpName=FOR_HTG_CMP_9 name=CMP_9 tdep_vars=[tx_block, Csub_block, Bs, As, ty_block] CMPtask=true seqID=9 HTGNode=CMP_9 
Csub_block[threadIdx.y][threadIdx.x]+=(As[ty_block[threadIdx.y][threadIdx.x]][k]*Bs[k][tx_block[threadIdx.y][threadIdx.x]]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_9 end=true begin=false 
}

}

#pragma fcuda compute name=SNC_8 cores=1 end=true begin=false 
}
return ;
}

void matrixMul_TRN_11_wrapper(int guard_matrixMul_TRN_11_block0, dim3 blockDim, dim3 gridDim, dim3 blockIdx_matrixMul_TRN_11_block0, DATATYPE * C, __shared__ DATATYPE Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], int c_block0, __shared__ int tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X], __shared__ int ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X], int wB)
{
matrixMul_TRN_11(guard_matrixMul_TRN_11_block0, blockDim, gridDim, blockIdx_matrixMul_TRN_11_block0, C, Csub_block_block0, c_block0, tx_block_block0, ty_block_block0, wB);
}

#pragma fcuda grid y_dim=16 x_dim=16 
#pragma fcuda coreinfo num_cores=1 pipeline=no 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB, dim3 gridDim, dim3 blockDim)
{
int bx_block0;
int by_block0;
__shared__ int tx_block_block0[BLOCKDIM_Y][BLOCKDIM_X];
__shared__ int ty_block_block0[BLOCKDIM_Y][BLOCKDIM_X];
int aBegin_block0;
int aEnd_block0;
int aStep_block0;
int bBegin_block0;
int bStep_block0;
__shared__ DATATYPE Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X];
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
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];



matrixMul_TRN_7(guard_matrixMul_TRN_7_block0, blockDim, gridDim, blockIdx_block0, As, A, a_block0, tx_block_block0, ty_block_block0, wA, Bs, B, b_block0, wB);




matrixMul_SNC_8(guard_matrixMul_SNC_8_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0, As, Bs, tx_block_block0, ty_block_block0);

}
c_block0=(((wB*16)*by_block0)+(16*bx_block0));



matrixMul_TRN_11_wrapper(guard_matrixMul_TRN_11_block0, blockDim, gridDim, blockIdx_block0, C, Csub_block_block0, c_block0, tx_block_block0, ty_block_block0, wB);



}
}
}



===========================================
