[LinkSymbol] 69 updates in 0.01 seconds
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
----addStatementBefore----index is:0
----addStatementBefore----index is:1
----addStatementBefore----index is:2
[AnnotParser] end in 0.05 seconds
WARNING: Fcuda flag is set but mcuda_nolib is not set
WARNING: turning on mcuda_nolib
WARNING: mcuda_nolib flag is set but serialThr is not set
WARNING: turning on serialThr
 ... Setting: FLOW = 3
       TASK DECOMP = 2
       CODE MOTION = 1

*** Before Any Passes  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0, b = 0, k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
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

-------------d is instance of procedure: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0, b = 0, k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}

-------------working on eliminating: int a = 0, b = 0, k = 0
------eliminating: int a = 0, b = 0, k = 0 its child is: int a = 0, b = 0, k = 0 its parent is: int a = 0, b = 0, k = 0;
------parent is instance of declaration statement, child was: int a = 0, b = 0, k = 0 parent was: int a = 0, b = 0, k = 0; outer was: null
------now child becomes: int a = 0, b = 0, k = 0; parent becomes: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0, b = 0, k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
} outer becomes: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0, b = 0, k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}
------Start to eliminate---------------------------------------------
------placeholder is---------------------------- 
....CompoundStmt...addDecAfter...01
....CompoundStmt...addDecAfter...02
------after outer.addDeclarationAfter(decl, placeholder), outer is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0, b = 0, k = 0;
 ;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}
------after parent.removeChild(child), parent is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
 ;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}
------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 2
------after, Declarator d = decl.getDeclarator(i), d is: k = 0
....CompoundStmt...addDecAfter...01
....CompoundStmt...addDecAfter...02
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
 ;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
 ;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}
------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 1
------after, Declarator d = decl.getDeclarator(i), d is: b = 0
....CompoundStmt...addDecAfter...01
....CompoundStmt...addDecAfter...02
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
 ;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
 ;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}
------enter for loop, int i = decl.getNumDeclarators() - 1, i is: 0
------after, Declarator d = decl.getDeclarator(i), d is: a = 0
....CompoundStmt...addDecAfter...01
....CompoundStmt...addDecAfter...02
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, outer is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
 ;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}
------after, outer.addDeclarationAfter(placeholder, new VariableDeclaration(decl.getSpecifiers(), d.clone()));, parent is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
 ;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}
------if (placeholder.getParent() instanceof DeclarationStatement), placeholder.getParent() is:  ;
------after parent.removeChild(placeholder.getParent()), parent is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}
------after parent.removeChild(placeholder.getParent()), outer is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}
------Done with eliminateMultipleDeclarators, d now is: int a = 0, b = 0, k = 0
[SingleDeclarator] end in 0.05 seconds
[LinkSymbol] 69 updates in 0.00 seconds

*** After SingleDeclarator  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}



===========================================
[SeparateInitializers] begin
[SeparateInitializers] examining procedure matrixMul
00-----if Driver.getoptionvvalue fcuda != null-----
00-----after List<Procedure> tskLst = FCUDAutils.getTaskMapping(proc.getSymbolName()); tskLst is: null-----
1111-----If tskLst == null-----
00-----in splitInitialization, proc is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx = blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by = blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int aBegin = ((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int aBegin;
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd = ((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep = 16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin = (16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep = (16*wB);
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
int aBegin;
aBegin=((wA*16)*by);
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub = 0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
Csub=0;
int a = 0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
Csub=0;
int a;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b = 0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k = 0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c = (((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}-----
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
1111-----enter while loop, declStmt is: int c = (((wB*16)*by)+(16*bx));-----
1111-----vDecl = (VariableDeclaration)declStmt.getDeclaration(), vDecl is: int c = (((wB*16)*by)+(16*bx))-----
1111-----variable = (VariableDeclarator)vDecl.getDeclarator(0), variable is: c = (((wB*16)*by)+(16*bx))-----
1111-----after Initializer vInit = variable.getInitializer(), vInit is:  = (((wB*16)*by)+(16*bx))-----
1111-----after variable.setInitializer(null), variable is: c-----
1111-----vDecl.getSpecifiers().remove(Specifier.CONST), vDecl is: int c-----
1111-----variable.getSpecifiers().remove(Specifier.CONST), variable is: c-----
1111-----List<Traversable> children = vInit.getChildren(), children is: [(((wB*16)*by)+(16*bx))]-----
1111-----Expression initExpr = (Expression)((Expression)children.get(0)).clone(), initExpr is: (((wB*16)*by)+(16*bx))-----
1111-----IDExpression vID = new Identifier(variable), vID is: c-----
1111-----AssignmentExpression vAssign = new AssignmentExpression(vID, AssignmentOperator.NORMAL, initExpr), vAssign is: (c=(((wB*16)*by)+(16*bx)))-----
1111-----ExpressionStatement vStmt = new ExpressionStatement(vAssign), vStmt is: c=(((wB*16)*by)+(16*bx));-----
1111-----CompoundStatement scope = (CompoundStatement)declStmt.getParent(), scope is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}-----
1111-----scope.addStatementAfter(declStmt, vStmt), scope is: {
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}-----
-----kernelTransformPass, finish transformProcedure-----, proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}

[SeparateInitializers] end in 0.03 seconds
[LinkSymbol] 81 updates in 0.00 seconds

*** After SeparateInitializers  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
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
00-----statements is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , int bx;, bx=blockIdx.x;, int by;, by=blockIdx.y;, int aBegin;, aBegin=((wA*16)*by);, int aEnd;, aEnd=((aBegin+wA)-1);, int aStep;, aStep=16;, int bBegin;, bBegin=(16*bx);, int bStep;, bStep=(16*wB);, DATATYPE Csub;, Csub=0;, int a;, a=0;, int b;, b=0;, int k;, k=0;, for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}, int c;, c=(((wB*16)*by)+(16*bx));, C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;]-----
00-----List<Statement> nonDeclarations = new LinkedList<Statement>()
00-----statements is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , int bx;, bx=blockIdx.x;, int by;, by=blockIdx.y;, int aBegin;, aBegin=((wA*16)*by);, int aEnd;, aEnd=((aBegin+wA)-1);, int aStep;, aStep=16;, int bBegin;, bBegin=(16*bx);, int bStep;, bStep=(16*wB);, DATATYPE Csub;, Csub=0;, int a;, a=0;, int b;, b=0;, int k;, k=0;, for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}, int c;, c=(((wB*16)*by)+(16*bx));, C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: #pragma HLS INTERFACE ap_bus port=A depth=3840 -----
1111-----Statement stmt = (Statement)i
1111-----stmt is: #pragma HLS INTERFACE ap_bus port=A depth=3840 -----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 ]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: #pragma HLS INTERFACE ap_bus port=B depth=6144 -----
1111-----Statement stmt = (Statement)i
1111-----stmt is: #pragma HLS INTERFACE ap_bus port=B depth=6144 -----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 ]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: #pragma HLS INTERFACE ap_bus port=C depth=10240 -----
1111-----Statement stmt = (Statement)i
1111-----stmt is: #pragma HLS INTERFACE ap_bus port=C depth=10240 -----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 ]-----
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
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;]-----
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
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;]-----
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
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;, aBegin=((wA*16)*by);]-----
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
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);]-----
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
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;]-----
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
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);]-----
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
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);]-----
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
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, Csub=0;]-----
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
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, Csub=0;, a=0;]-----
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
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, Csub=0;, a=0;, b=0;]-----
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
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, Csub=0;, a=0;, b=0;, k=0;]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, Csub=0;, a=0;, b=0;, k=0;, for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: int c;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: int c;-----
222222-----nonDeclarations.add(stmt)
222222-----i is: c=(((wB*16)*by)+(16*bx));-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: c=(((wB*16)*by)+(16*bx));-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, Csub=0;, a=0;, b=0;, k=0;, for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}, c=(((wB*16)*by)+(16*bx));]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, Csub=0;, a=0;, b=0;, k=0;, for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}, c=(((wB*16)*by)+(16*bx));, C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;]-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: #pragma HLS INTERFACE ap_bus port=A depth=3840 -----
222222-----d.detach()
222222-----d is: #pragma HLS INTERFACE ap_bus port=A depth=3840 -----
222222-----scope.addStatement(d)
222222-----scope is: {
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: #pragma HLS INTERFACE ap_bus port=B depth=6144 -----
222222-----d.detach()
222222-----d is: #pragma HLS INTERFACE ap_bus port=B depth=6144 -----
222222-----scope.addStatement(d)
222222-----scope is: {
#pragma HLS INTERFACE ap_bus port=C depth=10240 
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: #pragma HLS INTERFACE ap_bus port=C depth=10240 -----
222222-----d.detach()
222222-----d is: #pragma HLS INTERFACE ap_bus port=C depth=10240 -----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
bx=blockIdx.x;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: bx=blockIdx.x;-----
222222-----d.detach()
222222-----d is: bx=blockIdx.x;-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
by=blockIdx.y;
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
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
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
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: aBegin=((wA*16)*by);-----
222222-----d.detach()
222222-----d is: aBegin=((wA*16)*by);-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
int aBegin;
int aEnd;
aEnd=((aBegin+wA)-1);
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
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
int aBegin;
int aEnd;
int aStep;
aStep=16;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
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
int aBegin;
int aEnd;
int aStep;
int bBegin;
bBegin=(16*bx);
int bStep;
bStep=(16*wB);
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
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
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
bStep=(16*wB);
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
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
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
Csub=0;
int a;
a=0;
int b;
b=0;
int k;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: Csub=0;-----
222222-----d.detach()
222222-----d is: Csub=0;-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
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
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: a=0;-----
222222-----d.detach()
222222-----d is: a=0;-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
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
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
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
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
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
int aBegin;
int aEnd;
int aStep;
int bBegin;
int bStep;
DATATYPE Csub;
int a;
int b;
int k;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
int c;
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}-----
222222-----d.detach()
222222-----d is: for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
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
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
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
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;-----
222222-----d.detach()
222222-----d is: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;-----
222222-----scope.addStatement(d)
222222-----scope is: {
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}-----
00-----List<Traversable> statements = scope.getChildren()
00-----statements is: [__shared__ DATATYPE As[16][16];, __shared__ DATATYPE Bs[16][16];, As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, __syncthreads();, {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}, __syncthreads();]-----
00-----List<Statement> nonDeclarations = new LinkedList<Statement>()
00-----statements is: [__shared__ DATATYPE As[16][16];, __shared__ DATATYPE Bs[16][16];, As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, __syncthreads();, {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}, __syncthreads();]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: __shared__ DATATYPE As[16][16];-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: __shared__ DATATYPE As[16][16];-----
222222-----nonDeclarations.add(stmt)
222222-----i is: __shared__ DATATYPE Bs[16][16];-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: __shared__ DATATYPE Bs[16][16];-----
222222-----nonDeclarations.add(stmt)
222222-----i is: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: __syncthreads();-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: __syncthreads();-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, __syncthreads();]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, __syncthreads();, {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: __syncthreads();-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: __syncthreads();-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, __syncthreads();, {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}, __syncthreads();]-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];-----
222222-----d.detach()
222222-----d is: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];-----
222222-----scope.addStatement(d)
222222-----scope is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];-----
222222-----d.detach()
222222-----d is: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];-----
222222-----scope.addStatement(d)
222222-----scope is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: __syncthreads();-----
222222-----d.detach()
222222-----d is: __syncthreads();-----
222222-----scope.addStatement(d)
222222-----scope is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}-----
222222-----d.detach()
222222-----d is: {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}-----
222222-----scope.addStatement(d)
222222-----scope is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
__syncthreads();
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: __syncthreads();-----
222222-----d.detach()
222222-----d is: __syncthreads();-----
222222-----scope.addStatement(d)
222222-----scope is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}-----
00-----List<Traversable> statements = scope.getChildren()
00-----statements is: [lp1:, for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}]-----
00-----List<Statement> nonDeclarations = new LinkedList<Statement>()
00-----statements is: [lp1:, for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
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
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [lp1:, for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}]-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: lp1:-----
222222-----d.detach()
222222-----d is: lp1:-----
222222-----scope.addStatement(d)
222222-----scope is: {
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
lp1:
}-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}-----
222222-----d.detach()
222222-----d is: for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}-----
222222-----scope.addStatement(d)
222222-----scope is: {
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}-----
00-----List<Traversable> statements = scope.getChildren()
00-----statements is: [Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);]-----
00-----List<Statement> nonDeclarations = new LinkedList<Statement>()
00-----statements is: [Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);]-----
222222-----nonDeclarations.add(stmt)
222222-----i is: Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);-----
1111-----Statement stmt = (Statement)i
1111-----stmt is: Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);-----
222222-----if(!(stmt instanceof DeclarationStatement))
222222-----nonDeclarations.add(stmt)
222222-----nonDeclarations is: [Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);]-----
222222-----enter for(Statement d : nonDeclarations)
222222-----d is: Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);-----
222222-----d.detach()
222222-----d is: Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);-----
222222-----scope.addStatement(d)
222222-----scope is: {
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}-----
[AnsiDeclarations] end in 0.02 seconds
[LinkSymbol] 81 updates in 0.00 seconds

*** After AnsiDeclarations  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}



===========================================
[StreamInsertion-FCUDA] begin
[StreamInsertion-FCUDA] examining procedure matrixMul
-----kernelTransformPass, finish transformProcedure-----, proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}

[StreamInsertion-FCUDA] end in 0.01 seconds
[LinkSymbol] 81 updates in 0.00 seconds

*** After StreamInsertion ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}



===========================================
[CreateTaskRegions-FCUDA] begin
[CreateTaskRegions-FCUDA] examining procedure matrixMul
001
002
003---------------------------------------------------------------------------------------------------------------------------------------------------
----Collect global-memory arrays/pointers symbols (includes __constant__ symbols): glMemArraySet = GlobalMemUtils.getGlobMemSymbols(mProcedure)-------
------------------------------------------------------------------------------------------------------------------------------------------------------
----[* A, * C, * B]----
----1.1----mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}

Global-Mem Arrays: [* A, * C, * B]
----now identifyGlmemAccs----
PointerSet: [* A, * C, * B]
findGMrefs for: A
---before continue, GM refs in ArrayAccess format already----
findGMrefs for: B
---before continue, GM refs in ArrayAccess format already----
findGMrefs for: C
---before continue, GM refs in ArrayAccess format already----
AliasSet: []
derefAccs: []
004---------------------------------------------------------------------------------------------------------------------------------------------------
----Convert dereference-based global-mem accesses to array-accesses and find global-mem aliases: identifyGlMemAccs();-------
------------------------------------------------------------------------------------------------------------------------------------------------------
----1.2----mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}

----now handleMixStmts----
getMixdStmts Symbols: [* A, * C, * B]
getMixdStmts Global Symbols: [* A, * C, * B]
getMixdStmts Alias Symbols: []
symUses: [A]
Contained GM Ref: A[((a+(wA*threadIdx.y))+threadIdx.x)]
Candidate MIXED stmt: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
symUses: [B]
Contained GM Ref: B[((b+(wB*threadIdx.y))+threadIdx.x)]
Candidate MIXED stmt: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
symUses: [C]
Contained GM Ref: C[((c+(wB*threadIdx.y))+threadIdx.x)]
Candidate MIXED stmt: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
mixdStmts: []
--------------------------------
005---------------------------------------------------------------------------------------------------------------------------------------------------
----Eliminate MIXED statements (i.e. statements that contain both COMPUTE & TRANSFER parts): handleMixStmts();-------
------------------------------------------------------------------------------------------------------------------------------------------------------
----1.3----mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
}

----FcudaGlobalData2.java start----
-----cetus application IPChainAnalysis start----
-----cetus application IPChainAnalysis 1----
------IPChainAnalysis.java PerformAliasAnalysis start----
-------IPPointsToAnalysis.java IPPointsToAnalysis start super----
--------IPAnalysis.java IPAnalysis start 1----
--------IPAnalysis.java IPAnalysis start 2----
[NormalizeReturn] begin
*AP* procedure: __syncthreads
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul
*AP* is_void=true
*AP* ret_expr= null
[NormalizeReturn] end in 0.00 seconds
[LinkSymbol] 81 updates in 0.00 seconds
--------IPAnalysis.java IPAnalysis start 3 enter IPA Graph----
---------IPAGraph.java finish super()----
---------IPAGraph.java start new Arraylist <IPANode>----
---------IPAGraph.java enter buildgraph<prog> 
---------IPAGraph.java enter identifyCloneableNodes
---------IPAGraph.java enter buildTopOrder
---------IPAGraph.java finish new IPA Graph
[IPA] Stops due to no flow entry
-------IPPointsToAnalysis.java IPPointsToAnalysis finished super----
-------IPPointsToAnalysis.java IPPointsToAnalysis finished 2----
-------IPPointsToAnalysis.java IPPointsToAnalysis end----
------PerformAliasAnalysis 1----
0000IPpointsToAnalysis
[IPA:PointsTo] Stops due to no flow entry
------PerformAliasAnalysis end----
-----cetus application IPChainAnalysis 2----
-----cetus application IPChainAnalysis 3----
----------------------------------------------
----start to generate CF graph with thread----
----------------------------------------------
proc now is: void __syncthreads()
{
;
return ;
}
=====
proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
return ;
}
=====
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
-----cetus application IPChainAnalysis 4----
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
  -DEF: C, NODE: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
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
  -OUTdef: C, NODE: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
  -OUTdef: A, NODE: * A
  -OUTdef: B, NODE: * B
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
-----cetus application IPChainAnalysis 5----
-----cetus application IPChainAnalysis 6----
-----cetus application IPChainAnalysis 7----
-----cetus application IPChainAnalysis end----
----FcudaGlobalData2.java end----
----1.4----mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
return ;
}

006
Instances of tidx: [threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx]
----c.1---- idx is: threadIdx
----c.1---- parStmt is: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
----c.1---- idx is: threadIdx
----c.1---- parStmt is: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
----c.1---- idx is: threadIdx
----c.1---- parStmt is: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
defIDs: [As, As, As, As, Bs, Bs, Bs, Bs, Csub, Csub, C, C]
Looking for uses of: As
... in: Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... useID: As
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[As] 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[As] 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[As] 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[As] 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... useID: Bs
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[Bs, As] 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[Bs, As] 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[Bs, As] 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
Looking for uses of: Csub
... in: #pragma fcuda stmt tdep_vars=[Bs, As] 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... useID: Csub
... in: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
... useID: Csub
Looking for uses of: Csub
... in: #pragma fcuda stmt tdep_vars=[Bs, As, Csub] 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... in: #pragma fcuda stmt tdep_vars=[Csub] 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
Looking for uses of: C
Looking for uses of: C
defIDs: [Csub, Csub, Csub, C]
Looking for uses of: Csub
... in: #pragma fcuda stmt tdep_vars=[Bs, As, Csub] 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... in: #pragma fcuda stmt tdep_vars=[Csub] 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
Looking for uses of: Csub
... in: #pragma fcuda stmt tdep_vars=[Bs, As, Csub] 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... in: #pragma fcuda stmt tdep_vars=[Csub] 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
Looking for uses of: Csub
... in: #pragma fcuda stmt tdep_vars=[Bs, As, Csub] 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... in: #pragma fcuda stmt tdep_vars=[Csub] 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
Looking for uses of: C
----c.2---- tDepStmt is: #pragma fcuda stmt tdep_vars=[Csub] 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
----c.2---- tDepStmt is: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
----c.21---- tDepStmt is: #pragma fcuda stmt tdep=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
----c.2---- tDepStmt is: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
----c.21---- tDepStmt is: #pragma fcuda stmt tdep=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
----c.2---- tDepStmt is: #pragma fcuda stmt tdep_vars=[Bs, As, Csub] 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
----1.5----mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt tdep=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt tdep=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt tdep_vars=[Bs, As, Csub] tdep=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda stmt tdep_vars=[Csub] tdep=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
return ;
}

007
findTransferStmts Symbols: [* A, * C, * B]
findTransferStmts non-Const Symbols: [* A, * C, * B]
findTransferStmts for: A
findTransferStmts for: B
findTransferStmts for: C
INFO - findTransferStmts:  12 address index IDs
....IPChainAnalysis getDefList....
INFO - findTransferStmts: 2 defStmts for addrID: a
INFO - findTransferStmts: Corner case forloop definition: ((a=aBegin), (b=bBegin));
WARNING - findTransferStmts: Definition of class: class cetus.hir.CommaExpression
          ((a+=aStep), (b+=bStep))
....IPChainAnalysis getDefList....
INFO - findTransferStmts: 1 defStmts for addrID: wA
WARNING - findTransferStmts: Definition of class: class cetus.hir.VariableDeclarator
          wA
....IPChainAnalysis getDefList....
INFO - findTransferStmts: 2 defStmts for addrID: b
INFO - findTransferStmts: Corner case forloop definition: ((a=aBegin), (b=bBegin));
WARNING - findTransferStmts: Definition of class: class cetus.hir.CommaExpression
          ((a+=aStep), (b+=bStep))
....IPChainAnalysis getDefList....
INFO - findTransferStmts: 1 defStmts for addrID: wB
WARNING - findTransferStmts: Definition of class: class cetus.hir.VariableDeclarator
          wB
....IPChainAnalysis getDefList....
INFO - findTransferStmts: 1 defStmts for addrID: c
....IPChainAnalysis getDefList....
INFO - findTransferStmts: 1 defStmts for addrID: wB
WARNING - findTransferStmts: Definition of class: class cetus.hir.VariableDeclarator
          wB
----1.6----mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A tdep=true TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B tdep=true TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt tdep_vars=[Bs, As, Csub] tdep=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda stmt rdNwrt=false GLBpntr=C tdep_vars=[Csub] tdep=true TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
return ;
}

008
----1.7----mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 tdep=true seqID=3 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
return ;
}

009_finish
-----kernelTransformPass, finish transformProcedure-----, proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 tdep=true seqID=3 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
return ;
}

[CreateTaskRegions-FCUDA] end in 0.33 seconds
[LinkSymbol] 81 updates in 0.00 seconds

*** After CreateTaskRegions  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 tdep=true seqID=3 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
return ;
}



===========================================
[UniformCFstructs-FCUDA] begin
[UniformCFstructs-FCUDA] examining procedure matrixMul
----001----enter UniformCFstructs
----002----defUseData = FCUDAGlobalData2.getDataDepAnalysis(program)
-----001----- fcudaGlobalData2.java enter UpdateHTG
-----001----- proc is
#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 tdep=true seqID=3 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
return ;
}

