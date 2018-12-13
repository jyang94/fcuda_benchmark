; ModuleID = '/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matmul/solution1/.autopilot/db/a.g.1.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.dim3.1 = type { i32, i32, i32 }

@matrixMul.str = internal unnamed_addr constant [10 x i8] c"matrixMul\00" ; [#uses=1 type=[10 x i8]*]
@llvm.global_ctors = appending global [1 x { i32, void ()* }] [{ i32, void ()* } { i32 65535, void ()* @_GLOBAL__I_a }] ; [#uses=0 type=[1 x { i32, void ()* }]*]
@.str4 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=1 type=[1 x i8]*]
@.str3 = private unnamed_addr constant [7 x i8] c"ap_bus\00", align 1 ; [#uses=1 type=[7 x i8]*]
@.str2 = private unnamed_addr constant [12 x i8] c"hls_label_1\00", align 1 ; [#uses=1 type=[12 x i8]*]
@.str1 = private unnamed_addr constant [4 x i8] c"lp1\00", align 1 ; [#uses=1 type=[4 x i8]*]
@.str = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1 ; [#uses=1 type=[12 x i8]*]

; [#uses=1]
define internal fastcc void @matrixMul_TRN_6(%struct.dim3.1* byval align 8 %blockDim, [16 x float]* %As, float* %A, i32 %a, i32 %wA, [16 x float]* %Bs, float* %B, i32 %b, i32 %wB) nounwind uwtable {
  %threadIdx = alloca %struct.dim3.1, align 4     ; [#uses=3 type=%struct.dim3.1*]
  call void @llvm.dbg.declare(metadata !{%struct.dim3.1* %blockDim}, metadata !124), !dbg !125 ; [debug line = 46:54] [debug variable = blockDim]
  call void @llvm.dbg.declare(metadata !126, metadata !127), !dbg !128 ; [debug line = 46:69] [debug variable = gridDim]
  call void @llvm.dbg.declare(metadata !126, metadata !129), !dbg !130 ; [debug line = 46:83] [debug variable = blockIdx]
  call void @llvm.dbg.value(metadata !{[16 x float]* %As}, i64 0, metadata !131), !dbg !132 ; [debug line = 46:102] [debug variable = As]
  call void @llvm.dbg.value(metadata !{float* %A}, i64 0, metadata !133), !dbg !134 ; [debug line = 46:125] [debug variable = A]
  call void @llvm.dbg.value(metadata !{i32 %a}, i64 0, metadata !135), !dbg !136 ; [debug line = 46:132] [debug variable = a]
  call void @llvm.dbg.value(metadata !{i32 %wA}, i64 0, metadata !137), !dbg !138 ; [debug line = 46:139] [debug variable = wA]
  call void @llvm.dbg.value(metadata !{[16 x float]* %Bs}, i64 0, metadata !139), !dbg !140 ; [debug line = 46:152] [debug variable = Bs]
  call void @llvm.dbg.value(metadata !{float* %B}, i64 0, metadata !141), !dbg !142 ; [debug line = 46:175] [debug variable = B]
  call void @llvm.dbg.value(metadata !{i32 %b}, i64 0, metadata !143), !dbg !144 ; [debug line = 46:182] [debug variable = b]
  call void @llvm.dbg.value(metadata !{i32 %wB}, i64 0, metadata !145), !dbg !146 ; [debug line = 46:189] [debug variable = wB]
  call void (...)* @_ssdm_SpecArrayDimSize([16 x float]* %Bs, i32 16) nounwind, !dbg !147 ; [debug line = 47:2]
  call void (...)* @_ssdm_SpecArrayDimSize([16 x float]* %As, i32 16) nounwind, !dbg !149 ; [debug line = 47:32]
  call void @llvm.dbg.declare(metadata !{%struct.dim3.1* %threadIdx}, metadata !150), !dbg !151 ; [debug line = 48:6] [debug variable = threadIdx]
  call void @llvm.dbg.value(metadata !{%struct.dim3.1* %threadIdx}, i64 0, metadata !152), !dbg !155 ; [debug line = 433:5@48:15] [debug variable = this]
  call void @llvm.dbg.value(metadata !{%struct.dim3.1* %threadIdx}, i64 0, metadata !156), !dbg !158 ; [debug line = 433:5@433:90@48:15] [debug variable = this]
  %this.assign.addr = getelementptr inbounds %struct.dim3.1* %threadIdx, i64 0, i32 0, !dbg !159 ; [#uses=4 type=i32*] [debug line = 433:89@433:90@48:15]
  store i32 1, i32* %this.assign.addr, align 4, !dbg !159 ; [debug line = 433:89@433:90@48:15]
  %this.assign.addr.1 = getelementptr inbounds %struct.dim3.1* %threadIdx, i64 0, i32 1, !dbg !159 ; [#uses=2 type=i32*] [debug line = 433:89@433:90@48:15]
  store i32 1, i32* %this.assign.addr.1, align 4, !dbg !159 ; [debug line = 433:89@433:90@48:15]
  %this.assign.addr.2 = getelementptr inbounds %struct.dim3.1* %threadIdx, i64 0, i32 2, !dbg !159 ; [#uses=4 type=i32*] [debug line = 433:89@433:90@48:15]
  store i32 1, i32* %this.assign.addr.2, align 4, !dbg !159 ; [debug line = 433:89@433:90@48:15]
  br i1 false, label %.loopexit, label %1, !dbg !160 ; [debug line = 49:1]

; <label>:1                                       ; preds = %0
  store i32 0, i32* %this.assign.addr.2, align 4, !dbg !161 ; [debug line = 52:6]
  %blockDim.addr = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 2, !dbg !161 ; [#uses=1 type=i32*] [debug line = 52:6]
  %blockDim.load = load i32* %blockDim.addr, align 8, !dbg !161 ; [#uses=2 type=i32] [debug line = 52:6]
  %blockDim.addr.1 = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 1, !dbg !164 ; [#uses=1 type=i32*] [debug line = 53:6]
  %blockDim.load.1 = load i32* %blockDim.addr.1, align 4, !dbg !164 ; [#uses=2 type=i32] [debug line = 53:6]
  %blockDim.addr.2 = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 0, !dbg !166 ; [#uses=1 type=i32*] [debug line = 54:6]
  %blockDim.load.2 = load i32* %blockDim.addr.2, align 8, !dbg !166 ; [#uses=2 type=i32] [debug line = 54:6]
  br label %2, !dbg !161                          ; [debug line = 52:6]

; <label>:2                                       ; preds = %7, %1
  %this.assign.load = load i32* %this.assign.addr.2, align 4, !dbg !161 ; [#uses=4 type=i32] [debug line = 52:6]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load) nounwind
  %tmp = icmp ult i32 %this.assign.load, %blockDim.load, !dbg !161 ; [#uses=1 type=i1] [debug line = 52:6]
  br i1 %tmp, label %.preheader.preheader, label %.loopexit.loopexit, !dbg !161 ; [debug line = 52:6]

.preheader.preheader:                             ; preds = %2
  br label %.preheader, !dbg !168                 ; [debug line = 53:45]

.preheader:                                       ; preds = %6, %.preheader.preheader
  %storemerge = phi i32 [ %tmp.15, %6 ], [ 0, %.preheader.preheader ] ; [#uses=12 type=i32]
  store i32 %storemerge, i32* %this.assign.addr.1, align 4, !dbg !168 ; [debug line = 53:45]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.1) nounwind
  %tmp.1 = icmp ult i32 %storemerge, %blockDim.load.1, !dbg !164 ; [#uses=1 type=i1] [debug line = 53:6]
  br i1 %tmp.1, label %3, label %7, !dbg !164     ; [debug line = 53:6]

; <label>:3                                       ; preds = %.preheader
  store i32 0, i32* %this.assign.addr, align 4, !dbg !166 ; [debug line = 54:6]
  %tmp.2 = mul i32 %storemerge, %wA, !dbg !169    ; [#uses=1 type=i32] [debug line = 57:1]
  %tmp.3 = zext i32 %storemerge to i64, !dbg !169 ; [#uses=2 type=i64] [debug line = 57:1]
  %tmp.4 = mul i32 %storemerge, %wB, !dbg !171    ; [#uses=1 type=i32] [debug line = 58:1]
  br label %4, !dbg !166                          ; [debug line = 54:6]

; <label>:4                                       ; preds = %5, %3
  %this.assign.load.1 = load i32* %this.assign.addr, align 4, !dbg !166 ; [#uses=11 type=i32] [debug line = 54:6]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.1) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.2) nounwind
  %tmp.6 = icmp ult i32 %this.assign.load.1, %blockDim.load.2, !dbg !166 ; [#uses=1 type=i1] [debug line = 54:6]
  br i1 %tmp.6, label %5, label %6, !dbg !166     ; [debug line = 54:6]

; <label>:5                                       ; preds = %4
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.1) nounwind
  %tmp.7 = add i32 %tmp.2, %a, !dbg !169          ; [#uses=1 type=i32] [debug line = 57:1]
  %tmp.8 = add i32 %tmp.7, %this.assign.load.1, !dbg !169 ; [#uses=1 type=i32] [debug line = 57:1]
  %tmp.9 = zext i32 %tmp.8 to i64, !dbg !169      ; [#uses=1 type=i64] [debug line = 57:1]
  %A.addr = getelementptr inbounds float* %A, i64 %tmp.9, !dbg !169 ; [#uses=1 type=float*] [debug line = 57:1]
  %A.load = load float* %A.addr, align 4, !dbg !169 ; [#uses=2 type=float] [debug line = 57:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(float %A.load) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.1) nounwind
  %tmp.10 = zext i32 %this.assign.load.1 to i64, !dbg !169 ; [#uses=2 type=i64] [debug line = 57:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge) nounwind
  %As.addr = getelementptr inbounds [16 x float]* %As, i64 %tmp.3, i64 %tmp.10, !dbg !169 ; [#uses=1 type=float*] [debug line = 57:1]
  store float %A.load, float* %As.addr, align 4, !dbg !169 ; [debug line = 57:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.1) nounwind
  %tmp.11 = add i32 %tmp.4, %b, !dbg !171         ; [#uses=1 type=i32] [debug line = 58:1]
  %tmp.12 = add i32 %tmp.11, %this.assign.load.1, !dbg !171 ; [#uses=1 type=i32] [debug line = 58:1]
  %tmp.13 = zext i32 %tmp.12 to i64, !dbg !171    ; [#uses=1 type=i64] [debug line = 58:1]
  %B.addr = getelementptr inbounds float* %B, i64 %tmp.13, !dbg !171 ; [#uses=1 type=float*] [debug line = 58:1]
  %B.load = load float* %B.addr, align 4, !dbg !171 ; [#uses=2 type=float] [debug line = 58:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(float %B.load) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.1) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge) nounwind
  %Bs.addr = getelementptr inbounds [16 x float]* %Bs, i64 %tmp.3, i64 %tmp.10, !dbg !171 ; [#uses=1 type=float*] [debug line = 58:1]
  store float %B.load, float* %Bs.addr, align 4, !dbg !171 ; [debug line = 58:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.1) nounwind
  %tmp.14 = add i32 %this.assign.load.1, 1, !dbg !172 ; [#uses=1 type=i32] [debug line = 54:45]
  store i32 %tmp.14, i32* %this.assign.addr, align 4, !dbg !172 ; [debug line = 54:45]
  br label %4, !dbg !172                          ; [debug line = 54:45]

; <label>:6                                       ; preds = %4
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge) nounwind
  %tmp.15 = add i32 %storemerge, 1, !dbg !168     ; [#uses=1 type=i32] [debug line = 53:45]
  br label %.preheader, !dbg !168                 ; [debug line = 53:45]

; <label>:7                                       ; preds = %.preheader
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load) nounwind
  %tmp.5 = add i32 %this.assign.load, 1, !dbg !173 ; [#uses=1 type=i32] [debug line = 52:45]
  store i32 %tmp.5, i32* %this.assign.addr.2, align 4, !dbg !173 ; [debug line = 52:45]
  br label %2, !dbg !173                          ; [debug line = 52:45]

.loopexit.loopexit:                               ; preds = %2
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %0
  ret void, !dbg !174                             ; [debug line = 63:1]
}

; [#uses=1]
define internal fastcc void @matrixMul_TRN_10_wrapper(%struct.dim3.1* byval align 8 %blockDim, %struct.dim3.1* byval align 8 %gridDim, %struct.dim3.1* byval align 8 %blockIdx_matrixMul_TRN_10_block0, float* %C, [16 x float]* %Csub_block_block0, i32 %c_block0, i32 %wB) nounwind uwtable {
  %1 = alloca %struct.dim3.1, align 4             ; [#uses=4 type=%struct.dim3.1*]
  %2 = alloca %struct.dim3.1, align 4             ; [#uses=3 type=%struct.dim3.1*]
  %3 = alloca %struct.dim3.1, align 4             ; [#uses=3 type=%struct.dim3.1*]
  call void @llvm.dbg.declare(metadata !{%struct.dim3.1* %blockDim}, metadata !175), !dbg !176 ; [debug line = 95:71] [debug variable = blockDim]
  call void @llvm.dbg.declare(metadata !{%struct.dim3.1* %gridDim}, metadata !177), !dbg !178 ; [debug line = 95:86] [debug variable = gridDim]
  call void @llvm.dbg.declare(metadata !{%struct.dim3.1* %blockIdx_matrixMul_TRN_10_block0}, metadata !179), !dbg !180 ; [debug line = 95:100] [debug variable = blockIdx_matrixMul_TRN_10_block0]
  call void @llvm.dbg.value(metadata !{float* %C}, i64 0, metadata !181), !dbg !182 ; [debug line = 95:145] [debug variable = C]
  call void @llvm.dbg.value(metadata !{[16 x float]* %Csub_block_block0}, i64 0, metadata !183), !dbg !184 ; [debug line = 95:157] [debug variable = Csub_block_block0]
  call void @llvm.dbg.value(metadata !{i32 %c_block0}, i64 0, metadata !185), !dbg !186 ; [debug line = 95:204] [debug variable = c_block0]
  call void @llvm.dbg.value(metadata !{i32 %wB}, i64 0, metadata !187), !dbg !188 ; [debug line = 95:218] [debug variable = wB]
  call void (...)* @_ssdm_SpecArrayDimSize([16 x float]* %Csub_block_block0, i32 16) nounwind, !dbg !189 ; [debug line = 96:2]
  %.addr = getelementptr inbounds %struct.dim3.1* %1, i64 0, i32 0, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %blockDim.addr = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 0, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %blockDim.load = load i32* %blockDim.addr, align 8, !dbg !191 ; [#uses=2 type=i32] [debug line = 97:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load) nounwind
  store i32 %blockDim.load, i32* %.addr, align 4, !dbg !191 ; [debug line = 97:1]
  %.addr.1 = getelementptr inbounds %struct.dim3.1* %1, i64 0, i32 1, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %blockDim.addr.3 = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 1, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %blockDim.load.3 = load i32* %blockDim.addr.3, align 4, !dbg !191 ; [#uses=2 type=i32] [debug line = 97:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.3) nounwind
  store i32 %blockDim.load.3, i32* %.addr.1, align 4, !dbg !191 ; [debug line = 97:1]
  %.addr.2 = getelementptr inbounds %struct.dim3.1* %1, i64 0, i32 2, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %blockDim.addr.4 = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 2, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %blockDim.load.4 = load i32* %blockDim.addr.4, align 8, !dbg !191 ; [#uses=2 type=i32] [debug line = 97:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.4) nounwind
  store i32 %blockDim.load.4, i32* %.addr.2, align 4, !dbg !191 ; [debug line = 97:1]
  %.addr.3 = getelementptr inbounds %struct.dim3.1* %2, i64 0, i32 0, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %gridDim.addr = getelementptr inbounds %struct.dim3.1* %gridDim, i64 0, i32 0, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %gridDim.load = load i32* %gridDim.addr, align 8, !dbg !191 ; [#uses=2 type=i32] [debug line = 97:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load) nounwind
  store i32 %gridDim.load, i32* %.addr.3, align 4, !dbg !191 ; [debug line = 97:1]
  %.addr.4 = getelementptr inbounds %struct.dim3.1* %2, i64 0, i32 1, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %gridDim.addr.1 = getelementptr inbounds %struct.dim3.1* %gridDim, i64 0, i32 1, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %gridDim.load.1 = load i32* %gridDim.addr.1, align 4, !dbg !191 ; [#uses=2 type=i32] [debug line = 97:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load.1) nounwind
  store i32 %gridDim.load.1, i32* %.addr.4, align 4, !dbg !191 ; [debug line = 97:1]
  %.addr.5 = getelementptr inbounds %struct.dim3.1* %2, i64 0, i32 2, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %gridDim.addr.2 = getelementptr inbounds %struct.dim3.1* %gridDim, i64 0, i32 2, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %gridDim.load.2 = load i32* %gridDim.addr.2, align 8, !dbg !191 ; [#uses=2 type=i32] [debug line = 97:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load.2) nounwind
  store i32 %gridDim.load.2, i32* %.addr.5, align 4, !dbg !191 ; [debug line = 97:1]
  %.addr.6 = getelementptr inbounds %struct.dim3.1* %3, i64 0, i32 0, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %blockIdx_matrixMul_TRN_10_block0.addr = getelementptr inbounds %struct.dim3.1* %blockIdx_matrixMul_TRN_10_block0, i64 0, i32 0, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %blockIdx_matrixMul_TRN_10_block0.load = load i32* %blockIdx_matrixMul_TRN_10_block0.addr, align 8, !dbg !191 ; [#uses=2 type=i32] [debug line = 97:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockIdx_matrixMul_TRN_10_block0.load) nounwind
  store i32 %blockIdx_matrixMul_TRN_10_block0.load, i32* %.addr.6, align 4, !dbg !191 ; [debug line = 97:1]
  %.addr.7 = getelementptr inbounds %struct.dim3.1* %3, i64 0, i32 1, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %blockIdx_matrixMul_TRN_10_block0.addr.1 = getelementptr inbounds %struct.dim3.1* %blockIdx_matrixMul_TRN_10_block0, i64 0, i32 1, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %blockIdx_matrixMul_TRN_10_block0.load.1 = load i32* %blockIdx_matrixMul_TRN_10_block0.addr.1, align 4, !dbg !191 ; [#uses=2 type=i32] [debug line = 97:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockIdx_matrixMul_TRN_10_block0.load.1) nounwind
  store i32 %blockIdx_matrixMul_TRN_10_block0.load.1, i32* %.addr.7, align 4, !dbg !191 ; [debug line = 97:1]
  %.addr.8 = getelementptr inbounds %struct.dim3.1* %3, i64 0, i32 2, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %blockIdx_matrixMul_TRN_10_block0.addr.2 = getelementptr inbounds %struct.dim3.1* %blockIdx_matrixMul_TRN_10_block0, i64 0, i32 2, !dbg !191 ; [#uses=1 type=i32*] [debug line = 97:1]
  %blockIdx_matrixMul_TRN_10_block0.load.2 = load i32* %blockIdx_matrixMul_TRN_10_block0.addr.2, align 8, !dbg !191 ; [#uses=2 type=i32] [debug line = 97:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockIdx_matrixMul_TRN_10_block0.load.2) nounwind
  store i32 %blockIdx_matrixMul_TRN_10_block0.load.2, i32* %.addr.8, align 4, !dbg !191 ; [debug line = 97:1]
  call fastcc void @matrixMul_TRN_10(%struct.dim3.1* byval align 8 %1, float* %C, [16 x float]* %Csub_block_block0, i32 %c_block0, i32 %wB), !dbg !191 ; [debug line = 97:1]
  ret void, !dbg !192                             ; [debug line = 98:1]
}

; [#uses=1]
define internal fastcc void @matrixMul_TRN_10(%struct.dim3.1* byval align 8 %blockDim, float* %C, [16 x float]* %Csub_block, i32 %c, i32 %wB) nounwind uwtable {
  %threadIdx = alloca %struct.dim3.1, align 4     ; [#uses=3 type=%struct.dim3.1*]
  call void @llvm.dbg.declare(metadata !{%struct.dim3.1* %blockDim}, metadata !193), !dbg !194 ; [debug line = 26:56] [debug variable = blockDim]
  call void @llvm.dbg.declare(metadata !126, metadata !195), !dbg !196 ; [debug line = 26:71] [debug variable = gridDim]
  call void @llvm.dbg.declare(metadata !126, metadata !197), !dbg !198 ; [debug line = 26:85] [debug variable = blockIdx]
  call void @llvm.dbg.value(metadata !{float* %C}, i64 0, metadata !199), !dbg !200 ; [debug line = 26:106] [debug variable = C]
  call void @llvm.dbg.value(metadata !{[16 x float]* %Csub_block}, i64 0, metadata !201), !dbg !202 ; [debug line = 26:118] [debug variable = Csub_block]
  call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !203), !dbg !204 ; [debug line = 26:158] [debug variable = c]
  call void @llvm.dbg.value(metadata !{i32 %wB}, i64 0, metadata !205), !dbg !206 ; [debug line = 26:165] [debug variable = wB]
  call void (...)* @_ssdm_SpecArrayDimSize([16 x float]* %Csub_block, i32 16) nounwind, !dbg !207 ; [debug line = 27:2]
  call void @llvm.dbg.declare(metadata !{%struct.dim3.1* %threadIdx}, metadata !209), !dbg !210 ; [debug line = 28:6] [debug variable = threadIdx]
  call void @llvm.dbg.value(metadata !{%struct.dim3.1* %threadIdx}, i64 0, metadata !211), !dbg !213 ; [debug line = 433:5@28:15] [debug variable = this]
  call void @llvm.dbg.value(metadata !{%struct.dim3.1* %threadIdx}, i64 0, metadata !214), !dbg !216 ; [debug line = 433:5@433:90@28:15] [debug variable = this]
  %this.assign.addr = getelementptr inbounds %struct.dim3.1* %threadIdx, i64 0, i32 0, !dbg !217 ; [#uses=4 type=i32*] [debug line = 433:89@433:90@28:15]
  store i32 1, i32* %this.assign.addr, align 4, !dbg !217 ; [debug line = 433:89@433:90@28:15]
  %this.assign.addr.3 = getelementptr inbounds %struct.dim3.1* %threadIdx, i64 0, i32 1, !dbg !217 ; [#uses=2 type=i32*] [debug line = 433:89@433:90@28:15]
  store i32 1, i32* %this.assign.addr.3, align 4, !dbg !217 ; [debug line = 433:89@433:90@28:15]
  %this.assign.addr.4 = getelementptr inbounds %struct.dim3.1* %threadIdx, i64 0, i32 2, !dbg !217 ; [#uses=4 type=i32*] [debug line = 433:89@433:90@28:15]
  store i32 1, i32* %this.assign.addr.4, align 4, !dbg !217 ; [debug line = 433:89@433:90@28:15]
  br i1 false, label %.loopexit, label %1, !dbg !218 ; [debug line = 29:1]

; <label>:1                                       ; preds = %0
  store i32 0, i32* %this.assign.addr.4, align 4, !dbg !219 ; [debug line = 32:6]
  %blockDim.addr = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 2, !dbg !219 ; [#uses=1 type=i32*] [debug line = 32:6]
  %blockDim.load = load i32* %blockDim.addr, align 8, !dbg !219 ; [#uses=2 type=i32] [debug line = 32:6]
  %blockDim.addr.5 = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 1, !dbg !222 ; [#uses=1 type=i32*] [debug line = 33:6]
  %blockDim.load.5 = load i32* %blockDim.addr.5, align 4, !dbg !222 ; [#uses=2 type=i32] [debug line = 33:6]
  %blockDim.addr.6 = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 0, !dbg !224 ; [#uses=1 type=i32*] [debug line = 34:6]
  %blockDim.load.6 = load i32* %blockDim.addr.6, align 8, !dbg !224 ; [#uses=2 type=i32] [debug line = 34:6]
  br label %2, !dbg !219                          ; [debug line = 32:6]

; <label>:2                                       ; preds = %7, %1
  %this.assign.load = load i32* %this.assign.addr.4, align 4, !dbg !219 ; [#uses=4 type=i32] [debug line = 32:6]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load) nounwind
  %tmp = icmp ult i32 %this.assign.load, %blockDim.load, !dbg !219 ; [#uses=1 type=i1] [debug line = 32:6]
  br i1 %tmp, label %.preheader.preheader, label %.loopexit.loopexit, !dbg !219 ; [debug line = 32:6]

.preheader.preheader:                             ; preds = %2
  br label %.preheader, !dbg !226                 ; [debug line = 33:45]

.preheader:                                       ; preds = %6, %.preheader.preheader
  %storemerge = phi i32 [ %tmp.26, %6 ], [ 0, %.preheader.preheader ] ; [#uses=9 type=i32]
  store i32 %storemerge, i32* %this.assign.addr.3, align 4, !dbg !226 ; [debug line = 33:45]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.5) nounwind
  %tmp.16 = icmp ult i32 %storemerge, %blockDim.load.5, !dbg !222 ; [#uses=1 type=i1] [debug line = 33:6]
  br i1 %tmp.16, label %3, label %7, !dbg !222    ; [debug line = 33:6]

; <label>:3                                       ; preds = %.preheader
  store i32 0, i32* %this.assign.addr, align 4, !dbg !224 ; [debug line = 34:6]
  %tmp.17 = zext i32 %storemerge to i64, !dbg !227 ; [#uses=1 type=i64] [debug line = 37:1]
  %tmp.18 = mul i32 %storemerge, %wB, !dbg !227   ; [#uses=1 type=i32] [debug line = 37:1]
  br label %4, !dbg !224                          ; [debug line = 34:6]

; <label>:4                                       ; preds = %5, %3
  %this.assign.load.2 = load i32* %this.assign.addr, align 4, !dbg !224 ; [#uses=8 type=i32] [debug line = 34:6]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.2) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.6) nounwind
  %tmp.20 = icmp ult i32 %this.assign.load.2, %blockDim.load.6, !dbg !224 ; [#uses=1 type=i1] [debug line = 34:6]
  br i1 %tmp.20, label %5, label %6, !dbg !224    ; [debug line = 34:6]

; <label>:5                                       ; preds = %4
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.2) nounwind
  %tmp.21 = zext i32 %this.assign.load.2 to i64, !dbg !227 ; [#uses=1 type=i64] [debug line = 37:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge) nounwind
  %Csub_block.addr = getelementptr inbounds [16 x float]* %Csub_block, i64 %tmp.17, i64 %tmp.21, !dbg !227 ; [#uses=1 type=float*] [debug line = 37:1]
  %Csub_block.load = load float* %Csub_block.addr, align 4, !dbg !227 ; [#uses=2 type=float] [debug line = 37:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(float %Csub_block.load) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.2) nounwind
  %tmp.22 = add i32 %tmp.18, %c, !dbg !227        ; [#uses=1 type=i32] [debug line = 37:1]
  %tmp.23 = add i32 %tmp.22, %this.assign.load.2, !dbg !227 ; [#uses=1 type=i32] [debug line = 37:1]
  %tmp.24 = zext i32 %tmp.23 to i64, !dbg !227    ; [#uses=1 type=i64] [debug line = 37:1]
  %C.addr = getelementptr inbounds float* %C, i64 %tmp.24, !dbg !227 ; [#uses=1 type=float*] [debug line = 37:1]
  store float %Csub_block.load, float* %C.addr, align 4, !dbg !227 ; [debug line = 37:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.2) nounwind
  %tmp.25 = add i32 %this.assign.load.2, 1, !dbg !229 ; [#uses=1 type=i32] [debug line = 34:45]
  store i32 %tmp.25, i32* %this.assign.addr, align 4, !dbg !229 ; [debug line = 34:45]
  br label %4, !dbg !229                          ; [debug line = 34:45]

; <label>:6                                       ; preds = %4
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge) nounwind
  %tmp.26 = add i32 %storemerge, 1, !dbg !226     ; [#uses=1 type=i32] [debug line = 33:45]
  br label %.preheader, !dbg !226                 ; [debug line = 33:45]

; <label>:7                                       ; preds = %.preheader
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load) nounwind
  %tmp.19 = add i32 %this.assign.load, 1, !dbg !230 ; [#uses=1 type=i32] [debug line = 32:45]
  store i32 %tmp.19, i32* %this.assign.addr.4, align 4, !dbg !230 ; [debug line = 32:45]
  br label %2, !dbg !230                          ; [debug line = 32:45]

.loopexit.loopexit:                               ; preds = %2
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %0
  ret void, !dbg !231                             ; [debug line = 42:1]
}

; [#uses=1]
define internal fastcc void @matrixMul_SNC_7(%struct.dim3.1* byval align 8 %blockDim, [16 x float]* %Csub_block, [16 x float]* %As, [16 x float]* %Bs) nounwind uwtable {
  %threadIdx = alloca %struct.dim3.1, align 4     ; [#uses=3 type=%struct.dim3.1*]
  call void @llvm.dbg.declare(metadata !{%struct.dim3.1* %blockDim}, metadata !232), !dbg !233 ; [debug line = 67:54] [debug variable = blockDim]
  call void @llvm.dbg.declare(metadata !126, metadata !234), !dbg !235 ; [debug line = 67:69] [debug variable = gridDim]
  call void @llvm.dbg.declare(metadata !126, metadata !236), !dbg !237 ; [debug line = 67:83] [debug variable = blockIdx]
  call void @llvm.dbg.value(metadata !{[16 x float]* %Csub_block}, i64 0, metadata !238), !dbg !239 ; [debug line = 67:102] [debug variable = Csub_block]
  call void @llvm.dbg.value(metadata !{[16 x float]* %As}, i64 0, metadata !240), !dbg !241 ; [debug line = 67:147] [debug variable = As]
  call void @llvm.dbg.value(metadata !{[16 x float]* %Bs}, i64 0, metadata !242), !dbg !243 ; [debug line = 67:168] [debug variable = Bs]
  call void (...)* @_ssdm_SpecArrayDimSize([16 x float]* %Bs, i32 16) nounwind, !dbg !244 ; [debug line = 68:2]
  call void (...)* @_ssdm_SpecArrayDimSize([16 x float]* %As, i32 16) nounwind, !dbg !246 ; [debug line = 68:32]
  call void (...)* @_ssdm_SpecArrayDimSize([16 x float]* %Csub_block, i32 16) nounwind, !dbg !247 ; [debug line = 68:62]
  call void @llvm.dbg.declare(metadata !{%struct.dim3.1* %threadIdx}, metadata !248), !dbg !249 ; [debug line = 69:6] [debug variable = threadIdx]
  call void @llvm.dbg.value(metadata !{%struct.dim3.1* %threadIdx}, i64 0, metadata !250), !dbg !252 ; [debug line = 433:5@69:15] [debug variable = this]
  call void @llvm.dbg.value(metadata !{%struct.dim3.1* %threadIdx}, i64 0, metadata !253), !dbg !255 ; [debug line = 433:5@433:90@69:15] [debug variable = this]
  %this.assign.addr = getelementptr inbounds %struct.dim3.1* %threadIdx, i64 0, i32 0, !dbg !256 ; [#uses=2 type=i32*] [debug line = 433:89@433:90@69:15]
  store i32 1, i32* %this.assign.addr, align 4, !dbg !256 ; [debug line = 433:89@433:90@69:15]
  %this.assign.addr.5 = getelementptr inbounds %struct.dim3.1* %threadIdx, i64 0, i32 1, !dbg !256 ; [#uses=4 type=i32*] [debug line = 433:89@433:90@69:15]
  store i32 1, i32* %this.assign.addr.5, align 4, !dbg !256 ; [debug line = 433:89@433:90@69:15]
  %this.assign.addr.6 = getelementptr inbounds %struct.dim3.1* %threadIdx, i64 0, i32 2, !dbg !256 ; [#uses=4 type=i32*] [debug line = 433:89@433:90@69:15]
  store i32 1, i32* %this.assign.addr.6, align 4, !dbg !256 ; [debug line = 433:89@433:90@69:15]
  br i1 false, label %.loopexit, label %1, !dbg !257 ; [debug line = 70:1]

; <label>:1                                       ; preds = %0
  store i32 0, i32* %this.assign.addr.6, align 4, !dbg !258 ; [debug line = 77:6]
  %blockDim.addr = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 2, !dbg !258 ; [#uses=1 type=i32*] [debug line = 77:6]
  %blockDim.load = load i32* %blockDim.addr, align 8, !dbg !258 ; [#uses=2 type=i32] [debug line = 77:6]
  %blockDim.addr.7 = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 1, !dbg !262 ; [#uses=1 type=i32*] [debug line = 78:6]
  %blockDim.load.7 = load i32* %blockDim.addr.7, align 4, !dbg !262 ; [#uses=2 type=i32] [debug line = 78:6]
  %blockDim.addr.8 = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 0, !dbg !264 ; [#uses=1 type=i32*] [debug line = 79:6]
  %blockDim.load.8 = load i32* %blockDim.addr.8, align 8, !dbg !264 ; [#uses=2 type=i32] [debug line = 79:6]
  br label %2, !dbg !258                          ; [debug line = 77:6]

; <label>:2                                       ; preds = %8, %1
  %this.assign.load = load i32* %this.assign.addr.6, align 4, !dbg !258 ; [#uses=4 type=i32] [debug line = 77:6]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load) nounwind
  %tmp = icmp ult i32 %this.assign.load, %blockDim.load, !dbg !258 ; [#uses=1 type=i1] [debug line = 77:6]
  br i1 %tmp, label %.preheader2.preheader, label %.loopexit.loopexit, !dbg !258 ; [debug line = 77:6]

.preheader2.preheader:                            ; preds = %2
  br label %.preheader2, !dbg !266                ; [debug line = 78:45]

.preheader2:                                      ; preds = %7, %.preheader2.preheader
  %storemerge = phi i32 [ %tmp.32, %7 ], [ 0, %.preheader2.preheader ] ; [#uses=3 type=i32]
  store i32 %storemerge, i32* %this.assign.addr.5, align 4, !dbg !266 ; [debug line = 78:45]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.7) nounwind
  %tmp.27 = icmp ult i32 %storemerge, %blockDim.load.7, !dbg !262 ; [#uses=1 type=i1] [debug line = 78:6]
  br i1 %tmp.27, label %.preheader.preheader, label %8, !dbg !262 ; [debug line = 78:6]

.preheader.preheader:                             ; preds = %.preheader2
  br label %.preheader, !dbg !267                 ; [debug line = 79:45]

.preheader:                                       ; preds = %6, %.preheader.preheader
  %storemerge1 = phi i32 [ %tmp.33, %6 ], [ 0, %.preheader.preheader ] ; [#uses=8 type=i32]
  store i32 %storemerge1, i32* %this.assign.addr, align 4, !dbg !267 ; [debug line = 79:45]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge1) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.8) nounwind
  %tmp.29 = icmp ult i32 %storemerge1, %blockDim.load.8, !dbg !264 ; [#uses=1 type=i1] [debug line = 79:6]
  br i1 %tmp.29, label %3, label %7, !dbg !264    ; [debug line = 79:6]

; <label>:3                                       ; preds = %.preheader
  %rbegin = call i32 (...)* @_ssdm_op_SpecRegionBegin(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0)) nounwind, !dbg !268 ; [#uses=1 type=i32] [debug line = 80:2]
  call void (...)* @_ssdm_op_SpecLoopName(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !268 ; [debug line = 80:2]
  %rbegin3 = call i32 (...)* @_ssdm_op_SpecRegionBegin(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0)) nounwind, !dbg !268 ; [#uses=1 type=i32] [debug line = 80:2]
  %this.assign.load.3 = load i32* %this.assign.addr.5, align 4, !dbg !270 ; [#uses=3 type=i32] [debug line = 84:1]
  %tmp.30 = zext i32 %this.assign.load.3 to i64, !dbg !270 ; [#uses=2 type=i64] [debug line = 84:1]
  %tmp.31 = zext i32 %storemerge1 to i64, !dbg !270 ; [#uses=2 type=i64] [debug line = 84:1]
  %Csub_block.addr = getelementptr inbounds [16 x float]* %Csub_block, i64 %tmp.30, i64 %tmp.31, !dbg !270 ; [#uses=2 type=float*] [debug line = 84:1]
  br label %4, !dbg !273                          ; [debug line = 82:6]

; <label>:4                                       ; preds = %5, %3
  %k = phi i32 [ 0, %3 ], [ %k.1, %5 ]            ; [#uses=3 type=i32]
  %exitcond = icmp eq i32 %k, 16, !dbg !273       ; [#uses=1 type=i1] [debug line = 82:6]
  br i1 %exitcond, label %6, label %5, !dbg !273  ; [debug line = 82:6]

; <label>:5                                       ; preds = %4
  %tmp.34 = sext i32 %k to i64, !dbg !270         ; [#uses=2 type=i64] [debug line = 84:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.3) nounwind
  %As.addr = getelementptr inbounds [16 x float]* %As, i64 %tmp.30, i64 %tmp.34, !dbg !270 ; [#uses=1 type=float*] [debug line = 84:1]
  %As.load = load float* %As.addr, align 4, !dbg !270 ; [#uses=2 type=float] [debug line = 84:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(float %As.load) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge1) nounwind
  %Bs.addr = getelementptr inbounds [16 x float]* %Bs, i64 %tmp.34, i64 %tmp.31, !dbg !270 ; [#uses=1 type=float*] [debug line = 84:1]
  %Bs.load = load float* %Bs.addr, align 4, !dbg !270 ; [#uses=2 type=float] [debug line = 84:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(float %Bs.load) nounwind
  %tmp.35 = fmul float %As.load, %Bs.load, !dbg !270 ; [#uses=1 type=float] [debug line = 84:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge1) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.3) nounwind
  %Csub_block.load = load float* %Csub_block.addr, align 4, !dbg !270 ; [#uses=2 type=float] [debug line = 84:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(float %Csub_block.load) nounwind
  %tmp.36 = fadd float %Csub_block.load, %tmp.35, !dbg !270 ; [#uses=1 type=float] [debug line = 84:1]
  store float %tmp.36, float* %Csub_block.addr, align 4, !dbg !270 ; [debug line = 84:1]
  %k.1 = add nsw i32 %k, 1, !dbg !274             ; [#uses=1 type=i32] [debug line = 82:17]
  call void @llvm.dbg.value(metadata !{i32 %k.1}, i64 0, metadata !275), !dbg !274 ; [debug line = 82:17] [debug variable = k]
  br label %4, !dbg !274                          ; [debug line = 82:17]

; <label>:6                                       ; preds = %4
  %rend4 = call i32 (...)* @_ssdm_op_SpecRegionEnd(i8* getelementptr inbounds ([4 x i8]* @.str1, i64 0, i64 0), i32 %rbegin3) nounwind, !dbg !276 ; [#uses=0 type=i32] [debug line = 87:1]
  %rend = call i32 (...)* @_ssdm_op_SpecRegionEnd(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i32 %rbegin) nounwind, !dbg !276 ; [#uses=0 type=i32] [debug line = 87:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge1) nounwind
  %tmp.33 = add i32 %storemerge1, 1, !dbg !267    ; [#uses=1 type=i32] [debug line = 79:45]
  br label %.preheader, !dbg !267                 ; [debug line = 79:45]

; <label>:7                                       ; preds = %.preheader
  %this.assign.load.4 = load i32* %this.assign.addr.5, align 4, !dbg !266 ; [#uses=2 type=i32] [debug line = 78:45]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.4) nounwind
  %tmp.32 = add i32 %this.assign.load.4, 1, !dbg !266 ; [#uses=1 type=i32] [debug line = 78:45]
  br label %.preheader2, !dbg !266                ; [debug line = 78:45]

; <label>:8                                       ; preds = %.preheader2
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load) nounwind
  %tmp.28 = add i32 %this.assign.load, 1, !dbg !277 ; [#uses=1 type=i32] [debug line = 77:45]
  store i32 %tmp.28, i32* %this.assign.addr.6, align 4, !dbg !277 ; [debug line = 77:45]
  br label %2, !dbg !277                          ; [debug line = 77:45]

.loopexit.loopexit:                               ; preds = %2
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %0
  ret void, !dbg !278                             ; [debug line = 92:1]
}

; [#uses=1]
define internal fastcc void @matrixMul_CMP_5(%struct.dim3.1* byval align 8 %blockDim, [16 x float]* %Csub_block) nounwind uwtable {
  %threadIdx = alloca %struct.dim3.1, align 4     ; [#uses=3 type=%struct.dim3.1*]
  call void @llvm.dbg.declare(metadata !{%struct.dim3.1* %blockDim}, metadata !279), !dbg !280 ; [debug line = 6:54] [debug variable = blockDim]
  call void @llvm.dbg.declare(metadata !126, metadata !281), !dbg !282 ; [debug line = 6:69] [debug variable = gridDim]
  call void @llvm.dbg.declare(metadata !126, metadata !283), !dbg !284 ; [debug line = 6:83] [debug variable = blockIdx]
  call void @llvm.dbg.value(metadata !{[16 x float]* %Csub_block}, i64 0, metadata !285), !dbg !286 ; [debug line = 6:102] [debug variable = Csub_block]
  call void (...)* @_ssdm_SpecArrayDimSize([16 x float]* %Csub_block, i32 16) nounwind, !dbg !287 ; [debug line = 7:2]
  call void @llvm.dbg.declare(metadata !{%struct.dim3.1* %threadIdx}, metadata !289), !dbg !290 ; [debug line = 8:6] [debug variable = threadIdx]
  call void @llvm.dbg.value(metadata !{%struct.dim3.1* %threadIdx}, i64 0, metadata !291), !dbg !293 ; [debug line = 433:5@8:15] [debug variable = this]
  call void @llvm.dbg.value(metadata !{%struct.dim3.1* %threadIdx}, i64 0, metadata !294), !dbg !296 ; [debug line = 433:5@433:90@8:15] [debug variable = this]
  %this.assign.addr = getelementptr inbounds %struct.dim3.1* %threadIdx, i64 0, i32 0, !dbg !297 ; [#uses=4 type=i32*] [debug line = 433:89@433:90@8:15]
  store i32 1, i32* %this.assign.addr, align 4, !dbg !297 ; [debug line = 433:89@433:90@8:15]
  %this.assign.addr.7 = getelementptr inbounds %struct.dim3.1* %threadIdx, i64 0, i32 1, !dbg !297 ; [#uses=2 type=i32*] [debug line = 433:89@433:90@8:15]
  store i32 1, i32* %this.assign.addr.7, align 4, !dbg !297 ; [debug line = 433:89@433:90@8:15]
  %this.assign.addr.8 = getelementptr inbounds %struct.dim3.1* %threadIdx, i64 0, i32 2, !dbg !297 ; [#uses=4 type=i32*] [debug line = 433:89@433:90@8:15]
  store i32 1, i32* %this.assign.addr.8, align 4, !dbg !297 ; [debug line = 433:89@433:90@8:15]
  br i1 false, label %.loopexit, label %1, !dbg !298 ; [debug line = 9:1]

; <label>:1                                       ; preds = %0
  store i32 0, i32* %this.assign.addr.8, align 4, !dbg !299 ; [debug line = 12:6]
  %blockDim.addr = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 2, !dbg !299 ; [#uses=1 type=i32*] [debug line = 12:6]
  %blockDim.load = load i32* %blockDim.addr, align 8, !dbg !299 ; [#uses=2 type=i32] [debug line = 12:6]
  %blockDim.addr.9 = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 1, !dbg !302 ; [#uses=1 type=i32*] [debug line = 13:6]
  %blockDim.load.9 = load i32* %blockDim.addr.9, align 4, !dbg !302 ; [#uses=2 type=i32] [debug line = 13:6]
  %blockDim.addr.10 = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 0, !dbg !304 ; [#uses=1 type=i32*] [debug line = 14:6]
  %blockDim.load.10 = load i32* %blockDim.addr.10, align 8, !dbg !304 ; [#uses=2 type=i32] [debug line = 14:6]
  br label %2, !dbg !299                          ; [debug line = 12:6]

; <label>:2                                       ; preds = %7, %1
  %this.assign.load = load i32* %this.assign.addr.8, align 4, !dbg !299 ; [#uses=4 type=i32] [debug line = 12:6]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load) nounwind
  %tmp = icmp ult i32 %this.assign.load, %blockDim.load, !dbg !299 ; [#uses=1 type=i1] [debug line = 12:6]
  br i1 %tmp, label %.preheader.preheader, label %.loopexit.loopexit, !dbg !299 ; [debug line = 12:6]

.preheader.preheader:                             ; preds = %2
  br label %.preheader, !dbg !306                 ; [debug line = 13:45]

.preheader:                                       ; preds = %6, %.preheader.preheader
  %storemerge = phi i32 [ %tmp.44, %6 ], [ 0, %.preheader.preheader ] ; [#uses=7 type=i32]
  store i32 %storemerge, i32* %this.assign.addr.7, align 4, !dbg !306 ; [debug line = 13:45]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.9) nounwind
  %tmp.38 = icmp ult i32 %storemerge, %blockDim.load.9, !dbg !302 ; [#uses=1 type=i1] [debug line = 13:6]
  br i1 %tmp.38, label %3, label %7, !dbg !302    ; [debug line = 13:6]

; <label>:3                                       ; preds = %.preheader
  store i32 0, i32* %this.assign.addr, align 4, !dbg !304 ; [debug line = 14:6]
  %tmp.39 = zext i32 %storemerge to i64, !dbg !307 ; [#uses=1 type=i64] [debug line = 17:1]
  br label %4, !dbg !304                          ; [debug line = 14:6]

; <label>:4                                       ; preds = %5, %3
  %this.assign.load.5 = load i32* %this.assign.addr, align 4, !dbg !304 ; [#uses=6 type=i32] [debug line = 14:6]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.5) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.10) nounwind
  %tmp.41 = icmp ult i32 %this.assign.load.5, %blockDim.load.10, !dbg !304 ; [#uses=1 type=i1] [debug line = 14:6]
  br i1 %tmp.41, label %5, label %6, !dbg !304    ; [debug line = 14:6]

; <label>:5                                       ; preds = %4
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.5) nounwind
  %tmp.42 = zext i32 %this.assign.load.5 to i64, !dbg !307 ; [#uses=1 type=i64] [debug line = 17:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge) nounwind
  %Csub_block.addr = getelementptr inbounds [16 x float]* %Csub_block, i64 %tmp.39, i64 %tmp.42, !dbg !307 ; [#uses=1 type=float*] [debug line = 17:1]
  store float 0.000000e+00, float* %Csub_block.addr, align 4, !dbg !307 ; [debug line = 17:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.5) nounwind
  %tmp.43 = add i32 %this.assign.load.5, 1, !dbg !309 ; [#uses=1 type=i32] [debug line = 14:45]
  store i32 %tmp.43, i32* %this.assign.addr, align 4, !dbg !309 ; [debug line = 14:45]
  br label %4, !dbg !309                          ; [debug line = 14:45]

; <label>:6                                       ; preds = %4
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %storemerge) nounwind
  %tmp.44 = add i32 %storemerge, 1, !dbg !306     ; [#uses=1 type=i32] [debug line = 13:45]
  br label %.preheader, !dbg !306                 ; [debug line = 13:45]

; <label>:7                                       ; preds = %.preheader
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load) nounwind
  %tmp.40 = add i32 %this.assign.load, 1, !dbg !310 ; [#uses=1 type=i32] [debug line = 12:45]
  store i32 %tmp.40, i32* %this.assign.addr.8, align 4, !dbg !310 ; [debug line = 12:45]
  br label %2, !dbg !310                          ; [debug line = 12:45]

.loopexit.loopexit:                               ; preds = %2
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %0
  ret void, !dbg !311                             ; [debug line = 22:1]
}

; [#uses=0]
define void @matrixMul(float* %C, float* %A, float* %B, i32 %wA, i32 %wB, %struct.dim3.1* byval align 8 %gridDim, %struct.dim3.1* byval align 8 %blockDim) nounwind uwtable {
  call void (...)* @_ssdm_op_SpecTopModule([10 x i8]* @matrixMul.str) nounwind
  %Csub_block_block0 = alloca [16 x [16 x float]], align 16 ; [#uses=1 type=[16 x [16 x float]]*]
  %blockIdx_block0 = alloca %struct.dim3.1, align 4 ; [#uses=3 type=%struct.dim3.1*]
  %blockIdx_loop = alloca %struct.dim3.1, align 4 ; [#uses=3 type=%struct.dim3.1*]
  %1 = alloca %struct.dim3.1, align 4             ; [#uses=4 type=%struct.dim3.1*]
  %2 = alloca %struct.dim3.1, align 4             ; [#uses=3 type=%struct.dim3.1*]
  %3 = alloca %struct.dim3.1, align 4             ; [#uses=3 type=%struct.dim3.1*]
  %As = alloca [16 x [16 x float]], align 16      ; [#uses=1 type=[16 x [16 x float]]*]
  %Bs = alloca [16 x [16 x float]], align 16      ; [#uses=1 type=[16 x [16 x float]]*]
  %4 = alloca %struct.dim3.1, align 4             ; [#uses=4 type=%struct.dim3.1*]
  %5 = alloca %struct.dim3.1, align 4             ; [#uses=3 type=%struct.dim3.1*]
  %6 = alloca %struct.dim3.1, align 4             ; [#uses=3 type=%struct.dim3.1*]
  %7 = alloca %struct.dim3.1, align 4             ; [#uses=4 type=%struct.dim3.1*]
  %8 = alloca %struct.dim3.1, align 4             ; [#uses=3 type=%struct.dim3.1*]
  %9 = alloca %struct.dim3.1, align 4             ; [#uses=3 type=%struct.dim3.1*]
  %10 = alloca %struct.dim3.1, align 4            ; [#uses=4 type=%struct.dim3.1*]
  %11 = alloca %struct.dim3.1, align 4            ; [#uses=4 type=%struct.dim3.1*]
  %12 = alloca %struct.dim3.1, align 4            ; [#uses=4 type=%struct.dim3.1*]
  call void @llvm.dbg.value(metadata !{float* %C}, i64 0, metadata !312), !dbg !313 ; [debug line = 102:27] [debug variable = C]
  call void @llvm.dbg.value(metadata !{float* %A}, i64 0, metadata !314), !dbg !315 ; [debug line = 102:41] [debug variable = A]
  call void @llvm.dbg.value(metadata !{float* %B}, i64 0, metadata !316), !dbg !317 ; [debug line = 102:55] [debug variable = B]
  call void @llvm.dbg.value(metadata !{i32 %wA}, i64 0, metadata !318), !dbg !319 ; [debug line = 102:62] [debug variable = wA]
  call void @llvm.dbg.value(metadata !{i32 %wB}, i64 0, metadata !320), !dbg !321 ; [debug line = 102:70] [debug variable = wB]
  call void @llvm.dbg.declare(metadata !{%struct.dim3.1* %gridDim}, metadata !322), !dbg !323 ; [debug line = 102:79] [debug variable = gridDim]
  call void @llvm.dbg.declare(metadata !{%struct.dim3.1* %blockDim}, metadata !324), !dbg !325 ; [debug line = 102:93] [debug variable = blockDim]
  call void @llvm.dbg.declare(metadata !{[16 x [16 x float]]* %Csub_block_block0}, metadata !326), !dbg !330 ; [debug line = 111:10] [debug variable = Csub_block_block0]
  call void @llvm.dbg.declare(metadata !{%struct.dim3.1* %blockIdx_block0}, metadata !331), !dbg !332 ; [debug line = 116:6] [debug variable = blockIdx_block0]
  call void @llvm.dbg.value(metadata !{%struct.dim3.1* %blockIdx_block0}, i64 0, metadata !333), !dbg !335 ; [debug line = 433:5@116:21] [debug variable = this]
  call void @llvm.dbg.value(metadata !{%struct.dim3.1* %blockIdx_block0}, i64 0, metadata !336), !dbg !338 ; [debug line = 433:5@433:90@116:21] [debug variable = this]
  %this.assign.addr = getelementptr inbounds %struct.dim3.1* %blockIdx_block0, i64 0, i32 0, !dbg !339 ; [#uses=4 type=i32*] [debug line = 433:89@433:90@116:21]
  store i32 1, i32* %this.assign.addr, align 4, !dbg !339 ; [debug line = 433:89@433:90@116:21]
  %this.assign.addr.9 = getelementptr inbounds %struct.dim3.1* %blockIdx_block0, i64 0, i32 1, !dbg !339 ; [#uses=5 type=i32*] [debug line = 433:89@433:90@116:21]
  store i32 1, i32* %this.assign.addr.9, align 4, !dbg !339 ; [debug line = 433:89@433:90@116:21]
  %this.assign.addr.10 = getelementptr inbounds %struct.dim3.1* %blockIdx_block0, i64 0, i32 2, !dbg !339 ; [#uses=4 type=i32*] [debug line = 433:89@433:90@116:21]
  store i32 1, i32* %this.assign.addr.10, align 4, !dbg !339 ; [debug line = 433:89@433:90@116:21]
  call void @llvm.dbg.declare(metadata !{%struct.dim3.1* %blockIdx_loop}, metadata !340), !dbg !341 ; [debug line = 121:6] [debug variable = blockIdx_loop]
  call void @llvm.dbg.value(metadata !{%struct.dim3.1* %blockIdx_loop}, i64 0, metadata !342), !dbg !344 ; [debug line = 433:5@121:19] [debug variable = this]
  call void @llvm.dbg.value(metadata !{%struct.dim3.1* %blockIdx_loop}, i64 0, metadata !345), !dbg !347 ; [debug line = 433:5@433:90@121:19] [debug variable = this]
  %this.assign.1.addr = getelementptr inbounds %struct.dim3.1* %blockIdx_loop, i64 0, i32 0, !dbg !348 ; [#uses=2 type=i32*] [debug line = 433:89@433:90@121:19]
  store i32 1, i32* %this.assign.1.addr, align 4, !dbg !348 ; [debug line = 433:89@433:90@121:19]
  %this.assign.1.addr.1 = getelementptr inbounds %struct.dim3.1* %blockIdx_loop, i64 0, i32 1, !dbg !348 ; [#uses=4 type=i32*] [debug line = 433:89@433:90@121:19]
  store i32 1, i32* %this.assign.1.addr.1, align 4, !dbg !348 ; [debug line = 433:89@433:90@121:19]
  %this.assign.1.addr.2 = getelementptr inbounds %struct.dim3.1* %blockIdx_loop, i64 0, i32 2, !dbg !348 ; [#uses=1 type=i32*] [debug line = 433:89@433:90@121:19]
  store i32 1, i32* %this.assign.1.addr.2, align 4, !dbg !348 ; [debug line = 433:89@433:90@121:19]
  store i32 0, i32* %this.assign.1.addr.1, align 4, !dbg !349 ; [debug line = 122:6]
  %gridDim.addr = getelementptr inbounds %struct.dim3.1* %gridDim, i64 0, i32 1, !dbg !349 ; [#uses=1 type=i32*] [debug line = 122:6]
  %gridDim.load = load i32* %gridDim.addr, align 4, !dbg !349 ; [#uses=10 type=i32] [debug line = 122:6]
  %gridDim.addr.3 = getelementptr inbounds %struct.dim3.1* %gridDim, i64 0, i32 0, !dbg !351 ; [#uses=1 type=i32*] [debug line = 125:6]
  %gridDim.load.3 = load i32* %gridDim.addr.3, align 8, !dbg !351 ; [#uses=10 type=i32] [debug line = 125:6]
  %tmp.45 = shl nsw i32 %wA, 4, !dbg !354         ; [#uses=1 type=i32] [debug line = 137:1]
  %bStep_block0 = mul i32 %wB, 16, !dbg !356      ; [#uses=1 type=i32] [debug line = 141:1]
  %.addr = getelementptr inbounds %struct.dim3.1* %1, i64 0, i32 0, !dbg !357 ; [#uses=1 type=i32*] [debug line = 142:1]
  %blockDim.addr = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 0, !dbg !357 ; [#uses=1 type=i32*] [debug line = 142:1]
  %blockDim.load = load i32* %blockDim.addr, align 8, !dbg !357 ; [#uses=8 type=i32] [debug line = 142:1]
  %.addr.9 = getelementptr inbounds %struct.dim3.1* %1, i64 0, i32 1, !dbg !357 ; [#uses=1 type=i32*] [debug line = 142:1]
  %blockDim.addr.11 = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 1, !dbg !357 ; [#uses=1 type=i32*] [debug line = 142:1]
  %blockDim.load.11 = load i32* %blockDim.addr.11, align 4, !dbg !357 ; [#uses=8 type=i32] [debug line = 142:1]
  %.addr.10 = getelementptr inbounds %struct.dim3.1* %1, i64 0, i32 2, !dbg !357 ; [#uses=1 type=i32*] [debug line = 142:1]
  %blockDim.addr.12 = getelementptr inbounds %struct.dim3.1* %blockDim, i64 0, i32 2, !dbg !357 ; [#uses=1 type=i32*] [debug line = 142:1]
  %blockDim.load.12 = load i32* %blockDim.addr.12, align 8, !dbg !357 ; [#uses=8 type=i32] [debug line = 142:1]
  %.addr.11 = getelementptr inbounds %struct.dim3.1* %2, i64 0, i32 0, !dbg !357 ; [#uses=1 type=i32*] [debug line = 142:1]
  %.addr.12 = getelementptr inbounds %struct.dim3.1* %2, i64 0, i32 1, !dbg !357 ; [#uses=1 type=i32*] [debug line = 142:1]
  %.addr.13 = getelementptr inbounds %struct.dim3.1* %2, i64 0, i32 2, !dbg !357 ; [#uses=1 type=i32*] [debug line = 142:1]
  %gridDim.addr.4 = getelementptr inbounds %struct.dim3.1* %gridDim, i64 0, i32 2, !dbg !357 ; [#uses=1 type=i32*] [debug line = 142:1]
  %gridDim.load.4 = load i32* %gridDim.addr.4, align 8, !dbg !357 ; [#uses=8 type=i32] [debug line = 142:1]
  %.addr.14 = getelementptr inbounds %struct.dim3.1* %3, i64 0, i32 0, !dbg !357 ; [#uses=1 type=i32*] [debug line = 142:1]
  %.addr.15 = getelementptr inbounds %struct.dim3.1* %3, i64 0, i32 1, !dbg !357 ; [#uses=1 type=i32*] [debug line = 142:1]
  %.addr.16 = getelementptr inbounds %struct.dim3.1* %3, i64 0, i32 2, !dbg !357 ; [#uses=1 type=i32*] [debug line = 142:1]
  %Csub_block_block0.addr = getelementptr inbounds [16 x [16 x float]]* %Csub_block_block0, i64 0, i64 0, !dbg !357 ; [#uses=3 type=[16 x float]*] [debug line = 142:1]
  %.addr.17 = getelementptr inbounds %struct.dim3.1* %4, i64 0, i32 0, !dbg !358 ; [#uses=1 type=i32*] [debug line = 153:1]
  %.addr.18 = getelementptr inbounds %struct.dim3.1* %4, i64 0, i32 1, !dbg !358 ; [#uses=1 type=i32*] [debug line = 153:1]
  %.addr.19 = getelementptr inbounds %struct.dim3.1* %4, i64 0, i32 2, !dbg !358 ; [#uses=1 type=i32*] [debug line = 153:1]
  %.addr.20 = getelementptr inbounds %struct.dim3.1* %5, i64 0, i32 0, !dbg !358 ; [#uses=1 type=i32*] [debug line = 153:1]
  %.addr.21 = getelementptr inbounds %struct.dim3.1* %5, i64 0, i32 1, !dbg !358 ; [#uses=1 type=i32*] [debug line = 153:1]
  %.addr.22 = getelementptr inbounds %struct.dim3.1* %5, i64 0, i32 2, !dbg !358 ; [#uses=1 type=i32*] [debug line = 153:1]
  %.addr.23 = getelementptr inbounds %struct.dim3.1* %6, i64 0, i32 0, !dbg !358 ; [#uses=1 type=i32*] [debug line = 153:1]
  %.addr.24 = getelementptr inbounds %struct.dim3.1* %6, i64 0, i32 1, !dbg !358 ; [#uses=1 type=i32*] [debug line = 153:1]
  %.addr.25 = getelementptr inbounds %struct.dim3.1* %6, i64 0, i32 2, !dbg !358 ; [#uses=1 type=i32*] [debug line = 153:1]
  %As.addr = getelementptr inbounds [16 x [16 x float]]* %As, i64 0, i64 0, !dbg !358 ; [#uses=2 type=[16 x float]*] [debug line = 153:1]
  %Bs.addr = getelementptr inbounds [16 x [16 x float]]* %Bs, i64 0, i64 0, !dbg !358 ; [#uses=2 type=[16 x float]*] [debug line = 153:1]
  %.addr.26 = getelementptr inbounds %struct.dim3.1* %7, i64 0, i32 0, !dbg !361 ; [#uses=1 type=i32*] [debug line = 157:1]
  %.addr.27 = getelementptr inbounds %struct.dim3.1* %7, i64 0, i32 1, !dbg !361 ; [#uses=1 type=i32*] [debug line = 157:1]
  %.addr.28 = getelementptr inbounds %struct.dim3.1* %7, i64 0, i32 2, !dbg !361 ; [#uses=1 type=i32*] [debug line = 157:1]
  %.addr.29 = getelementptr inbounds %struct.dim3.1* %8, i64 0, i32 0, !dbg !361 ; [#uses=1 type=i32*] [debug line = 157:1]
  %.addr.30 = getelementptr inbounds %struct.dim3.1* %8, i64 0, i32 1, !dbg !361 ; [#uses=1 type=i32*] [debug line = 157:1]
  %.addr.31 = getelementptr inbounds %struct.dim3.1* %8, i64 0, i32 2, !dbg !361 ; [#uses=1 type=i32*] [debug line = 157:1]
  %.addr.32 = getelementptr inbounds %struct.dim3.1* %9, i64 0, i32 0, !dbg !361 ; [#uses=1 type=i32*] [debug line = 157:1]
  %.addr.33 = getelementptr inbounds %struct.dim3.1* %9, i64 0, i32 1, !dbg !361 ; [#uses=1 type=i32*] [debug line = 157:1]
  %.addr.34 = getelementptr inbounds %struct.dim3.1* %9, i64 0, i32 2, !dbg !361 ; [#uses=1 type=i32*] [debug line = 157:1]
  %.addr.35 = getelementptr inbounds %struct.dim3.1* %10, i64 0, i32 0, !dbg !362 ; [#uses=1 type=i32*] [debug line = 163:1]
  %.addr.36 = getelementptr inbounds %struct.dim3.1* %10, i64 0, i32 1, !dbg !362 ; [#uses=1 type=i32*] [debug line = 163:1]
  %.addr.37 = getelementptr inbounds %struct.dim3.1* %10, i64 0, i32 2, !dbg !362 ; [#uses=1 type=i32*] [debug line = 163:1]
  %.addr.38 = getelementptr inbounds %struct.dim3.1* %11, i64 0, i32 0, !dbg !362 ; [#uses=1 type=i32*] [debug line = 163:1]
  %.addr.39 = getelementptr inbounds %struct.dim3.1* %11, i64 0, i32 1, !dbg !362 ; [#uses=1 type=i32*] [debug line = 163:1]
  %.addr.40 = getelementptr inbounds %struct.dim3.1* %11, i64 0, i32 2, !dbg !362 ; [#uses=1 type=i32*] [debug line = 163:1]
  %.addr.41 = getelementptr inbounds %struct.dim3.1* %12, i64 0, i32 0, !dbg !362 ; [#uses=1 type=i32*] [debug line = 163:1]
  %.addr.42 = getelementptr inbounds %struct.dim3.1* %12, i64 0, i32 1, !dbg !362 ; [#uses=1 type=i32*] [debug line = 163:1]
  %.addr.43 = getelementptr inbounds %struct.dim3.1* %12, i64 0, i32 2, !dbg !362 ; [#uses=1 type=i32*] [debug line = 163:1]
  br label %13, !dbg !349                         ; [debug line = 122:6]

; <label>:13                                      ; preds = %20, %0
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load) nounwind
  %this.assign.1.load = load i32* %this.assign.1.addr.1, align 4, !dbg !349 ; [#uses=6 type=i32] [debug line = 122:6]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.1.load) nounwind
  %tmp.46 = icmp eq i32 %gridDim.load, %this.assign.1.load, !dbg !349 ; [#uses=1 type=i1] [debug line = 122:6]
  br i1 %tmp.46, label %21, label %14, !dbg !349  ; [debug line = 122:6]

; <label>:14                                      ; preds = %13
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.1.load) nounwind
  store i32 %this.assign.1.load, i32* %this.assign.addr.9, align 4, !dbg !363 ; [debug line = 124:1]
  br label %15, !dbg !351                         ; [debug line = 125:6]

; <label>:15                                      ; preds = %19, %14
  %bx_block0 = phi i32 [ 0, %14 ], [ %tmp.53, %19 ] ; [#uses=12 type=i32]
  store i32 %bx_block0, i32* %this.assign.1.addr, align 4, !dbg !364 ; [debug line = 125:61]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load.3) nounwind
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %bx_block0) nounwind
  %tmp.48 = icmp eq i32 %gridDim.load.3, %bx_block0, !dbg !351 ; [#uses=1 type=i1] [debug line = 125:6]
  br i1 %tmp.48, label %20, label %16, !dbg !351  ; [debug line = 125:6]

; <label>:16                                      ; preds = %15
  %rbegin = call i32 (...)* @_ssdm_op_SpecRegionBegin(i8* getelementptr inbounds ([12 x i8]* @.str2, i64 0, i64 0)) nounwind, !dbg !365 ; [#uses=1 type=i32] [debug line = 126:2]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %bx_block0) nounwind
  store i32 %bx_block0, i32* %this.assign.addr, align 4, !dbg !366 ; [debug line = 127:1]
  call void (...)* @_ssdm_op_SpecInterface(float* %A, i8* getelementptr inbounds ([7 x i8]* @.str3, i64 0, i64 0), i32 0, i32 0, i32 0, i32 3840, i8* getelementptr inbounds ([1 x i8]* @.str4, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str4, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str4, i64 0, i64 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str4, i64 0, i64 0)) nounwind, !dbg !367 ; [debug line = 132:1]
  call void (...)* @_ssdm_op_SpecInterface(float* %B, i8* getelementptr inbounds ([7 x i8]* @.str3, i64 0, i64 0), i32 0, i32 0, i32 0, i32 6144, i8* getelementptr inbounds ([1 x i8]* @.str4, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str4, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str4, i64 0, i64 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str4, i64 0, i64 0)) nounwind, !dbg !368 ; [debug line = 133:1]
  call void (...)* @_ssdm_op_SpecInterface(float* %C, i8* getelementptr inbounds ([7 x i8]* @.str3, i64 0, i64 0), i32 0, i32 0, i32 0, i32 10240, i8* getelementptr inbounds ([1 x i8]* @.str4, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str4, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8]* @.str4, i64 0, i64 0), i32 0, i32 0, i32 0, i32 0, i8* getelementptr inbounds ([1 x i8]* @.str4, i64 0, i64 0)) nounwind, !dbg !369 ; [debug line = 134:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %bx_block0) nounwind
  call void @llvm.dbg.value(metadata !{i32 %bx_block0}, i64 0, metadata !370), !dbg !371 ; [debug line = 135:1] [debug variable = bx_block0]
  %by_block0 = load i32* %this.assign.addr.9, align 4, !dbg !372 ; [#uses=5 type=i32] [debug line = 136:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %by_block0) nounwind
  call void @llvm.dbg.value(metadata !{i32 %by_block0}, i64 0, metadata !373), !dbg !372 ; [debug line = 136:1] [debug variable = by_block0]
  %aBegin_block0 = mul nsw i32 %by_block0, %tmp.45, !dbg !354 ; [#uses=2 type=i32] [debug line = 137:1]
  call void @llvm.dbg.value(metadata !{i32 %aBegin_block0}, i64 0, metadata !374), !dbg !354 ; [debug line = 137:1] [debug variable = aBegin_block0]
  %tmp.50 = add i32 %wA, -1, !dbg !375            ; [#uses=1 type=i32] [debug line = 138:1]
  %aEnd_block0 = add i32 %tmp.50, %aBegin_block0, !dbg !375 ; [#uses=1 type=i32] [debug line = 138:1]
  call void @llvm.dbg.value(metadata !{i32 %aEnd_block0}, i64 0, metadata !376), !dbg !375 ; [debug line = 138:1] [debug variable = aEnd_block0]
  %bBegin_block0 = shl nsw i32 %bx_block0, 4, !dbg !377 ; [#uses=1 type=i32] [debug line = 140:1]
  call void @llvm.dbg.value(metadata !{i32 %bBegin_block0}, i64 0, metadata !378), !dbg !377 ; [debug line = 140:1] [debug variable = bBegin_block0]
  call void @llvm.dbg.value(metadata !{i32 %bStep_block0}, i64 0, metadata !379), !dbg !356 ; [debug line = 141:1] [debug variable = bStep_block0]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load) nounwind
  store i32 %blockDim.load, i32* %.addr, align 4, !dbg !357 ; [debug line = 142:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.11) nounwind
  store i32 %blockDim.load.11, i32* %.addr.9, align 4, !dbg !357 ; [debug line = 142:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.12) nounwind
  store i32 %blockDim.load.12, i32* %.addr.10, align 4, !dbg !357 ; [debug line = 142:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load.3) nounwind
  store i32 %gridDim.load.3, i32* %.addr.11, align 4, !dbg !357 ; [debug line = 142:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load) nounwind
  store i32 %gridDim.load, i32* %.addr.12, align 4, !dbg !357 ; [debug line = 142:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load.4) nounwind
  store i32 %gridDim.load.4, i32* %.addr.13, align 4, !dbg !357 ; [debug line = 142:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %bx_block0) nounwind
  store i32 %bx_block0, i32* %.addr.14, align 4, !dbg !357 ; [debug line = 142:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %by_block0) nounwind
  store i32 %by_block0, i32* %.addr.15, align 4, !dbg !357 ; [debug line = 142:1]
  %this.assign.load = load i32* %this.assign.addr.10, align 4, !dbg !357 ; [#uses=2 type=i32] [debug line = 142:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load) nounwind
  store i32 %this.assign.load, i32* %.addr.16, align 4, !dbg !357 ; [debug line = 142:1]
  call fastcc void @matrixMul_CMP_5(%struct.dim3.1* byval align 8 %1, [16 x float]* %Csub_block_block0.addr), !dbg !357 ; [debug line = 142:1]
  call void @llvm.dbg.value(metadata !{i32 %aBegin_block0}, i64 0, metadata !380), !dbg !381 ; [debug line = 147:6] [debug variable = a_block0]
  call void @llvm.dbg.value(metadata !{i32 %bBegin_block0}, i64 0, metadata !382), !dbg !381 ; [debug line = 147:6] [debug variable = b_block0]
  br label %17, !dbg !381                         ; [debug line = 147:6]

; <label>:17                                      ; preds = %18, %16
  %a_block01 = phi i32 [ %aBegin_block0, %16 ], [ %a_block0.2, %18 ] ; [#uses=3 type=i32]
  %b_block01 = phi i32 [ %bBegin_block0, %16 ], [ %b_block0.2, %18 ] ; [#uses=2 type=i32]
  %tmp.51 = icmp sgt i32 %a_block01, %aEnd_block0, !dbg !381 ; [#uses=1 type=i1] [debug line = 147:6]
  br i1 %tmp.51, label %19, label %18, !dbg !381  ; [debug line = 147:6]

; <label>:18                                      ; preds = %17
  call void @llvm.dbg.declare(metadata !{[16 x [16 x float]]* %As}, metadata !383), !dbg !384 ; [debug line = 149:10] [debug variable = As]
  call void @llvm.dbg.declare(metadata !{[16 x [16 x float]]* %Bs}, metadata !385), !dbg !386 ; [debug line = 150:10] [debug variable = Bs]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load) nounwind
  store i32 %blockDim.load, i32* %.addr.17, align 4, !dbg !358 ; [debug line = 153:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.11) nounwind
  store i32 %blockDim.load.11, i32* %.addr.18, align 4, !dbg !358 ; [debug line = 153:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.12) nounwind
  store i32 %blockDim.load.12, i32* %.addr.19, align 4, !dbg !358 ; [debug line = 153:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load.3) nounwind
  store i32 %gridDim.load.3, i32* %.addr.20, align 4, !dbg !358 ; [debug line = 153:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load) nounwind
  store i32 %gridDim.load, i32* %.addr.21, align 4, !dbg !358 ; [debug line = 153:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load.4) nounwind
  store i32 %gridDim.load.4, i32* %.addr.22, align 4, !dbg !358 ; [debug line = 153:1]
  %this.assign.load.9 = load i32* %this.assign.addr, align 4, !dbg !358 ; [#uses=4 type=i32] [debug line = 153:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.9) nounwind
  store i32 %this.assign.load.9, i32* %.addr.23, align 4, !dbg !358 ; [debug line = 153:1]
  %this.assign.load.10 = load i32* %this.assign.addr.9, align 4, !dbg !358 ; [#uses=4 type=i32] [debug line = 153:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.10) nounwind
  store i32 %this.assign.load.10, i32* %.addr.24, align 4, !dbg !358 ; [debug line = 153:1]
  %this.assign.load.11 = load i32* %this.assign.addr.10, align 4, !dbg !358 ; [#uses=4 type=i32] [debug line = 153:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.11) nounwind
  store i32 %this.assign.load.11, i32* %.addr.25, align 4, !dbg !358 ; [debug line = 153:1]
  call fastcc void @matrixMul_TRN_6(%struct.dim3.1* byval align 8 %4, [16 x float]* %As.addr, float* %A, i32 %a_block01, i32 %wA, [16 x float]* %Bs.addr, float* %B, i32 %b_block01, i32 %wB), !dbg !358 ; [debug line = 153:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load) nounwind
  store i32 %blockDim.load, i32* %.addr.26, align 4, !dbg !361 ; [debug line = 157:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.11) nounwind
  store i32 %blockDim.load.11, i32* %.addr.27, align 4, !dbg !361 ; [debug line = 157:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.12) nounwind
  store i32 %blockDim.load.12, i32* %.addr.28, align 4, !dbg !361 ; [debug line = 157:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load.3) nounwind
  store i32 %gridDim.load.3, i32* %.addr.29, align 4, !dbg !361 ; [debug line = 157:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load) nounwind
  store i32 %gridDim.load, i32* %.addr.30, align 4, !dbg !361 ; [debug line = 157:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load.4) nounwind
  store i32 %gridDim.load.4, i32* %.addr.31, align 4, !dbg !361 ; [debug line = 157:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.9) nounwind
  store i32 %this.assign.load.9, i32* %.addr.32, align 4, !dbg !361 ; [debug line = 157:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.10) nounwind
  store i32 %this.assign.load.10, i32* %.addr.33, align 4, !dbg !361 ; [debug line = 157:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.11) nounwind
  store i32 %this.assign.load.11, i32* %.addr.34, align 4, !dbg !361 ; [debug line = 157:1]
  call fastcc void @matrixMul_SNC_7(%struct.dim3.1* byval align 8 %7, [16 x float]* %Csub_block_block0.addr, [16 x float]* %As.addr, [16 x float]* %Bs.addr), !dbg !361 ; [debug line = 157:1]
  %a_block0.2 = add nsw i32 %a_block01, 16, !dbg !387 ; [#uses=1 type=i32] [debug line = 147:83]
  call void @llvm.dbg.value(metadata !{i32 %a_block0.2}, i64 0, metadata !380), !dbg !387 ; [debug line = 147:83] [debug variable = a_block0]
  %b_block0.2 = add nsw i32 %b_block01, %bStep_block0, !dbg !387 ; [#uses=1 type=i32] [debug line = 147:83]
  call void @llvm.dbg.value(metadata !{i32 %b_block0.2}, i64 0, metadata !382), !dbg !387 ; [debug line = 147:83] [debug variable = b_block0]
  br label %17, !dbg !387                         ; [debug line = 147:83]

; <label>:19                                      ; preds = %17
  %tmp.52 = mul i32 %by_block0, %wB, !dbg !388    ; [#uses=1 type=i32] [debug line = 160:1]
  %tmp = add i32 %tmp.52, %bx_block0              ; [#uses=1 type=i32]
  %c_block0 = shl i32 %tmp, 4, !dbg !388          ; [#uses=1 type=i32] [debug line = 160:1]
  call void @llvm.dbg.value(metadata !{i32 %c_block0}, i64 0, metadata !389), !dbg !388 ; [debug line = 160:1] [debug variable = c_block0]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load) nounwind
  store i32 %blockDim.load, i32* %.addr.35, align 4, !dbg !362 ; [debug line = 163:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.11) nounwind
  store i32 %blockDim.load.11, i32* %.addr.36, align 4, !dbg !362 ; [debug line = 163:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %blockDim.load.12) nounwind
  store i32 %blockDim.load.12, i32* %.addr.37, align 4, !dbg !362 ; [debug line = 163:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load.3) nounwind
  store i32 %gridDim.load.3, i32* %.addr.38, align 4, !dbg !362 ; [debug line = 163:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load) nounwind
  store i32 %gridDim.load, i32* %.addr.39, align 4, !dbg !362 ; [debug line = 163:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %gridDim.load.4) nounwind
  store i32 %gridDim.load.4, i32* %.addr.40, align 4, !dbg !362 ; [debug line = 163:1]
  %this.assign.load.6 = load i32* %this.assign.addr, align 4, !dbg !362 ; [#uses=2 type=i32] [debug line = 163:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.6) nounwind
  store i32 %this.assign.load.6, i32* %.addr.41, align 4, !dbg !362 ; [debug line = 163:1]
  %this.assign.load.7 = load i32* %this.assign.addr.9, align 4, !dbg !362 ; [#uses=2 type=i32] [debug line = 163:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.7) nounwind
  store i32 %this.assign.load.7, i32* %.addr.42, align 4, !dbg !362 ; [debug line = 163:1]
  %this.assign.load.8 = load i32* %this.assign.addr.10, align 4, !dbg !362 ; [#uses=2 type=i32] [debug line = 163:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.load.8) nounwind
  store i32 %this.assign.load.8, i32* %.addr.43, align 4, !dbg !362 ; [debug line = 163:1]
  call fastcc void @matrixMul_TRN_10_wrapper(%struct.dim3.1* byval align 8 %10, %struct.dim3.1* byval align 8 %11, %struct.dim3.1* byval align 8 %12, float* %C, [16 x float]* %Csub_block_block0.addr, i32 %c_block0, i32 %wB), !dbg !362 ; [debug line = 163:1]
  %rend = call i32 (...)* @_ssdm_op_SpecRegionEnd(i8* getelementptr inbounds ([12 x i8]* @.str2, i64 0, i64 0), i32 %rbegin) nounwind, !dbg !390 ; [#uses=0 type=i32] [debug line = 166:1]
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %bx_block0) nounwind
  %tmp.53 = add i32 %bx_block0, 1, !dbg !364      ; [#uses=1 type=i32] [debug line = 125:61]
  br label %15, !dbg !364                         ; [debug line = 125:61]

; <label>:20                                      ; preds = %15
  call void (...)* @_ssdm_SpecKeepArrayLoad(i32 %this.assign.1.load) nounwind
  %tmp.49 = add i32 %this.assign.1.load, 1, !dbg !391 ; [#uses=1 type=i32] [debug line = 122:61]
  store i32 %tmp.49, i32* %this.assign.1.addr.1, align 4, !dbg !391 ; [debug line = 122:61]
  br label %13, !dbg !391                         ; [debug line = 122:61]

; <label>:21                                      ; preds = %13
  ret void, !dbg !392                             ; [debug line = 168:1]
}

; [#uses=49]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=26]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=3]
declare i32 @_ssdm_op_SpecRegionEnd(...)

; [#uses=3]
declare i32 @_ssdm_op_SpecRegionBegin(...)

; [#uses=1]
declare void @_ssdm_op_SpecLoopName(...) nounwind

; [#uses=3]
declare void @_ssdm_op_SpecInterface(...) nounwind

; [#uses=115]
declare void @_ssdm_SpecKeepArrayLoad(...)

; [#uses=8]
declare void @_ssdm_SpecArrayDimSize(...) nounwind

; [#uses=1]
declare void @_GLOBAL__I_a() nounwind section ".text.startup"

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!81, !88, !94, !100, !106, !108, !112, !112, !118, !118}
!hls.encrypted.func = !{}

!0 = metadata !{i32 786449, i32 0, i32 4, metadata !"/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matmul/solution1/.autopilot/db/fcuda_gen_matmul.pragma.2.cpp", metadata !"/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul", metadata !"clang version 3.1 ", i1 true, i1 false, metadata !"", i32 0, metadata !1, metadata !1, metadata !3, metadata !74} ; [ DW_TAG_compile_unit ]
!1 = metadata !{metadata !2}
!2 = metadata !{i32 0}
!3 = metadata !{metadata !4}
!4 = metadata !{metadata !5, metadata !50, metadata !54, metadata !57, metadata !60, metadata !61, metadata !64, metadata !71, metadata !72, metadata !73}
!5 = metadata !{i32 786478, i32 0, metadata !6, metadata !"matrixMul_CMP_5", metadata !"matrixMul_CMP_5", metadata !"_Z15matrixMul_CMP_5i4dim3S_S_PA16_f", metadata !6, i32 6, metadata !7, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !21, i32 7} ; [ DW_TAG_subprogram ]
!6 = metadata !{i32 786473, metadata !"fcuda_gen/fcuda_gen_matmul.cpp", metadata !"/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul", null} ; [ DW_TAG_file_type ]
!7 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !8, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!8 = metadata !{null, metadata !9, metadata !10, metadata !10, metadata !10, metadata !44}
!9 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!10 = metadata !{i32 786434, null, metadata !"dim3", metadata !11, i32 429, i64 96, i64 32, i32 0, i32 0, null, metadata !12, i32 0, null, null} ; [ DW_TAG_class_type ]
!11 = metadata !{i32 786473, metadata !"/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/vector_types.h", metadata !"/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul", null} ; [ DW_TAG_file_type ]
!12 = metadata !{metadata !13, metadata !15, metadata !16, metadata !17, metadata !23, metadata !41}
!13 = metadata !{i32 786445, metadata !10, metadata !"x", metadata !11, i32 431, i64 32, i64 32, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ]
!14 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!15 = metadata !{i32 786445, metadata !10, metadata !"y", metadata !11, i32 431, i64 32, i64 32, i64 32, i32 0, metadata !14} ; [ DW_TAG_member ]
!16 = metadata !{i32 786445, metadata !10, metadata !"z", metadata !11, i32 431, i64 32, i64 32, i64 64, i32 0, metadata !14} ; [ DW_TAG_member ]
!17 = metadata !{i32 786478, i32 0, metadata !10, metadata !"dim3", metadata !"dim3", metadata !"", metadata !11, i32 433, metadata !18, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !21, i32 433} ; [ DW_TAG_subprogram ]
!18 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !19, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!19 = metadata !{null, metadata !20, metadata !14, metadata !14, metadata !14}
!20 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !10} ; [ DW_TAG_pointer_type ]
!21 = metadata !{metadata !22}
!22 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!23 = metadata !{i32 786478, i32 0, metadata !10, metadata !"dim3", metadata !"dim3", metadata !"", metadata !11, i32 434, metadata !24, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !21, i32 434} ; [ DW_TAG_subprogram ]
!24 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !25, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!25 = metadata !{null, metadata !20, metadata !26}
!26 = metadata !{i32 786454, null, metadata !"uint3", metadata !11, i32 375, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_typedef ]
!27 = metadata !{i32 786434, null, metadata !"uint3", metadata !11, i32 180, i64 96, i64 32, i32 0, i32 0, null, metadata !28, i32 0, null, null} ; [ DW_TAG_class_type ]
!28 = metadata !{metadata !29, metadata !30, metadata !31, metadata !32, metadata !36}
!29 = metadata !{i32 786445, metadata !27, metadata !"x", metadata !11, i32 182, i64 32, i64 32, i64 0, i32 0, metadata !14} ; [ DW_TAG_member ]
!30 = metadata !{i32 786445, metadata !27, metadata !"y", metadata !11, i32 182, i64 32, i64 32, i64 32, i32 0, metadata !14} ; [ DW_TAG_member ]
!31 = metadata !{i32 786445, metadata !27, metadata !"z", metadata !11, i32 182, i64 32, i64 32, i64 64, i32 0, metadata !14} ; [ DW_TAG_member ]
!32 = metadata !{i32 786478, i32 0, metadata !27, metadata !"uint3", metadata !"uint3", metadata !"", metadata !11, i32 180, metadata !33, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !21, i32 180} ; [ DW_TAG_subprogram ]
!33 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !34, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!34 = metadata !{null, metadata !35}
!35 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !27} ; [ DW_TAG_pointer_type ]
!36 = metadata !{i32 786478, i32 0, metadata !27, metadata !"uint3", metadata !"uint3", metadata !"", metadata !11, i32 180, metadata !37, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !21, i32 180} ; [ DW_TAG_subprogram ]
!37 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !38, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!38 = metadata !{null, metadata !35, metadata !39}
!39 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !40} ; [ DW_TAG_reference_type ]
!40 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !27} ; [ DW_TAG_const_type ]
!41 = metadata !{i32 786478, i32 0, metadata !10, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !11, i32 435, metadata !42, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !21, i32 435} ; [ DW_TAG_subprogram ]
!42 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !43, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!43 = metadata !{metadata !26, metadata !20}
!44 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !45} ; [ DW_TAG_pointer_type ]
!45 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 32, i32 0, i32 0, metadata !46, metadata !48, i32 0, i32 0} ; [ DW_TAG_array_type ]
!46 = metadata !{i32 786454, null, metadata !"DATATYPE", metadata !6, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !47} ; [ DW_TAG_typedef ]
!47 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!48 = metadata !{metadata !49}
!49 = metadata !{i32 786465, i64 0, i64 15}       ; [ DW_TAG_subrange_type ]
!50 = metadata !{i32 786478, i32 0, metadata !6, metadata !"matrixMul_TRN_10", metadata !"matrixMul_TRN_10", metadata !"_Z16matrixMul_TRN_10i4dim3S_S_PfPA16_fii", metadata !6, i32 26, metadata !51, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !21, i32 27} ; [ DW_TAG_subprogram ]
!51 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !52, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!52 = metadata !{null, metadata !9, metadata !10, metadata !10, metadata !10, metadata !53, metadata !44, metadata !9, metadata !9}
!53 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !46} ; [ DW_TAG_pointer_type ]
!54 = metadata !{i32 786478, i32 0, metadata !6, metadata !"matrixMul_TRN_6", metadata !"matrixMul_TRN_6", metadata !"_Z15matrixMul_TRN_6i4dim3S_S_PA16_fPfiiS1_S2_ii", metadata !6, i32 46, metadata !55, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !21, i32 47} ; [ DW_TAG_subprogram ]
!55 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !56, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!56 = metadata !{null, metadata !9, metadata !10, metadata !10, metadata !10, metadata !44, metadata !53, metadata !9, metadata !9, metadata !44, metadata !53, metadata !9, metadata !9}
!57 = metadata !{i32 786478, i32 0, metadata !6, metadata !"matrixMul_SNC_7", metadata !"matrixMul_SNC_7", metadata !"_Z15matrixMul_SNC_7i4dim3S_S_PA16_fS1_S1_", metadata !6, i32 67, metadata !58, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !21, i32 68} ; [ DW_TAG_subprogram ]
!58 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !59, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!59 = metadata !{null, metadata !9, metadata !10, metadata !10, metadata !10, metadata !44, metadata !44, metadata !44}
!60 = metadata !{i32 786478, i32 0, metadata !6, metadata !"matrixMul_TRN_10_wrapper", metadata !"matrixMul_TRN_10_wrapper", metadata !"_Z24matrixMul_TRN_10_wrapperi4dim3S_S_PfPA16_fii", metadata !6, i32 95, metadata !51, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !21, i32 96} ; [ DW_TAG_subprogram ]
!61 = metadata !{i32 786478, i32 0, metadata !6, metadata !"matrixMul", metadata !"matrixMul", metadata !"_Z9matrixMulPfS_S_ii4dim3S0_", metadata !6, i32 102, metadata !62, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, void (float*, float*, float*, i32, i32, %struct.dim3.1*, %struct.dim3.1*)* @matrixMul, null, null, metadata !21, i32 103} ; [ DW_TAG_subprogram ]
!62 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !63, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!63 = metadata !{null, metadata !53, metadata !53, metadata !53, metadata !9, metadata !9, metadata !10, metadata !10}
!64 = metadata !{i32 786478, i32 0, null, metadata !"ssdm_global_array_fcuda_gen_matmulpp0cppaplinecpp", metadata !"ssdm_global_array_fcuda_gen_matmulpp0cppaplinecpp", metadata !"_ZN49ssdm_global_array_fcuda_gen_matmulpp0cppaplinecppC1Ev", metadata !6, i32 172, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !70, metadata !21, i32 172} ; [ DW_TAG_subprogram ]
!65 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !66, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!66 = metadata !{null, metadata !67}
!67 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !68} ; [ DW_TAG_pointer_type ]
!68 = metadata !{i32 786434, null, metadata !"ssdm_global_array_fcuda_gen_matmulpp0cppaplinecpp", metadata !6, i32 170, i64 8, i64 8, i32 0, i32 0, null, metadata !69, i32 0, null, null} ; [ DW_TAG_class_type ]
!69 = metadata !{metadata !70}
!70 = metadata !{i32 786478, i32 0, metadata !68, metadata !"ssdm_global_array_fcuda_gen_matmulpp0cppaplinecpp", metadata !"ssdm_global_array_fcuda_gen_matmulpp0cppaplinecpp", metadata !"", metadata !6, i32 172, metadata !65, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !21, i32 172} ; [ DW_TAG_subprogram ]
!71 = metadata !{i32 786478, i32 0, null, metadata !"ssdm_global_array_fcuda_gen_matmulpp0cppaplinecpp", metadata !"ssdm_global_array_fcuda_gen_matmulpp0cppaplinecpp", metadata !"_ZN49ssdm_global_array_fcuda_gen_matmulpp0cppaplinecppC2Ev", metadata !6, i32 172, metadata !65, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !70, metadata !21, i32 172} ; [ DW_TAG_subprogram ]
!72 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C1Ejjj", metadata !11, i32 433, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !17, metadata !21, i32 433} ; [ DW_TAG_subprogram ]
!73 = metadata !{i32 786478, i32 0, null, metadata !"dim3", metadata !"dim3", metadata !"_ZN4dim3C2Ejjj", metadata !11, i32 433, metadata !18, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, metadata !17, metadata !21, i32 433} ; [ DW_TAG_subprogram ]
!74 = metadata !{metadata !75}
!75 = metadata !{metadata !76, metadata !76, metadata !76, metadata !76, metadata !78, metadata !79, metadata !80}
!76 = metadata !{i32 786484, i32 0, metadata !6, metadata !"BLOCKDIM_Y", metadata !"BLOCKDIM_Y", metadata !"BLOCKDIM_Y", metadata !6, i32 4, metadata !77, i32 1, i32 1, i32 16} ; [ DW_TAG_variable ]
!77 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !9} ; [ DW_TAG_const_type ]
!78 = metadata !{i32 786484, i32 0, null, metadata !"ssdm_global_array_ins", metadata !"ssdm_global_array_ins", metadata !"_ZL21ssdm_global_array_ins", metadata !6, i32 177, metadata !68, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!79 = metadata !{i32 786484, i32 0, null, metadata !"BLOCKDIM_Y", metadata !"BLOCKDIM_Y", metadata !"_ZL10BLOCKDIM_Y", metadata !6, i32 4, metadata !77, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!80 = metadata !{i32 786484, i32 0, null, metadata !"BLOCKDIM_X", metadata !"BLOCKDIM_X", metadata !"_ZL10BLOCKDIM_X", metadata !6, i32 4, metadata !77, i32 1, i32 1, null} ; [ DW_TAG_variable ]
!81 = metadata !{null, metadata !82, metadata !83, metadata !84, metadata !85, metadata !86, metadata !87}
!82 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 1}
!83 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!84 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"struct dim3", metadata !"struct dim3", metadata !"struct dim3", metadata !"DATATYPE [16]*"}
!85 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!86 = metadata !{metadata !"kernel_arg_name", metadata !"guard_matrixMul_CMP_5", metadata !"blockDim", metadata !"gridDim", metadata !"blockIdx", metadata !"Csub_block"}
!87 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!88 = metadata !{null, metadata !89, metadata !90, metadata !91, metadata !92, metadata !93, metadata !87}
!89 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 0, i32 0}
!90 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!91 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"struct dim3", metadata !"struct dim3", metadata !"struct dim3", metadata !"DATATYPE*", metadata !"DATATYPE [16]*", metadata !"int", metadata !"int"}
!92 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!93 = metadata !{metadata !"kernel_arg_name", metadata !"guard_matrixMul_TRN_10", metadata !"blockDim", metadata !"gridDim", metadata !"blockIdx", metadata !"C", metadata !"Csub_block", metadata !"c", metadata !"wB"}
!94 = metadata !{null, metadata !95, metadata !96, metadata !97, metadata !98, metadata !99, metadata !87}
!95 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 0, i32 0, i32 1, i32 1, i32 0, i32 0}
!96 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!97 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"struct dim3", metadata !"struct dim3", metadata !"struct dim3", metadata !"DATATYPE [16]*", metadata !"DATATYPE*", metadata !"int", metadata !"int", metadata !"DATATYPE [16]*", metadata !"DATATYPE*", metadata !"int", metadata !"int"}
!98 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!99 = metadata !{metadata !"kernel_arg_name", metadata !"guard_matrixMul_TRN_6", metadata !"blockDim", metadata !"gridDim", metadata !"blockIdx", metadata !"As", metadata !"A", metadata !"a", metadata !"wA", metadata !"Bs", metadata !"B", metadata !"b", metadata !"wB"}
!100 = metadata !{null, metadata !101, metadata !102, metadata !103, metadata !104, metadata !105, metadata !87}
!101 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1}
!102 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!103 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"struct dim3", metadata !"struct dim3", metadata !"struct dim3", metadata !"DATATYPE [16]*", metadata !"DATATYPE [16]*", metadata !"DATATYPE [16]*"}
!104 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!105 = metadata !{metadata !"kernel_arg_name", metadata !"guard_matrixMul_SNC_7", metadata !"blockDim", metadata !"gridDim", metadata !"blockIdx", metadata !"Csub_block", metadata !"As", metadata !"Bs"}
!106 = metadata !{null, metadata !89, metadata !90, metadata !91, metadata !92, metadata !107, metadata !87}
!107 = metadata !{metadata !"kernel_arg_name", metadata !"guard_matrixMul_TRN_10_block0", metadata !"blockDim", metadata !"gridDim", metadata !"blockIdx_matrixMul_TRN_10_block0", metadata !"C", metadata !"Csub_block_block0", metadata !"c_block0", metadata !"wB"}
!108 = metadata !{void (float*, float*, float*, i32, i32, %struct.dim3.1*, %struct.dim3.1*)* @matrixMul, metadata !109, metadata !102, metadata !110, metadata !104, metadata !111, metadata !87}
!109 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0}
!110 = metadata !{metadata !"kernel_arg_type", metadata !"DATATYPE*", metadata !"DATATYPE*", metadata !"DATATYPE*", metadata !"int", metadata !"int", metadata !"struct dim3", metadata !"struct dim3"}
!111 = metadata !{metadata !"kernel_arg_name", metadata !"C", metadata !"A", metadata !"B", metadata !"wA", metadata !"wB", metadata !"gridDim", metadata !"blockDim"}
!112 = metadata !{null, metadata !113, metadata !114, metadata !115, metadata !116, metadata !117, metadata !87}
!113 = metadata !{metadata !"kernel_arg_addr_space"}
!114 = metadata !{metadata !"kernel_arg_access_qual"}
!115 = metadata !{metadata !"kernel_arg_type"}
!116 = metadata !{metadata !"kernel_arg_type_qual"}
!117 = metadata !{metadata !"kernel_arg_name"}
!118 = metadata !{null, metadata !119, metadata !120, metadata !121, metadata !122, metadata !123, metadata !87}
!119 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0}
!120 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!121 = metadata !{metadata !"kernel_arg_type", metadata !"uint", metadata !"uint", metadata !"uint"}
!122 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!123 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"y", metadata !"z"}
!124 = metadata !{i32 786689, metadata !54, metadata !"blockDim", metadata !6, i32 33554478, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!125 = metadata !{i32 46, i32 54, metadata !54, null}
!126 = metadata !{%struct.dim3.1* null}
!127 = metadata !{i32 786689, metadata !54, metadata !"gridDim", metadata !6, i32 50331694, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!128 = metadata !{i32 46, i32 69, metadata !54, null}
!129 = metadata !{i32 786689, metadata !54, metadata !"blockIdx", metadata !6, i32 67108910, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!130 = metadata !{i32 46, i32 83, metadata !54, null}
!131 = metadata !{i32 786689, metadata !54, metadata !"As", metadata !6, i32 83886126, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!132 = metadata !{i32 46, i32 102, metadata !54, null}
!133 = metadata !{i32 786689, metadata !54, metadata !"A", metadata !6, i32 100663342, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!134 = metadata !{i32 46, i32 125, metadata !54, null}
!135 = metadata !{i32 786689, metadata !54, metadata !"a", metadata !6, i32 117440558, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!136 = metadata !{i32 46, i32 132, metadata !54, null}
!137 = metadata !{i32 786689, metadata !54, metadata !"wA", metadata !6, i32 134217774, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!138 = metadata !{i32 46, i32 139, metadata !54, null}
!139 = metadata !{i32 786689, metadata !54, metadata !"Bs", metadata !6, i32 150994990, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!140 = metadata !{i32 46, i32 152, metadata !54, null}
!141 = metadata !{i32 786689, metadata !54, metadata !"B", metadata !6, i32 167772206, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!142 = metadata !{i32 46, i32 175, metadata !54, null}
!143 = metadata !{i32 786689, metadata !54, metadata !"b", metadata !6, i32 184549422, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!144 = metadata !{i32 46, i32 182, metadata !54, null}
!145 = metadata !{i32 786689, metadata !54, metadata !"wB", metadata !6, i32 201326638, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!146 = metadata !{i32 46, i32 189, metadata !54, null}
!147 = metadata !{i32 47, i32 2, metadata !148, null}
!148 = metadata !{i32 786443, metadata !54, i32 47, i32 1, metadata !6, i32 12} ; [ DW_TAG_lexical_block ]
!149 = metadata !{i32 47, i32 32, metadata !148, null}
!150 = metadata !{i32 786688, metadata !148, metadata !"threadIdx", metadata !6, i32 48, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!151 = metadata !{i32 48, i32 6, metadata !148, null}
!152 = metadata !{i32 786689, metadata !72, metadata !"this", metadata !11, i32 16777649, metadata !153, i32 64, metadata !154} ; [ DW_TAG_arg_variable ]
!153 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !10} ; [ DW_TAG_pointer_type ]
!154 = metadata !{i32 48, i32 15, metadata !148, null}
!155 = metadata !{i32 433, i32 5, metadata !72, metadata !154}
!156 = metadata !{i32 786689, metadata !73, metadata !"this", metadata !11, i32 16777649, metadata !153, i32 64, metadata !157} ; [ DW_TAG_arg_variable ]
!157 = metadata !{i32 433, i32 90, metadata !72, metadata !154}
!158 = metadata !{i32 433, i32 5, metadata !73, metadata !157}
!159 = metadata !{i32 433, i32 89, metadata !73, metadata !157}
!160 = metadata !{i32 49, i32 1, metadata !148, null}
!161 = metadata !{i32 52, i32 6, metadata !162, null}
!162 = metadata !{i32 786443, metadata !163, i32 52, i32 1, metadata !6, i32 14} ; [ DW_TAG_lexical_block ]
!163 = metadata !{i32 786443, metadata !148, i32 50, i32 1, metadata !6, i32 13} ; [ DW_TAG_lexical_block ]
!164 = metadata !{i32 53, i32 6, metadata !165, null}
!165 = metadata !{i32 786443, metadata !162, i32 53, i32 1, metadata !6, i32 15} ; [ DW_TAG_lexical_block ]
!166 = metadata !{i32 54, i32 6, metadata !167, null}
!167 = metadata !{i32 786443, metadata !165, i32 54, i32 1, metadata !6, i32 16} ; [ DW_TAG_lexical_block ]
!168 = metadata !{i32 53, i32 45, metadata !165, null}
!169 = metadata !{i32 57, i32 1, metadata !170, null}
!170 = metadata !{i32 786443, metadata !167, i32 55, i32 1, metadata !6, i32 17} ; [ DW_TAG_lexical_block ]
!171 = metadata !{i32 58, i32 1, metadata !170, null}
!172 = metadata !{i32 54, i32 45, metadata !167, null}
!173 = metadata !{i32 52, i32 45, metadata !162, null}
!174 = metadata !{i32 63, i32 1, metadata !148, null}
!175 = metadata !{i32 786689, metadata !60, metadata !"blockDim", metadata !6, i32 33554527, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!176 = metadata !{i32 95, i32 71, metadata !60, null}
!177 = metadata !{i32 786689, metadata !60, metadata !"gridDim", metadata !6, i32 50331743, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!178 = metadata !{i32 95, i32 86, metadata !60, null}
!179 = metadata !{i32 786689, metadata !60, metadata !"blockIdx_matrixMul_TRN_10_block0", metadata !6, i32 67108959, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!180 = metadata !{i32 95, i32 100, metadata !60, null}
!181 = metadata !{i32 786689, metadata !60, metadata !"C", metadata !6, i32 83886175, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!182 = metadata !{i32 95, i32 145, metadata !60, null}
!183 = metadata !{i32 786689, metadata !60, metadata !"Csub_block_block0", metadata !6, i32 100663391, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!184 = metadata !{i32 95, i32 157, metadata !60, null}
!185 = metadata !{i32 786689, metadata !60, metadata !"c_block0", metadata !6, i32 117440607, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!186 = metadata !{i32 95, i32 204, metadata !60, null}
!187 = metadata !{i32 786689, metadata !60, metadata !"wB", metadata !6, i32 134217823, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!188 = metadata !{i32 95, i32 218, metadata !60, null}
!189 = metadata !{i32 96, i32 2, metadata !190, null}
!190 = metadata !{i32 786443, metadata !60, i32 96, i32 1, metadata !6, i32 27} ; [ DW_TAG_lexical_block ]
!191 = metadata !{i32 97, i32 1, metadata !190, null}
!192 = metadata !{i32 98, i32 1, metadata !190, null}
!193 = metadata !{i32 786689, metadata !50, metadata !"blockDim", metadata !6, i32 33554458, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!194 = metadata !{i32 26, i32 56, metadata !50, null}
!195 = metadata !{i32 786689, metadata !50, metadata !"gridDim", metadata !6, i32 50331674, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!196 = metadata !{i32 26, i32 71, metadata !50, null}
!197 = metadata !{i32 786689, metadata !50, metadata !"blockIdx", metadata !6, i32 67108890, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!198 = metadata !{i32 26, i32 85, metadata !50, null}
!199 = metadata !{i32 786689, metadata !50, metadata !"C", metadata !6, i32 83886106, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!200 = metadata !{i32 26, i32 106, metadata !50, null}
!201 = metadata !{i32 786689, metadata !50, metadata !"Csub_block", metadata !6, i32 100663322, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!202 = metadata !{i32 26, i32 118, metadata !50, null}
!203 = metadata !{i32 786689, metadata !50, metadata !"c", metadata !6, i32 117440538, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!204 = metadata !{i32 26, i32 158, metadata !50, null}
!205 = metadata !{i32 786689, metadata !50, metadata !"wB", metadata !6, i32 134217754, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!206 = metadata !{i32 26, i32 165, metadata !50, null}
!207 = metadata !{i32 27, i32 2, metadata !208, null}
!208 = metadata !{i32 786443, metadata !50, i32 27, i32 1, metadata !6, i32 6} ; [ DW_TAG_lexical_block ]
!209 = metadata !{i32 786688, metadata !208, metadata !"threadIdx", metadata !6, i32 28, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!210 = metadata !{i32 28, i32 6, metadata !208, null}
!211 = metadata !{i32 786689, metadata !72, metadata !"this", metadata !11, i32 16777649, metadata !153, i32 64, metadata !212} ; [ DW_TAG_arg_variable ]
!212 = metadata !{i32 28, i32 15, metadata !208, null}
!213 = metadata !{i32 433, i32 5, metadata !72, metadata !212}
!214 = metadata !{i32 786689, metadata !73, metadata !"this", metadata !11, i32 16777649, metadata !153, i32 64, metadata !215} ; [ DW_TAG_arg_variable ]
!215 = metadata !{i32 433, i32 90, metadata !72, metadata !212}
!216 = metadata !{i32 433, i32 5, metadata !73, metadata !215}
!217 = metadata !{i32 433, i32 89, metadata !73, metadata !215}
!218 = metadata !{i32 29, i32 1, metadata !208, null}
!219 = metadata !{i32 32, i32 6, metadata !220, null}
!220 = metadata !{i32 786443, metadata !221, i32 32, i32 1, metadata !6, i32 8} ; [ DW_TAG_lexical_block ]
!221 = metadata !{i32 786443, metadata !208, i32 30, i32 1, metadata !6, i32 7} ; [ DW_TAG_lexical_block ]
!222 = metadata !{i32 33, i32 6, metadata !223, null}
!223 = metadata !{i32 786443, metadata !220, i32 33, i32 1, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!224 = metadata !{i32 34, i32 6, metadata !225, null}
!225 = metadata !{i32 786443, metadata !223, i32 34, i32 1, metadata !6, i32 10} ; [ DW_TAG_lexical_block ]
!226 = metadata !{i32 33, i32 45, metadata !223, null}
!227 = metadata !{i32 37, i32 1, metadata !228, null}
!228 = metadata !{i32 786443, metadata !225, i32 35, i32 1, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!229 = metadata !{i32 34, i32 45, metadata !225, null}
!230 = metadata !{i32 32, i32 45, metadata !220, null}
!231 = metadata !{i32 42, i32 1, metadata !208, null}
!232 = metadata !{i32 786689, metadata !57, metadata !"blockDim", metadata !6, i32 33554499, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!233 = metadata !{i32 67, i32 54, metadata !57, null}
!234 = metadata !{i32 786689, metadata !57, metadata !"gridDim", metadata !6, i32 50331715, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!235 = metadata !{i32 67, i32 69, metadata !57, null}
!236 = metadata !{i32 786689, metadata !57, metadata !"blockIdx", metadata !6, i32 67108931, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!237 = metadata !{i32 67, i32 83, metadata !57, null}
!238 = metadata !{i32 786689, metadata !57, metadata !"Csub_block", metadata !6, i32 83886147, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!239 = metadata !{i32 67, i32 102, metadata !57, null}
!240 = metadata !{i32 786689, metadata !57, metadata !"As", metadata !6, i32 100663363, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!241 = metadata !{i32 67, i32 147, metadata !57, null}
!242 = metadata !{i32 786689, metadata !57, metadata !"Bs", metadata !6, i32 117440579, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!243 = metadata !{i32 67, i32 168, metadata !57, null}
!244 = metadata !{i32 68, i32 2, metadata !245, null}
!245 = metadata !{i32 786443, metadata !57, i32 68, i32 1, metadata !6, i32 18} ; [ DW_TAG_lexical_block ]
!246 = metadata !{i32 68, i32 32, metadata !245, null}
!247 = metadata !{i32 68, i32 62, metadata !245, null}
!248 = metadata !{i32 786688, metadata !245, metadata !"threadIdx", metadata !6, i32 69, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!249 = metadata !{i32 69, i32 6, metadata !245, null}
!250 = metadata !{i32 786689, metadata !72, metadata !"this", metadata !11, i32 16777649, metadata !153, i32 64, metadata !251} ; [ DW_TAG_arg_variable ]
!251 = metadata !{i32 69, i32 15, metadata !245, null}
!252 = metadata !{i32 433, i32 5, metadata !72, metadata !251}
!253 = metadata !{i32 786689, metadata !73, metadata !"this", metadata !11, i32 16777649, metadata !153, i32 64, metadata !254} ; [ DW_TAG_arg_variable ]
!254 = metadata !{i32 433, i32 90, metadata !72, metadata !251}
!255 = metadata !{i32 433, i32 5, metadata !73, metadata !254}
!256 = metadata !{i32 433, i32 89, metadata !73, metadata !254}
!257 = metadata !{i32 70, i32 1, metadata !245, null}
!258 = metadata !{i32 77, i32 6, metadata !259, null}
!259 = metadata !{i32 786443, metadata !260, i32 77, i32 1, metadata !6, i32 21} ; [ DW_TAG_lexical_block ]
!260 = metadata !{i32 786443, metadata !261, i32 74, i32 1, metadata !6, i32 20} ; [ DW_TAG_lexical_block ]
!261 = metadata !{i32 786443, metadata !245, i32 71, i32 1, metadata !6, i32 19} ; [ DW_TAG_lexical_block ]
!262 = metadata !{i32 78, i32 6, metadata !263, null}
!263 = metadata !{i32 786443, metadata !259, i32 78, i32 1, metadata !6, i32 22} ; [ DW_TAG_lexical_block ]
!264 = metadata !{i32 79, i32 6, metadata !265, null}
!265 = metadata !{i32 786443, metadata !263, i32 79, i32 1, metadata !6, i32 23} ; [ DW_TAG_lexical_block ]
!266 = metadata !{i32 78, i32 45, metadata !263, null}
!267 = metadata !{i32 79, i32 45, metadata !265, null}
!268 = metadata !{i32 80, i32 2, metadata !269, null}
!269 = metadata !{i32 786443, metadata !265, i32 80, i32 1, metadata !6, i32 24} ; [ DW_TAG_lexical_block ]
!270 = metadata !{i32 84, i32 1, metadata !271, null}
!271 = metadata !{i32 786443, metadata !272, i32 83, i32 1, metadata !6, i32 26} ; [ DW_TAG_lexical_block ]
!272 = metadata !{i32 786443, metadata !269, i32 82, i32 1, metadata !6, i32 25} ; [ DW_TAG_lexical_block ]
!273 = metadata !{i32 82, i32 6, metadata !272, null}
!274 = metadata !{i32 82, i32 17, metadata !272, null}
!275 = metadata !{i32 786688, metadata !261, metadata !"k", metadata !6, i32 72, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!276 = metadata !{i32 87, i32 1, metadata !269, null}
!277 = metadata !{i32 77, i32 45, metadata !259, null}
!278 = metadata !{i32 92, i32 1, metadata !245, null}
!279 = metadata !{i32 786689, metadata !5, metadata !"blockDim", metadata !6, i32 33554438, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!280 = metadata !{i32 6, i32 54, metadata !5, null}
!281 = metadata !{i32 786689, metadata !5, metadata !"gridDim", metadata !6, i32 50331654, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!282 = metadata !{i32 6, i32 69, metadata !5, null}
!283 = metadata !{i32 786689, metadata !5, metadata !"blockIdx", metadata !6, i32 67108870, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!284 = metadata !{i32 6, i32 83, metadata !5, null}
!285 = metadata !{i32 786689, metadata !5, metadata !"Csub_block", metadata !6, i32 83886086, metadata !44, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!286 = metadata !{i32 6, i32 102, metadata !5, null}
!287 = metadata !{i32 7, i32 2, metadata !288, null}
!288 = metadata !{i32 786443, metadata !5, i32 7, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!289 = metadata !{i32 786688, metadata !288, metadata !"threadIdx", metadata !6, i32 8, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!290 = metadata !{i32 8, i32 6, metadata !288, null}
!291 = metadata !{i32 786689, metadata !72, metadata !"this", metadata !11, i32 16777649, metadata !153, i32 64, metadata !292} ; [ DW_TAG_arg_variable ]
!292 = metadata !{i32 8, i32 15, metadata !288, null}
!293 = metadata !{i32 433, i32 5, metadata !72, metadata !292}
!294 = metadata !{i32 786689, metadata !73, metadata !"this", metadata !11, i32 16777649, metadata !153, i32 64, metadata !295} ; [ DW_TAG_arg_variable ]
!295 = metadata !{i32 433, i32 90, metadata !72, metadata !292}
!296 = metadata !{i32 433, i32 5, metadata !73, metadata !295}
!297 = metadata !{i32 433, i32 89, metadata !73, metadata !295}
!298 = metadata !{i32 9, i32 1, metadata !288, null}
!299 = metadata !{i32 12, i32 6, metadata !300, null}
!300 = metadata !{i32 786443, metadata !301, i32 12, i32 1, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!301 = metadata !{i32 786443, metadata !288, i32 10, i32 1, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!302 = metadata !{i32 13, i32 6, metadata !303, null}
!303 = metadata !{i32 786443, metadata !300, i32 13, i32 1, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!304 = metadata !{i32 14, i32 6, metadata !305, null}
!305 = metadata !{i32 786443, metadata !303, i32 14, i32 1, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!306 = metadata !{i32 13, i32 45, metadata !303, null}
!307 = metadata !{i32 17, i32 1, metadata !308, null}
!308 = metadata !{i32 786443, metadata !305, i32 15, i32 1, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!309 = metadata !{i32 14, i32 45, metadata !305, null}
!310 = metadata !{i32 12, i32 45, metadata !300, null}
!311 = metadata !{i32 22, i32 1, metadata !288, null}
!312 = metadata !{i32 786689, metadata !61, metadata !"C", metadata !6, i32 16777318, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!313 = metadata !{i32 102, i32 27, metadata !61, null}
!314 = metadata !{i32 786689, metadata !61, metadata !"A", metadata !6, i32 33554534, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!315 = metadata !{i32 102, i32 41, metadata !61, null}
!316 = metadata !{i32 786689, metadata !61, metadata !"B", metadata !6, i32 50331750, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!317 = metadata !{i32 102, i32 55, metadata !61, null}
!318 = metadata !{i32 786689, metadata !61, metadata !"wA", metadata !6, i32 67108966, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!319 = metadata !{i32 102, i32 62, metadata !61, null}
!320 = metadata !{i32 786689, metadata !61, metadata !"wB", metadata !6, i32 83886182, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!321 = metadata !{i32 102, i32 70, metadata !61, null}
!322 = metadata !{i32 786689, metadata !61, metadata !"gridDim", metadata !6, i32 100663398, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!323 = metadata !{i32 102, i32 79, metadata !61, null}
!324 = metadata !{i32 786689, metadata !61, metadata !"blockDim", metadata !6, i32 117440614, metadata !10, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!325 = metadata !{i32 102, i32 93, metadata !61, null}
!326 = metadata !{i32 786688, metadata !327, metadata !"Csub_block_block0", metadata !6, i32 111, metadata !328, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!327 = metadata !{i32 786443, metadata !61, i32 103, i32 1, metadata !6, i32 28} ; [ DW_TAG_lexical_block ]
!328 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8192, i64 32, i32 0, i32 0, metadata !46, metadata !329, i32 0, i32 0} ; [ DW_TAG_array_type ]
!329 = metadata !{metadata !49, metadata !49}
!330 = metadata !{i32 111, i32 10, metadata !327, null}
!331 = metadata !{i32 786688, metadata !327, metadata !"blockIdx_block0", metadata !6, i32 116, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!332 = metadata !{i32 116, i32 6, metadata !327, null}
!333 = metadata !{i32 786689, metadata !72, metadata !"this", metadata !11, i32 16777649, metadata !153, i32 64, metadata !334} ; [ DW_TAG_arg_variable ]
!334 = metadata !{i32 116, i32 21, metadata !327, null}
!335 = metadata !{i32 433, i32 5, metadata !72, metadata !334}
!336 = metadata !{i32 786689, metadata !73, metadata !"this", metadata !11, i32 16777649, metadata !153, i32 64, metadata !337} ; [ DW_TAG_arg_variable ]
!337 = metadata !{i32 433, i32 90, metadata !72, metadata !334}
!338 = metadata !{i32 433, i32 5, metadata !73, metadata !337}
!339 = metadata !{i32 433, i32 89, metadata !73, metadata !337}
!340 = metadata !{i32 786688, metadata !327, metadata !"blockIdx_loop", metadata !6, i32 121, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!341 = metadata !{i32 121, i32 6, metadata !327, null}
!342 = metadata !{i32 786689, metadata !72, metadata !"this", metadata !11, i32 16777649, metadata !153, i32 64, metadata !343} ; [ DW_TAG_arg_variable ]
!343 = metadata !{i32 121, i32 19, metadata !327, null}
!344 = metadata !{i32 433, i32 5, metadata !72, metadata !343}
!345 = metadata !{i32 786689, metadata !73, metadata !"this", metadata !11, i32 16777649, metadata !153, i32 64, metadata !346} ; [ DW_TAG_arg_variable ]
!346 = metadata !{i32 433, i32 90, metadata !72, metadata !343}
!347 = metadata !{i32 433, i32 5, metadata !73, metadata !346}
!348 = metadata !{i32 433, i32 89, metadata !73, metadata !346}
!349 = metadata !{i32 122, i32 6, metadata !350, null}
!350 = metadata !{i32 786443, metadata !327, i32 122, i32 1, metadata !6, i32 29} ; [ DW_TAG_lexical_block ]
!351 = metadata !{i32 125, i32 6, metadata !352, null}
!352 = metadata !{i32 786443, metadata !353, i32 125, i32 1, metadata !6, i32 31} ; [ DW_TAG_lexical_block ]
!353 = metadata !{i32 786443, metadata !350, i32 123, i32 1, metadata !6, i32 30} ; [ DW_TAG_lexical_block ]
!354 = metadata !{i32 137, i32 1, metadata !355, null}
!355 = metadata !{i32 786443, metadata !352, i32 126, i32 1, metadata !6, i32 32} ; [ DW_TAG_lexical_block ]
!356 = metadata !{i32 141, i32 1, metadata !355, null}
!357 = metadata !{i32 142, i32 1, metadata !355, null}
!358 = metadata !{i32 153, i32 1, metadata !359, null}
!359 = metadata !{i32 786443, metadata !360, i32 148, i32 1, metadata !6, i32 34} ; [ DW_TAG_lexical_block ]
!360 = metadata !{i32 786443, metadata !355, i32 147, i32 1, metadata !6, i32 33} ; [ DW_TAG_lexical_block ]
!361 = metadata !{i32 157, i32 1, metadata !359, null}
!362 = metadata !{i32 163, i32 1, metadata !355, null}
!363 = metadata !{i32 124, i32 1, metadata !353, null}
!364 = metadata !{i32 125, i32 61, metadata !352, null}
!365 = metadata !{i32 126, i32 2, metadata !355, null}
!366 = metadata !{i32 127, i32 1, metadata !355, null}
!367 = metadata !{i32 132, i32 1, metadata !355, null}
!368 = metadata !{i32 133, i32 1, metadata !355, null}
!369 = metadata !{i32 134, i32 1, metadata !355, null}
!370 = metadata !{i32 786688, metadata !327, metadata !"bx_block0", metadata !6, i32 104, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!371 = metadata !{i32 135, i32 1, metadata !355, null}
!372 = metadata !{i32 136, i32 1, metadata !355, null}
!373 = metadata !{i32 786688, metadata !327, metadata !"by_block0", metadata !6, i32 105, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!374 = metadata !{i32 786688, metadata !327, metadata !"aBegin_block0", metadata !6, i32 106, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!375 = metadata !{i32 138, i32 1, metadata !355, null}
!376 = metadata !{i32 786688, metadata !327, metadata !"aEnd_block0", metadata !6, i32 107, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!377 = metadata !{i32 140, i32 1, metadata !355, null}
!378 = metadata !{i32 786688, metadata !327, metadata !"bBegin_block0", metadata !6, i32 109, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!379 = metadata !{i32 786688, metadata !327, metadata !"bStep_block0", metadata !6, i32 110, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!380 = metadata !{i32 786688, metadata !327, metadata !"a_block0", metadata !6, i32 112, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!381 = metadata !{i32 147, i32 6, metadata !360, null}
!382 = metadata !{i32 786688, metadata !327, metadata !"b_block0", metadata !6, i32 113, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!383 = metadata !{i32 786688, metadata !359, metadata !"As", metadata !6, i32 149, metadata !328, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!384 = metadata !{i32 149, i32 10, metadata !359, null}
!385 = metadata !{i32 786688, metadata !359, metadata !"Bs", metadata !6, i32 150, metadata !328, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!386 = metadata !{i32 150, i32 10, metadata !359, null}
!387 = metadata !{i32 147, i32 83, metadata !360, null}
!388 = metadata !{i32 160, i32 1, metadata !355, null}
!389 = metadata !{i32 786688, metadata !327, metadata !"c_block0", metadata !6, i32 115, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!390 = metadata !{i32 166, i32 1, metadata !355, null}
!391 = metadata !{i32 122, i32 61, metadata !350, null}
!392 = metadata !{i32 168, i32 1, metadata !327, null}