-----001----- proc.getSymbolName() is
matrixMul
------001------ HTGraph.java super()
------002------ HTGraph.java curTask = new String()
------003------ HTGraph.java HTGName = new String(name)
------004------ HTGraph.java if(trv instanceof Procedure)
------005------ HTGraph.java mProcedure = (Procedure) trv
------007------ HTGraph.java before build graph
------0007------ t is procedure now
------0007------ t is procedure now, getbody
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 tdep=true seqID=3 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
return ;
}
------0007------ t is CompoundStatement now
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 tdep=true seqID=3 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
return ;
}
------0007------ buildCompound cStmt getChildren
[int bx;, int by;, int aBegin;, int aEnd;, int aStep;, int bBegin;, int bStep;, DATATYPE Csub;, int a;, int b;, int k;, int c;, #pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, Csub=0;, a=0;, b=0;, k=0;, for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 tdep=true seqID=3 
__syncthreads();
}, c=(((wB*16)*by)+(16*bx));, #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;, return ;]
------0007------ buildCompound for(Traversable trv : children), current trv is
int bx;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int bx;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int by;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int by;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int aBegin;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int aBegin;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int aEnd;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int aEnd;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int aStep;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int aStep;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int bBegin;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int bBegin;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int bStep;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int bStep;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
DATATYPE Csub;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for DATATYPE Csub;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int a;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int a;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int b;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int b;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int k;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int k;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int c;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int c;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma HLS INTERFACE ap_bus port=A depth=3840 
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for #pragma HLS INTERFACE ap_bus port=A depth=3840 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma HLS INTERFACE ap_bus port=B depth=6144 
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for #pragma HLS INTERFACE ap_bus port=B depth=6144 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma HLS INTERFACE ap_bus port=C depth=10240 
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for #pragma HLS INTERFACE ap_bus port=C depth=10240 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
bx=blockIdx.x;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for bx=blockIdx.x;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
by=blockIdx.y;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for by=blockIdx.y;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
aBegin=((wA*16)*by);
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for aBegin=((wA*16)*by);
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
aEnd=((aBegin+wA)-1);
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for aEnd=((aBegin+wA)-1);
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
aStep=16;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for aStep=16;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
bBegin=(16*bx);
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for bBegin=(16*bx);
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
bStep=(16*wB);
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for bStep=(16*wB);
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
Csub=0;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for Csub=0;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
a=0;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for a=0;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
b=0;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for b=0;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
k=0;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for k=0;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 tdep=true seqID=3 
__syncthreads();
}
------ for loop current trv is not compound
------0007------ t is ForLoop now
------0007------ t is CompoundStatement now
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 tdep=true seqID=3 
__syncthreads();
}
------0007------ buildCompound cStmt getChildren
[__shared__ DATATYPE As[16][16];, __shared__ DATATYPE Bs[16][16];, #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, #pragma fcuda stmt SNCtask=true name=SNC_1 tdep=true seqID=1 
__syncthreads();, {
lp1:
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}, #pragma fcuda stmt SNCtask=true name=SNC_3 tdep=true seqID=3 
__syncthreads();]
------0007------ buildCompound for(Traversable trv : children), current trv is
__shared__ DATATYPE As[16][16];
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for __shared__ DATATYPE As[16][16];
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
__shared__ DATATYPE Bs[16][16];
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for __shared__ DATATYPE Bs[16][16];
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, TRN task----
-----added node: TRN_0
------done curr build graph
--- DFAGraph for #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, TRN task----
-----added node: TRN_0
------done curr build graph
--- DFAGraph for #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt SNCtask=true name=SNC_1 tdep=true seqID=1 
__syncthreads();
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, SYNC task----
-----added node: SNC_1
------done curr build graph
--- DFAGraph for #pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
{
lp1:
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
------ for loop current trv is compound
------0007------ t is CompoundStatement now
{
lp1:
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
------0007------ buildCompound cStmt getChildren
[lp1:, for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}]
------0007------ buildCompound for(Traversable trv : children), current trv is
lp1:
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for lp1:
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
------ for loop current trv is not compound
------0007------ t is ForLoop now
------0007------ t is CompoundStatement now
{
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
------0007------ buildCompound cStmt getChildren
[#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);]
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt name=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, COM task----
-----added node: CMP_2
------done curr build graph
--- DFAGraph for #pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ exit buildCompound for loop
------ ret.size > 0------
------ wrap enabled------
====== DFAGraph.java enter getFirst()
------ exit buildCompound with wrap enabled, and ret > 0, return superDFA------
------ exit buildCompound with wrap enabled, and ret == 0, return superDFA------
------done curr build graph
------ for loop ret has node------
====== DFAGraph.java enter getFirst()
------done curr build graph
--- DFAGraph for #pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ exit buildCompound for loop
------ ret.size > 0------
------ exit buildCompound with NO wrap, return ret------
------done curr build graph
--- DFAGraph for {
lp1:
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt SNCtask=true name=SNC_3 tdep=true seqID=3 
__syncthreads();
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, SYNC task----
-----added node: SNC_3
------done curr build graph
--- DFAGraph for #pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ exit buildCompound for loop
------ ret.size > 0------
------ wrap enabled------
====== DFAGraph.java enter getFirst()
------ exit buildCompound with wrap enabled, and ret > 0, return superDFA------
------ exit buildCompound with wrap enabled, and ret == 0, return superDFA------
------done curr build graph
------ for loop ret has node------
====== DFAGraph.java enter getFirst()
------done curr build graph
--- DFAGraph for #pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
}
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
c=(((wB*16)*by)+(16*bx));
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for c=(((wB*16)*by)+(16*bx));
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, TRN task----
-----added node: TRN_4
------done curr build graph
--- DFAGraph for #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
return ;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for return ;
has 0 nodes
------0007------ exit buildCompound for loop
------ ret.size > 0------
------ exit buildCompound with NO wrap, return ret------
------done curr build graph
------done curr build graph
------008------ HTGraph.java DFAGraph dfag = buildGraph(trv)
-----002----- fcudaGlobalData2.java HTGraph htg = new HTGraph(proc, proc.getSymbolName())
-----003----- fcudaGlobalData2.java mKern2HTG.put(proc, htg)
----003----defUseData = FCUDAGlobalData2.getDataDepAnalysis(program)


HTG PRINT-OUT

	 ====================
	| Graph: matrixMul  L1
		 |
		 V
	 --------------------
	| FOR_HTG_TRN_0
	|  type: FOR
	|  tdep: false
	 --------------------

		 ====================
		| Graph: HTG_TRN_0  L2
			 |
			 V
		 --------------------
		| TRN_0
		|  ParentNode: FOR_HTG_TRN_0
		|  type: TRN
		 --------------------
			 |
			 V
		 --------------------
		| SNC_1
		|  ParentNode: FOR_HTG_TRN_0
		|  type: SNC
		 --------------------
			 |
			 V
		 --------------------
		| FOR_HTG_CMP_2
		|  ParentNode: FOR_HTG_TRN_0
		|  type: FOR
		|  tdep: false
		 --------------------

			 ====================
			| Graph: HTG_CMP_2  L3
				 |
				 V
			 --------------------
			| CMP_2
			|  ParentNode: FOR_HTG_CMP_2
			|  type: CMP
			|  Addr-Use: false
			 --------------------
			\===== HTG_CMP_2 =====/

			 |
			 V
		 --------------------
		| SNC_3
		|  ParentNode: FOR_HTG_TRN_0
		|  type: SNC
		 --------------------
		\===== HTG_TRN_0 =====/

		 |
		 V
	 --------------------
	| TRN_4
	|  type: TRN
	 --------------------
	\===== matrixMul =====/

----004----procHTG.printGraph_1_0
----005----after if rgnBounds.add_none_or_TRN
----006----List<DFANode> nonUniformCFs = new LinkedList_DFANode
----007----identifyCFs(nonUniformCFs, rgnBounds, procHTG.getFirst(), false)
----007----before 008, nonUniformCFs is: []
-----kernelTransformPass, finish transformProcedure-----, proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
return ;
}

[UniformCFstructs-FCUDA] end in 0.02 seconds
[LinkSymbol] 81 updates in 0.00 seconds

*** After UniformCFstructs  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
return ;
}



===========================================
[AnnotateTasks-FCUDA] begin
[AnnotateTasks-FCUDA] examining procedure matrixMul
------001------ HTGraph.java super()
------002------ HTGraph.java curTask = new String()
------003------ HTGraph.java HTGName = new String(name)
------004------ HTGraph.java if(trv instanceof Procedure)
------005------ HTGraph.java mProcedure = (Procedure) trv
------007------ HTGraph.java before build graph
------0007------ t is procedure now
------0007------ t is procedure now, getbody
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
return ;
}
------0007------ t is CompoundStatement now
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
return ;
}
------0007------ buildCompound cStmt getChildren
[int bx;, int by;, int aBegin;, int aEnd;, int aStep;, int bBegin;, int bStep;, DATATYPE Csub;, int a;, int b;, int k;, int c;, #pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, Csub=0;, a=0;, b=0;, k=0;, #pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
}, c=(((wB*16)*by)+(16*bx));, #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;, return ;]
------0007------ buildCompound for(Traversable trv : children), current trv is
int bx;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int bx;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int by;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int by;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int aBegin;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int aBegin;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int aEnd;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int aEnd;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int aStep;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int aStep;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int bBegin;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int bBegin;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int bStep;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int bStep;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
DATATYPE Csub;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for DATATYPE Csub;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int a;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int a;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int b;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int b;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int k;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int k;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int c;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int c;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma HLS INTERFACE ap_bus port=A depth=3840 
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for #pragma HLS INTERFACE ap_bus port=A depth=3840 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma HLS INTERFACE ap_bus port=B depth=6144 
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for #pragma HLS INTERFACE ap_bus port=B depth=6144 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma HLS INTERFACE ap_bus port=C depth=10240 
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for #pragma HLS INTERFACE ap_bus port=C depth=10240 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
bx=blockIdx.x;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for bx=blockIdx.x;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
by=blockIdx.y;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for by=blockIdx.y;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
aBegin=((wA*16)*by);
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for aBegin=((wA*16)*by);
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
aEnd=((aBegin+wA)-1);
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for aEnd=((aBegin+wA)-1);
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
aStep=16;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for aStep=16;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
bBegin=(16*bx);
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for bBegin=(16*bx);
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
bStep=(16*wB);
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for bStep=(16*wB);
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
Csub=0;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for Csub=0;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
a=0;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for a=0;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
b=0;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for b=0;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
k=0;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for k=0;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
}
------ for loop current trv is not compound
------0007------ t is ForLoop now
------0007------ t is CompoundStatement now
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
}
------0007------ buildCompound cStmt getChildren
[__shared__ DATATYPE As[16][16];, __shared__ DATATYPE Bs[16][16];, #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, #pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();, {
lp1:
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}, #pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();]
------0007------ buildCompound for(Traversable trv : children), current trv is
__shared__ DATATYPE As[16][16];
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for __shared__ DATATYPE As[16][16];
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
__shared__ DATATYPE Bs[16][16];
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for __shared__ DATATYPE Bs[16][16];
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, TRN task----
-----added node: TRN_0
------done curr build graph
--- DFAGraph for #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, TRN task----
-----added node: TRN_0
------done curr build graph
--- DFAGraph for #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, SYNC task----
-----added node: SNC_1
------done curr build graph
--- DFAGraph for #pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
{
lp1:
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
------ for loop current trv is compound
------0007------ t is CompoundStatement now
{
lp1:
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
------0007------ buildCompound cStmt getChildren
[lp1:, #pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}]
------0007------ buildCompound for(Traversable trv : children), current trv is
lp1:
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for lp1:
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
------ for loop current trv is not compound
------0007------ t is ForLoop now
------0007------ t is CompoundStatement now
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
------0007------ buildCompound cStmt getChildren
[#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);]
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, COM task----
-----added node: CMP_2
------done curr build graph
--- DFAGraph for #pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ exit buildCompound for loop
------ ret.size > 0------
------ wrap enabled------
====== DFAGraph.java enter getFirst()
------ exit buildCompound with wrap enabled, and ret > 0, return superDFA------
------ exit buildCompound with wrap enabled, and ret == 0, return superDFA------
------done curr build graph
------ for loop ret has node------
====== DFAGraph.java enter getFirst()
------done curr build graph
--- DFAGraph for #pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ exit buildCompound for loop
------ ret.size > 0------
------ exit buildCompound with NO wrap, return ret------
------done curr build graph
--- DFAGraph for {
lp1:
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, SYNC task----
-----added node: SNC_3
------done curr build graph
--- DFAGraph for #pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ exit buildCompound for loop
------ ret.size > 0------
------ wrap enabled------
====== DFAGraph.java enter getFirst()
------ exit buildCompound with wrap enabled, and ret > 0, return superDFA------
------ exit buildCompound with wrap enabled, and ret == 0, return superDFA------
------done curr build graph
------ for loop ret has node------
====== DFAGraph.java enter getFirst()
------done curr build graph
--- DFAGraph for #pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
}
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
c=(((wB*16)*by)+(16*bx));
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for c=(((wB*16)*by)+(16*bx));
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, TRN task----
-----added node: TRN_4
------done curr build graph
--- DFAGraph for #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
return ;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for return ;
has 0 nodes
------0007------ exit buildCompound for loop
------ ret.size > 0------
------ exit buildCompound with NO wrap, return ret------
------done curr build graph
------done curr build graph
------008------ HTGraph.java DFAGraph dfag = buildGraph(trv)


PRINT-GRAPH OUTPUT

	 ====================
	| Graph: matrixMul  L1
		 |
		 V
	 --------------------
	| FOR_HTG_TRN_0
	|  type: FOR
	|  tdep: false
	 --------------------

		 ====================
		| Graph: HTG_TRN_0  L2
			 |
			 V
		 --------------------
		| TRN_0
		|  ParentNode: FOR_HTG_TRN_0
		|  type: TRN
		 --------------------
			 |
			 V
		 --------------------
		| SNC_1
		|  ParentNode: FOR_HTG_TRN_0
		|  type: SNC
		 --------------------
			 |
			 V
		 --------------------
		| FOR_HTG_CMP_2
		|  ParentNode: FOR_HTG_TRN_0
		|  type: FOR
		|  tdep: false
		 --------------------

			 ====================
			| Graph: HTG_CMP_2  L3
				 |
				 V
			 --------------------
			| CMP_2
			|  ParentNode: FOR_HTG_CMP_2
			|  type: CMP
			|  Addr-Use: false
			 --------------------
			\===== HTG_CMP_2 =====/

			 |
			 V
		 --------------------
		| SNC_3
		|  ParentNode: FOR_HTG_TRN_0
		|  type: SNC
		 --------------------
		\===== HTG_TRN_0 =====/

		 |
		 V
	 --------------------
	| TRN_4
	|  type: TRN
	 --------------------
	\===== matrixMul =====/

*** CF Node Info Begin ***
FOR_HTG_TRN_0 info:
     - uniform: false     - SubTypes: [TRN, CMP, SNC]
*** CF Node Info End ***
*** Number of Tasks in matrixMul :3
---- Target: TRN_0 ----
    nodes #: 1
       TRN_0
       Node Types: [TRN]
       uniform: true

 **** TLOOPS(1) ****
 TLOOP 0
---- Target: TRN_0 ----
    nodes #: 1
       TRN_0
       Node Types: [TRN]
       uniform: true



----addStatementBefore----index is:2
----addStatementBefore----index is:3
---- Target: SNC_1 ----
    nodes #: 3
       SNC_1
       FOR_HTG_CMP_2
       SNC_3
       Node Types: [CMP, SNC]
       uniform: true

 **** TLOOPS(1) ****
 TLOOP 0
---- Target: FOR_HTG_CMP_2 ----
    nodes #: 1
       FOR_HTG_CMP_2
       Node Types: [CMP]
       uniform: true



----addStatementBefore----index is:8
----addStatementBefore----index is:1
---- Target: TRN_4 ----
    nodes #: 1
       TRN_4
       Node Types: [TRN]
       uniform: true

 **** TLOOPS(1) ****
 TLOOP 0
---- Target: TRN_4 ----
    nodes #: 1
       TRN_4
       Node Types: [TRN]
       uniform: true



----addStatementBefore----index is:28
----addStatementBefore----index is:29
-----kernelTransformPass, finish transformProcedure-----, proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=false begin=true 
#pragma fcuda tloop name=TRN_0 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_0 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=true begin=false 
#pragma fcuda compute cores=1 name=SNC_1 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 tlpName=FOR_HTG_CMP_2 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=true begin=false 
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_1 end=true begin=false 
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_4 end=false begin=true 
#pragma fcuda tloop name=TRN_4 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 tlpName=TRN_4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma fcuda tloop name=TRN_4 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_4 end=true begin=false 
return ;
}

[AnnotateTasks-FCUDA] end in 0.02 seconds
[LinkSymbol] 81 updates in 0.00 seconds

*** After AnnotateTasks  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=false begin=true 
#pragma fcuda tloop name=TRN_0 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_0 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=true begin=false 
#pragma fcuda compute cores=1 name=SNC_1 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 tlpName=FOR_HTG_CMP_2 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=true begin=false 
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_1 end=true begin=false 
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_4 end=false begin=true 
#pragma fcuda tloop name=TRN_4 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 tlpName=TRN_4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma fcuda tloop name=TRN_4 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_4 end=true begin=false 
return ;
}



===========================================
[PrivatizeScalars-FCUDA] begin
[PrivatizeScalars-FCUDA] examining procedure matrixMul
----FcudaGlobalData2.java start----
-----cetus application IPChainAnalysis start----
-----cetus application IPChainAnalysis 1----
------IPChainAnalysis.java PerformAliasAnalysis start----
-------IPPointsToAnalysis.java IPPointsToAnalysis start super----
--------IPAnalysis.java IPAnalysis start 1----
--------IPAnalysis.java IPAnalysis start 2----
[NormalizeReturn] begin
*AP* procedure: __syncthreads
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul
*AP* is_void=true
*AP* ret_expr= null
[NormalizeReturn] end in 0.00 seconds
[LinkSymbol] 81 updates in 0.00 seconds
--------IPAnalysis.java IPAnalysis start 3 enter IPA Graph----
---------IPAGraph.java finish super()----
---------IPAGraph.java start new Arraylist <IPANode>----
---------IPAGraph.java enter buildgraph<prog> 
---------IPAGraph.java enter identifyCloneableNodes
---------IPAGraph.java enter buildTopOrder
---------IPAGraph.java finish new IPA Graph
[IPA] Stops due to no flow entry
-------IPPointsToAnalysis.java IPPointsToAnalysis finished super----
-------IPPointsToAnalysis.java IPPointsToAnalysis finished 2----
-------IPPointsToAnalysis.java IPPointsToAnalysis end----
------PerformAliasAnalysis 1----
0000IPpointsToAnalysis
[IPA:PointsTo] Stops due to no flow entry
------PerformAliasAnalysis end----
-----cetus application IPChainAnalysis 2----
-----cetus application IPChainAnalysis 3----
----------------------------------------------
----start to generate CF graph with thread----
----------------------------------------------
proc now is: void __syncthreads()
{
;
return ;
}
=====
proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=false begin=true 
#pragma fcuda tloop name=TRN_0 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_0 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=true begin=false 
#pragma fcuda compute cores=1 name=SNC_1 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 tlpName=FOR_HTG_CMP_2 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=true begin=false 
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_1 end=true begin=false 
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_4 end=false begin=true 
#pragma fcuda tloop name=TRN_4 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 tlpName=TRN_4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma fcuda tloop name=TRN_4 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_4 end=true begin=false 
return ;
}
=====
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
-----cetus application IPChainAnalysis 4----
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
## Call Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Call Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: B, NODE: * B
  -DEF: C, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 tlpName=TRN_4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
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
  # parameter: B
  # parameter: C
  # parameter: A
  # Global Info (psg_entry_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Call Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Call Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref)
  -OUTdef: B, NODE: * B
  -OUTdef: C, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 tlpName=TRN_4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
  -OUTdef: A, NODE: * A
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
-----cetus application IPChainAnalysis 5----
-----cetus application IPChainAnalysis 6----
-----cetus application IPChainAnalysis 7----
-----cetus application IPChainAnalysis end----
----FcudaGlobalData2.java end----
...ps...001...before set of candidate variables to be privatized...
*** bfi: {
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub=0;
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=false begin=true 
#pragma fcuda tloop name=TRN_0 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_0 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=true begin=false 
#pragma fcuda compute cores=1 name=SNC_1 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 tlpName=FOR_HTG_CMP_2 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=true begin=false 
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_1 end=true begin=false 
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_4 end=false begin=true 
#pragma fcuda tloop name=TRN_4 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 tlpName=TRN_4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
#pragma fcuda tloop name=TRN_4 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_4 end=true begin=false 
return ;
}
*** bfi: int bx;
*** bfi: int by;
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
*** bfi: #pragma HLS INTERFACE ap_bus port=A depth=3840 
*** bfi: #pragma HLS INTERFACE ap_bus port=B depth=6144 
*** bfi: #pragma HLS INTERFACE ap_bus port=C depth=10240 
*** bfi: bx=blockIdx.x;
*** bfi: by=blockIdx.y;
*** bfi: aBegin=((wA*16)*by);
*** bfi: aEnd=((aBegin+wA)-1);
*** bfi: aStep=16;
*** bfi: bBegin=(16*bx);
*** bfi: bStep=(16*wB);
*** bfi: Csub=0;
*** bfi: a=0;
*** bfi: b=0;
*** bfi: k=0;
*** bfi: #pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=false begin=true 
#pragma fcuda tloop name=TRN_0 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_0 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=true begin=false 
#pragma fcuda compute cores=1 name=SNC_1 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 tlpName=FOR_HTG_CMP_2 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=true begin=false 
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_1 end=true begin=false 
}
*** bfi: c=(((wB*16)*by)+(16*bx));
*** bfi: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_4 end=false begin=true 
*** bfi: #pragma fcuda tloop name=TRN_4 end=false begin=true 
*** tloop pragma: #pragma fcuda tloop name=TRN_4 end=false begin=true 
*** entering: TRN_4
*** bfi: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 tlpName=TRN_4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
...ps...scan...001...curTloop is: TRN_4
...ps...scan...0001...fcAnnot is: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 tlpName=TRN_4 TRNtask=true 
 - defs: [C[((c+(wB*threadIdx.y))+threadIdx.x)]]
...ps...scan...00001...defExp is: C[((c+(wB*threadIdx.y))+threadIdx.x)]
 - Is DefID:C candidate?
 - Non-Candidate defId: C
*** bfi: #pragma fcuda tloop name=TRN_4 end=true begin=false 
...ps...scan...001...curTloop is: TRN_4
...ps...scan...0001...fcAnnot is: #pragma fcuda tloop name=TRN_4 end=true begin=false 
*** tloop pragma: #pragma fcuda tloop name=TRN_4 end=true begin=false 
*** exiting: TRN_4
*** bfi: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_4 end=true begin=false 
*** bfi: return ;
*** bfi: ((a=aBegin), (b=bBegin));
*** bfi: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=false begin=true 
#pragma fcuda tloop name=TRN_0 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_0 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=true begin=false 
#pragma fcuda compute cores=1 name=SNC_1 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 tlpName=FOR_HTG_CMP_2 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=true begin=false 
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_1 end=true begin=false 
}
*** bfi: __shared__ DATATYPE As[16][16];
*** bfi: __shared__ DATATYPE Bs[16][16];
*** bfi: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=false begin=true 
*** bfi: #pragma fcuda tloop name=TRN_0 end=false begin=true 
*** tloop pragma: #pragma fcuda tloop name=TRN_0 end=false begin=true 
*** entering: TRN_0
*** bfi: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
...ps...scan...001...curTloop is: TRN_0
...ps...scan...0001...fcAnnot is: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
 - defs: [As[threadIdx.y][threadIdx.x]]
...ps...scan...00001...defExp is: As[threadIdx.y][threadIdx.x]
 - Is DefID:As candidate?
 - Non-Candidate defId: As
*** bfi: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
...ps...scan...001...curTloop is: TRN_0
...ps...scan...0001...fcAnnot is: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
 - defs: [Bs[threadIdx.y][threadIdx.x]]
...ps...scan...00001...defExp is: Bs[threadIdx.y][threadIdx.x]
 - Is DefID:Bs candidate?
 - Non-Candidate defId: Bs
*** bfi: #pragma fcuda tloop name=TRN_0 end=true begin=false 
...ps...scan...001...curTloop is: TRN_0
...ps...scan...0001...fcAnnot is: #pragma fcuda tloop name=TRN_0 end=true begin=false 
*** tloop pragma: #pragma fcuda tloop name=TRN_0 end=true begin=false 
*** exiting: TRN_0
*** bfi: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=true begin=false 
*** bfi: #pragma fcuda compute cores=1 name=SNC_1 end=false begin=true 
*** bfi: #pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
*** bfi: {
lp1:
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 tlpName=FOR_HTG_CMP_2 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=true begin=false 
}
*** bfi: #pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
*** bfi: #pragma fcuda compute cores=1 name=SNC_1 end=true begin=false 
*** bfi: lp1:
*** bfi: #pragma fcuda tloop name=FOR_HTG_CMP_2 end=false begin=true 
*** tloop pragma: #pragma fcuda tloop name=FOR_HTG_CMP_2 end=false begin=true 
*** entering: FOR_HTG_CMP_2
*** bfi: #pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 tlpName=FOR_HTG_CMP_2 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
...ps...scan...001...curTloop is: FOR_HTG_CMP_2
...ps...scan...0001...fcAnnot is: #pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 tlpName=FOR_HTG_CMP_2 
 - defs: [k, k, Csub]
...ps...scan...00001...defExp is: k
 - Is DefID:k candidate?
     - with TRV USE:k<16
     - with TRV USE:#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
     - with TRV USE:#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
     - with TRV USE: ++ k
 - Non-Candidate defId: k
...ps...scan...00001...defExp is: k
 - Is DefID:k candidate?
     - with TRV USE:k<16
     - with TRV USE:#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
     - with TRV USE:#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
     - with TRV USE: ++ k
 - Non-Candidate defId: k
...ps...scan...00001...defExp is: Csub
 - Is DefID:Csub candidate?
     - with TRV USE:#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
     - with TRV USE:#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 tlpName=TRN_4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;
 - Candidate defId: Csub
*** bfi: #pragma fcuda tloop name=FOR_HTG_CMP_2 end=true begin=false 
...ps...scan...001...curTloop is: FOR_HTG_CMP_2
...ps...scan...0001...fcAnnot is: #pragma fcuda tloop name=FOR_HTG_CMP_2 end=true begin=false 
*** tloop pragma: #pragma fcuda tloop name=FOR_HTG_CMP_2 end=true begin=false 
*** exiting: FOR_HTG_CMP_2
*** bfi: #pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
k=0;
*** bfi: #pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
*** bfi: #pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
...ps...002...after scanTLoops_candidateVars...
...ps...002...candidateVars is: [Csub]
...ps...002...end of candidateVars print...
Privatization candidates for matrixMul: [Csub]
....ps....09....candVars is: [Csub]
....ps....09.01....for loop curr idExp is: Csub
....ps....09.02....idExp.getSymbol, origDeclor is: Csub
....ps....09.04....defSyms.containsKey(origDeclor) is: false
....ps....09.04....defSyms before put is: {}
....ps....09.04....curr origDeclor is: Csub
....ps....09.04....curr symtarg is: fcuda.analysis.SymTarget@27f723
....ps....09.05....defSyms after put is: {Csub=fcuda.analysis.SymTarget@27f723}
....ps....10.....defSyms.keySet is: [Csub]
....ps....10.01....for loop curr defSym is: Csub
 - Privatizing SymTarget:
---- Symbol: Csub ----
 ***   mDefUses: 
{71194203=[2006034581, 916419490], 457357179=[2006034581, 916419490]}
 ***   Candidate Defs: 1  [71194203]
 - 71194203 : #pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
 ***   non-Candidate Defs: 1
 - 457357179 : Csub=0;
 ***   Symbol Uses: 
[#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);, #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 tlpName=TRN_4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub;]
....ps....10.02....defSym is: Csub
....ps....10.02....defSym.getDeclaration, origDecl is: DATATYPE Csub
  *** Using clone for tIdx.y ***
  *** Using clone for tIdx.x ***
Replaced 1 candidate defs
Replaced 2 candidate uses
Replaced 1 non-candidate defs with cand uses
Replaced 0 non-candidate uses
....privatize....10.02....origDecl is: DATATYPE Csub
....privatize....10.02....origDecl.getParent is: DATATYPE Csub;
....privatize....10.02....blockDecl is: __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
....privatize....10.02....blockDecl.parent is: null
....privatize....10.02....compoundStatement.class is: class cetus.hir.CompoundStatement
....IRTools....getAncestorOfType....first argu t is not null....
....IRTools....t.parent, ret is: DATATYPE Csub;
....IRTools....type.isInstance(ret) is: false
....IRTools....ret = ret.parent, ret is: {
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub_block[threadIdx.y][threadIdx.x]=0;
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=false begin=true 
#pragma fcuda tloop name=TRN_0 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_0 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=true begin=false 
#pragma fcuda compute cores=1 name=SNC_1 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 tlpName=FOR_HTG_CMP_2 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=true begin=false 
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_1 end=true begin=false 
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_4 end=false begin=true 
#pragma fcuda tloop name=TRN_4 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 tlpName=TRN_4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_4 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_4 end=true begin=false 
return ;
}
....IRTools....type.isInstance(ret) is: true
....privatize....10.03....parCmpd is: {
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
Csub_block[threadIdx.y][threadIdx.x]=0;
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_0 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=false begin=true 
#pragma fcuda tloop name=TRN_0 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_0 HTGNode=TRN_0 tdep=true seqID=0 tlpName=TRN_0 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_0 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_0 end=true begin=false 
#pragma fcuda compute cores=1 name=SNC_1 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_1 HTGNode=SNC_1 tdep=true seqID=1 
__syncthreads();
{
lp1:
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 tlpName=FOR_HTG_CMP_2 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_2 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_2 
{
#pragma fcuda stmt name=CMP_2 HTGNode=CMP_2 tdep_vars=[Bs, As, Csub] tdep=true seqID=2 tlpName=FOR_HTG_CMP_2 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_2 end=true begin=false 
}
#pragma fcuda stmt SNCtask=true name=SNC_3 HTGNode=SNC_3 tdep=true seqID=3 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_1 end=true begin=false 
}
c=(((wB*16)*by)+(16*bx));
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_4 end=false begin=true 
#pragma fcuda tloop name=TRN_4 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_4 HTGNode=TRN_4 tdep_vars=[Csub] tdep=true seqID=4 tlpName=TRN_4 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_4 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_4 end=true begin=false 
return ;
}
....CompoundStmt...addDecAfter...01
....CompoundStmt...addDecAfter...02
001
002
003---------------------------------------------------------------------------------------------------------------------------------------------------
----Collect global-memory arrays/pointers symbols (includes __constant__ symbols): glMemArraySet = GlobalMemUtils.getGlobMemSymbols(mProcedure)-------
------------------------------------------------------------------------------------------------------------------------------------------------------
----[* A, * C, * B]----
----1.1----mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
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


As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];



__syncthreads();
{
lp1:

for (k=0; k<16;  ++ k)
{
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
__syncthreads();

}
c=(((wB*16)*by)+(16*bx));


C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];


return ;
}

Global-Mem Arrays: [* A, * C, * B]
----now identifyGlmemAccs----
PointerSet: [* A, * C, * B]
findGMrefs for: A
---before continue, GM refs in ArrayAccess format already----
findGMrefs for: B
---before continue, GM refs in ArrayAccess format already----
findGMrefs for: C
---before continue, GM refs in ArrayAccess format already----
AliasSet: []
derefAccs: []
004---------------------------------------------------------------------------------------------------------------------------------------------------
----Convert dereference-based global-mem accesses to array-accesses and find global-mem aliases: identifyGlMemAccs();-------
------------------------------------------------------------------------------------------------------------------------------------------------------
----1.2----mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
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


As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];



__syncthreads();
{
lp1:

for (k=0; k<16;  ++ k)
{
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
__syncthreads();

}
c=(((wB*16)*by)+(16*bx));


C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];


return ;
}

----now handleMixStmts----
getMixdStmts Symbols: [* A, * C, * B]
getMixdStmts Global Symbols: [* A, * C, * B]
getMixdStmts Alias Symbols: []
symUses: [A]
Contained GM Ref: A[((a+(wA*threadIdx.y))+threadIdx.x)]
Candidate MIXED stmt: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
symUses: [B]
Contained GM Ref: B[((b+(wB*threadIdx.y))+threadIdx.x)]
Candidate MIXED stmt: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
symUses: [C]
Contained GM Ref: C[((c+(wB*threadIdx.y))+threadIdx.x)]
Candidate MIXED stmt: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
mixdStmts: []
--------------------------------
005---------------------------------------------------------------------------------------------------------------------------------------------------
----Eliminate MIXED statements (i.e. statements that contain both COMPUTE & TRANSFER parts): handleMixStmts();-------
------------------------------------------------------------------------------------------------------------------------------------------------------
----1.3----mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
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


As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];



__syncthreads();
{
lp1:

for (k=0; k<16;  ++ k)
{
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
__syncthreads();

}
c=(((wB*16)*by)+(16*bx));


C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];


return ;
}

----FcudaGlobalData2.java start----
-----cetus application IPChainAnalysis start----
-----cetus application IPChainAnalysis 1----
------IPChainAnalysis.java PerformAliasAnalysis start----
-------IPPointsToAnalysis.java IPPointsToAnalysis start super----
--------IPAnalysis.java IPAnalysis start 1----
--------IPAnalysis.java IPAnalysis start 2----
[NormalizeReturn] begin
*AP* procedure: __syncthreads
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul
*AP* is_void=true
*AP* ret_expr= null
[NormalizeReturn] end in 0.00 seconds
[LinkSymbol] 93 updates in 0.00 seconds
--------IPAnalysis.java IPAnalysis start 3 enter IPA Graph----
---------IPAGraph.java finish super()----
---------IPAGraph.java start new Arraylist <IPANode>----
---------IPAGraph.java enter buildgraph<prog> 
---------IPAGraph.java enter identifyCloneableNodes
---------IPAGraph.java enter buildTopOrder
---------IPAGraph.java finish new IPA Graph
[IPA] Stops due to no flow entry
-------IPPointsToAnalysis.java IPPointsToAnalysis finished super----
-------IPPointsToAnalysis.java IPPointsToAnalysis finished 2----
-------IPPointsToAnalysis.java IPPointsToAnalysis end----
------PerformAliasAnalysis 1----
0000IPpointsToAnalysis
[IPA:PointsTo] Stops due to no flow entry
------PerformAliasAnalysis end----
-----cetus application IPChainAnalysis 2----
-----cetus application IPChainAnalysis 3----
----------------------------------------------
----start to generate CF graph with thread----
----------------------------------------------
proc now is: void __syncthreads()
{
;
return ;
}
=====
proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
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


As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];



__syncthreads();
{
lp1:

for (k=0; k<16;  ++ k)
{
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
__syncthreads();

}
c=(((wB*16)*by)+(16*bx));


C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];


return ;
}
=====
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
-----cetus application IPChainAnalysis 4----
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
  -DEF: C, NODE: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
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
  -OUTdef: C, NODE: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTdef: B, NODE: * B
  -OUTdef: A, NODE: * A
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
-----cetus application IPChainAnalysis 5----
-----cetus application IPChainAnalysis 6----
-----cetus application IPChainAnalysis 7----
-----cetus application IPChainAnalysis end----
----FcudaGlobalData2.java end----
----1.4----mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
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


As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];



__syncthreads();
{
lp1:

for (k=0; k<16;  ++ k)
{
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
__syncthreads();

}
c=(((wB*16)*by)+(16*bx));


C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];


return ;
}

006
Instances of tidx: [threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx, threadIdx]
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Csub_block[threadIdx.y][threadIdx.x]=0;
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Csub_block[threadIdx.y][threadIdx.x]=0;
----c.1---- idx is: threadIdx
----c.1---- parStmt is: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
----c.1---- idx is: threadIdx
----c.1---- parStmt is: Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
----c.1---- idx is: threadIdx
----c.1---- parStmt is: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
----c.1---- idx is: threadIdx
----c.1---- parStmt is: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
defIDs: [Csub_block, Csub_block, As, As, As, As, Bs, Bs, Bs, Bs, Csub_block, Csub_block, Csub_block, Csub_block, C, C, C, C]
Looking for uses of: Csub_block
... in: Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... useID: Csub_block
... in: C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
... useID: Csub_block
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... in: #pragma fcuda stmt tdep_vars=[Csub_block] 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... useID: As
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[As, Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[As, Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
Looking for uses of: As
... in: #pragma fcuda stmt tdep_vars=[As, Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[As, Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... useID: Bs
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[Bs, As, Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[Bs, As, Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
Looking for uses of: Bs
... in: #pragma fcuda stmt tdep_vars=[Bs, As, Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[Bs, As, Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... in: #pragma fcuda stmt tdep_vars=[Csub_block] 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[Bs, As, Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... in: #pragma fcuda stmt tdep_vars=[Csub_block] 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[Bs, As, Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... in: #pragma fcuda stmt tdep_vars=[Csub_block] 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[Bs, As, Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... in: #pragma fcuda stmt tdep_vars=[Csub_block] 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
Looking for uses of: C
Looking for uses of: C
Looking for uses of: C
Looking for uses of: C
defIDs: [Csub_block, C, Csub_block, Csub_block]
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[Bs, As, Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... in: #pragma fcuda stmt tdep_vars=[Csub_block] 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
Looking for uses of: C
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[Bs, As, Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... in: #pragma fcuda stmt tdep_vars=[Csub_block] 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
Looking for uses of: Csub_block
... in: #pragma fcuda stmt tdep_vars=[Bs, As, Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
... in: #pragma fcuda stmt tdep_vars=[Csub_block] 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
----c.2---- tDepStmt is: #pragma fcuda stmt tdep_vars=[Csub_block] 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
----c.2---- tDepStmt is: As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
----c.21---- tDepStmt is: #pragma fcuda stmt tdep=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
----c.2---- tDepStmt is: Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
----c.21---- tDepStmt is: #pragma fcuda stmt tdep=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
----c.2---- tDepStmt is: Csub_block[threadIdx.y][threadIdx.x]=0;
----c.21---- tDepStmt is: #pragma fcuda stmt tdep=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
----c.2---- tDepStmt is: #pragma fcuda stmt tdep_vars=[Bs, As, Csub_block] 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
----1.5----mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda stmt tdep=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda stmt tdep=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt tdep=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];



__syncthreads();
{
lp1:

for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt tdep_vars=[Bs, As, Csub_block] tdep=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
__syncthreads();

}
c=(((wB*16)*by)+(16*bx));


#pragma fcuda stmt tdep_vars=[Csub_block] tdep=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];


return ;
}

007
findTransferStmts Symbols: [* A, * C, * B]
findTransferStmts non-Const Symbols: [* A, * C, * B]
findTransferStmts for: A
findTransferStmts for: B
findTransferStmts for: C
INFO - findTransferStmts:  12 address index IDs
....IPChainAnalysis getDefList....
INFO - findTransferStmts: 2 defStmts for addrID: a
INFO - findTransferStmts: Corner case forloop definition: ((a=aBegin), (b=bBegin));
WARNING - findTransferStmts: Definition of class: class cetus.hir.CommaExpression
          ((a+=aStep), (b+=bStep))
....IPChainAnalysis getDefList....
INFO - findTransferStmts: 1 defStmts for addrID: wA
WARNING - findTransferStmts: Definition of class: class cetus.hir.VariableDeclarator
          wA
....IPChainAnalysis getDefList....
INFO - findTransferStmts: 2 defStmts for addrID: b
INFO - findTransferStmts: Corner case forloop definition: ((a=aBegin), (b=bBegin));
WARNING - findTransferStmts: Definition of class: class cetus.hir.CommaExpression
          ((a+=aStep), (b+=bStep))
....IPChainAnalysis getDefList....
INFO - findTransferStmts: 1 defStmts for addrID: wB
WARNING - findTransferStmts: Definition of class: class cetus.hir.VariableDeclarator
          wB
....IPChainAnalysis getDefList....
INFO - findTransferStmts: 1 defStmts for addrID: c
....IPChainAnalysis getDefList....
INFO - findTransferStmts: 1 defStmts for addrID: wB
WARNING - findTransferStmts: Definition of class: class cetus.hir.VariableDeclarator
          wB
----1.6----mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda stmt tdep=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda stmt rdNwrt=true GLBpntr=A tdep=true TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B tdep=true TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];



__syncthreads();
{
lp1:

for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt tdep_vars=[Bs, As, Csub_block] tdep=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
__syncthreads();

}
c=(((wB*16)*by)+(16*bx));


#pragma fcuda stmt rdNwrt=false GLBpntr=C tdep_vars=[Csub_block] tdep=true TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];


return ;
}

008
----1.7----mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda stmt name=CMP_5 tdep=true seqID=5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 tdep=true seqID=6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 tdep=true seqID=6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];



#pragma fcuda stmt SNCtask=true name=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
#pragma fcuda stmt SNCtask=true name=SNC_9 tdep=true seqID=9 
__syncthreads();

}
c=(((wB*16)*by)+(16*bx));


#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];


return ;
}

009_finish
------001------ HTGraph.java super()
------002------ HTGraph.java curTask = new String()
------003------ HTGraph.java HTGName = new String(name)
------004------ HTGraph.java if(trv instanceof Procedure)
------005------ HTGraph.java mProcedure = (Procedure) trv
------007------ HTGraph.java before build graph
------0007------ t is procedure now
------0007------ t is procedure now, getbody
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda stmt name=CMP_5 tdep=true seqID=5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 tdep=true seqID=6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 tdep=true seqID=6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];



#pragma fcuda stmt SNCtask=true name=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
#pragma fcuda stmt SNCtask=true name=SNC_9 tdep=true seqID=9 
__syncthreads();

}
c=(((wB*16)*by)+(16*bx));


#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];


return ;
}
------0007------ t is CompoundStatement now
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda stmt name=CMP_5 tdep=true seqID=5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
a=0;
b=0;
k=0;
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 tdep=true seqID=6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 tdep=true seqID=6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];



#pragma fcuda stmt SNCtask=true name=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
#pragma fcuda stmt SNCtask=true name=SNC_9 tdep=true seqID=9 
__syncthreads();

}
c=(((wB*16)*by)+(16*bx));


#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];


return ;
}
------0007------ buildCompound cStmt getChildren
[int bx;, int by;, int aBegin;, int aEnd;, int aStep;, int bBegin;, int bStep;, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];, int a;, int b;, int k;, int c;, #pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , bx=blockIdx.x;, by=blockIdx.y;, aBegin=((wA*16)*by);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*bx);, bStep=(16*wB);, #pragma fcuda stmt name=CMP_5 tdep=true seqID=5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;, a=0;, b=0;, k=0;, for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 tdep=true seqID=6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 tdep=true seqID=6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];



#pragma fcuda stmt SNCtask=true name=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
#pragma fcuda stmt SNCtask=true name=SNC_9 tdep=true seqID=9 
__syncthreads();

}, c=(((wB*16)*by)+(16*bx));, , , #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];, , , return ;]
------0007------ buildCompound for(Traversable trv : children), current trv is
int bx;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int bx;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int by;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int by;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int aBegin;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int aBegin;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int aEnd;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int aEnd;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int aStep;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int aStep;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int bBegin;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int bBegin;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int bStep;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int bStep;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
__shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int a;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int a;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int b;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int b;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int k;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int k;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
int c;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for int c;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma HLS INTERFACE ap_bus port=A depth=3840 
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for #pragma HLS INTERFACE ap_bus port=A depth=3840 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma HLS INTERFACE ap_bus port=B depth=6144 
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for #pragma HLS INTERFACE ap_bus port=B depth=6144 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma HLS INTERFACE ap_bus port=C depth=10240 
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for #pragma HLS INTERFACE ap_bus port=C depth=10240 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
bx=blockIdx.x;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for bx=blockIdx.x;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
by=blockIdx.y;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for by=blockIdx.y;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
aBegin=((wA*16)*by);
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for aBegin=((wA*16)*by);
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
aEnd=((aBegin+wA)-1);
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for aEnd=((aBegin+wA)-1);
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
aStep=16;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for aStep=16;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
bBegin=(16*bx);
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for bBegin=(16*bx);
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
bStep=(16*wB);
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for bStep=(16*wB);
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt name=CMP_5 tdep=true seqID=5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, COM task----
-----added node: CMP_5
------done curr build graph
--- DFAGraph for #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
a=0;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for a=0;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
b=0;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for b=0;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
k=0;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for k=0;
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 tdep=true seqID=6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 tdep=true seqID=6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];



#pragma fcuda stmt SNCtask=true name=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
#pragma fcuda stmt SNCtask=true name=SNC_9 tdep=true seqID=9 
__syncthreads();

}
------ for loop current trv is not compound
------0007------ t is ForLoop now
------0007------ t is CompoundStatement now
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 tdep=true seqID=6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 tdep=true seqID=6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];



#pragma fcuda stmt SNCtask=true name=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
#pragma fcuda stmt SNCtask=true name=SNC_9 tdep=true seqID=9 
__syncthreads();

}
------0007------ buildCompound cStmt getChildren
[__shared__ DATATYPE As[16][16];, __shared__ DATATYPE Bs[16][16];, , , #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 tdep=true seqID=6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 tdep=true seqID=6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, , , , #pragma fcuda stmt SNCtask=true name=SNC_7 tdep=true seqID=7 
__syncthreads();, {
lp1:

for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}, #pragma fcuda stmt SNCtask=true name=SNC_9 tdep=true seqID=9 
__syncthreads();, ]
------0007------ buildCompound for(Traversable trv : children), current trv is
__shared__ DATATYPE As[16][16];
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for __shared__ DATATYPE As[16][16];
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
__shared__ DATATYPE Bs[16][16];
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for __shared__ DATATYPE Bs[16][16];
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is

------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is

------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 tdep=true seqID=6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, TRN task----
-----added node: TRN_6
------done curr build graph
--- DFAGraph for #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 tdep=true seqID=6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, TRN task----
-----added node: TRN_6
------done curr build graph
--- DFAGraph for #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is

------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is

------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is

------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt SNCtask=true name=SNC_7 tdep=true seqID=7 
__syncthreads();
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, SYNC task----
-----added node: SNC_7
------done curr build graph
--- DFAGraph for #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
{
lp1:

for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
------ for loop current trv is compound
------0007------ t is CompoundStatement now
{
lp1:

for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
------0007------ buildCompound cStmt getChildren
[lp1:, , for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}, ]
------0007------ buildCompound for(Traversable trv : children), current trv is
lp1:
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for lp1:
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is

------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
------ for loop current trv is not compound
------0007------ t is ForLoop now
------0007------ t is CompoundStatement now
{
#pragma fcuda stmt name=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
------0007------ buildCompound cStmt getChildren
[#pragma fcuda stmt name=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);]
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt name=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, COM task----
-----added node: CMP_8
------done curr build graph
--- DFAGraph for #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ exit buildCompound for loop
------ ret.size > 0------
------ wrap enabled------
====== DFAGraph.java enter getFirst()
------ exit buildCompound with wrap enabled, and ret > 0, return superDFA------
------ exit buildCompound with wrap enabled, and ret == 0, return superDFA------
------done curr build graph
------ for loop ret has node------
====== DFAGraph.java enter getFirst()
------done curr build graph
--- DFAGraph for #pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is

------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for 
has 0 nodes
------0007------ exit buildCompound for loop
------ ret.size > 0------
------ exit buildCompound with NO wrap, return ret------
------done curr build graph
--- DFAGraph for {
lp1:

#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt SNCtask=true name=SNC_9 tdep=true seqID=9 
__syncthreads();
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, SYNC task----
-----added node: SNC_9
------done curr build graph
--- DFAGraph for #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is

------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for 
has 0 nodes
------0007------ exit buildCompound for loop
------ ret.size > 0------
------ wrap enabled------
====== DFAGraph.java enter getFirst()
------ exit buildCompound with wrap enabled, and ret > 0, return superDFA------
------ exit buildCompound with wrap enabled, and ret == 0, return superDFA------
------done curr build graph
------ for loop ret has node------
====== DFAGraph.java enter getFirst()
------done curr build graph
--- DFAGraph for #pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];



#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 
for (k=0; k<16;  ++ k)
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();

}
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is
c=(((wB*16)*by)+(16*bx));
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for c=(((wB*16)*by)+(16*bx));
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is

------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is

------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular tdep stmt, TRN task----
-----added node: TRN_10
------done curr build graph
--- DFAGraph for #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
has 1 nodes
====== DFAGraph.java enter getFirst()
------ done node = 1
------0007------ buildCompound for(Traversable trv : children), current trv is

------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is

------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for 
has 0 nodes
------0007------ buildCompound for(Traversable trv : children), current trv is
return ;
------ for loop current trv is not compound
------0007------ t is regular Statement now
------regular non-tdep stmt----
------regular non-tdep stmt----NOT TRNtask----
------done curr build graph
--- DFAGraph for return ;
has 0 nodes
------0007------ exit buildCompound for loop
------ ret.size > 0------
------ exit buildCompound with NO wrap, return ret------
------done curr build graph
------done curr build graph
------008------ HTGraph.java DFAGraph dfag = buildGraph(trv)


PRINT-GRAPH OUTPUT

	 ====================
	| Graph: matrixMul  L1
		 |
		 V
	 --------------------
	| CMP_5
	|  type: CMP
	|  Addr-Use: false
	 --------------------
		 |
		 V
	 --------------------
	| FOR_HTG_TRN_6
	|  type: FOR
	|  tdep: false
	 --------------------

		 ====================
		| Graph: HTG_TRN_6  L2
			 |
			 V
		 --------------------
		| TRN_6
		|  ParentNode: FOR_HTG_TRN_6
		|  type: TRN
		 --------------------
			 |
			 V
		 --------------------
		| SNC_7
		|  ParentNode: FOR_HTG_TRN_6
		|  type: SNC
		 --------------------
			 |
			 V
		 --------------------
		| FOR_HTG_CMP_8
		|  ParentNode: FOR_HTG_TRN_6
		|  type: FOR
		|  tdep: false
		 --------------------

			 ====================
			| Graph: HTG_CMP_8  L3
				 |
				 V
			 --------------------
			| CMP_8
			|  ParentNode: FOR_HTG_CMP_8
			|  type: CMP
			|  Addr-Use: false
			 --------------------
			\===== HTG_CMP_8 =====/

			 |
			 V
		 --------------------
		| SNC_9
		|  ParentNode: FOR_HTG_TRN_6
		|  type: SNC
		 --------------------
		\===== HTG_TRN_6 =====/

		 |
		 V
	 --------------------
	| TRN_10
	|  type: TRN
	 --------------------
	\===== matrixMul =====/

*** CF Node Info Begin ***
FOR_HTG_TRN_6 info:
     - uniform: false     - SubTypes: [TRN, CMP, SNC]
*** CF Node Info End ***
*** Number of Tasks in matrixMul :4
---- Target: CMP_5 ----
    nodes #: 1
       CMP_5
       Node Types: [CMP]
       uniform: true

 **** TLOOPS(1) ****
 TLOOP 0
---- Target: CMP_5 ----
    nodes #: 1
       CMP_5
       Node Types: [CMP]
       uniform: true



----addStatementBefore----index is:22
----addStatementBefore----index is:23
---- Target: TRN_6 ----
    nodes #: 1
       TRN_6
       Node Types: [TRN]
       uniform: true

 **** TLOOPS(1) ****
 TLOOP 0
---- Target: TRN_6 ----
    nodes #: 1
       TRN_6
       Node Types: [TRN]
       uniform: true



----addStatementBefore----index is:4
----addStatementBefore----index is:5
---- Target: SNC_7 ----
    nodes #: 3
       SNC_7
       FOR_HTG_CMP_8
       SNC_9
       Node Types: [CMP, SNC]
       uniform: true

 **** TLOOPS(1) ****
 TLOOP 0
---- Target: FOR_HTG_CMP_8 ----
    nodes #: 1
       FOR_HTG_CMP_8
       Node Types: [CMP]
       uniform: true



----addStatementBefore----index is:13
----addStatementBefore----index is:2
---- Target: TRN_10 ----
    nodes #: 1
       TRN_10
       Node Types: [TRN]
       uniform: true

 **** TLOOPS(1) ****
 TLOOP 0
---- Target: TRN_10 ----
    nodes #: 1
       TRN_10
       Node Types: [TRN]
       uniform: true



----addStatementBefore----index is:34
----addStatementBefore----index is:35
-----kernelTransformPass, finish transformProcedure-----, proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*by)+(16*bx));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

[PrivatizeScalars-FCUDA] end in 0.36 seconds
[LinkSymbol] 93 updates in 0.00 seconds

*** After PrivatizeScalars  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*by)+(16*bx));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}



===========================================
----FcudaGlobalData2.java start----
-----cetus application IPChainAnalysis start----
-----cetus application IPChainAnalysis 1----
------IPChainAnalysis.java PerformAliasAnalysis start----
-------IPPointsToAnalysis.java IPPointsToAnalysis start super----
--------IPAnalysis.java IPAnalysis start 1----
--------IPAnalysis.java IPAnalysis start 2----
[NormalizeReturn] begin
*AP* procedure: __syncthreads
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul
*AP* is_void=true
*AP* ret_expr= null
[NormalizeReturn] end in 0.00 seconds
[LinkSymbol] 93 updates in 0.00 seconds
--------IPAnalysis.java IPAnalysis start 3 enter IPA Graph----
---------IPAGraph.java finish super()----
---------IPAGraph.java start new Arraylist <IPANode>----
---------IPAGraph.java enter buildgraph<prog> 
---------IPAGraph.java enter identifyCloneableNodes
---------IPAGraph.java enter buildTopOrder
---------IPAGraph.java finish new IPA Graph
[IPA] Stops due to no flow entry
-------IPPointsToAnalysis.java IPPointsToAnalysis finished super----
-------IPPointsToAnalysis.java IPPointsToAnalysis finished 2----
-------IPPointsToAnalysis.java IPPointsToAnalysis end----
------PerformAliasAnalysis 1----
0000IPpointsToAnalysis
[IPA:PointsTo] Stops due to no flow entry
------PerformAliasAnalysis end----
-----cetus application IPChainAnalysis 2----
-----cetus application IPChainAnalysis 3----
----------------------------------------------
----start to generate CF graph with thread----
----------------------------------------------
proc now is: void __syncthreads()
{
;
return ;
}
=====
====== DFAGraph.java enter getFirst()
proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
int bx;
int by;
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
bx=blockIdx.x;
by=blockIdx.y;
aBegin=((wA*16)*by);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*bx);
bStep=(16*wB);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*by)+(16*bx));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
=====
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
-----cetus application IPChainAnalysis 4----
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
## Call Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Call Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: C, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
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
## Call Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Call Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref)
  -OUTdef: C, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTdef: B, NODE: * B
  -OUTdef: A, NODE: * A
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
-----cetus application IPChainAnalysis 5----
-----cetus application IPChainAnalysis 6----
-----cetus application IPChainAnalysis 7----
-----cetus application IPChainAnalysis end----
----FcudaGlobalData2.java end----
DEF::
########################## (printDefUseChain) Procedure: __syncthreads
#######################################################################
########################## (printDefUseChain) Procedure: matrixMul
Def[0]: C, IR: * C
Def[1]: A, IR: * A
  --> Use: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, proc: matrixMul
Def[2]: B, IR: * B
  --> Use: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, proc: matrixMul
Def[3]: wA, IR: wA
  --> Use: aBegin=((wA*16)*by);, proc: matrixMul
  --> Use: aEnd=((aBegin+wA)-1);, proc: matrixMul
  --> Use: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, proc: matrixMul
Def[4]: wB, IR: wB
  --> Use: bStep=(16*wB);, proc: matrixMul
  --> Use: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, proc: matrixMul
  --> Use: c=(((wB*16)*by)+(16*bx));, proc: matrixMul
  --> Use: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];, proc: matrixMul
Def[5]: bx, IR: bx=blockIdx.x;
  --> Use: bBegin=(16*bx);, proc: matrixMul
  --> Use: c=(((wB*16)*by)+(16*bx));, proc: matrixMul
Def[6]: by, IR: by=blockIdx.y;
  --> Use: aBegin=((wA*16)*by);, proc: matrixMul
  --> Use: c=(((wB*16)*by)+(16*bx));, proc: matrixMul
Def[7]: aBegin, IR: aBegin=((wA*16)*by);
  --> Use: aEnd=((aBegin+wA)-1);, proc: matrixMul
  --> Use: ((a=aBegin), (b=bBegin));, proc: matrixMul
Def[8]: aEnd, IR: aEnd=((aBegin+wA)-1);
  --> Use: a<=aEnd, proc: matrixMul
Def[9]: aStep, IR: aStep=16;
  --> Use: ((a+=aStep), (b+=bStep)), proc: matrixMul
Def[10]: bBegin, IR: bBegin=(16*bx);
  --> Use: ((a=aBegin), (b=bBegin));, proc: matrixMul
Def[11]: bStep, IR: bStep=(16*wB);
  --> Use: ((a+=aStep), (b+=bStep)), proc: matrixMul
Def[12]: Csub_block, IR: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  --> Use: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);, proc: matrixMul
  --> Use: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];, proc: matrixMul
Def[13]: a, IR: a=0;
Def[14]: b, IR: b=0;
Def[15]: k, IR: k=0;
Def[16]: a, IR: ((a=aBegin), (b=bBegin));
  --> Use: a<=aEnd, proc: matrixMul
  --> Use: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, proc: matrixMul
  --> Use: ((a+=aStep), (b+=bStep)), proc: matrixMul
Def[17]: b, IR: ((a=aBegin), (b=bBegin));
  --> Use: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, proc: matrixMul
  --> Use: ((a+=aStep), (b+=bStep)), proc: matrixMul
Def[18]: As, IR: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  --> Use: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);, proc: matrixMul
Def[19]: Bs, IR: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  --> Use: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);, proc: matrixMul
Def[20]: k, IR: #pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0;
  --> Use: k<16, proc: matrixMul
  --> Use: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);, proc: matrixMul
  --> Use: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);, proc: matrixMul
  --> Use:  ++ k, proc: matrixMul
Def[21]: Csub_block, IR: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  --> Use: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);, proc: matrixMul
  --> Use: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];, proc: matrixMul
Def[22]: k, IR:  ++ k
  --> Use: k<16, proc: matrixMul
  --> Use: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);, proc: matrixMul
  --> Use: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);, proc: matrixMul
  --> Use:  ++ k, proc: matrixMul
Def[23]: a, IR: ((a+=aStep), (b+=bStep))
  --> Use: a<=aEnd, proc: matrixMul
  --> Use: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, proc: matrixMul
  --> Use: ((a+=aStep), (b+=bStep)), proc: matrixMul
Def[24]: b, IR: ((a+=aStep), (b+=bStep))
  --> Use: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, proc: matrixMul
  --> Use: ((a+=aStep), (b+=bStep)), proc: matrixMul
Def[25]: c, IR: c=(((wB*16)*by)+(16*bx));
  --> Use: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];, proc: matrixMul
Def[26]: C, IR: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#######################################################################
USE::
########################## (printUseDefChain) Procedure: __syncthreads
#######################################################################
########################## (printUseDefChain) Procedure: matrixMul
Use[0]: wA, IR: aBegin=((wA*16)*by);
....IPChainAnalysis getDefList....
  --> Def: wA, proc: matrixMul
Use[1]: by, IR: aBegin=((wA*16)*by);
....IPChainAnalysis getDefList....
  --> Def: by=blockIdx.y;, proc: matrixMul
Use[2]: aBegin, IR: aEnd=((aBegin+wA)-1);
....IPChainAnalysis getDefList....
  --> Def: aBegin=((wA*16)*by);, proc: matrixMul
Use[3]: wA, IR: aEnd=((aBegin+wA)-1);
....IPChainAnalysis getDefList....
  --> Def: wA, proc: matrixMul
Use[4]: bx, IR: bBegin=(16*bx);
....IPChainAnalysis getDefList....
  --> Def: bx=blockIdx.x;, proc: matrixMul
Use[5]: wB, IR: bStep=(16*wB);
....IPChainAnalysis getDefList....
  --> Def: wB, proc: matrixMul
Use[6]: aBegin, IR: ((a=aBegin), (b=bBegin));
....IPChainAnalysis getDefList....
  --> Def: aBegin=((wA*16)*by);, proc: matrixMul
Use[7]: bBegin, IR: ((a=aBegin), (b=bBegin));
....IPChainAnalysis getDefList....
  --> Def: bBegin=(16*bx);, proc: matrixMul
Use[8]: a, IR: a<=aEnd
....IPChainAnalysis getDefList....
  --> Def: ((a=aBegin), (b=bBegin));, proc: matrixMul
  --> Def: ((a+=aStep), (b+=bStep)), proc: matrixMul
Use[9]: aEnd, IR: a<=aEnd
....IPChainAnalysis getDefList....
  --> Def: aEnd=((aBegin+wA)-1);, proc: matrixMul
Use[10]: a, IR: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
....IPChainAnalysis getDefList....
  --> Def: ((a=aBegin), (b=bBegin));, proc: matrixMul
  --> Def: ((a+=aStep), (b+=bStep)), proc: matrixMul
Use[11]: wA, IR: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
....IPChainAnalysis getDefList....
  --> Def: wA, proc: matrixMul
Use[12]: A, IR: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
....IPChainAnalysis getDefList....
  --> Def: * A, proc: matrixMul
Use[13]: b, IR: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
....IPChainAnalysis getDefList....
  --> Def: ((a=aBegin), (b=bBegin));, proc: matrixMul
  --> Def: ((a+=aStep), (b+=bStep)), proc: matrixMul
Use[14]: wB, IR: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
....IPChainAnalysis getDefList....
  --> Def: wB, proc: matrixMul
Use[15]: B, IR: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
....IPChainAnalysis getDefList....
  --> Def: * B, proc: matrixMul
Use[16]: k, IR: k<16
....IPChainAnalysis getDefList....
  --> Def: #pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0;, proc: matrixMul
  --> Def:  ++ k, proc: matrixMul
Use[17]: k, IR: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
....IPChainAnalysis getDefList....
  --> Def: #pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0;, proc: matrixMul
  --> Def:  ++ k, proc: matrixMul
Use[18]: As, IR: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
....IPChainAnalysis getDefList....
  --> Def: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, proc: matrixMul
Use[19]: k, IR: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
....IPChainAnalysis getDefList....
  --> Def: #pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0;, proc: matrixMul
  --> Def:  ++ k, proc: matrixMul
Use[20]: Bs, IR: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
....IPChainAnalysis getDefList....
  --> Def: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, proc: matrixMul
Use[21]: Csub_block, IR: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
....IPChainAnalysis getDefList....
  --> Def: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;, proc: matrixMul
  --> Def: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);, proc: matrixMul
Use[22]: k, IR:  ++ k
....IPChainAnalysis getDefList....
  --> Def: #pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0;, proc: matrixMul
  --> Def:  ++ k, proc: matrixMul
Use[23]: aStep, IR: ((a+=aStep), (b+=bStep))
....IPChainAnalysis getDefList....
  --> Def: aStep=16;, proc: matrixMul
Use[24]: a, IR: ((a+=aStep), (b+=bStep))
....IPChainAnalysis getDefList....
  --> Def: ((a=aBegin), (b=bBegin));, proc: matrixMul
  --> Def: ((a+=aStep), (b+=bStep)), proc: matrixMul
Use[25]: bStep, IR: ((a+=aStep), (b+=bStep))
....IPChainAnalysis getDefList....
  --> Def: bStep=(16*wB);, proc: matrixMul
Use[26]: b, IR: ((a+=aStep), (b+=bStep))
....IPChainAnalysis getDefList....
  --> Def: ((a=aBegin), (b=bBegin));, proc: matrixMul
  --> Def: ((a+=aStep), (b+=bStep)), proc: matrixMul
Use[27]: wB, IR: c=(((wB*16)*by)+(16*bx));
....IPChainAnalysis getDefList....
  --> Def: wB, proc: matrixMul
Use[28]: by, IR: c=(((wB*16)*by)+(16*bx));
....IPChainAnalysis getDefList....
  --> Def: by=blockIdx.y;, proc: matrixMul
Use[29]: bx, IR: c=(((wB*16)*by)+(16*bx));
....IPChainAnalysis getDefList....
  --> Def: bx=blockIdx.x;, proc: matrixMul
Use[30]: Csub_block, IR: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
....IPChainAnalysis getDefList....
  --> Def: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;, proc: matrixMul
  --> Def: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);, proc: matrixMul
Use[31]: c, IR: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
....IPChainAnalysis getDefList....
  --> Def: c=(((wB*16)*by)+(16*bx));, proc: matrixMul
Use[32]: wB, IR: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
....IPChainAnalysis getDefList....
  --> Def: wB, proc: matrixMul
#######################################################################
[SplitFcudaTasks2-FCUDA] begin
[SplitFcudaTasks2-FCUDA] examining procedure matrixMul
mVar2Var:
{a=[a, b, bStep, blockIdx, aStep, wA, bBegin, wB, aBegin], A=[], bStep=[wB], b=[a, b, bStep, blockIdx, aStep, wA, bBegin, wB, aBegin], B=[], c=[blockIdx, wB], C=[blockIdx, threadIdx, c, wB], wA=[], bBegin=[blockIdx], k=[k], wB=[], Bs=[a, b, bStep, blockIdx, threadIdx, aStep, wA, bBegin, wB, aBegin], blockIdx=[], threadIdx=[], As=[a, b, bStep, blockIdx, threadIdx, aStep, wA, bBegin, wB, aBegin], aStep=[], aEnd=[blockIdx, wA, aBegin], Csub_block=[threadIdx, k], aBegin=[blockIdx, wA]}
----SFT2_entered transformProcedure----
-----SFT2 enter new flow-----
-----SFT2 finished addAllSharedToBRAMSet(proc)-----
-----SFT2 finished FCUDAGlobalData2.setBRAMSet(mBRAMSet);-----
-----SFT2 finished proc.getBody().addANSIDeclaration(MCUDAUtils.Bidx.getDecl().get(0));-----
-----proc after proc.getbody addAnsideclaration-----
#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

-----start to decomposeKernel-----
----001----dck BFI new----
----002----annotLst bfitr getlist----
----003----annotLst bfitr getlist----
----004----asNum = annotLst size, asNum is: 31
----0041----enter for_1, curr asCnt is: 0
----0042----annotStmt is: #pragma HLS INTERFACE ap_bus port=A depth=3840 
----0043----list fcAnnots is: []
----0041----enter for_1, curr asCnt is: 1
----0042----annotStmt is: #pragma HLS INTERFACE ap_bus port=B depth=6144 
----0043----list fcAnnots is: []
----0041----enter for_1, curr asCnt is: 2
----0042----annotStmt is: #pragma HLS INTERFACE ap_bus port=C depth=10240 
----0043----list fcAnnots is: []
----0041----enter for_1, curr asCnt is: 3
----0042----annotStmt is: #pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
----0043----list fcAnnots is: [#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true ]
----00431----enter for_2 curr fcannot is: #pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
----00432----curr annotType is: compute
----00433----curr bgn is: true
----00434----curr annotType is COM or TRN
----00435----curr bgn is true
----SFT2-decompose-before sanity check, inCMP is: false, inTRN is: false, tskName is: null
----0041----enter for_1, curr asCnt is: 4
----0042----annotStmt is: #pragma fcuda tloop name=CMP_5 end=false begin=true 
----0043----list fcAnnots is: [#pragma fcuda tloop name=CMP_5 end=false begin=true ]
----00431----enter for_2 curr fcannot is: #pragma fcuda tloop name=CMP_5 end=false begin=true 
----00432----curr annotType is: tloop
----00433----curr bgn is: true
----0043A----curr annotType is not COM nor TRN
----0041----enter for_1, curr asCnt is: 5
----0042----annotStmt is: #pragma fcuda tloop name=CMP_5 end=true begin=false 
----0043----list fcAnnots is: [#pragma fcuda tloop name=CMP_5 end=true begin=false ]
----00431----enter for_2 curr fcannot is: #pragma fcuda tloop name=CMP_5 end=true begin=false 
----00432----curr annotType is: tloop
----00433----curr bgn is: false
----0043A----curr annotType is not COM nor TRN
----0041----enter for_1, curr asCnt is: 6
----0042----annotStmt is: #pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
----0043----list fcAnnots is: [#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false ]
----00431----enter for_2 curr fcannot is: #pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
----00432----curr annotType is: compute
----00433----curr bgn is: false
----00434----curr annotType is COM or TRN
----00436----curr bgn is false
----00438----enter inCMP decomposeCompute
----00438----bgnstmt is: #pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
----00438----endStmt is: #pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
----00438----tskNmae is: CMP_5

 ... Prelim task handling: matrixMul_CMP_5
...tskName is: matrixMul_CMP_5
...mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

...print current fcudaGlobalData2 tasks...
Tasks: [matrixMul_CMP_5]
....00......................................
....01....enableSignal is: guard_matrixMul_CMP_5
....02....enDeclor is: guard_matrixMul_CMP_5
....03....enableDecl is: int guard_matrixMul_CMP_5
....04....after getbody addAnsideclaration, mprocedure_body is: {
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
int guard_matrixMul_CMP_5;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
----addStatementBefore----index is:12
....05....after addAfterLastDeclaration, mprocedure_body is: {
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
int guard_matrixMul_CMP_5;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
....06....parCStmt is: {
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
int guard_matrixMul_CMP_5;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
....07....idxDif is: 2
....08....taskCall is: matrixMul_CMP_5()
....09....after addTaskCall, tskName is: matrixMul_CMP_5
....09....after addTaskCall, taskCall is: matrixMul_CMP_5()
....10....after addFcudaCore, taskCall is: matrixMul_CMP_5()
....10....after addFcudaCore, mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

Creating new FcudaCoreData for core: matrixMul_CMP_5()
....11....after setCoreName, tskName is: matrixMul_CMP_5
....11....after setCoreName, taskCall is: matrixMul_CMP_5()
....11....after setCoreName, mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

....12....sftTaskArgs size is: 0
....12....sftTaskArgs is: []
....13....sftTaskArgs size is: 1
....13....sftTaskArgs is: [guard_matrixMul_CMP_5]
....14....sftTaskArgSyms is: [guard_matrixMul_CMP_5]
....15....sftTaskDecls size is: 1
....15....sftTaskDecls is: [int guard_matrixMul_CMP_5]
....16....sftTaskArgs size is: 2
....16....sftTaskArgs is: [guard_matrixMul_CMP_5, blockDim]
....16....sftTaskDecls size is: 4
....16....sftTaskDecls is: [int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx]
....17....sftCommonArgsIndex size is: 1
....17....sftCommonArgsIndex is: [1]
....18....sftTaskArgs size is: 3
....18....sftTaskArgs is: [guard_matrixMul_CMP_5, blockDim, gridDim]
....18....sftCommonArgsIndex size is: 2
....18....sftCommonArgsIndex is: [1, 2]
....19....sftTaskArgs size is: 4
....19....sftTaskArgs is: [guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx]
....20....enableStmt is: if (guard_matrixMul_CMP_5)
{

}
....21....fcTask is: {
if (guard_matrixMul_CMP_5)
{

}
}
....22....tskStmts size is: 41
....22....tskStmts is: [int aBegin;, int aEnd;, int aStep;, int bBegin;, int bStep;, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];, int a;, int b;, int k;, int c;, dim3 blockIdx;, int guard_matrixMul_CMP_5;, guard_matrixMul_CMP_5=1;, #pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , aBegin=((wA*16)*blockIdx.y);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*blockIdx.x);, bStep=(16*wB);, #pragma fcuda compute cores=1 name=CMP_5 end=false begin=true , #pragma fcuda tloop name=CMP_5 end=false begin=true , #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;, #pragma fcuda tloop name=CMP_5 end=true begin=false , #pragma fcuda compute cores=1 name=CMP_5 end=true begin=false , a=0;, b=0;, k=0;, #pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}, c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));, , , #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true , #pragma fcuda tloop name=TRN_10 end=false begin=true , #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];, #pragma fcuda tloop name=TRN_10 end=true begin=false , #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false , , , return ;]
Marking Statements 19 - 23 for task: matrixMul_CMP_5
....23....curr sIdx is: 19 , curr tskStmts to be added is: #pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
....23....after adding, tskName is: matrixMul_CMP_5
....23....curr sIdx is: 20 , curr tskStmts to be added is: #pragma fcuda tloop name=CMP_5 end=false begin=true 
....23....after adding, tskName is: matrixMul_CMP_5
....23....curr sIdx is: 21 , curr tskStmts to be added is: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
....23....after adding, tskName is: matrixMul_CMP_5
....23....curr sIdx is: 22 , curr tskStmts to be added is: #pragma fcuda tloop name=CMP_5 end=true begin=false 
....23....after adding, tskName is: matrixMul_CMP_5
....23....curr sIdx is: 23 , curr tskStmts to be added is: #pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
....23....after adding, tskName is: matrixMul_CMP_5
........declList is: []
....24....ProcedureDeclarator tskProcDecl is: matrixMul_CMP_5()
....25....Procedure tskProc is: void matrixMul_CMP_5()
{
if (guard_matrixMul_CMP_5)
{

}
}

....26.... TranslationUnit kernUnit is: #include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}


....27.... after kernUnit.addDeclaratuibBefore, kernUnit is: #include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
void matrixMul_CMP_5()
{
if (guard_matrixMul_CMP_5)
{

}
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}


....28.... before FCUDAutils.addTaskMapping, mProcedure.getSymbolName is: matrixMul
....28.... before FCUDAutils.addTaskMapping, tskProc is: void matrixMul_CMP_5()
{
if (guard_matrixMul_CMP_5)
{

}
}

....29.... after FCUDAutils.addTaskMapping, mProcedure.getSymbolName is: matrixMul
....29.... after FCUDAutils.addTaskMapping, tskProc is: void matrixMul_CMP_5()
{
if (guard_matrixMul_CMP_5)
{

}
}

....30.... after FcudaAnnotation fannot, fannot is: #pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
....31.... fannot is not null
....32.... done taskCreationPrelims
....32.... final taskCall is: matrixMul_CMP_5()
----addStatementBefore----index is:21
Starting to collect parameters for procedure: matrixMul_CMP_5
Task Statement: #pragma fcuda compute cores=1 name=CMP_5 end=false begin=true   of task: matrixMul_CMP_5
Task Statement: #pragma fcuda tloop name=CMP_5 end=false begin=true   of task: matrixMul_CMP_5
Task Statement: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;  of task: matrixMul_CMP_5
Task defExp: Csub_block[threadIdx.y][threadIdx.x]  of task: matrixMul_CMP_5
Task def: Csub_block  of task: matrixMul_CMP_5
     ... has # of chain uses: 2
Check Uses: [#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);, #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];]
      ... has Use out of task
      > #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
Task useExp: threadIdx.x  of task: matrixMul_CMP_5
Task useExp: threadIdx.y  of task: matrixMul_CMP_5
Task Statement: #pragma fcuda tloop name=CMP_5 end=true begin=false   of task: matrixMul_CMP_5
Task Statement: #pragma fcuda compute cores=1 name=CMP_5 end=true begin=false   of task: matrixMul_CMP_5
----0041----enter for_1, curr asCnt is: 7
----0042----annotStmt is: 
----0043----list fcAnnots is: []
----0041----enter for_1, curr asCnt is: 8
----0042----annotStmt is: 
----0043----list fcAnnots is: []
----0041----enter for_1, curr asCnt is: 9
----0042----annotStmt is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
----0043----list fcAnnots is: [#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true ]
----00431----enter for_2 curr fcannot is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
----00432----curr annotType is: transfer
----00433----curr bgn is: true
----00434----curr annotType is COM or TRN
----00435----curr bgn is true
----SFT2-decompose-before sanity check, inCMP is: false, inTRN is: false, tskName is: null
----0041----enter for_1, curr asCnt is: 10
----0042----annotStmt is: #pragma fcuda tloop name=TRN_10 end=false begin=true 
----0043----list fcAnnots is: [#pragma fcuda tloop name=TRN_10 end=false begin=true ]
----00431----enter for_2 curr fcannot is: #pragma fcuda tloop name=TRN_10 end=false begin=true 
----00432----curr annotType is: tloop
----00433----curr bgn is: true
----0043A----curr annotType is not COM nor TRN
----0041----enter for_1, curr asCnt is: 11
----0042----annotStmt is: #pragma fcuda tloop name=TRN_10 end=true begin=false 
----0043----list fcAnnots is: [#pragma fcuda tloop name=TRN_10 end=true begin=false ]
----00431----enter for_2 curr fcannot is: #pragma fcuda tloop name=TRN_10 end=true begin=false 
----00432----curr annotType is: tloop
----00433----curr bgn is: false
----0043A----curr annotType is not COM nor TRN
----0041----enter for_1, curr asCnt is: 12
----0042----annotStmt is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
----0043----list fcAnnots is: [#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false ]
----00431----enter for_2 curr fcannot is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
----00432----curr annotType is: transfer
----00433----curr bgn is: false
----00434----curr annotType is COM or TRN
----00436----curr bgn is false
----00439----enter inTRN decomposeCompute
----00439----bgnstmt is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
----00439----endStmt is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
----00439----tskNmae is: TRN_10
----4.0----trnTaskName is: matrixMul_TRN_10
----4.0----bgnIdx is: 34
----4.0----endIdx is: 38

 ... Prelim task handling: matrixMul_TRN_10
...tskName is: matrixMul_TRN_10
...mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

...print current fcudaGlobalData2 tasks...
Tasks: [matrixMul_TRN_10, matrixMul_CMP_5]
....00......................................
....01....enableSignal is: guard_matrixMul_TRN_10
....02....enDeclor is: guard_matrixMul_TRN_10
....03....enableDecl is: int guard_matrixMul_TRN_10
....04....after getbody addAnsideclaration, mprocedure_body is: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
----addStatementBefore----index is:13
....05....after addAfterLastDeclaration, mprocedure_body is: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
....06....parCStmt is: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
....07....idxDif is: 2
....08....taskCall is: matrixMul_TRN_10()
....09....after addTaskCall, tskName is: matrixMul_TRN_10
....09....after addTaskCall, taskCall is: matrixMul_TRN_10()
....10....after addFcudaCore, taskCall is: matrixMul_TRN_10()
....10....after addFcudaCore, mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

Creating new FcudaCoreData for core: matrixMul_TRN_10()
....11....after setCoreName, tskName is: matrixMul_TRN_10
....11....after setCoreName, taskCall is: matrixMul_TRN_10()
....11....after setCoreName, mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

....12....sftTaskArgs size is: 0
....12....sftTaskArgs is: []
....13....sftTaskArgs size is: 1
....13....sftTaskArgs is: [guard_matrixMul_TRN_10]
....14....sftTaskArgSyms is: [guard_matrixMul_TRN_10]
....15....sftTaskDecls size is: 1
....15....sftTaskDecls is: [int guard_matrixMul_TRN_10]
....16....sftTaskArgs size is: 2
....16....sftTaskArgs is: [guard_matrixMul_TRN_10, blockDim]
....16....sftTaskDecls size is: 4
....16....sftTaskDecls is: [int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx]
....17....sftCommonArgsIndex size is: 1
....17....sftCommonArgsIndex is: [1]
....18....sftTaskArgs size is: 3
....18....sftTaskArgs is: [guard_matrixMul_TRN_10, blockDim, gridDim]
....18....sftCommonArgsIndex size is: 2
....18....sftCommonArgsIndex is: [1, 2]
....19....sftTaskArgs size is: 4
....19....sftTaskArgs is: [guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx]
....20....enableStmt is: if (guard_matrixMul_TRN_10)
{

}
....21....fcTask is: {
if (guard_matrixMul_TRN_10)
{

}
}
....22....tskStmts size is: 44
....22....tskStmts is: [int aBegin;, int aEnd;, int aStep;, int bBegin;, int bStep;, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];, int a;, int b;, int k;, int c;, dim3 blockIdx;, int guard_matrixMul_CMP_5;, int guard_matrixMul_TRN_10;, guard_matrixMul_TRN_10=1;, guard_matrixMul_CMP_5=1;, #pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , aBegin=((wA*16)*blockIdx.y);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*blockIdx.x);, bStep=(16*wB);, matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);, #pragma fcuda compute cores=1 name=CMP_5 end=false begin=true , #pragma fcuda tloop name=CMP_5 end=false begin=true , #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;, #pragma fcuda tloop name=CMP_5 end=true begin=false , #pragma fcuda compute cores=1 name=CMP_5 end=true begin=false , a=0;, b=0;, k=0;, #pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}, c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));, , , #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true , #pragma fcuda tloop name=TRN_10 end=false begin=true , #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];, #pragma fcuda tloop name=TRN_10 end=true begin=false , #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false , , , return ;]
Marking Statements 34 - 38 for task: matrixMul_TRN_10
....23....curr sIdx is: 34 , curr tskStmts to be added is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
....23....after adding, tskName is: matrixMul_TRN_10
....23....curr sIdx is: 35 , curr tskStmts to be added is: #pragma fcuda tloop name=TRN_10 end=false begin=true 
....23....after adding, tskName is: matrixMul_TRN_10
....23....curr sIdx is: 36 , curr tskStmts to be added is: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
....23....after adding, tskName is: matrixMul_TRN_10
....23....curr sIdx is: 37 , curr tskStmts to be added is: #pragma fcuda tloop name=TRN_10 end=true begin=false 
....23....after adding, tskName is: matrixMul_TRN_10
....23....curr sIdx is: 38 , curr tskStmts to be added is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
....23....after adding, tskName is: matrixMul_TRN_10
........declList is: []
....24....ProcedureDeclarator tskProcDecl is: matrixMul_TRN_10()
....25....Procedure tskProc is: void matrixMul_TRN_10()
{
if (guard_matrixMul_TRN_10)
{

}
}

....26.... TranslationUnit kernUnit is: #include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_CMP_5)
{

}
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}


....27.... after kernUnit.addDeclaratuibBefore, kernUnit is: #include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_CMP_5)
{

}
}

void matrixMul_TRN_10()
{
if (guard_matrixMul_TRN_10)
{

}
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}


....28.... before FCUDAutils.addTaskMapping, mProcedure.getSymbolName is: matrixMul
....28.... before FCUDAutils.addTaskMapping, tskProc is: void matrixMul_TRN_10()
{
if (guard_matrixMul_TRN_10)
{

}
}

....29.... after FCUDAutils.addTaskMapping, mProcedure.getSymbolName is: matrixMul
....29.... after FCUDAutils.addTaskMapping, tskProc is: void matrixMul_TRN_10()
{
if (guard_matrixMul_TRN_10)
{

}
}

....30.... after FcudaAnnotation fannot, fannot is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
....31.... fannot is not null
....32.... done taskCreationPrelims
....32.... final taskCall is: matrixMul_TRN_10()
----4.0----taskCall is: matrixMul_TRN_10()
----4.0----taskCallStmt is: matrixMul_TRN_10();
----addStatementBefore----index is:36
----4.0----cStmt after addStatementBefore is: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10();
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
----4.1----Starting to collect parameters for procedure: matrixMul_TRN_10
----4.1----trnData is: fcuda.common.TaskData@61ca2dfa
----4.1----tskStmts is: [#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true , #pragma fcuda tloop name=TRN_10 end=false begin=true , #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];, #pragma fcuda tloop name=TRN_10 end=true begin=false , #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false ]
----4.1----allTskSyms is: []
----4.2----curr Task Statement: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
----7.11----test_children is: []
----7.12----test_annot is: [#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true ]
----7.13---coresList is: [1]
----7.13---sizeList is: [BLOCKDIM_X]
----7.13---taskName is: TRN_10
----7.13---transferType is: null
----4.21---- AnnotationStatement continue
----4.2----curr Task Statement: #pragma fcuda tloop name=TRN_10 end=false begin=true 
----7.11----test_children is: []
----7.12----test_annot is: [#pragma fcuda tloop name=TRN_10 end=false begin=true ]
----4.21---- AnnotationStatement continue
----4.2----curr Task Statement: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
----7.11----test_children is: [C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x]]
----7.12----test_annot is: [#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true ]
----7.14----stmtpragmas: []
----7.14----test_annot: [#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true ]
----7.14----real_stmt: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
----7.14---mOffchipPtrNameList is: [C]
----7.14---dirList is: false
----7.15----1.collecting parameters----
-------GLBpntr is: [C]
-------core: [1]
-------size: [BLOCKDIM_X]
-------rdNwrt: false
-------name: TRN_10
-------type: null
----4.3----in for loop DEFS, defExp: C[((c+(wB*threadIdx.y))+threadIdx.x)]
----4.3----Task def: C
----4.3----defSym: * C
----4.3----scalarDef: true
----4.3----constArrAcc: false
----4.3----allTskSyms: [* C]
----4.4----defDecl: DATATYPE * C
----4.4----defUses: []
----4.4---- ... has # of chain uses: 0
Task useExp: Csub_block[threadIdx.y][threadIdx.x]  of task: matrixMul_TRN_10
Task use: Csub_block  of task: matrixMul_TRN_10
     ... has # of chain defs: 2
      ... has Def out of task
      > #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
Task useExp: c  of task: matrixMul_TRN_10
Task use: c  of task: matrixMul_TRN_10
     ... has # of chain defs: 1
      ... has Def out of task
      > c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));
Task useExp: threadIdx.x  of task: matrixMul_TRN_10
Task useExp: threadIdx.y  of task: matrixMul_TRN_10
Task useExp: wB  of task: matrixMul_TRN_10
Task use: wB  of task: matrixMul_TRN_10
     ... has # of chain defs: 1
      ... has Def out of task
      > wB
----4.2----curr Task Statement: #pragma fcuda tloop name=TRN_10 end=true begin=false 
----7.11----test_children is: []
----7.12----test_annot is: [#pragma fcuda tloop name=TRN_10 end=true begin=false ]
----4.21---- AnnotationStatement continue
----4.2----curr Task Statement: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
----7.11----test_children is: []
----7.12----test_annot is: [#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false ]
----4.21---- AnnotationStatement continue
----5.0----end of task statement, cStmt is: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10();
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
----8.0----trnTaskName: matrixMul_TRN_10
--------sftTaskArgSyms: [wB, Csub_block[BLOCKDIM_Y][BLOCKDIM_X], c, guard_matrixMul_TRN_10, * C]
--------sftTaskArgs: [guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB]
--------sftTaskDecls: [int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB]
--------taskCall: matrixMul_TRN_10()
--------sftCommonArgsIndex: [1, 2, 4, 7]
----8.00----tskSym is: wB
----8.01----decl is: int wB
----8.02----inTaskDecl is: false
----8.03----sftTaskArgSyms contains tskSym
----8.00----tskSym is: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
----8.01----decl is: __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
----8.02----inTaskDecl is: false
----8.03----sftTaskArgSyms contains tskSym
----8.00----tskSym is: c
----8.01----decl is: int c
----8.02----inTaskDecl is: false
----8.03----sftTaskArgSyms contains tskSym
----8.00----tskSym is: * C
----8.01----decl is: DATATYPE * C
----8.02----inTaskDecl is: false
----8.03----sftTaskArgSyms contains tskSym
----8.07----trnTaskName: matrixMul_TRN_10
--------sftTaskArgSyms: [wB, Csub_block[BLOCKDIM_Y][BLOCKDIM_X], c, guard_matrixMul_TRN_10, * C]
--------sftTaskArgs: [guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB]
--------sftTaskDecls: [int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB]
--------taskCall: matrixMul_TRN_10()
--------sftCommonArgsIndex: [1, 2, 4, 7]
----8.08----trnTaskName: matrixMul_TRN_10
--------sftTaskArgSyms: [wB, Csub_block[BLOCKDIM_Y][BLOCKDIM_X], c, guard_matrixMul_TRN_10, * C]
--------sftTaskArgs: [guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB]
--------sftTaskDecls: [int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB]
--------taskCall: matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB)
--------sftCommonArgsIndex: [1, 2, 4, 7]
----0041----enter for_1, curr asCnt is: 13
----0042----annotStmt is: 
----0043----list fcAnnots is: []
----0041----enter for_1, curr asCnt is: 14
----0042----annotStmt is: 
----0043----list fcAnnots is: []
----0041----enter for_1, curr asCnt is: 15
----0042----annotStmt is: 
----0043----list fcAnnots is: []
----0041----enter for_1, curr asCnt is: 16
----0042----annotStmt is: 
----0043----list fcAnnots is: []
----0041----enter for_1, curr asCnt is: 17
----0042----annotStmt is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
----0043----list fcAnnots is: [#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true ]
----00431----enter for_2 curr fcannot is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
----00432----curr annotType is: transfer
----00433----curr bgn is: true
----00434----curr annotType is COM or TRN
----00435----curr bgn is true
----SFT2-decompose-before sanity check, inCMP is: false, inTRN is: false, tskName is: null
----0041----enter for_1, curr asCnt is: 18
----0042----annotStmt is: #pragma fcuda tloop name=TRN_6 end=false begin=true 
----0043----list fcAnnots is: [#pragma fcuda tloop name=TRN_6 end=false begin=true ]
----00431----enter for_2 curr fcannot is: #pragma fcuda tloop name=TRN_6 end=false begin=true 
----00432----curr annotType is: tloop
----00433----curr bgn is: true
----0043A----curr annotType is not COM nor TRN
----0041----enter for_1, curr asCnt is: 19
----0042----annotStmt is: #pragma fcuda tloop name=TRN_6 end=true begin=false 
----0043----list fcAnnots is: [#pragma fcuda tloop name=TRN_6 end=true begin=false ]
----00431----enter for_2 curr fcannot is: #pragma fcuda tloop name=TRN_6 end=true begin=false 
----00432----curr annotType is: tloop
----00433----curr bgn is: false
----0043A----curr annotType is not COM nor TRN
----0041----enter for_1, curr asCnt is: 20
----0042----annotStmt is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
----0043----list fcAnnots is: [#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false ]
----00431----enter for_2 curr fcannot is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
----00432----curr annotType is: transfer
----00433----curr bgn is: false
----00434----curr annotType is COM or TRN
----00436----curr bgn is false
----00439----enter inTRN decomposeCompute
----00439----bgnstmt is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
----00439----endStmt is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
----00439----tskNmae is: TRN_6
----4.0----trnTaskName is: matrixMul_TRN_6
----4.0----bgnIdx is: 4
----4.0----endIdx is: 9

 ... Prelim task handling: matrixMul_TRN_6
...tskName is: matrixMul_TRN_6
...mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

...print current fcudaGlobalData2 tasks...
Tasks: [matrixMul_TRN_6, matrixMul_TRN_10, matrixMul_CMP_5]
....00......................................
....01....enableSignal is: guard_matrixMul_TRN_6
....02....enDeclor is: guard_matrixMul_TRN_6
....03....enableDecl is: int guard_matrixMul_TRN_6
....04....after getbody addAnsideclaration, mprocedure_body is: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
----addStatementBefore----index is:14
....05....after addAfterLastDeclaration, mprocedure_body is: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
....06....parCStmt is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
....07....idxDif is: 0
....08....taskCall is: matrixMul_TRN_6()
....09....after addTaskCall, tskName is: matrixMul_TRN_6
....09....after addTaskCall, taskCall is: matrixMul_TRN_6()
....10....after addFcudaCore, taskCall is: matrixMul_TRN_6()
....10....after addFcudaCore, mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

Creating new FcudaCoreData for core: matrixMul_TRN_6()
....11....after setCoreName, tskName is: matrixMul_TRN_6
....11....after setCoreName, taskCall is: matrixMul_TRN_6()
....11....after setCoreName, mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

....12....sftTaskArgs size is: 0
....12....sftTaskArgs is: []
....13....sftTaskArgs size is: 1
....13....sftTaskArgs is: [guard_matrixMul_TRN_6]
....14....sftTaskArgSyms is: [guard_matrixMul_TRN_6]
....15....sftTaskDecls size is: 1
....15....sftTaskDecls is: [int guard_matrixMul_TRN_6]
....16....sftTaskArgs size is: 2
....16....sftTaskArgs is: [guard_matrixMul_TRN_6, blockDim]
....16....sftTaskDecls size is: 4
....16....sftTaskDecls is: [int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx]
....17....sftCommonArgsIndex size is: 1
....17....sftCommonArgsIndex is: [1]
....18....sftTaskArgs size is: 3
....18....sftTaskArgs is: [guard_matrixMul_TRN_6, blockDim, gridDim]
....18....sftCommonArgsIndex size is: 2
....18....sftCommonArgsIndex is: [1, 2]
....19....sftTaskArgs size is: 4
....19....sftTaskArgs is: [guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx]
....20....enableStmt is: if (guard_matrixMul_TRN_6)
{

}
....21....fcTask is: {
if (guard_matrixMul_TRN_6)
{

}
}
....22....tskStmts size is: 19
....22....tskStmts is: [__shared__ DATATYPE As[16][16];, __shared__ DATATYPE Bs[16][16];, , , #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true , #pragma fcuda tloop name=TRN_6 end=false begin=true , #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, #pragma fcuda tloop name=TRN_6 end=true begin=false , #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false , , , , #pragma fcuda compute cores=1 name=SNC_7 end=false begin=true , #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();, {
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}, #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();, #pragma fcuda compute cores=1 name=SNC_7 end=true begin=false , ]
Marking Statements 4 - 9 for task: matrixMul_TRN_6
....23....curr sIdx is: 4 , curr tskStmts to be added is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
....23....after adding, tskName is: matrixMul_TRN_6
....23....curr sIdx is: 5 , curr tskStmts to be added is: #pragma fcuda tloop name=TRN_6 end=false begin=true 
....23....after adding, tskName is: matrixMul_TRN_6
....23....curr sIdx is: 6 , curr tskStmts to be added is: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
....23....after adding, tskName is: matrixMul_TRN_6
....23....curr sIdx is: 7 , curr tskStmts to be added is: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
....23....after adding, tskName is: matrixMul_TRN_6
....23....curr sIdx is: 8 , curr tskStmts to be added is: #pragma fcuda tloop name=TRN_6 end=true begin=false 
....23....after adding, tskName is: matrixMul_TRN_6
....23....curr sIdx is: 9 , curr tskStmts to be added is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
....23....after adding, tskName is: matrixMul_TRN_6
........declList is: []
....24....ProcedureDeclarator tskProcDecl is: matrixMul_TRN_6()
....25....Procedure tskProc is: void matrixMul_TRN_6()
{
if (guard_matrixMul_TRN_6)
{

}
}

....26.... TranslationUnit kernUnit is: #include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_CMP_5)
{

}
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
if (guard_matrixMul_TRN_10)
{

}
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}


....27.... after kernUnit.addDeclaratuibBefore, kernUnit is: #include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_CMP_5)
{

}
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
if (guard_matrixMul_TRN_10)
{

}
}

void matrixMul_TRN_6()
{
if (guard_matrixMul_TRN_6)
{

}
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}


....28.... before FCUDAutils.addTaskMapping, mProcedure.getSymbolName is: matrixMul
....28.... before FCUDAutils.addTaskMapping, tskProc is: void matrixMul_TRN_6()
{
if (guard_matrixMul_TRN_6)
{

}
}

....29.... after FCUDAutils.addTaskMapping, mProcedure.getSymbolName is: matrixMul
....29.... after FCUDAutils.addTaskMapping, tskProc is: void matrixMul_TRN_6()
{
if (guard_matrixMul_TRN_6)
{

}
}

....30.... after FcudaAnnotation fannot, fannot is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
....31.... fannot is not null
....32.... done taskCreationPrelims
....32.... final taskCall is: matrixMul_TRN_6()
----4.0----taskCall is: matrixMul_TRN_6()
----4.0----taskCallStmt is: matrixMul_TRN_6();
----addStatementBefore----index is:4
----4.0----cStmt after addStatementBefore is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


matrixMul_TRN_6();
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
----4.1----Starting to collect parameters for procedure: matrixMul_TRN_6
----4.1----trnData is: fcuda.common.TaskData@7ba18f1b
----4.1----tskStmts is: [#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true , #pragma fcuda tloop name=TRN_6 end=false begin=true , #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, #pragma fcuda tloop name=TRN_6 end=true begin=false , #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false ]
----4.1----allTskSyms is: []
----4.2----curr Task Statement: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
----7.11----test_children is: []
----7.12----test_annot is: [#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true ]
----7.13---coresList is: [1]
----7.13---sizeList is: [BLOCKDIM_X]
----7.13---taskName is: TRN_6
----7.13---transferType is: null
----4.21---- AnnotationStatement continue
----4.2----curr Task Statement: #pragma fcuda tloop name=TRN_6 end=false begin=true 
----7.11----test_children is: []
----7.12----test_annot is: [#pragma fcuda tloop name=TRN_6 end=false begin=true ]
----4.21---- AnnotationStatement continue
----4.2----curr Task Statement: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
----7.11----test_children is: [As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)]]
----7.12----test_annot is: [#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true ]
----7.14----stmtpragmas: []
----7.14----test_annot: [#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true ]
----7.14----real_stmt: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
----7.14---mOffchipPtrNameList is: [A]
----7.14---dirList is: true
----7.15----1.collecting parameters----
-------GLBpntr is: [A]
-------core: [1]
-------size: [BLOCKDIM_X]
-------rdNwrt: true
-------name: TRN_6
-------type: null
----4.3----in for loop DEFS, defExp: As[threadIdx.y][threadIdx.x]
----4.3----Task def: As
----4.3----defSym: As[16][16]
----4.3----scalarDef: false
----4.3----constArrAcc: false
----4.3----allTskSyms: [As[16][16]]
----4.4----defDecl: __shared__ DATATYPE As[16][16]
----4.4----defUses: [#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);]
----4.4---- ... has # of chain uses: 1
----4.5----curr useTrv: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
----4.51----!(taskContains(useTrv, tskStmts))
----4.51----sftTaskArgs: [guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As]
----4.51----sftTaskArgSyms: [As[16][16], guard_matrixMul_TRN_6]
----4.51----sftTaskDecls: [int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16]]
      ... has Use out of task
      > #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
----4.52----gonna break
Task useExp: A[((a+(wA*threadIdx.y))+threadIdx.x)]  of task: matrixMul_TRN_6
Task use: A  of task: matrixMul_TRN_6
     ... has # of chain defs: 1
      ... has Def out of task
      > * A
Task useExp: a  of task: matrixMul_TRN_6
Task use: a  of task: matrixMul_TRN_6
     ... has # of chain defs: 2
      ... has Def out of task
      > ((a=aBegin), (b=bBegin));
Task useExp: threadIdx.x  of task: matrixMul_TRN_6
Task useExp: threadIdx.y  of task: matrixMul_TRN_6
Task useExp: wA  of task: matrixMul_TRN_6
Task use: wA  of task: matrixMul_TRN_6
     ... has # of chain defs: 1
      ... has Def out of task
      > wA
----4.2----curr Task Statement: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
----7.11----test_children is: [Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)]]
----7.12----test_annot is: [#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true ]
----7.14----stmtpragmas: []
----7.14----test_annot: [#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true ]
----7.14----real_stmt: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
----7.14---mOffchipPtrNameList is: [A, B]
----7.14---dirList is: true
----7.15----1.collecting parameters----
-------GLBpntr is: [A, B]
-------core: [1]
-------size: [BLOCKDIM_X]
-------rdNwrt: true
-------name: TRN_6
-------type: null
----4.3----in for loop DEFS, defExp: Bs[threadIdx.y][threadIdx.x]
----4.3----Task def: Bs
----4.3----defSym: Bs[16][16]
----4.3----scalarDef: false
----4.3----constArrAcc: false
----4.3----allTskSyms: [* A, Bs[16][16], wA, a, As[16][16]]
----4.4----defDecl: __shared__ DATATYPE Bs[16][16]
----4.4----defUses: [#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);]
----4.4---- ... has # of chain uses: 1
----4.5----curr useTrv: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
----4.51----!(taskContains(useTrv, tskStmts))
----4.51----sftTaskArgs: [guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs]
----4.51----sftTaskArgSyms: [* A, Bs[16][16], wA, a, As[16][16], guard_matrixMul_TRN_6]
----4.51----sftTaskDecls: [int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16]]
      ... has Use out of task
      > #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
----4.52----gonna break
Task useExp: B[((b+(wB*threadIdx.y))+threadIdx.x)]  of task: matrixMul_TRN_6
Task use: B  of task: matrixMul_TRN_6
     ... has # of chain defs: 1
      ... has Def out of task
      > * B
Task useExp: b  of task: matrixMul_TRN_6
Task use: b  of task: matrixMul_TRN_6
     ... has # of chain defs: 2
      ... has Def out of task
      > ((a=aBegin), (b=bBegin));
Task useExp: threadIdx.x  of task: matrixMul_TRN_6
Task useExp: threadIdx.y  of task: matrixMul_TRN_6
Task useExp: wB  of task: matrixMul_TRN_6
Task use: wB  of task: matrixMul_TRN_6
     ... has # of chain defs: 1
      ... has Def out of task
      > wB
----4.2----curr Task Statement: #pragma fcuda tloop name=TRN_6 end=true begin=false 
----7.11----test_children is: []
----7.12----test_annot is: [#pragma fcuda tloop name=TRN_6 end=true begin=false ]
----4.21---- AnnotationStatement continue
----4.2----curr Task Statement: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
----7.11----test_children is: []
----7.12----test_annot is: [#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false ]
----4.21---- AnnotationStatement continue
----5.0----end of task statement, cStmt is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


matrixMul_TRN_6();
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
----8.0----trnTaskName: matrixMul_TRN_6
--------sftTaskArgSyms: [wB, * A, Bs[16][16], wA, a, As[16][16], guard_matrixMul_TRN_6, b, * B]
--------sftTaskArgs: [guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB]
--------sftTaskDecls: [int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB]
--------taskCall: matrixMul_TRN_6()
--------sftCommonArgsIndex: [1, 2, 5, 7, 9, 11]
----8.00----tskSym is: wB
----8.01----decl is: int wB
----8.02----inTaskDecl is: false
----8.03----sftTaskArgSyms contains tskSym
----8.00----tskSym is: * A
----8.01----decl is: DATATYPE * A
----8.02----inTaskDecl is: false
----8.03----sftTaskArgSyms contains tskSym
----8.00----tskSym is: Bs[16][16]
----8.01----decl is: __shared__ DATATYPE Bs[16][16]
----8.02----inTaskDecl is: false
----8.03----sftTaskArgSyms contains tskSym
----8.00----tskSym is: wA
----8.01----decl is: int wA
----8.02----inTaskDecl is: false
----8.03----sftTaskArgSyms contains tskSym
----8.00----tskSym is: a
----8.01----decl is: int a
----8.02----inTaskDecl is: false
----8.03----sftTaskArgSyms contains tskSym
----8.00----tskSym is: As[16][16]
----8.01----decl is: __shared__ DATATYPE As[16][16]
----8.02----inTaskDecl is: false
----8.03----sftTaskArgSyms contains tskSym
----8.00----tskSym is: b
----8.01----decl is: int b
----8.02----inTaskDecl is: false
----8.03----sftTaskArgSyms contains tskSym
----8.00----tskSym is: * B
----8.01----decl is: DATATYPE * B
----8.02----inTaskDecl is: false
----8.03----sftTaskArgSyms contains tskSym
----8.07----trnTaskName: matrixMul_TRN_6
--------sftTaskArgSyms: [wB, * A, Bs[16][16], wA, a, As[16][16], guard_matrixMul_TRN_6, b, * B]
--------sftTaskArgs: [guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB]
--------sftTaskDecls: [int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB]
--------taskCall: matrixMul_TRN_6()
--------sftCommonArgsIndex: [1, 2, 5, 7, 9, 11]
----8.08----trnTaskName: matrixMul_TRN_6
--------sftTaskArgSyms: [wB, * A, Bs[16][16], wA, a, As[16][16], guard_matrixMul_TRN_6, b, * B]
--------sftTaskArgs: [guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB]
--------sftTaskDecls: [int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB]
--------taskCall: matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB)
--------sftCommonArgsIndex: [1, 2, 5, 7, 9, 11]
----0041----enter for_1, curr asCnt is: 21
----0042----annotStmt is: 
----0043----list fcAnnots is: []
----0041----enter for_1, curr asCnt is: 22
----0042----annotStmt is: 
----0043----list fcAnnots is: []
----0041----enter for_1, curr asCnt is: 23
----0042----annotStmt is: 
----0043----list fcAnnots is: []
----0041----enter for_1, curr asCnt is: 24
----0042----annotStmt is: #pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
----0043----list fcAnnots is: [#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true ]
----00431----enter for_2 curr fcannot is: #pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
----00432----curr annotType is: compute
----00433----curr bgn is: true
----00434----curr annotType is COM or TRN
----00435----curr bgn is true
----SFT2-decompose-before sanity check, inCMP is: false, inTRN is: false, tskName is: null
----0041----enter for_1, curr asCnt is: 25
----0042----annotStmt is: #pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
----0043----list fcAnnots is: [#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false ]
----00431----enter for_2 curr fcannot is: #pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
----00432----curr annotType is: compute
----00433----curr bgn is: false
----00434----curr annotType is COM or TRN
----00436----curr bgn is false
----00438----enter inCMP decomposeCompute
----00438----bgnstmt is: #pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
----00438----endStmt is: #pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
----00438----tskNmae is: SNC_7

 ... Prelim task handling: matrixMul_SNC_7
...tskName is: matrixMul_SNC_7
...mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

...print current fcudaGlobalData2 tasks...
Tasks: [matrixMul_TRN_6, matrixMul_SNC_7, matrixMul_TRN_10, matrixMul_CMP_5]
....00......................................
....01....enableSignal is: guard_matrixMul_SNC_7
....02....enDeclor is: guard_matrixMul_SNC_7
....03....enableDecl is: int guard_matrixMul_SNC_7
....04....after getbody addAnsideclaration, mprocedure_body is: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
----addStatementBefore----index is:15
....05....after addAfterLastDeclaration, mprocedure_body is: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
....06....parCStmt is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
....07....idxDif is: 0
....08....taskCall is: matrixMul_SNC_7()
....09....after addTaskCall, tskName is: matrixMul_SNC_7
....09....after addTaskCall, taskCall is: matrixMul_SNC_7()
....10....after addFcudaCore, taskCall is: matrixMul_SNC_7()
....10....after addFcudaCore, mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

Creating new FcudaCoreData for core: matrixMul_SNC_7()
....11....after setCoreName, tskName is: matrixMul_SNC_7
....11....after setCoreName, taskCall is: matrixMul_SNC_7()
....11....after setCoreName, mProcedure is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

....12....sftTaskArgs size is: 0
....12....sftTaskArgs is: []
....13....sftTaskArgs size is: 1
....13....sftTaskArgs is: [guard_matrixMul_SNC_7]
....14....sftTaskArgSyms is: [guard_matrixMul_SNC_7]
....15....sftTaskDecls size is: 1
....15....sftTaskDecls is: [int guard_matrixMul_SNC_7]
....16....sftTaskArgs size is: 2
....16....sftTaskArgs is: [guard_matrixMul_SNC_7, blockDim]
....16....sftTaskDecls size is: 4
....16....sftTaskDecls is: [int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx]
....17....sftCommonArgsIndex size is: 1
....17....sftCommonArgsIndex is: [1]
....18....sftTaskArgs size is: 3
....18....sftTaskArgs is: [guard_matrixMul_SNC_7, blockDim, gridDim]
....18....sftCommonArgsIndex size is: 2
....18....sftCommonArgsIndex is: [1, 2]
....19....sftTaskArgs size is: 4
....19....sftTaskArgs is: [guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx]
....20....enableStmt is: if (guard_matrixMul_SNC_7)
{

}
....21....fcTask is: {
if (guard_matrixMul_SNC_7)
{

}
}
....22....tskStmts size is: 20
....22....tskStmts is: [__shared__ DATATYPE As[16][16];, __shared__ DATATYPE Bs[16][16];, , , matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);, #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true , #pragma fcuda tloop name=TRN_6 end=false begin=true , #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, #pragma fcuda tloop name=TRN_6 end=true begin=false , #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false , , , , #pragma fcuda compute cores=1 name=SNC_7 end=false begin=true , #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();, {
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}, #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();, #pragma fcuda compute cores=1 name=SNC_7 end=true begin=false , ]
Marking Statements 14 - 18 for task: matrixMul_SNC_7
....23....curr sIdx is: 14 , curr tskStmts to be added is: #pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
....23....after adding, tskName is: matrixMul_SNC_7
....23....curr sIdx is: 15 , curr tskStmts to be added is: #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
....23....after adding, tskName is: matrixMul_SNC_7
....23....curr sIdx is: 16 , curr tskStmts to be added is: {
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
....23....after adding, tskName is: matrixMul_SNC_7
....23....curr sIdx is: 17 , curr tskStmts to be added is: #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
....23....after adding, tskName is: matrixMul_SNC_7
....23....curr sIdx is: 18 , curr tskStmts to be added is: #pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
....23....after adding, tskName is: matrixMul_SNC_7
........declList is: []
....24....ProcedureDeclarator tskProcDecl is: matrixMul_SNC_7()
....25....Procedure tskProc is: void matrixMul_SNC_7()
{
if (guard_matrixMul_SNC_7)
{

}
}

....26.... TranslationUnit kernUnit is: #include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_CMP_5)
{

}
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
if (guard_matrixMul_TRN_10)
{

}
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
if (guard_matrixMul_TRN_6)
{

}
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}


....27.... after kernUnit.addDeclaratuibBefore, kernUnit is: #include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_CMP_5)
{

}
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
if (guard_matrixMul_TRN_10)
{

}
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
if (guard_matrixMul_TRN_6)
{

}
}

void matrixMul_SNC_7()
{
if (guard_matrixMul_SNC_7)
{

}
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}


....28.... before FCUDAutils.addTaskMapping, mProcedure.getSymbolName is: matrixMul
....28.... before FCUDAutils.addTaskMapping, tskProc is: void matrixMul_SNC_7()
{
if (guard_matrixMul_SNC_7)
{

}
}

....29.... after FCUDAutils.addTaskMapping, mProcedure.getSymbolName is: matrixMul
....29.... after FCUDAutils.addTaskMapping, tskProc is: void matrixMul_SNC_7()
{
if (guard_matrixMul_SNC_7)
{

}
}

....30.... after FcudaAnnotation fannot, fannot is: #pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
....31.... fannot is not null
....32.... done taskCreationPrelims
....32.... final taskCall is: matrixMul_SNC_7()
----addStatementBefore----index is:14
Starting to collect parameters for procedure: matrixMul_SNC_7
Task Statement: #pragma fcuda compute cores=1 name=SNC_7 end=false begin=true   of task: matrixMul_SNC_7
Task Statement: #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();  of task: matrixMul_SNC_7
Task Statement: {
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}  of task: matrixMul_SNC_7
Task defExp: Csub_block[threadIdx.y][threadIdx.x]  of task: matrixMul_SNC_7
Task def: Csub_block  of task: matrixMul_SNC_7
     ... has # of chain uses: 2
Check Uses: [#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);, #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];]
      ... has Use out of task
      > #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
Task defExp: k  of task: matrixMul_SNC_7
Task def: k  of task: matrixMul_SNC_7
     ... has # of chain uses: 4
Check Uses: [k<16, #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);, #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);,  ++ k]
Task useExp: As[threadIdx.y][k]  of task: matrixMul_SNC_7
Task use: As  of task: matrixMul_SNC_7
     ... has # of chain defs: 1
Check Defs: [#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];]
      ... has Def out of task
      > #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Task useExp: Bs[k][threadIdx.x]  of task: matrixMul_SNC_7
Task use: Bs  of task: matrixMul_SNC_7
     ... has # of chain defs: 1
Check Defs: [#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];]
      ... has Def out of task
      > #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
Task useExp: Csub_block[threadIdx.y][threadIdx.x]  of task: matrixMul_SNC_7
Task use: Csub_block  of task: matrixMul_SNC_7
Task useExp: k  of task: matrixMul_SNC_7
Task use: k  of task: matrixMul_SNC_7
     ... has # of chain defs: 2
Check Defs: [#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0;,  ++ k]
Task useExp: threadIdx.x  of task: matrixMul_SNC_7
Task useExp: threadIdx.y  of task: matrixMul_SNC_7
Task Statement: #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();  of task: matrixMul_SNC_7
Task Statement: #pragma fcuda compute cores=1 name=SNC_7 end=true begin=false   of task: matrixMul_SNC_7
Shift Decl: int k  to proc: matrixMul_SNC_7
----0041----enter for_1, curr asCnt is: 26
----0042----annotStmt is: 
----0043----list fcAnnots is: []
----0041----enter for_1, curr asCnt is: 27
----0042----annotStmt is: 
----0043----list fcAnnots is: []
----0041----enter for_1, curr asCnt is: 28
----0042----annotStmt is: #pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
----0043----list fcAnnots is: [#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true ]
----00431----enter for_2 curr fcannot is: #pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
----00432----curr annotType is: tloop
----00433----curr bgn is: true
----0043A----curr annotType is not COM nor TRN
----0041----enter for_1, curr asCnt is: 29
----0042----annotStmt is: #pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 
----0043----list fcAnnots is: [#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false ]
----00431----enter for_2 curr fcannot is: #pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 
----00432----curr annotType is: tloop
----00433----curr bgn is: false
----0043A----curr annotType is not COM nor TRN
----0041----enter for_1, curr asCnt is: 30
----0042----annotStmt is: 
----0043----list fcAnnots is: []
-----SFT2 finished decomposeKernel();-----
-----proc after decomposeKernel-----
#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

-----6.0----generateMemcpy starts-----
----6.1----stmt is: int aBegin;
----6.11----test_children is: [int aBegin]
----6.12----test_annot is: null
----6.1----stmt is: int aEnd;
----6.11----test_children is: [int aEnd]
----6.12----test_annot is: null
----6.1----stmt is: int aStep;
----6.11----test_children is: [int aStep]
----6.12----test_annot is: null
----6.1----stmt is: int bBegin;
----6.11----test_children is: [int bBegin]
----6.12----test_annot is: null
----6.1----stmt is: int bStep;
----6.11----test_children is: [int bStep]
----6.12----test_annot is: null
----6.1----stmt is: __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];
----6.11----test_children is: [__shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X]]
----6.12----test_annot is: null
----6.1----stmt is: int a;
----6.11----test_children is: [int a]
----6.12----test_annot is: null
----6.1----stmt is: int b;
----6.11----test_children is: [int b]
----6.12----test_annot is: null
----6.1----stmt is: int k;
----6.11----test_children is: [int k]
----6.12----test_annot is: null
----6.1----stmt is: int c;
----6.11----test_children is: [int c]
----6.12----test_annot is: null
----6.1----stmt is: dim3 blockIdx;
----6.11----test_children is: [dim3 blockIdx]
----6.12----test_annot is: null
----6.1----stmt is: int guard_matrixMul_CMP_5;
----6.11----test_children is: [int guard_matrixMul_CMP_5]
----6.12----test_annot is: null
----6.1----stmt is: int guard_matrixMul_TRN_10;
----6.11----test_children is: [int guard_matrixMul_TRN_10]
----6.12----test_annot is: null
----6.1----stmt is: int guard_matrixMul_TRN_6;
----6.11----test_children is: [int guard_matrixMul_TRN_6]
----6.12----test_annot is: null
----6.1----stmt is: int guard_matrixMul_SNC_7;
----6.11----test_children is: [int guard_matrixMul_SNC_7]
----6.12----test_annot is: null
----6.1----stmt is: guard_matrixMul_SNC_7=1;
----6.11----test_children is: [guard_matrixMul_SNC_7=1]
----6.12----test_annot is: null
----6.1----stmt is: guard_matrixMul_TRN_6=1;
----6.11----test_children is: [guard_matrixMul_TRN_6=1]
----6.12----test_annot is: null
----6.1----stmt is: guard_matrixMul_TRN_10=1;
----6.11----test_children is: [guard_matrixMul_TRN_10=1]
----6.12----test_annot is: null
----6.1----stmt is: guard_matrixMul_CMP_5=1;
----6.11----test_children is: [guard_matrixMul_CMP_5=1]
----6.12----test_annot is: null
----6.1----stmt is: #pragma HLS INTERFACE ap_bus port=A depth=3840 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma HLS INTERFACE ap_bus port=A depth=3840 ]
----6.1----stmt is: #pragma HLS INTERFACE ap_bus port=B depth=6144 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma HLS INTERFACE ap_bus port=B depth=6144 ]
----6.1----stmt is: #pragma HLS INTERFACE ap_bus port=C depth=10240 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma HLS INTERFACE ap_bus port=C depth=10240 ]
----6.1----stmt is: aBegin=((wA*16)*blockIdx.y);
----6.11----test_children is: [aBegin=((wA*16)*blockIdx.y)]
----6.12----test_annot is: null
----6.1----stmt is: aEnd=((aBegin+wA)-1);
----6.11----test_children is: [aEnd=((aBegin+wA)-1)]
----6.12----test_annot is: null
----6.1----stmt is: aStep=16;
----6.11----test_children is: [aStep=16]
----6.12----test_annot is: null
----6.1----stmt is: bBegin=(16*blockIdx.x);
----6.11----test_children is: [bBegin=(16*blockIdx.x)]
----6.12----test_annot is: null
----6.1----stmt is: bStep=(16*wB);
----6.11----test_children is: [bStep=(16*wB)]
----6.12----test_annot is: null
----6.1----stmt is: matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
----6.11----test_children is: [matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block)]
----6.12----test_annot is: null
----6.1----stmt is: #pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true ]

 ... Preprocessing pragma: 
	#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
----6.1----stmt is: #pragma fcuda tloop name=CMP_5 end=false begin=true 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda tloop name=CMP_5 end=false begin=true ]

 ... Preprocessing pragma: 
	#pragma fcuda tloop name=CMP_5 end=false begin=true 
----6.15----find tloop
----6.1----stmt is: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
----6.11----test_children is: [Csub_block[threadIdx.y][threadIdx.x]=0]
----6.12----test_annot is: [#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true ]
----6.13----find stmt annot

 ... Preprocessing pragma: 
	#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
----6.1----stmt is: #pragma fcuda tloop name=CMP_5 end=true begin=false 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda tloop name=CMP_5 end=true begin=false ]

 ... Preprocessing pragma: 
	#pragma fcuda tloop name=CMP_5 end=true begin=false 
----6.15----find tloop
----6.1----stmt is: #pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false ]

 ... Preprocessing pragma: 
	#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
----6.1----stmt is: a=0;
----6.11----test_children is: [a=0]
----6.12----test_annot is: null
----6.1----stmt is: b=0;
----6.11----test_children is: [b=0]
----6.12----test_annot is: null
----6.1----stmt is: k=0;
----6.11----test_children is: [k=0]
----6.12----test_annot is: null
----6.1----stmt is: ((a=aBegin), (b=bBegin));
----6.11----test_children is: [((a=aBegin), (b=bBegin))]
----6.12----test_annot is: null
----6.1----stmt is: __shared__ DATATYPE As[16][16];
----6.11----test_children is: [__shared__ DATATYPE As[16][16]]
----6.12----test_annot is: null
----6.1----stmt is: __shared__ DATATYPE Bs[16][16];
----6.11----test_children is: [__shared__ DATATYPE Bs[16][16]]
----6.12----test_annot is: null
----6.1----stmt is: 
----6.11----test_children is: []
----6.12----test_annot is: []
----6.1----stmt is: 
----6.11----test_children is: []
----6.12----test_annot is: []
----6.1----stmt is: matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
----6.11----test_children is: [matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB)]
----6.12----test_annot is: null
----6.1----stmt is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true ]

 ... Preprocessing pragma: 
	#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
----6.14----find transfer begin
----6.1----stmt is: #pragma fcuda tloop name=TRN_6 end=false begin=true 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda tloop name=TRN_6 end=false begin=true ]

 ... Preprocessing pragma: 
	#pragma fcuda tloop name=TRN_6 end=false begin=true 
----6.15----find tloop
----6.1----stmt is: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
----6.11----test_children is: [As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)]]
----6.12----test_annot is: [#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true ]
----6.13----find stmt annot

 ... Preprocessing pragma: 
	#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
----6.16----find stmt
----6.16----children size: 1
----6.160----stmtpragmas: []
----6.161----test_annot: [#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true ]
----6.162----real_stmt: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
----6.1----stmt is: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
----6.11----test_children is: [Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)]]
----6.12----test_annot is: [#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true ]
----6.13----find stmt annot

 ... Preprocessing pragma: 
	#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
----6.16----find stmt
----6.16----children size: 1
----6.160----stmtpragmas: []
----6.161----test_annot: [#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true ]
----6.162----real_stmt: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
----6.1----stmt is: #pragma fcuda tloop name=TRN_6 end=true begin=false 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda tloop name=TRN_6 end=true begin=false ]

 ... Preprocessing pragma: 
	#pragma fcuda tloop name=TRN_6 end=true begin=false 
----6.15----find tloop
----6.1----stmt is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false ]

 ... Preprocessing pragma: 
	#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
----6.17----find transfer end
----6.18----ready to enter addTransferParameters
----transferAnnot is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
----transferStmt is: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
----real_trn is: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
----taskDecls is: [dim3 blockDim, dim3 gridDim]
----taskArgs is: [blockDim, gridDim]
----taskArgSet is: [blockDim, gridDim]
----commonArgsIndex is: [0, 1]
----6.19----enter addTransferParameters2

 ... Handling transfer params for 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
----6.23----1.collecting parameters----
-------GLBpntr is: [B]
-------core: [1]
-------size: [BLOCKDIM_X]
-------rdNwrt: true
-------name: TRN_6
-------type: null
-------base: []
----6.24----transferAnnot.getAnnotatable: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
----6.25--------
----annotStmt: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
----cStmt: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
----transferStmtf2: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
---------------------------------
----6.26------ptrName is: B
----6.26------ptrId is: B
----6.27------ptrDecl is: DATATYPE * B
----6.28------ptrDeclor is: * B
----6.28------ptrDeclorSpecs is: [* ]
----6.29----ptrDecl.getSpecifiers(): [DATATYPE]
----6.30--volatPtrDecl: DATATYPE * B
----6.300----taskArgSet not contain ptrId, enter if
----6.31--transferStmtf2: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
transferStmtf2: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
----6.31--real_trn: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
[findBRAM]: Annotated Statement --> #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
---Assignments---  [Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)]]
----6.32--bramId: Bs
----6.33--bramDecl: __shared__ DATATYPE Bs[16][16]
------6.331---in try block now------
------6.331---in catch block now------
------6.332---taskArgSet not contain bramId, enter if------
BRAM: Bs  Dim: 2
Array access, but dimension greater than 1 Bs[threadIdx.y][threadIdx.x]
------6.34----onChipOffset is: null
------6.34----prefixOffset is: TRN_6_Bs_offset
------6.34----coeffOffset is: TRN_6_Bs_offset
------6.34----offsetDeclor is: TRN_6_Bs_offset
------6.34----offsetDeclion is: int TRN_6_Bs_offset
----addStatementBefore----index is:4
------6.341----before taskArgs: [blockDim, gridDim, B, Bs]
------6.341----before taskDecls: [dim3 blockDim, dim3 gridDim, DATATYPE * B, __shared__ DATATYPE Bs[16][16]]
------6.341----after taskArgs: [blockDim, gridDim, B, Bs, TRN_6_Bs_offset]
------6.341----after taskDecls: [dim3 blockDim, dim3 gridDim, DATATYPE * B, __shared__ DATATYPE Bs[16][16], int TRN_6_Bs_offset]
------6.35----after offset added, cStmt is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
------6.36----after memcpyArgs added, memcpyArgs is: [(TRN_6_Bs_offset+Bs[threadIdx.y])]
Parsing ((b+(wB*threadIdx.y))+threadIdx.x)
Terms [b, (wB*threadIdx.y), threadIdx.x]
Terms [threadIdx.y]
Base expr b
c1 = wB
c2 = null
c3 = 1
c4 = null
c5 = null
------6.37----baseAddrForBurst is: b
------6.370----j is: 0
------6.371----prefix is: TRN_6_Bs_X
------6.372----coeffVar is: TRN_6_Bs_X_0
------6.373----cDeclor is: TRN_6_Bs_X_0
------6.374----cDeclion is: int TRN_6_Bs_X_0
----addStatementBefore----index is:5
------6.38----taskArgs is: [blockDim, gridDim, B, Bs, TRN_6_Bs_offset, TRN_6_Bs_X_0]
------6.38----taskDecls is: [dim3 blockDim, dim3 gridDim, DATATYPE * B, __shared__ DATATYPE Bs[16][16], int TRN_6_Bs_offset, int TRN_6_Bs_X_0]
------6.38----cStmt is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
------6.370----j is: 1
------6.371----prefix is: TRN_6_Bs_c
------6.372----coeffVar is: TRN_6_Bs_c_1
------6.373----cDeclor is: TRN_6_Bs_c_1
------6.374----cDeclion is: int TRN_6_Bs_c_1
----addStatementBefore----index is:6
------6.38----taskArgs is: [blockDim, gridDim, B, Bs, TRN_6_Bs_offset, TRN_6_Bs_X_0, TRN_6_Bs_c_1]
------6.38----taskDecls is: [dim3 blockDim, dim3 gridDim, DATATYPE * B, __shared__ DATATYPE Bs[16][16], int TRN_6_Bs_offset, int TRN_6_Bs_X_0, int TRN_6_Bs_c_1]
------6.38----cStmt is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
------6.39----memcpyArgs is: [(TRN_6_Bs_offset+Bs[threadIdx.y]), ((B+TRN_6_Bs_X_0)+(threadIdx.y*TRN_6_Bs_c_1))]
------6.40----after memsize, memcpyArgs is: [(TRN_6_Bs_offset+Bs[threadIdx.y]), ((B+TRN_6_Bs_X_0)+(threadIdx.y*TRN_6_Bs_c_1)), (BLOCKDIM_X*sizeof (DATATYPE))]
------6.40----memcpyCall is: memcpy((TRN_6_Bs_offset+Bs[threadIdx.y]), ((B+TRN_6_Bs_X_0)+(threadIdx.y*TRN_6_Bs_c_1)), (BLOCKDIM_X*sizeof (DATATYPE)))
------6.42----after add memcpy before real_trn: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
--------sftTaskArgSyms: [Bs[16][16], Csub_block[BLOCKDIM_Y][BLOCKDIM_X], As[16][16], guard_matrixMul_SNC_7]
--------sftTaskArgs: [guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs]
--------sftTaskDecls: [int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16]]
--------sftCommonArgsIndex: [1, 2]
------6.44----before leave addTrans, cstmt is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
----6.1----stmt is: 
----6.11----test_children is: []
----6.12----test_annot is: []
----6.1----stmt is: 
----6.11----test_children is: []
----6.12----test_annot is: []
----6.1----stmt is: 
----6.11----test_children is: []
----6.12----test_annot is: []
----6.1----stmt is: matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
----6.11----test_children is: [matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs)]
----6.12----test_annot is: null
----6.1----stmt is: #pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true ]

 ... Preprocessing pragma: 
	#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
----6.1----stmt is: #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
----6.11----test_children is: [__syncthreads()]
----6.12----test_annot is: [#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 ]
----6.13----find stmt annot

 ... Preprocessing pragma: 
	#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
----6.1----stmt is: lp1:
----6.11----test_children is: [lp1]
----6.12----test_annot is: null
----6.1----stmt is: 
----6.11----test_children is: []
----6.12----test_annot is: []
----6.1----stmt is: #pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true ]

 ... Preprocessing pragma: 
	#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
----6.15----find tloop
----6.1----stmt is: #pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0;
----6.11----test_children is: [k=0]
----6.12----test_annot is: [#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 ]
----6.13----find stmt annot

 ... Preprocessing pragma: 
	#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
----6.1----stmt is: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
----6.11----test_children is: [Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x])]
----6.12----test_annot is: [#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true ]
----6.13----find stmt annot

 ... Preprocessing pragma: 
	#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
----6.1----stmt is: #pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
----6.11----test_children is: [#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);]
----6.12----test_annot is: [#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 ]
----6.13----find stmt annot

 ... Preprocessing pragma: 
	#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
----6.1----stmt is: #pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
----6.11----test_children is: [#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0;, k<16,  ++ k, #pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}]
----6.12----test_annot is: [#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 ]
----6.13----find stmt annot

 ... Preprocessing pragma: 
	#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
----6.1----stmt is: #pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false ]

 ... Preprocessing pragma: 
	#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 
----6.15----find tloop
----6.1----stmt is: 
----6.11----test_children is: []
----6.12----test_annot is: []
----6.1----stmt is: {
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
----6.11----test_children is: [lp1:, , #pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true , #pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}, #pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false , ]
----6.12----test_annot is: null
----6.1----stmt is: #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
----6.11----test_children is: [__syncthreads()]
----6.12----test_annot is: [#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 ]
----6.13----find stmt annot

 ... Preprocessing pragma: 
	#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
----6.1----stmt is: #pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false ]

 ... Preprocessing pragma: 
	#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
----6.1----stmt is: 
----6.11----test_children is: []
----6.12----test_annot is: []
----6.1----stmt is: {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
----6.11----test_children is: [__shared__ DATATYPE As[16][16];, __shared__ DATATYPE Bs[16][16];, , , TRN_6_Bs_offset=0;, TRN_6_Bs_X_0=b;, TRN_6_Bs_c_1=wB;, matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);, #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true , #pragma fcuda tloop name=TRN_6 end=false begin=true , #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];, #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];, #pragma fcuda tloop name=TRN_6 end=true begin=false , #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false , , , , matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);, #pragma fcuda compute cores=1 name=SNC_7 end=false begin=true , #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();, {
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}, #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();, #pragma fcuda compute cores=1 name=SNC_7 end=true begin=false , ]
----6.12----test_annot is: null
----6.1----stmt is: #pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
----6.11----test_children is: [((a=aBegin), (b=bBegin));, a<=aEnd, ((a+=aStep), (b+=bStep)), {
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}]
----6.12----test_annot is: [#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 ]
----6.13----find stmt annot

 ... Preprocessing pragma: 
	#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
----6.1----stmt is: c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));
----6.11----test_children is: [c=(((wB*16)*blockIdx.y)+(16*blockIdx.x))]
----6.12----test_annot is: null
----6.1----stmt is: 
----6.11----test_children is: []
----6.12----test_annot is: []
----6.1----stmt is: 
----6.11----test_children is: []
----6.12----test_annot is: []
----6.1----stmt is: matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
----6.11----test_children is: [matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB)]
----6.12----test_annot is: null
----6.1----stmt is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true ]

 ... Preprocessing pragma: 
	#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
----6.14----find transfer begin
----6.1----stmt is: #pragma fcuda tloop name=TRN_10 end=false begin=true 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda tloop name=TRN_10 end=false begin=true ]

 ... Preprocessing pragma: 
	#pragma fcuda tloop name=TRN_10 end=false begin=true 
----6.15----find tloop
----6.1----stmt is: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
----6.11----test_children is: [C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x]]
----6.12----test_annot is: [#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true ]
----6.13----find stmt annot

 ... Preprocessing pragma: 
	#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
----6.16----find stmt
----6.16----children size: 1
----6.160----stmtpragmas: []
----6.161----test_annot: [#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true ]
----6.162----real_stmt: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
----6.1----stmt is: #pragma fcuda tloop name=TRN_10 end=true begin=false 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda tloop name=TRN_10 end=true begin=false ]

 ... Preprocessing pragma: 
	#pragma fcuda tloop name=TRN_10 end=true begin=false 
----6.15----find tloop
----6.1----stmt is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
----6.11----test_children is: []
----6.12----test_annot is: [#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false ]

 ... Preprocessing pragma: 
	#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
----6.17----find transfer end
----6.18----ready to enter addTransferParameters
----transferAnnot is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
----transferStmt is: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
----real_trn is: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
----taskDecls is: [dim3 blockDim, dim3 gridDim]
----taskArgs is: [blockDim, gridDim]
----taskArgSet is: [blockDim, gridDim]
----commonArgsIndex is: [0, 1]
----6.19----enter addTransferParameters2

 ... Handling transfer params for 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
----6.23----1.collecting parameters----
-------GLBpntr is: [C]
-------core: [1]
-------size: [BLOCKDIM_X]
-------rdNwrt: false
-------name: TRN_10
-------type: null
-------base: []
----6.24----transferAnnot.getAnnotatable: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
----6.25--------
----annotStmt: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
----cStmt: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
----transferStmtf2: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
---------------------------------
----6.26------ptrName is: C
----6.26------ptrId is: C
----6.27------ptrDecl is: DATATYPE * C
----6.28------ptrDeclor is: * C
----6.28------ptrDeclorSpecs is: [* ]
----6.29----ptrDecl.getSpecifiers(): [DATATYPE]
----6.30--volatPtrDecl: DATATYPE * C
----6.300----taskArgSet not contain ptrId, enter if
----6.31--transferStmtf2: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
transferStmtf2: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
----6.31--real_trn: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
[findBRAM]: Annotated Statement --> #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
---Assignments---  [C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x]]
----6.32--bramId: Csub_block
----6.33--bramDecl: __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
------6.331---in try block now------
------6.331---in catch block now------
------6.332---taskArgSet not contain bramId, enter if------
BRAM: Csub_block  Dim: 2
Array access, but dimension greater than 1 Csub_block[threadIdx.y][threadIdx.x]
------6.34----onChipOffset is: null
------6.34----prefixOffset is: TRN_10_Csub_block_offset
------6.34----coeffOffset is: TRN_10_Csub_block_offset
------6.34----offsetDeclor is: TRN_10_Csub_block_offset
------6.34----offsetDeclion is: int TRN_10_Csub_block_offset
----addStatementBefore----index is:44
------6.341----before taskArgs: [blockDim, gridDim, C, Csub_block]
------6.341----before taskDecls: [dim3 blockDim, dim3 gridDim, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X]]
------6.341----after taskArgs: [blockDim, gridDim, C, Csub_block, TRN_10_Csub_block_offset]
------6.341----after taskDecls: [dim3 blockDim, dim3 gridDim, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int TRN_10_Csub_block_offset]
------6.35----after offset added, cStmt is: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
------6.36----after memcpyArgs added, memcpyArgs is: [(TRN_10_Csub_block_offset+Csub_block[threadIdx.y])]
Parsing ((c+(wB*threadIdx.y))+threadIdx.x)
Terms [c, (wB*threadIdx.y), threadIdx.x]
Terms [threadIdx.y]
Base expr c
c1 = wB
c2 = null
c3 = 1
c4 = null
c5 = null
------6.37----baseAddrForBurst is: c
------6.370----j is: 0
------6.371----prefix is: TRN_10_Csub_block_X
------6.372----coeffVar is: TRN_10_Csub_block_X_0
------6.373----cDeclor is: TRN_10_Csub_block_X_0
------6.374----cDeclion is: int TRN_10_Csub_block_X_0
----addStatementBefore----index is:46
------6.38----taskArgs is: [blockDim, gridDim, C, Csub_block, TRN_10_Csub_block_offset, TRN_10_Csub_block_X_0]
------6.38----taskDecls is: [dim3 blockDim, dim3 gridDim, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int TRN_10_Csub_block_offset, int TRN_10_Csub_block_X_0]
------6.38----cStmt is: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
------6.370----j is: 1
------6.371----prefix is: TRN_10_Csub_block_c
------6.372----coeffVar is: TRN_10_Csub_block_c_1
------6.373----cDeclor is: TRN_10_Csub_block_c_1
------6.374----cDeclion is: int TRN_10_Csub_block_c_1
----addStatementBefore----index is:48
------6.38----taskArgs is: [blockDim, gridDim, C, Csub_block, TRN_10_Csub_block_offset, TRN_10_Csub_block_X_0, TRN_10_Csub_block_c_1]
------6.38----taskDecls is: [dim3 blockDim, dim3 gridDim, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int TRN_10_Csub_block_offset, int TRN_10_Csub_block_X_0, int TRN_10_Csub_block_c_1]
------6.38----cStmt is: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
------6.39----memcpyArgs is: [(TRN_10_Csub_block_offset+Csub_block[threadIdx.y]), ((C+TRN_10_Csub_block_X_0)+(threadIdx.y*TRN_10_Csub_block_c_1))]
------6.40----after memsize, memcpyArgs is: [((C+TRN_10_Csub_block_X_0)+(threadIdx.y*TRN_10_Csub_block_c_1)), (TRN_10_Csub_block_offset+Csub_block[threadIdx.y]), (BLOCKDIM_X*sizeof (DATATYPE))]
------6.40----memcpyCall is: memcpy(((C+TRN_10_Csub_block_X_0)+(threadIdx.y*TRN_10_Csub_block_c_1)), (TRN_10_Csub_block_offset+Csub_block[threadIdx.y]), (BLOCKDIM_X*sizeof (DATATYPE)))
------6.42----after add memcpy before real_trn: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
--------sftTaskArgSyms: [Bs[16][16], Csub_block[BLOCKDIM_Y][BLOCKDIM_X], As[16][16], guard_matrixMul_SNC_7]
--------sftTaskArgs: [guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs]
--------sftTaskDecls: [int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16]]
--------sftCommonArgsIndex: [1, 2]
------6.44----before leave addTrans, cstmt is: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
----6.1----stmt is: 
----6.11----test_children is: []
----6.12----test_annot is: []
----6.1----stmt is: 
----6.11----test_children is: []
----6.12----test_annot is: []
----6.1----stmt is: return ;
----6.11----test_children is: []
----6.12----test_annot is: null
----6.1----stmt is: {
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}
----6.11----test_children is: [int aBegin;, int aEnd;, int aStep;, int bBegin;, int bStep;, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X];, int a;, int b;, int k;, int c;, dim3 blockIdx;, int guard_matrixMul_CMP_5;, int guard_matrixMul_TRN_10;, int guard_matrixMul_TRN_6;, int guard_matrixMul_SNC_7;, int TRN_6_Bs_offset;, int TRN_6_Bs_X_0;, int TRN_6_Bs_c_1;, int TRN_10_Csub_block_offset;, int TRN_10_Csub_block_X_0;, int TRN_10_Csub_block_c_1;, guard_matrixMul_SNC_7=1;, guard_matrixMul_TRN_6=1;, guard_matrixMul_TRN_10=1;, guard_matrixMul_CMP_5=1;, #pragma HLS INTERFACE ap_bus port=A depth=3840 , #pragma HLS INTERFACE ap_bus port=B depth=6144 , #pragma HLS INTERFACE ap_bus port=C depth=10240 , aBegin=((wA*16)*blockIdx.y);, aEnd=((aBegin+wA)-1);, aStep=16;, bBegin=(16*blockIdx.x);, bStep=(16*wB);, matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);, #pragma fcuda compute cores=1 name=CMP_5 end=false begin=true , #pragma fcuda tloop name=CMP_5 end=false begin=true , #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;, #pragma fcuda tloop name=CMP_5 end=true begin=false , #pragma fcuda compute cores=1 name=CMP_5 end=true begin=false , a=0;, b=0;, k=0;, #pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}, c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));, , , TRN_10_Csub_block_offset=0;, TRN_10_Csub_block_X_0=c;, TRN_10_Csub_block_c_1=wB;, matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);, #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true , #pragma fcuda tloop name=TRN_10 end=false begin=true , #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];, #pragma fcuda tloop name=TRN_10 end=true begin=false , #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false , , , return ;]
----6.12----test_annot is: null
-----6.9----generateMemcpy ends-----
-----6.9----proc is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 


return ;
}

-----start to fillDecomposedTasks-----
Moving task statement: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
Moving task statement: #pragma fcuda tloop name=TRN_6 end=false begin=true 
Moving task statement: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
Moving task statement: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
Moving task statement: #pragma fcuda tloop name=TRN_6 end=true begin=false 
Moving task statement: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
Moving task statement: #pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
Moving task statement: #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
Moving task statement: {
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
Moving task statement: #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
Moving task statement: #pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
Moving task statement: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
Moving task statement: #pragma fcuda tloop name=TRN_10 end=false begin=true 
Moving task statement: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
Moving task statement: #pragma fcuda tloop name=TRN_10 end=true begin=false 
Moving task statement: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
Moving task statement: #pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
Moving task statement: #pragma fcuda tloop name=CMP_5 end=false begin=true 
Moving task statement: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
Moving task statement: #pragma fcuda tloop name=CMP_5 end=true begin=false 
Moving task statement: #pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
-----SFT2 finished fillDecomposedTasks();-----
-----proc after filldecomposedTasks-----
#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}

-----KernUnit after filldecomposedTasks-----
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_CMP_5)
{
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
}
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
if (guard_matrixMul_TRN_10)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
}
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
if (guard_matrixMul_TRN_6)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
}
}

#pragma fcuda compute name=SNC_7 end=false cores=1 begin=true 
void matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16])
{
if (guard_matrixMul_SNC_7)
{
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
}
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}


-----start to shiftDeclarations-----
----FcudaGlobalData2.java start----
-----cetus application IPChainAnalysis start----
-----cetus application IPChainAnalysis 1----
------IPChainAnalysis.java PerformAliasAnalysis start----
-------IPPointsToAnalysis.java IPPointsToAnalysis start super----
--------IPAnalysis.java IPAnalysis start 1----
--------IPAnalysis.java IPAnalysis start 2----
[NormalizeReturn] begin
*AP* procedure: __syncthreads
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul_CMP_5
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul_TRN_10
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul_TRN_6
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul_SNC_7
*AP* is_void=true
*AP* ret_expr= null
*AP* procedure: matrixMul
*AP* is_void=true
*AP* ret_expr= null
[NormalizeReturn] end in 0.00 seconds
[WARNING] Undeclared symbol k from k=0
[WARNING] Undeclared symbol k from k<16
[WARNING] Undeclared symbol k from  ++ k
[WARNING] Undeclared symbol k from As[threadIdx.y][k]
[WARNING] Undeclared symbol k from Bs[k][threadIdx.x]
[LinkSymbol] 124 updates in 0.00 seconds
--------IPAnalysis.java IPAnalysis start 3 enter IPA Graph----
---------IPAGraph.java finish super()----
---------IPAGraph.java start new Arraylist <IPANode>----
---------IPAGraph.java enter buildgraph<prog> 
---------IPAGraph.java enter identifyCloneableNodes
---------IPAGraph.java enter buildTopOrder
---------IPAGraph.java finish new IPA Graph
[IPA] Stops due to no flow entry
-------IPPointsToAnalysis.java IPPointsToAnalysis finished super----
-------IPPointsToAnalysis.java IPPointsToAnalysis finished 2----
-------IPPointsToAnalysis.java IPPointsToAnalysis end----
------PerformAliasAnalysis 1----
0000IPpointsToAnalysis
[IPA:PointsTo] Stops due to no flow entry
------PerformAliasAnalysis end----
-----cetus application IPChainAnalysis 2----
-----cetus application IPChainAnalysis 3----
----------------------------------------------
----start to generate CF graph with thread----
----------------------------------------------
proc now is: void __syncthreads()
{
;
return ;
}
=====
proc now is: #pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_CMP_5)
{
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
}
return ;
}
=====
proc now is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
if (guard_matrixMul_TRN_10)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
}
return ;
}
=====
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
proc now is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
if (guard_matrixMul_TRN_6)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
}
return ;
}
=====
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
proc now is: #pragma fcuda compute name=SNC_7 end=false cores=1 begin=true 
void matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16])
{
if (guard_matrixMul_SNC_7)
{
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
}
return ;
}
=====
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}
=====
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
====== DFAGraph.java enter getFirst()
-----cetus application IPChainAnalysis 4----
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
############### PSG Summary Detail[matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  # Global Info (psg_entry_global, UseOutSet)
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -DEF: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  # Global Info (psg_exit_global, DefInSet)
############### PSG Summary Detail[matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  -USE: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_entry_global, UseOutSet)
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -DEF: C, NODE: * C
  -DEF: C, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_exit_global, DefInSet)
############### PSG Summary Detail[matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  # Global Info (psg_entry_global, UseOutSet)
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: B, NODE: * B
  -DEF: As, NODE: As[16][16]
  -DEF: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -DEF: A, NODE: * A
  -DEF: Bs, NODE: Bs[16][16]
  -DEF: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  # Global Info (psg_exit_global, DefInSet)
############### PSG Summary Detail[matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16])] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  -USE: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -USE: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -USE: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  # Global Info (psg_entry_global, UseOutSet)
## Call Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Call Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
  # Ref Info (psg_call_ref, def)
  psg_call_ref is null
  # Global Info (psg_call_global, DefInSet)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
  # Ref Info (psg_return_ref, use)
  psg_return_ref is null
  # Global Info (psg_return_global, UseOutSet)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: Bs, NODE: Bs[16][16]
  -DEF: As, NODE: As[16][16]
  -DEF: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -DEF: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  # Global Info (psg_exit_global, DefInSet)
############### PSG Summary Detail[matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref, use)
  -USE: B, NODE: matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
  -USE: C, NODE: matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
  -USE: A, NODE: matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
  # Global Info (psg_entry_global, UseOutSet)
## Call Node ## IR: matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
  # Ref Info (psg_call_ref, def)
  # Global Info (psg_call_global, DefInSet)
## Return Node ## IR: matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
  # Ref Info (psg_return_ref, use)
  # Global Info (psg_return_global, UseOutSet)
## Call Node ## IR: matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
  # Ref Info (psg_call_ref, def)
  # Global Info (psg_call_global, DefInSet)
## Return Node ## IR: matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
  # Ref Info (psg_return_ref, use)
  # Global Info (psg_return_global, UseOutSet)
## Call Node ## IR: matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
  # Ref Info (psg_call_ref, def)
  # Global Info (psg_call_global, DefInSet)
## Return Node ## IR: matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
  # Ref Info (psg_return_ref, use)
  # Global Info (psg_return_global, UseOutSet)
## Call Node ## IR: matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
  # Ref Info (psg_call_ref, def)
  # Global Info (psg_call_global, DefInSet)
## Return Node ## IR: matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
  # Ref Info (psg_return_ref, use)
  # Global Info (psg_return_global, UseOutSet)
## Exit Node ##
  # Ref Info (psg_exit_ref, def)
  -DEF: B, NODE: * B
  -DEF: B, NODE: matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
  -DEF: C, NODE: matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
  -DEF: A, NODE: * A
  -DEF: A, NODE: matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
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
############### PSG Propagated Detail[matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  # parameter: Csub_block
  -INuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_entry_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Exit Node ##
  # Ref Info (psg_exit_ref)
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -INuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
############### PSG Propagated Detail[matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  # parameter: Csub_block
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  # parameter: C
  # Global Info (psg_entry_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Exit Node ##
  # Ref Info (psg_exit_ref)
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTdef: C, NODE: * C
  -OUTdef: C, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
############### PSG Propagated Detail[matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  # parameter: Bs
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -INdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -OUTdef: Bs, NODE: Bs[16][16]
  -INuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  # parameter: As
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -INdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -OUTdef: As, NODE: As[16][16]
  -INuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  # parameter: A
  -INdef: A, NODE: * A
  -OUTdef: A, NODE: * A
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
  -INdef: B, NODE: * B
  -OUTdef: B, NODE: * B
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -INdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -OUTdef: As, NODE: As[16][16]
  -INuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INdef: A, NODE: * A
  -OUTdef: A, NODE: * A
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -INdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -OUTdef: Bs, NODE: Bs[16][16]
  -INuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
############### PSG Propagated Detail[matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16])] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  # parameter: As
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -INdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -OUTdef: As, NODE: As[16][16]
  -INuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  # parameter: Bs
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -INdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -OUTdef: Bs, NODE: Bs[16][16]
  -INuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  # parameter: Csub_block
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_entry_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Call Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Call Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
  # Ref Info (psg_call_ref)
  psg_call_ref is null
  # Global Info (psg_call_global)
  psg_call_global is null
## Return Node ## IR: #pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
  # Ref Info (psg_return_ref)
  psg_return_ref is null
  # Global Info (psg_return_global)
  psg_return_global is null
## Exit Node ##
  # Ref Info (psg_exit_ref)
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -INdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -INuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -INdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -INuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -INuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
############### PSG Propagated Detail[matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)] #################
## Entry Node ##
  # Ref Info (psg_entry_ref)
  # parameter: B
  -INuse: B, NODE: matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
  # parameter: C
  -INuse: C, NODE: matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
  # parameter: A
  -INuse: A, NODE: matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
  # Global Info (psg_entry_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Call Node ## IR: matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
  # Ref Info (psg_call_ref)
  -INuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_call_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Return Node ## IR: matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
  # Ref Info (psg_return_ref)
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -INuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_return_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Call Node ## IR: matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
  # Ref Info (psg_call_ref)
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -INdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -OUTdef: Bs, NODE: Bs[16][16]
  -INuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INdef: A, NODE: * A
  -OUTdef: A, NODE: * A
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -INdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -OUTdef: As, NODE: As[16][16]
  -INuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INdef: B, NODE: * B
  -OUTdef: B, NODE: * B
  # Global Info (psg_call_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Return Node ## IR: matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
  # Ref Info (psg_return_ref)
  -INdef: B, NODE: * B
  -OUTdef: B, NODE: * B
  -INdef: A, NODE: * A
  -OUTdef: A, NODE: * A
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -INdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -OUTdef: As, NODE: As[16][16]
  -INuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -INdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -OUTdef: Bs, NODE: Bs[16][16]
  -INuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  # Global Info (psg_return_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Call Node ## IR: matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
  # Ref Info (psg_call_ref)
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -INdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -OUTdef: As, NODE: As[16][16]
  -INuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -INdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -OUTdef: Bs, NODE: Bs[16][16]
  -INuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  # Global Info (psg_call_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Return Node ## IR: matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);
  # Ref Info (psg_return_ref)
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: As[16][16]
  -INdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: As[16][16]
  -OUTdef: As, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
  -INuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: As, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -INuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: Bs[16][16]
  -INdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: Bs[16][16]
  -OUTdef: Bs, NODE: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
  -INuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTuse: Bs, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  # Global Info (psg_return_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Call Node ## IR: matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
  # Ref Info (psg_call_ref)
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTuse: Csub_block, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_call_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Return Node ## IR: matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
  # Ref Info (psg_return_ref)
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -INdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -INdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
  -OUTdef: Csub_block, NODE: Csub_block[BLOCKDIM_Y][BLOCKDIM_X]
  -OUTdef: Csub_block, NODE: #pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
  -INdef: C, NODE: * C
  -INdef: C, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTdef: C, NODE: * C
  -OUTdef: C, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  # Global Info (psg_return_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
## Exit Node ##
  # Ref Info (psg_exit_ref)
  -INdef: B, NODE: * B
  -OUTdef: B, NODE: * B
  -OUTdef: B, NODE: matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
  -OUTdef: B, NODE: * B
  -INdef: C, NODE: * C
  -INdef: C, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -OUTdef: C, NODE: matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);
  -OUTdef: C, NODE: * C
  -OUTdef: C, NODE: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
  -INdef: A, NODE: * A
  -OUTdef: A, NODE: * A
  -OUTdef: A, NODE: matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);
  -OUTdef: A, NODE: * A
  # Global Info (psg_exit_global)
  -INdef: {}
  -OUTdef: {}
  -INuse: {}
  -OUTuse: {}
-----cetus application IPChainAnalysis 5----
-----cetus application IPChainAnalysis 6----
-----cetus application IPChainAnalysis 7----
-----cetus application IPChainAnalysis end----
----FcudaGlobalData2.java end----
Found def k with IR: k=0;
isExist? true
#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}

-----proc after shiftDeclarations();-----
-----kernelTransformPass, finish transformProcedure-----, proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}

[SplitFcudaTasks2-FCUDA] end in 0.29 seconds
[LinkSymbol] 129 updates in 0.00 seconds

*** After SplitFcudaTasks2  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_CMP_5)
{
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
if (guard_matrixMul_TRN_10)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
if (guard_matrixMul_TRN_6)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
}
return ;
}

#pragma fcuda compute name=SNC_7 end=false cores=1 begin=true 
void matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16])
{
if (guard_matrixMul_SNC_7)
{
int k;
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
}
return ;
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}



===========================================
[CleanKernelDecls-FCUDA] begin
[CleanKernelDecls-FCUDA] examining procedure matrixMul
cur_level:0
Defs+Uses:[guard_matrixMul_SNC_7]
Defs+Uses:[guard_matrixMul_TRN_6]
Defs+Uses:[guard_matrixMul_TRN_10]
Defs+Uses:[guard_matrixMul_CMP_5]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[aBegin, blockIdx, blockIdx.y, wA]
Defs+Uses:[aBegin, aEnd, wA]
Defs+Uses:[aStep]
Defs+Uses:[bBegin, blockIdx, blockIdx.x]
Defs+Uses:[bStep, wB]
Defs+Uses:[Csub_block, blockDim, blockIdx, gridDim, guard_matrixMul_CMP_5, matrixMul_CMP_5]
Defs+Uses:[a]
Defs+Uses:[b]
Defs+Uses:[k]
cur_level:1
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[TRN_6_Bs_offset]
Defs+Uses:[TRN_6_Bs_X_0, b]
Defs+Uses:[TRN_6_Bs_c_1, wB]
Defs+Uses:[A, As, B, Bs, a, b, blockDim, blockIdx, gridDim, guard_matrixMul_TRN_6, matrixMul_TRN_6, wA, wB]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[As, Bs, Csub_block, blockDim, blockIdx, gridDim, guard_matrixMul_SNC_7, matrixMul_SNC_7]
Defs+Uses:[]
cur_level:1
var2freqMap{As=2, Bs=2}
funcCallParams[A, As, B, Bs, Csub_block, a, b, blockDim, blockIdx, gridDim, guard_matrixMul_CMP_5, guard_matrixMul_SNC_7, guard_matrixMul_TRN_6, wA, wB]
Defs+Uses:[blockIdx, blockIdx.x, blockIdx.y, c, wB]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[TRN_10_Csub_block_offset]
Defs+Uses:[TRN_10_Csub_block_X_0, c]
Defs+Uses:[TRN_10_Csub_block_c_1, wB]
Defs+Uses:[C, Csub_block, blockDim, blockIdx, c, gridDim, guard_matrixMul_TRN_10, matrixMul_TRN_10, wB]
Defs+Uses:[]
Defs+Uses:[]
Defs+Uses:[]
cur_level:0
var2freqMap{Csub_block=3, TRN_10_Csub_block_X_0=1, TRN_10_Csub_block_c_1=1, TRN_10_Csub_block_offset=1, TRN_6_Bs_X_0=1, TRN_6_Bs_c_1=1, TRN_6_Bs_offset=1, a=5, aBegin=3, aEnd=2, aStep=2, b=5, bBegin=2, bStep=2, c=3, guard_matrixMul_CMP_5=2, guard_matrixMul_SNC_7=2, guard_matrixMul_TRN_10=2, guard_matrixMul_TRN_6=2, k=1}
funcCallParams[A, As, B, Bs, C, Csub_block, a, b, blockDim, blockIdx, c, gridDim, guard_matrixMul_CMP_5, guard_matrixMul_SNC_7, guard_matrixMul_TRN_10, guard_matrixMul_TRN_6, wA, wB]
-----kernelTransformPass, finish transformProcedure-----, proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}

[CleanKernelDecls-FCUDA] end in 0.01 seconds
[LinkSymbol] 129 updates in 0.00 seconds

*** After CleanKernelDecls  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_CMP_5)
{
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
if (guard_matrixMul_TRN_10)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
if (guard_matrixMul_TRN_6)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
}
return ;
}

#pragma fcuda compute name=SNC_7 end=false cores=1 begin=true 
void matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16])
{
if (guard_matrixMul_SNC_7)
{
int k;
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
}
return ;
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}



===========================================
[SerializeThreads2-MCUDA] begin
[SerializeThreads2-MCUDA] examining procedure matrixMul
----ST2-enter ST2 and if (Driver.getOptionValue(Fcuda) != null)
-----ST2-List<Procedure> tskLst = FCUDAutils.getTaskMapping(proc.getSymbolName());
------ST2-if(tskLst != null)
-------ST2-for( Procedure task : tskLst ), task is: #pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
if (guard_matrixMul_CMP_5)
{
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
}
return ;
}

------InsertTLoops flag 1------
------InsertTLoops flag 2------
------InsertTLoops flag 2------
------InsertTLoops flag 3------
------InsertTLoops flag 2------
------InsertTLoops flag 4------
------InsertTLoops flag 5------
------InsertTLoops flag 6------
------InsertTLoops flag 6.1------
------InsertTLoops flag 6.2------
------InsertTLoops flag 6.2------tloopstmts.get(idx) is: #pragma fcuda tloop name=CMP_5 end=false begin=true 
------InsertTLoops flag 6.3------
------InsertTLoops flag 6.1------
------InsertTLoops flag 6.2------
------InsertTLoops flag 6.2------tloopstmts.get(idx) is: #pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
------InsertTLoops flag 6.3------
------InsertTLoops flag 6.4------
------InsertTLoops flag 6.5------
------InsertTLoops flag 7------
------InsertTLoops flag 2------
-------ST2-for( Procedure task : tskLst ), finish current insertTLoops
-------ST2-for( Procedure task : tskLst ), task is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
if (guard_matrixMul_TRN_10)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
}
return ;
}

------InsertTLoops flag 1------
------InsertTLoops flag 2------
------InsertTLoops flag 2------
------InsertTLoops flag 3------
------InsertTLoops flag 2------
------InsertTLoops flag 4------
------InsertTLoops flag 5------
------InsertTLoops flag 6------
------InsertTLoops flag 6.1------
------InsertTLoops flag 6.2------
------InsertTLoops flag 6.2------tloopstmts.get(idx) is: #pragma fcuda tloop name=TRN_10 end=false begin=true 
------InsertTLoops flag 6.3------
------InsertTLoops flag 6.1------
------InsertTLoops flag 6.2------
------InsertTLoops flag 6.2------tloopstmts.get(idx) is: #pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
------InsertTLoops flag 6.3------
------InsertTLoops flag 6.4------
------InsertTLoops flag 6.5------
------InsertTLoops flag 7------
------InsertTLoops flag 2------
-------ST2-for( Procedure task : tskLst ), finish current insertTLoops
-------ST2-for( Procedure task : tskLst ), task is: #pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
if (guard_matrixMul_TRN_6)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
}
return ;
}

------InsertTLoops flag 1------
------InsertTLoops flag 2------
------InsertTLoops flag 2------
------InsertTLoops flag 3------
------InsertTLoops flag 2------
------InsertTLoops flag 4------
------InsertTLoops flag 5------
------InsertTLoops flag 6------
------InsertTLoops flag 6.1------
------InsertTLoops flag 6.2------
------InsertTLoops flag 6.2------tloopstmts.get(idx) is: #pragma fcuda tloop name=TRN_6 end=false begin=true 
------InsertTLoops flag 6.3------
------InsertTLoops flag 6.1------
------InsertTLoops flag 6.2------
------InsertTLoops flag 6.2------tloopstmts.get(idx) is: #pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
------InsertTLoops flag 6.3------
------InsertTLoops flag 6.1------
------InsertTLoops flag 6.2------
------InsertTLoops flag 6.2------tloopstmts.get(idx) is: #pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
------InsertTLoops flag 6.3------
------InsertTLoops flag 6.4------
------InsertTLoops flag 6.5------
------InsertTLoops flag 7------
------InsertTLoops flag 2------
-------ST2-for( Procedure task : tskLst ), finish current insertTLoops
-------ST2-for( Procedure task : tskLst ), task is: #pragma fcuda compute name=SNC_7 end=false cores=1 begin=true 
void matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16])
{
if (guard_matrixMul_SNC_7)
{
int k;
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
}
return ;
}

------InsertTLoops flag 1------
------InsertTLoops flag 2------
------InsertTLoops flag 2------
------InsertTLoops flag 2------
------InsertTLoops flag 2------
------InsertTLoops flag 3------
------InsertTLoops flag 2------
------InsertTLoops flag 4------
------InsertTLoops flag 5------
------InsertTLoops flag 6------
------InsertTLoops flag 6.1------
------InsertTLoops flag 6.2------
------InsertTLoops flag 6.2------tloopstmts.get(idx) is: #pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
------InsertTLoops flag 6.3------
------InsertTLoops flag 6.1------
------InsertTLoops flag 6.2------
------InsertTLoops flag 6.2------tloopstmts.get(idx) is: #pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
------InsertTLoops flag 6.3------
------InsertTLoops flag 6.4------
------InsertTLoops flag 6.5------
------InsertTLoops flag 7------
------InsertTLoops flag 2------
-------ST2-for( Procedure task : tskLst ), finish current insertTLoops
-----kernelTransformPass, finish transformProcedure-----, proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}

[SerializeThreads2-MCUDA] end in 0.01 seconds
[LinkSymbol] 129 updates in 0.00 seconds

*** After SerializeThreads2  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_CMP_5)
{
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
}
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_10)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_6)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
}
return ;
}

#pragma fcuda compute name=SNC_7 end=false cores=1 begin=true 
void matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_SNC_7)
{
int k;
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 
}

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
}
return ;
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}



===========================================
[CleanThreadLoops2-FCUDA] begin
[CleanThreadLoops2-FCUDA] examining procedure matrixMul
mVar2Var:
{threadIdx=[], guard_matrixMul_CMP_5=[], blockDim=[], Csub_block=[threadIdx]}
   TLP Thread-Indep Stmts: []
mVar2Var:
{threadIdx=[], C=[threadIdx, c, wB], c=[], guard_matrixMul_TRN_10=[], blockDim=[], wB=[], Csub_block=[]}
   TLP Thread-Indep Stmts: []
mVar2Var:
{guard_matrixMul_TRN_6=[], A=[], a=[], Bs=[threadIdx, b, wB], threadIdx=[], As=[a, threadIdx, wA], B=[], b=[], blockDim=[], wA=[], wB=[]}
   TLP Thread-Indep Stmts: []
mVar2Var:
{Bs=[], threadIdx=[], As=[], blockDim=[], guard_matrixMul_SNC_7=[], k=[k], Csub_block=[threadIdx, k]}
   TLP Thread-Indep Stmts: []
-----kernelTransformPass, finish transformProcedure-----, proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}

[CleanThreadLoops2-FCUDA] end in 0.02 seconds
[LinkSymbol] 129 updates in 0.00 seconds

*** After CleanThreadLoops2  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_CMP_5)
{
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
}
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_10)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_6)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
}
return ;
}

#pragma fcuda compute name=SNC_7 end=false cores=1 begin=true 
void matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_SNC_7)
{
int k;
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 
}

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
}
return ;
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}



===========================================
[UnrollThreadLoops2-MCUDA] begin
[UnrollThreadLoops2-MCUDA] examining procedure matrixMul

[Unrolling] : matrixMul_CMP_5
[unrollFactor] 1

[Unrolling] : matrixMul_SNC_7
[unrollFactor] 1
mUnrolledIDs: 
{}
-----kernelTransformPass, finish transformProcedure-----, proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}

[UnrollThreadLoops2-MCUDA] end in 0.00 seconds
[LinkSymbol] 129 updates in 0.00 seconds

*** After UnrollThreadLoops2  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_CMP_5)
{
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
}
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_10)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_6)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
}
return ;
}

#pragma fcuda compute name=SNC_7 end=false cores=1 begin=true 
void matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_SNC_7)
{
int k;
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 
}

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
}
return ;
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}



===========================================
[PartitionArrays2-MCUDA] begin
[PartitionArrays2-MCUDA] examining procedure matrixMul
[Memory partition] : matrixMul_CMP_5

[mempartFactor]1
[Memory partition] : matrixMul_TRN_10

[mempartFactor]1
[Memory partition] : matrixMul_TRN_6

[mempartFactor]1
[Memory partition] : matrixMul_SNC_7

[mempartFactor]1
[Memory partition] : matrixMul

-----kernelTransformPass, finish transformProcedure-----, proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}

[PartitionArrays2-MCUDA] end in 0.00 seconds
[LinkSymbol] 129 updates in 0.00 seconds

*** After PartitionArrays2  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_CMP_5)
{
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
}
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_10)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_6)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
}
return ;
}

#pragma fcuda compute name=SNC_7 end=false cores=1 begin=true 
void matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_SNC_7)
{
int k;
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 
}

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
}
return ;
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


return ;
}



===========================================
[WrapBlockIdxLoop2-FCUDA] begin
[WrapBlockIdxLoop2-FCUDA] examining procedure matrixMul
-----kernelTransformPass, finish transformProcedure-----, proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB, dim3 gridDim, dim3 blockDim)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
dim3 blockIdx_loop;
for (blockIdx_loop.y=0; (gridDim.y+(-1*blockIdx_loop.y))>0; blockIdx_loop.y+=1)
{
blockIdx.y=blockIdx_loop.y;
for (blockIdx_loop.x=0; (gridDim.x+(-1*blockIdx_loop.x))>0; blockIdx_loop.x+=1)
{
blockIdx.x=blockIdx_loop.x;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


}
}
}

[WrapBlockIdxLoop2-FCUDA] end in 0.01 seconds
[LinkSymbol] 137 updates in 0.00 seconds

*** After WrapBlockIdxLoop2  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_CMP_5)
{
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
}
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_10)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_6)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
}
return ;
}

#pragma fcuda compute name=SNC_7 end=false cores=1 begin=true 
void matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_SNC_7)
{
int k;
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 
}

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
}
return ;
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB, dim3 gridDim, dim3 blockDim)
{
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
int guard_matrixMul_CMP_5;
int guard_matrixMul_TRN_10;
int guard_matrixMul_TRN_6;
int guard_matrixMul_SNC_7;
int TRN_6_Bs_offset;
int TRN_6_Bs_X_0;
int TRN_6_Bs_c_1;
int TRN_10_Csub_block_offset;
int TRN_10_Csub_block_X_0;
int TRN_10_Csub_block_c_1;
dim3 blockIdx_loop;
for (blockIdx_loop.y=0; (gridDim.y+(-1*blockIdx_loop.y))>0; blockIdx_loop.y+=1)
{
blockIdx.y=blockIdx_loop.y;
for (blockIdx_loop.x=0; (gridDim.x+(-1*blockIdx_loop.x))>0; blockIdx_loop.x+=1)
{
blockIdx.x=blockIdx_loop.x;
guard_matrixMul_SNC_7=1;
guard_matrixMul_TRN_6=1;
guard_matrixMul_TRN_10=1;
guard_matrixMul_CMP_5=1;
#pragma HLS INTERFACE ap_bus port=A depth=3840 
#pragma HLS INTERFACE ap_bus port=B depth=6144 
#pragma HLS INTERFACE ap_bus port=C depth=10240 
aBegin=((wA*16)*blockIdx.y);
aEnd=((aBegin+wA)-1);
aStep=16;
bBegin=(16*blockIdx.x);
bStep=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block);
a=0;
b=0;
k=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a=aBegin), (b=bBegin)); a<=aEnd; ((a+=aStep), (b+=bStep)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset=0;
TRN_6_Bs_X_0=b;
TRN_6_Bs_c_1=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs);

}
c=(((wB*16)*blockIdx.y)+(16*blockIdx.x));


TRN_10_Csub_block_offset=0;
TRN_10_Csub_block_X_0=c;
TRN_10_Csub_block_c_1=wB;
matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB);


}
}
}



===========================================
[DuplicateForFCUDA2-FCUDA] begin
[DuplicateForFCUDA2-FCUDA] examining procedure matrixMul
matrixMul is inStreamProc: false
fcudaCores:
[matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block), matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB), matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB), matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs)]
coreNames: 
[matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block), matrixMul_SNC_7(guard_matrixMul_SNC_7, blockDim, gridDim, blockIdx, Csub_block, As, Bs), matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB), matrixMul_TRN_6(guard_matrixMul_TRN_6, blockDim, gridDim, blockIdx, As, A, a, wA, Bs, B, b, wB)]
------------------------
mVarsToDuplicate: []
mVarsToDuplicate: [a, guard_matrixMul_TRN_6, bStep, b, c, guard_matrixMul_TRN_10, TRN_10_Csub_block_offset, guard_matrixMul_SNC_7, bBegin, k, TRN_10_Csub_block_X_0, blockIdx, TRN_6_Bs_X_0, aStep, aEnd, guard_matrixMul_CMP_5, TRN_6_Bs_offset, TRN_10_Csub_block_c_1, Csub_block, TRN_6_Bs_c_1, aBegin]
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mVarsToDuplicate: [a, guard_matrixMul_TRN_6, bStep, b, c, guard_matrixMul_TRN_10, TRN_10_Csub_block_offset, guard_matrixMul_SNC_7, bBegin, k, TRN_10_Csub_block_X_0, blockIdx, TRN_6_Bs_X_0, aStep, aEnd, guard_matrixMul_CMP_5, TRN_6_Bs_offset, TRN_10_Csub_block_c_1, Csub_block, TRN_6_Bs_c_1, aBegin]
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
   --- handleFcudaCore: matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block)
getCoreType for matrixMul_CMP_5(guard_matrixMul_CMP_5, blockDim, gridDim, blockIdx, Csub_block)
   --- of type COMPUTE: 
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
   --- handleFcudaCore: matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB)
getCoreType for matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB)
getCoreType for matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB)
   --- of typee TRANSFER: 
mId2sym: {Csub_block_block0=Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], TRN_10_Csub_block_X_0_block0=TRN_10_Csub_block_X_0_block0, TRN_10_Csub_block_c_1_block0=TRN_10_Csub_block_c_1_block0, TRN_10_Csub_block_offset_block0=TRN_10_Csub_block_offset_block0, TRN_6_Bs_X_0_block0=TRN_6_Bs_X_0_block0, TRN_6_Bs_c_1_block0=TRN_6_Bs_c_1_block0, TRN_6_Bs_offset_block0=TRN_6_Bs_offset_block0, aBegin_block0=aBegin_block0, aEnd_block0=aEnd_block0, aStep_block0=aStep_block0, a_block0=a_block0, bBegin_block0=bBegin_block0, bStep_block0=bStep_block0, b_block0=b_block0, blockIdx_block0=blockIdx_block0, c_block0=c_block0, guard_matrixMul_CMP_5_block0=guard_matrixMul_CMP_5_block0, guard_matrixMul_SNC_7_block0=guard_matrixMul_SNC_7_block0, guard_matrixMul_TRN_10_block0=guard_matrixMul_TRN_10_block0, guard_matrixMul_TRN_6_block0=guard_matrixMul_TRN_6_block0, k_block0=k_block0}
Treating arguments of call: matrixMul_TRN_10(guard_matrixMul_TRN_10_block0, blockDim, gridDim, blockIdx_block0, C, Csub_block_block0, c_block0, wB)
Arg #0: guard_matrixMul_TRN_10_block0
getCoreName for matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB)
getCoreName for matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB)
Arg #1: blockDim
Arg #2: gridDim
Arg #3: blockIdx_block0
getCoreName for matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB)
getCoreName for matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB)
Arg #4: C
Arg #5: Csub_block_block0
Arg #6: c_block0
Arg #7: wB
getCommonArgsIndex for matrixMul_TRN_10(guard_matrixMul_TRN_10, blockDim, gridDim, blockIdx, C, Csub_block, c, wB)
----addStatementBefore----index is:16
----addStatementBefore----index is:12
----addStatementBefore----index is:17
----addStatementBefore----index is:3
----addStatementBefore----index is:15
----addStatementBefore----index is:24
----addStatementBefore----index is:2
----addStatementBefore----index is:13
----addStatementBefore----index is:1
----addStatementBefore----index is:22
----addStatementBefore----index is:9
----addStatementBefore----index is:14
----addStatementBefore----index is:10
----addStatementBefore----index is:23
----addStatementBefore----index is:4
----addStatementBefore----index is:18
----addStatementBefore----index is:21
----addStatementBefore----index is:8
----addStatementBefore----index is:11
----addStatementBefore----index is:0
----addStatementBefore----index is:0
... handleCompoundStatement finished! 
-----kernelTransformPass, finish transformProcedure-----, proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB, dim3 gridDim, dim3 blockDim)
{
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
int guard_matrixMul_CMP_5_block0;
int guard_matrixMul_TRN_10_block0;
int guard_matrixMul_TRN_6_block0;
int guard_matrixMul_SNC_7_block0;
int TRN_6_Bs_offset_block0;
int TRN_6_Bs_X_0_block0;
int TRN_6_Bs_c_1_block0;
int TRN_10_Csub_block_offset_block0;
int TRN_10_Csub_block_X_0_block0;
int TRN_10_Csub_block_c_1_block0;
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
aBegin_block0=((wA*16)*blockIdx_block0.y);
aEnd_block0=((aBegin_block0+wA)-1);
aStep_block0=16;
bBegin_block0=(16*blockIdx_block0.x);
bStep_block0=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0);
a_block0=0;
b_block0=0;
k_block0=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a_block0=aBegin_block0), (b_block0=bBegin_block0)); a_block0<=aEnd_block0; ((a_block0+=aStep_block0), (b_block0+=bStep_block0)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset_block0=0;
TRN_6_Bs_X_0_block0=b_block0;
TRN_6_Bs_c_1_block0=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6_block0, blockDim, gridDim, blockIdx_block0, As, A, a_block0, wA, Bs, B, b_block0, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0, As, Bs);

}
c_block0=(((wB*16)*blockIdx_block0.y)+(16*blockIdx_block0.x));


TRN_10_Csub_block_offset_block0=0;
TRN_10_Csub_block_X_0_block0=c_block0;
TRN_10_Csub_block_c_1_block0=wB;
matrixMul_TRN_10_wrapper(guard_matrixMul_TRN_10_block0, blockDim, gridDim, blockIdx_block0, C, Csub_block_block0, c_block0, wB);


}
}
}

[DuplicateForFCUDA2-FCUDA] end in 0.01 seconds
[LinkSymbol] 146 updates in 0.00 seconds

*** After DuplicateForFCUDA2  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_CMP_5)
{
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
}
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_10)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_6)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
}
return ;
}

#pragma fcuda compute name=SNC_7 end=false cores=1 begin=true 
void matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_SNC_7)
{
int k;
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
#pragma fcuda stmt SNCtask=true name=SNC_7 HTGNode=SNC_7 tdep=true seqID=7 
__syncthreads();
{
lp1:

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 
}

}
#pragma fcuda stmt SNCtask=true name=SNC_9 HTGNode=SNC_9 tdep=true seqID=9 
__syncthreads();
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
}
return ;
}

void matrixMul_TRN_10_wrapper(int guard_matrixMul_TRN_10_block0, dim3 blockDim, dim3 gridDim, dim3 blockIdx_matrixMul_TRN_10_block0, DATATYPE * C, __shared__ DATATYPE Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], int c_block0, int wB)
{
matrixMul_TRN_10(guard_matrixMul_TRN_10_block0, blockDim, gridDim, blockIdx_matrixMul_TRN_10_block0, C, Csub_block_block0, c_block0, wB);
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB, dim3 gridDim, dim3 blockDim)
{
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
int guard_matrixMul_CMP_5_block0;
int guard_matrixMul_TRN_10_block0;
int guard_matrixMul_TRN_6_block0;
int guard_matrixMul_SNC_7_block0;
int TRN_6_Bs_offset_block0;
int TRN_6_Bs_X_0_block0;
int TRN_6_Bs_c_1_block0;
int TRN_10_Csub_block_offset_block0;
int TRN_10_Csub_block_X_0_block0;
int TRN_10_Csub_block_c_1_block0;
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
aBegin_block0=((wA*16)*blockIdx_block0.y);
aEnd_block0=((aBegin_block0+wA)-1);
aStep_block0=16;
bBegin_block0=(16*blockIdx_block0.x);
bStep_block0=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0);
a_block0=0;
b_block0=0;
k_block0=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a_block0=aBegin_block0), (b_block0=bBegin_block0)); a_block0<=aEnd_block0; ((a_block0+=aStep_block0), (b_block0+=bStep_block0)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset_block0=0;
TRN_6_Bs_X_0_block0=b_block0;
TRN_6_Bs_c_1_block0=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6_block0, blockDim, gridDim, blockIdx_block0, As, A, a_block0, wA, Bs, B, b_block0, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0, As, Bs);

}
c_block0=(((wB*16)*blockIdx_block0.y)+(16*blockIdx_block0.x));


TRN_10_Csub_block_offset_block0=0;
TRN_10_Csub_block_X_0_block0=c_block0;
TRN_10_Csub_block_c_1_block0=wB;
matrixMul_TRN_10_wrapper(guard_matrixMul_TRN_10_block0, blockDim, gridDim, blockIdx_block0, C, Csub_block_block0, c_block0, wB);


}
}
}



===========================================
[CleanSyncFunc-MCUDA] begin
[CleanSyncFunc-MCUDA] examining procedure matrixMul
-----kernelTransformPass, finish transformProcedure-----, proc now is: #pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB, dim3 gridDim, dim3 blockDim)
{
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
int guard_matrixMul_CMP_5_block0;
int guard_matrixMul_TRN_10_block0;
int guard_matrixMul_TRN_6_block0;
int guard_matrixMul_SNC_7_block0;
int TRN_6_Bs_offset_block0;
int TRN_6_Bs_X_0_block0;
int TRN_6_Bs_c_1_block0;
int TRN_10_Csub_block_offset_block0;
int TRN_10_Csub_block_X_0_block0;
int TRN_10_Csub_block_c_1_block0;
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
aBegin_block0=((wA*16)*blockIdx_block0.y);
aEnd_block0=((aBegin_block0+wA)-1);
aStep_block0=16;
bBegin_block0=(16*blockIdx_block0.x);
bStep_block0=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0);
a_block0=0;
b_block0=0;
k_block0=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a_block0=aBegin_block0), (b_block0=bBegin_block0)); a_block0<=aEnd_block0; ((a_block0+=aStep_block0), (b_block0+=bStep_block0)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset_block0=0;
TRN_6_Bs_X_0_block0=b_block0;
TRN_6_Bs_c_1_block0=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6_block0, blockDim, gridDim, blockIdx_block0, As, A, a_block0, wA, Bs, B, b_block0, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0, As, Bs);

}
c_block0=(((wB*16)*blockIdx_block0.y)+(16*blockIdx_block0.x));


TRN_10_Csub_block_offset_block0=0;
TRN_10_Csub_block_X_0_block0=c_block0;
TRN_10_Csub_block_c_1_block0=wB;
matrixMul_TRN_10_wrapper(guard_matrixMul_TRN_10_block0, blockDim, gridDim, blockIdx_block0, C, Csub_block_block0, c_block0, wB);


}
}
}

[CleanSyncFunc-MCUDA] end in 0.00 seconds
[LinkSymbol] 144 updates in 0.00 seconds

*** After CleanSyncFunc  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_CMP_5)
{
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
}
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_10)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_6)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
}
return ;
}

#pragma fcuda compute name=SNC_7 end=false cores=1 begin=true 
void matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_SNC_7)
{
int k;
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
{
lp1:

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 
}

}
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
}
return ;
}

void matrixMul_TRN_10_wrapper(int guard_matrixMul_TRN_10_block0, dim3 blockDim, dim3 gridDim, dim3 blockIdx_matrixMul_TRN_10_block0, DATATYPE * C, __shared__ DATATYPE Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], int c_block0, int wB)
{
matrixMul_TRN_10(guard_matrixMul_TRN_10_block0, blockDim, gridDim, blockIdx_matrixMul_TRN_10_block0, C, Csub_block_block0, c_block0, wB);
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB, dim3 gridDim, dim3 blockDim)
{
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
int guard_matrixMul_CMP_5_block0;
int guard_matrixMul_TRN_10_block0;
int guard_matrixMul_TRN_6_block0;
int guard_matrixMul_SNC_7_block0;
int TRN_6_Bs_offset_block0;
int TRN_6_Bs_X_0_block0;
int TRN_6_Bs_c_1_block0;
int TRN_10_Csub_block_offset_block0;
int TRN_10_Csub_block_X_0_block0;
int TRN_10_Csub_block_c_1_block0;
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
aBegin_block0=((wA*16)*blockIdx_block0.y);
aEnd_block0=((aBegin_block0+wA)-1);
aStep_block0=16;
bBegin_block0=(16*blockIdx_block0.x);
bStep_block0=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0);
a_block0=0;
b_block0=0;
k_block0=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a_block0=aBegin_block0), (b_block0=bBegin_block0)); a_block0<=aEnd_block0; ((a_block0+=aStep_block0), (b_block0+=bStep_block0)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset_block0=0;
TRN_6_Bs_X_0_block0=b_block0;
TRN_6_Bs_c_1_block0=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6_block0, blockDim, gridDim, blockIdx_block0, As, A, a_block0, wA, Bs, B, b_block0, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0, As, Bs);

}
c_block0=(((wB*16)*blockIdx_block0.y)+(16*blockIdx_block0.x));


TRN_10_Csub_block_offset_block0=0;
TRN_10_Csub_block_X_0_block0=c_block0;
TRN_10_Csub_block_c_1_block0=wB;
matrixMul_TRN_10_wrapper(guard_matrixMul_TRN_10_block0, blockDim, gridDim, blockIdx_block0, C, Csub_block_block0, c_block0, wB);


}
}
}



===========================================

*** After CleanLaunches  ***
#include <fcuda.h>
#include "../matrixMul.h"
#include <string.h>
const int BLOCKDIM_X = 16, BLOCKDIM_Y = 16;
#pragma fcuda compute name=CMP_5 end=false cores=1 begin=true 
void matrixMul_CMP_5(int guard_matrixMul_CMP_5, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_CMP_5)
{
#pragma fcuda compute cores=1 name=CMP_5 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=CMP_5 end=false begin=true 
#pragma fcuda stmt name=CMP_5 HTGNode=CMP_5 tdep=true seqID=5 tlpName=CMP_5 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]=0;
#pragma fcuda tloop name=CMP_5 end=true begin=false 
}
#pragma fcuda compute cores=1 name=CMP_5 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
void matrixMul_TRN_10(int guard_matrixMul_TRN_10, dim3 blockDim, dim3 gridDim, dim3 blockIdx, DATATYPE * C, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], int c, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_10)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_10 end=false begin=true 
#pragma fcuda stmt rdNwrt=false GLBpntr=C name=TRN_10 HTGNode=TRN_10 tdep_vars=[Csub_block] tdep=true seqID=10 tlpName=TRN_10 TRNtask=true 
C[((c+(wB*threadIdx.y))+threadIdx.x)]=Csub_block[threadIdx.y][threadIdx.x];
#pragma fcuda tloop name=TRN_10 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_10 end=true begin=false 
}
return ;
}

#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
void matrixMul_TRN_6(int guard_matrixMul_TRN_6, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE As[16][16], DATATYPE * A, int a, int wA, __shared__ DATATYPE Bs[16][16], DATATYPE * B, int b, int wB)
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_TRN_6)
{
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=false begin=true 
for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=TRN_6 end=false begin=true 
#pragma fcuda stmt rdNwrt=true GLBpntr=A name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
As[threadIdx.y][threadIdx.x]=A[((a+(wA*threadIdx.y))+threadIdx.x)];
#pragma fcuda stmt rdNwrt=true GLBpntr=B name=TRN_6 HTGNode=TRN_6 tdep=true seqID=6 tlpName=TRN_6 TRNtask=true 
Bs[threadIdx.y][threadIdx.x]=B[((b+(wB*threadIdx.y))+threadIdx.x)];
#pragma fcuda tloop name=TRN_6 end=true begin=false 
}
#pragma fcuda transfer cores=1 size=[BLOCKDIM_X] name=TRN_6 end=true begin=false 
}
return ;
}

#pragma fcuda compute name=SNC_7 end=false cores=1 begin=true 
void matrixMul_SNC_7(int guard_matrixMul_SNC_7, dim3 blockDim, dim3 gridDim, dim3 blockIdx, __shared__ DATATYPE Csub_block[BLOCKDIM_Y][BLOCKDIM_X], __shared__ DATATYPE As[16][16], __shared__ DATATYPE Bs[16][16])
{
dim3 __shared__ threadIdx;
if (guard_matrixMul_SNC_7)
{
int k;
#pragma fcuda compute cores=1 name=SNC_7 end=false begin=true 
{
lp1:

for (threadIdx.z=0;threadIdx.z<blockDim.z ; threadIdx.z=threadIdx.z+1) 
for (threadIdx.y=0;threadIdx.y<blockDim.y ; threadIdx.y=threadIdx.y+1) 
for (threadIdx.x=0;threadIdx.x<blockDim.x ; threadIdx.x=threadIdx.x+1) 
{
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=false begin=true 
#pragma fcuda stmt HTGNode=FOR_HTG_CMP_8 tlpName=FOR_HTG_CMP_8 
for (#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
k=0; k<16;  ++ k)
#pragma fcuda stmt tlpName=FOR_HTG_CMP_8 
{
#pragma fcuda stmt name=CMP_8 HTGNode=CMP_8 tdep_vars=[Bs, As, Csub_block] tdep=true seqID=8 tlpName=FOR_HTG_CMP_8 CMPtask=true 
Csub_block[threadIdx.y][threadIdx.x]+=(As[threadIdx.y][k]*Bs[k][threadIdx.x]);
}
#pragma fcuda tloop name=FOR_HTG_CMP_8 end=true begin=false 
}

}
#pragma fcuda compute cores=1 name=SNC_7 end=true begin=false 
}
return ;
}

void matrixMul_TRN_10_wrapper(int guard_matrixMul_TRN_10_block0, dim3 blockDim, dim3 gridDim, dim3 blockIdx_matrixMul_TRN_10_block0, DATATYPE * C, __shared__ DATATYPE Csub_block_block0[BLOCKDIM_Y][BLOCKDIM_X], int c_block0, int wB)
{
matrixMul_TRN_10(guard_matrixMul_TRN_10_block0, blockDim, gridDim, blockIdx_matrixMul_TRN_10_block0, C, Csub_block_block0, c_block0, wB);
}

#pragma fcuda grid x_dim=16 y_dim=16 
#pragma fcuda coreinfo pipeline=no num_cores=1 
__global__ void matrixMul(DATATYPE * C, DATATYPE * A, DATATYPE * B, int wA, int wB, dim3 gridDim, dim3 blockDim)
{
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
int guard_matrixMul_CMP_5_block0;
int guard_matrixMul_TRN_10_block0;
int guard_matrixMul_TRN_6_block0;
int guard_matrixMul_SNC_7_block0;
int TRN_6_Bs_offset_block0;
int TRN_6_Bs_X_0_block0;
int TRN_6_Bs_c_1_block0;
int TRN_10_Csub_block_offset_block0;
int TRN_10_Csub_block_X_0_block0;
int TRN_10_Csub_block_c_1_block0;
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
aBegin_block0=((wA*16)*blockIdx_block0.y);
aEnd_block0=((aBegin_block0+wA)-1);
aStep_block0=16;
bBegin_block0=(16*blockIdx_block0.x);
bStep_block0=(16*wB);
matrixMul_CMP_5(guard_matrixMul_CMP_5_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0);
a_block0=0;
b_block0=0;
k_block0=0;
#pragma fcuda stmt HTGNode=FOR_HTG_TRN_6 
for (((a_block0=aBegin_block0), (b_block0=bBegin_block0)); a_block0<=aEnd_block0; ((a_block0+=aStep_block0), (b_block0+=bStep_block0)))
{
__shared__ DATATYPE As[16][16];
__shared__ DATATYPE Bs[16][16];


TRN_6_Bs_offset_block0=0;
TRN_6_Bs_X_0_block0=b_block0;
TRN_6_Bs_c_1_block0=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6_block0, blockDim, gridDim, blockIdx_block0, As, A, a_block0, wA, Bs, B, b_block0, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0, As, Bs);

}
c_block0=(((wB*16)*blockIdx_block0.y)+(16*blockIdx_block0.x));


TRN_10_Csub_block_offset_block0=0;
TRN_10_Csub_block_X_0_block0=c_block0;
TRN_10_Csub_block_c_1_block0=wB;
matrixMul_TRN_10_wrapper(guard_matrixMul_TRN_10_block0, blockDim, gridDim, blockIdx_block0, C, Csub_block_block0, c_block0, wB);


}
}
}




*** After ClearCUDASpecs  ***
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
int TRN_6_Bs_offset_block0;
int TRN_6_Bs_X_0_block0;
int TRN_6_Bs_c_1_block0;
int TRN_10_Csub_block_offset_block0;
int TRN_10_Csub_block_X_0_block0;
int TRN_10_Csub_block_c_1_block0;
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
aBegin_block0=((wA*16)*blockIdx_block0.y);
aEnd_block0=((aBegin_block0+wA)-1);
aStep_block0=16;
bBegin_block0=(16*blockIdx_block0.x);
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


TRN_6_Bs_offset_block0=0;
TRN_6_Bs_X_0_block0=b_block0;
TRN_6_Bs_c_1_block0=wB;
matrixMul_TRN_6(guard_matrixMul_TRN_6_block0, blockDim, gridDim, blockIdx_block0, As, A, a_block0, wA, Bs, B, b_block0, wB);



matrixMul_SNC_7(guard_matrixMul_SNC_7_block0, blockDim, gridDim, blockIdx_block0, Csub_block_block0, As, Bs);

}
c_block0=(((wB*16)*blockIdx_block0.y)+(16*blockIdx_block0.x));


TRN_10_Csub_block_offset_block0=0;
TRN_10_Csub_block_X_0_block0=c_block0;
TRN_10_Csub_block_c_1_block0=wB;
matrixMul_TRN_10_wrapper(guard_matrixMul_TRN_10_block0, blockDim, gridDim, blockIdx_block0, C, Csub_block_block0, c_block0, wB);


}
}
}



