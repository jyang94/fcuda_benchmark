; ModuleID = '/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matmul/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@matrixMul.str = internal unnamed_addr constant [10 x i8] c"matrixMul\00" ; [#uses=1 type=[10 x i8]*]
@llvm.global_ctors.1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a] ; [#uses=0 type=[1 x void ()*]*]
@llvm.global_ctors.0 = appending global [1 x i32] [i32 65535] ; [#uses=0 type=[1 x i32]*]
@.str4 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=28 type=[1 x i8]*]
@.str3 = private unnamed_addr constant [7 x i8] c"ap_bus\00", align 1 ; [#uses=7 type=[7 x i8]*]
@.str2 = private unnamed_addr constant [12 x i8] c"hls_label_1\00", align 1 ; [#uses=2 type=[12 x i8]*]
@.str1 = private unnamed_addr constant [4 x i8] c"lp1\00", align 1 ; [#uses=3 type=[4 x i8]*]
@.str = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1 ; [#uses=2 type=[12 x i8]*]

; [#uses=1]
define internal fastcc void @matrixMul_TRN_6(i32 %blockDim.x, i32 %blockDim.y, i32 %blockDim.z, [16 x [16 x float]]* nocapture %As, float* %A, i32 %a, i32 %wA, [16 x [16 x float]]* nocapture %Bs, float* %B, i32 %b, i32 %wB) {
  call void (...)* @_ssdm_op_SpecInterface(float* %B, [7 x i8]* @.str3, i32 0, i32 0, i32 0, i32 6144, [1 x i8]* @.str4, [1 x i8]* @.str4, [1 x i8]* @.str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str4) nounwind
  call void (...)* @_ssdm_op_SpecInterface(float* %A, [7 x i8]* @.str3, i32 0, i32 0, i32 0, i32 3840, [1 x i8]* @.str4, [1 x i8]* @.str4, [1 x i8]* @.str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str4) nounwind
  call void @llvm.dbg.value(metadata !{[16 x [16 x float]]* %As}, i64 0, metadata !131), !dbg !134 ; [debug line = 46:102] [debug variable = As]
  call void @llvm.dbg.value(metadata !{float* %A}, i64 0, metadata !135), !dbg !136 ; [debug line = 46:125] [debug variable = A]
  call void @llvm.dbg.value(metadata !{i32 %a}, i64 0, metadata !137), !dbg !138 ; [debug line = 46:132] [debug variable = a]
  call void @llvm.dbg.value(metadata !{i32 %wA}, i64 0, metadata !139), !dbg !140 ; [debug line = 46:139] [debug variable = wA]
  call void @llvm.dbg.value(metadata !{[16 x [16 x float]]* %Bs}, i64 0, metadata !141), !dbg !142 ; [debug line = 46:152] [debug variable = Bs]
  call void @llvm.dbg.value(metadata !{float* %B}, i64 0, metadata !143), !dbg !144 ; [debug line = 46:175] [debug variable = B]
  call void @llvm.dbg.value(metadata !{i32 %b}, i64 0, metadata !145), !dbg !146 ; [debug line = 46:182] [debug variable = b]
  call void @llvm.dbg.value(metadata !{i32 %wB}, i64 0, metadata !147), !dbg !148 ; [debug line = 46:189] [debug variable = wB]
  br label %1, !dbg !149                          ; [debug line = 52:6]

; <label>:1                                       ; preds = %8, %0
  %threadIdx.2 = phi i32 [ 0, %0 ], [ %threadIdx.z, %8 ] ; [#uses=2 type=i32]
  %exitcond2 = icmp eq i32 %threadIdx.2, %blockDim.z, !dbg !149 ; [#uses=1 type=i1] [debug line = 52:6]
  br i1 %exitcond2, label %.loopexit, label %.preheader.preheader, !dbg !149 ; [debug line = 52:6]

.preheader.preheader:                             ; preds = %1
  br label %.preheader, !dbg !153                 ; [debug line = 53:45]

.preheader:                                       ; preds = %7, %.preheader.preheader
  %threadIdx.y = phi i32 [ %tmp.1, %7 ], [ 0, %.preheader.preheader ] ; [#uses=5 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx.y}, i64 0, metadata !155), !dbg !153 ; [debug line = 53:45] [debug variable = threadIdx.y]
  %exitcond1 = icmp eq i32 %threadIdx.y, %blockDim.y, !dbg !159 ; [#uses=1 type=i1] [debug line = 53:6]
  br i1 %exitcond1, label %8, label %2, !dbg !159 ; [debug line = 53:6]

; <label>:2                                       ; preds = %.preheader
  %tmp.2 = mul i32 %threadIdx.y, %wA, !dbg !160   ; [#uses=2 type=i32] [debug line = 57:1]
  %tmp.3 = zext i32 %threadIdx.y to i64, !dbg !160 ; [#uses=2 type=i64] [debug line = 57:1]
  %tmp.4 = mul i32 %threadIdx.y, %wB, !dbg !163   ; [#uses=2 type=i32] [debug line = 58:1]
  %tmp.5 = add i32 0, %a, !dbg !160               ; [#uses=1 type=i32] [debug line = 57:1]
  %tmp.7 = add i32 %tmp.2, %tmp.5, !dbg !160      ; [#uses=1 type=i32] [debug line = 57:1]
  %tmp.11 = zext i32 %tmp.7 to i64, !dbg !160     ; [#uses=1 type=i64] [debug line = 57:1]
  %tmp.12 = add i32 0, %b, !dbg !163              ; [#uses=1 type=i32] [debug line = 58:1]
  %tmp.13 = add i32 %tmp.4, %tmp.12, !dbg !163    ; [#uses=1 type=i32] [debug line = 58:1]
  %tmp.14 = zext i32 %tmp.13 to i64, !dbg !163    ; [#uses=1 type=i64] [debug line = 58:1]
  br label %3, !dbg !164                          ; [debug line = 54:6]

; <label>:3                                       ; preds = %4, %2
  %threadIdx = phi i32 [ 0, %2 ], [ %threadIdx.x, %4 ] ; [#uses=5 type=i32]
  %exitcond = icmp eq i32 %threadIdx, %blockDim.x, !dbg !164 ; [#uses=1 type=i1] [debug line = 54:6]
  br i1 %exitcond, label %7, label %4, !dbg !164  ; [debug line = 54:6]

; <label>:4                                       ; preds = %3
  %tmp = add i32 %threadIdx, %a, !dbg !160        ; [#uses=1 type=i32] [debug line = 57:1]
  %tmp.8 = add i32 %tmp.2, %tmp, !dbg !160        ; [#uses=1 type=i32] [debug line = 57:1]
  %tmp.9 = zext i32 %tmp.8 to i64, !dbg !160      ; [#uses=1 type=i64] [debug line = 57:1]
  %A.addr = getelementptr inbounds float* %A, i64 %tmp.9, !dbg !160 ; [#uses=1 type=float*] [debug line = 57:1]
  %A.addr.1 = getelementptr inbounds float* %A, i64 %tmp.11, !dbg !160 ; [#uses=1 type=float*] [debug line = 57:1]
  %5 = call i32 (...)* @_ssdm_op_SpecBurst(float* %A.addr.1, i32 1, i32 %blockDim.x, i32 1) ; [#uses=0 type=i32]
  %A.load = load float* %A.addr, align 4, !dbg !160 ; [#uses=1 type=float] [debug line = 57:1]
  %tmp. = zext i32 %threadIdx to i64, !dbg !160   ; [#uses=2 type=i64] [debug line = 57:1]
  %As.addr = getelementptr [16 x [16 x float]]* %As, i64 0, i64 %tmp.3, i64 %tmp., !dbg !160 ; [#uses=1 type=float*] [debug line = 57:1]
  store float %A.load, float* %As.addr, align 4, !dbg !160 ; [debug line = 57:1]
  %tmp1 = add i32 %threadIdx, %b, !dbg !163       ; [#uses=1 type=i32] [debug line = 58:1]
  %tmp.6 = add i32 %tmp.4, %tmp1, !dbg !163       ; [#uses=1 type=i32] [debug line = 58:1]
  %tmp.10 = zext i32 %tmp.6 to i64, !dbg !163     ; [#uses=1 type=i64] [debug line = 58:1]
  %B.addr = getelementptr inbounds float* %B, i64 %tmp.10, !dbg !163 ; [#uses=1 type=float*] [debug line = 58:1]
  %B.addr.1 = getelementptr inbounds float* %B, i64 %tmp.14, !dbg !163 ; [#uses=1 type=float*] [debug line = 58:1]
  %6 = call i32 (...)* @_ssdm_op_SpecBurst(float* %B.addr.1, i32 1, i32 %blockDim.x, i32 1) ; [#uses=0 type=i32]
  %B.load = load float* %B.addr, align 4, !dbg !163 ; [#uses=1 type=float] [debug line = 58:1]
  %Bs.addr = getelementptr [16 x [16 x float]]* %Bs, i64 0, i64 %tmp.3, i64 %tmp., !dbg !163 ; [#uses=1 type=float*] [debug line = 58:1]
  store float %B.load, float* %Bs.addr, align 4, !dbg !163 ; [debug line = 58:1]
  %threadIdx.x = add i32 %threadIdx, 1, !dbg !165 ; [#uses=1 type=i32] [debug line = 54:45]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx.x}, i64 0, metadata !166), !dbg !165 ; [debug line = 54:45] [debug variable = threadIdx.x]
  br label %3, !dbg !165                          ; [debug line = 54:45]

; <label>:7                                       ; preds = %3
  %tmp.1 = add i32 %threadIdx.y, 1, !dbg !153     ; [#uses=1 type=i32] [debug line = 53:45]
  br label %.preheader, !dbg !153                 ; [debug line = 53:45]

; <label>:8                                       ; preds = %.preheader
  %threadIdx.z = add i32 %threadIdx.2, 1, !dbg !169 ; [#uses=1 type=i32] [debug line = 52:45]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx.z}, i64 0, metadata !170), !dbg !169 ; [debug line = 52:45] [debug variable = threadIdx.z]
  br label %1, !dbg !169                          ; [debug line = 52:45]

.loopexit:                                        ; preds = %1
  ret void, !dbg !173                             ; [debug line = 63:1]
}

; [#uses=1]
define internal fastcc void @matrixMul_TRN_10_wrapper(i32 %blockDim.x, i32 %blockDim.y, i32 %blockDim.z, float* %C, [16 x [16 x float]]* nocapture %Csub_block_block0, i32 %c_block0, i32 %wB) {
  call void (...)* @_ssdm_op_SpecInterface(float* %C, [7 x i8]* @.str3, i32 0, i32 0, i32 0, i32 10240, [1 x i8]* @.str4, [1 x i8]* @.str4, [1 x i8]* @.str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str4) nounwind
  call void @llvm.dbg.value(metadata !{float* %C}, i64 0, metadata !174), !dbg !175 ; [debug line = 95:145] [debug variable = C]
  call void @llvm.dbg.value(metadata !{[16 x [16 x float]]* %Csub_block_block0}, i64 0, metadata !176), !dbg !177 ; [debug line = 95:157] [debug variable = Csub_block_block0]
  call void @llvm.dbg.value(metadata !{i32 %c_block0}, i64 0, metadata !178), !dbg !179 ; [debug line = 95:204] [debug variable = c_block0]
  call void @llvm.dbg.value(metadata !{i32 %wB}, i64 0, metadata !180), !dbg !181 ; [debug line = 95:218] [debug variable = wB]
  call fastcc void @matrixMul_TRN_10(i32 %blockDim.x, i32 %blockDim.y, i32 %blockDim.z, float* %C, [16 x [16 x float]]* %Csub_block_block0, i32 %c_block0, i32 %wB), !dbg !182 ; [debug line = 97:1]
  ret void, !dbg !184                             ; [debug line = 98:1]
}

; [#uses=1]
define internal fastcc void @matrixMul_TRN_10(i32 %blockDim.x, i32 %blockDim.y, i32 %blockDim.z, float* %C, [16 x [16 x float]]* nocapture %Csub_block, i32 %c, i32 %wB) {
  call void (...)* @_ssdm_op_SpecInterface(float* %C, [7 x i8]* @.str3, i32 0, i32 0, i32 0, i32 10240, [1 x i8]* @.str4, [1 x i8]* @.str4, [1 x i8]* @.str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str4) nounwind
  call void @llvm.dbg.value(metadata !{float* %C}, i64 0, metadata !185), !dbg !186 ; [debug line = 26:106] [debug variable = C]
  call void @llvm.dbg.value(metadata !{[16 x [16 x float]]* %Csub_block}, i64 0, metadata !187), !dbg !188 ; [debug line = 26:118] [debug variable = Csub_block]
  call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !189), !dbg !190 ; [debug line = 26:158] [debug variable = c]
  call void @llvm.dbg.value(metadata !{i32 %wB}, i64 0, metadata !191), !dbg !192 ; [debug line = 26:165] [debug variable = wB]
  br label %1, !dbg !193                          ; [debug line = 32:6]

; <label>:1                                       ; preds = %7, %0
  %threadIdx.2 = phi i32 [ 0, %0 ], [ %threadIdx.z, %7 ] ; [#uses=2 type=i32]
  %exitcond2 = icmp eq i32 %threadIdx.2, %blockDim.z, !dbg !193 ; [#uses=1 type=i1] [debug line = 32:6]
  br i1 %exitcond2, label %.loopexit, label %.preheader.preheader, !dbg !193 ; [debug line = 32:6]

.preheader.preheader:                             ; preds = %1
  br label %.preheader, !dbg !197                 ; [debug line = 33:45]

.preheader:                                       ; preds = %6, %.preheader.preheader
  %threadIdx.y = phi i32 [ %tmp.12, %6 ], [ 0, %.preheader.preheader ] ; [#uses=4 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx.y}, i64 0, metadata !199), !dbg !197 ; [debug line = 33:45] [debug variable = threadIdx.y]
  %exitcond1 = icmp eq i32 %threadIdx.y, %blockDim.y, !dbg !201 ; [#uses=1 type=i1] [debug line = 33:6]
  br i1 %exitcond1, label %7, label %2, !dbg !201 ; [debug line = 33:6]

; <label>:2                                       ; preds = %.preheader
  %tmp. = zext i32 %threadIdx.y to i64, !dbg !202 ; [#uses=1 type=i64] [debug line = 37:1]
  %tmp.11 = mul i32 %threadIdx.y, %wB, !dbg !202  ; [#uses=2 type=i32] [debug line = 37:1]
  %tmp.17 = add i32 0, %c, !dbg !202              ; [#uses=1 type=i32] [debug line = 37:1]
  %tmp.18 = add i32 %tmp.11, %tmp.17, !dbg !202   ; [#uses=1 type=i32] [debug line = 37:1]
  %tmp.19 = zext i32 %tmp.18 to i64, !dbg !202    ; [#uses=1 type=i64] [debug line = 37:1]
  br label %3, !dbg !205                          ; [debug line = 34:6]

; <label>:3                                       ; preds = %4, %2
  %threadIdx = phi i32 [ 0, %2 ], [ %threadIdx.x, %4 ] ; [#uses=4 type=i32]
  %exitcond = icmp eq i32 %threadIdx, %blockDim.x, !dbg !205 ; [#uses=1 type=i1] [debug line = 34:6]
  br i1 %exitcond, label %6, label %4, !dbg !205  ; [debug line = 34:6]

; <label>:4                                       ; preds = %3
  %tmp.13 = zext i32 %threadIdx to i64, !dbg !202 ; [#uses=1 type=i64] [debug line = 37:1]
  %Csub_block.addr = getelementptr [16 x [16 x float]]* %Csub_block, i64 0, i64 %tmp., i64 %tmp.13, !dbg !202 ; [#uses=1 type=float*] [debug line = 37:1]
  %Csub_block.load = load float* %Csub_block.addr, align 4, !dbg !202 ; [#uses=1 type=float] [debug line = 37:1]
  %tmp = add i32 %threadIdx, %c, !dbg !202        ; [#uses=1 type=i32] [debug line = 37:1]
  %tmp.14 = add i32 %tmp.11, %tmp, !dbg !202      ; [#uses=1 type=i32] [debug line = 37:1]
  %tmp.15 = zext i32 %tmp.14 to i64, !dbg !202    ; [#uses=1 type=i64] [debug line = 37:1]
  %C.addr = getelementptr inbounds float* %C, i64 %tmp.15, !dbg !202 ; [#uses=1 type=float*] [debug line = 37:1]
  %C.addr.1 = getelementptr inbounds float* %C, i64 %tmp.19, !dbg !202 ; [#uses=1 type=float*] [debug line = 37:1]
  %5 = call i32 (...)* @_ssdm_op_SpecBurst(float* %C.addr.1, i32 0, i32 %blockDim.x, i32 1) ; [#uses=0 type=i32]
  store float %Csub_block.load, float* %C.addr, align 4, !dbg !202 ; [debug line = 37:1]
  %threadIdx.x = add i32 %threadIdx, 1, !dbg !206 ; [#uses=1 type=i32] [debug line = 34:45]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx.x}, i64 0, metadata !207), !dbg !206 ; [debug line = 34:45] [debug variable = threadIdx.x]
  br label %3, !dbg !206                          ; [debug line = 34:45]

; <label>:6                                       ; preds = %3
  %tmp.12 = add i32 %threadIdx.y, 1, !dbg !197    ; [#uses=1 type=i32] [debug line = 33:45]
  br label %.preheader, !dbg !197                 ; [debug line = 33:45]

; <label>:7                                       ; preds = %.preheader
  %threadIdx.z = add i32 %threadIdx.2, 1, !dbg !208 ; [#uses=1 type=i32] [debug line = 32:45]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx.z}, i64 0, metadata !209), !dbg !208 ; [debug line = 32:45] [debug variable = threadIdx.z]
  br label %1, !dbg !208                          ; [debug line = 32:45]

.loopexit:                                        ; preds = %1
  ret void, !dbg !210                             ; [debug line = 42:1]
}

; [#uses=1]
define internal fastcc void @matrixMul_SNC_7(i32 %blockDim.x, i32 %blockDim.y, i32 %blockDim.z, [16 x [16 x float]]* nocapture %Csub_block, [16 x [16 x float]]* nocapture %As, [16 x [16 x float]]* nocapture %Bs) {
  call void @llvm.dbg.value(metadata !{[16 x [16 x float]]* %Csub_block}, i64 0, metadata !211), !dbg !212 ; [debug line = 67:102] [debug variable = Csub_block]
  call void @llvm.dbg.value(metadata !{[16 x [16 x float]]* %As}, i64 0, metadata !213), !dbg !214 ; [debug line = 67:147] [debug variable = As]
  call void @llvm.dbg.value(metadata !{[16 x [16 x float]]* %Bs}, i64 0, metadata !215), !dbg !216 ; [debug line = 67:168] [debug variable = Bs]
  br label %1, !dbg !217                          ; [debug line = 77:6]

; <label>:1                                       ; preds = %10, %0
  %threadIdx.2 = phi i32 [ 0, %0 ], [ %threadIdx.z, %10 ] ; [#uses=2 type=i32]
  %exitcond3 = icmp eq i32 %threadIdx.2, %blockDim.z, !dbg !217 ; [#uses=1 type=i1] [debug line = 77:6]
  br i1 %exitcond3, label %.loopexit, label %.preheader2.preheader, !dbg !217 ; [debug line = 77:6]

.preheader2.preheader:                            ; preds = %1
  br label %.preheader2, !dbg !222                ; [debug line = 78:45]

.preheader2:                                      ; preds = %9, %.preheader2.preheader
  %threadIdx.y = phi i32 [ %tmp., %9 ], [ 0, %.preheader2.preheader ] ; [#uses=3 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx.y}, i64 0, metadata !224), !dbg !222 ; [debug line = 78:45] [debug variable = threadIdx.y]
  %exitcond2 = icmp eq i32 %threadIdx.y, %blockDim.y, !dbg !226 ; [#uses=1 type=i1] [debug line = 78:6]
  br i1 %exitcond2, label %10, label %.preheader.preheader, !dbg !226 ; [debug line = 78:6]

.preheader.preheader:                             ; preds = %.preheader2
  %tmp.16 = zext i32 %threadIdx.y to i64, !dbg !227 ; [#uses=2 type=i64] [debug line = 84:1]
  br label %.preheader, !dbg !232                 ; [debug line = 79:45]

.preheader:                                       ; preds = %6, %.preheader.preheader
  %threadIdx.x = phi i32 [ %tmp.18, %6 ], [ 0, %.preheader.preheader ] ; [#uses=3 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx.x}, i64 0, metadata !233), !dbg !232 ; [debug line = 79:45] [debug variable = threadIdx.x]
  %exitcond1 = icmp eq i32 %threadIdx.x, %blockDim.x, !dbg !234 ; [#uses=1 type=i1] [debug line = 79:6]
  br i1 %exitcond1, label %9, label %2, !dbg !234 ; [debug line = 79:6]

; <label>:2                                       ; preds = %.preheader
  %tmp = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @.str), !dbg !235 ; [#uses=1 type=i32] [debug line = 80:2]
  call void (...)* @_ssdm_op_SpecLoopName([4 x i8]* @.str1) nounwind, !dbg !235 ; [debug line = 80:2]
  %tmp.1 = call i32 (...)* @_ssdm_op_SpecRegionBegin([4 x i8]* @.str1), !dbg !235 ; [#uses=1 type=i32] [debug line = 80:2]
  %tmp.17 = zext i32 %threadIdx.x to i64, !dbg !227 ; [#uses=2 type=i64] [debug line = 84:1]
  %Csub_block.addr = getelementptr [16 x [16 x float]]* %Csub_block, i64 0, i64 %tmp.16, i64 %tmp.17, !dbg !227 ; [#uses=2 type=float*] [debug line = 84:1]
  br label %3, !dbg !236                          ; [debug line = 82:6]

; <label>:3                                       ; preds = %5, %2
  %k = phi i5 [ 0, %2 ], [ %k.1, %5 ]             ; [#uses=3 type=i5]
  %exitcond = icmp eq i5 %k, -16, !dbg !236       ; [#uses=1 type=i1] [debug line = 82:6]
  %4 = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 16, i64 16, i64 16) ; [#uses=0 type=i32]
  br i1 %exitcond, label %6, label %5, !dbg !236  ; [debug line = 82:6]

; <label>:5                                       ; preds = %3
  %tmp.19 = zext i5 %k to i64, !dbg !227          ; [#uses=2 type=i64] [debug line = 84:1]
  %As.addr = getelementptr [16 x [16 x float]]* %As, i64 0, i64 %tmp.16, i64 %tmp.19, !dbg !227 ; [#uses=1 type=float*] [debug line = 84:1]
  %As.load = load float* %As.addr, align 4, !dbg !227 ; [#uses=1 type=float] [debug line = 84:1]
  %Bs.addr = getelementptr [16 x [16 x float]]* %Bs, i64 0, i64 %tmp.19, i64 %tmp.17, !dbg !227 ; [#uses=1 type=float*] [debug line = 84:1]
  %Bs.load = load float* %Bs.addr, align 4, !dbg !227 ; [#uses=1 type=float] [debug line = 84:1]
  %tmp.20 = fmul float %As.load, %Bs.load, !dbg !227 ; [#uses=1 type=float] [debug line = 84:1]
  %Csub_block.load = load float* %Csub_block.addr, align 4, !dbg !227 ; [#uses=1 type=float] [debug line = 84:1]
  %tmp.21 = fadd float %Csub_block.load, %tmp.20, !dbg !227 ; [#uses=1 type=float] [debug line = 84:1]
  store float %tmp.21, float* %Csub_block.addr, align 4, !dbg !227 ; [debug line = 84:1]
  %k.1 = add i5 %k, 1, !dbg !237                  ; [#uses=1 type=i5] [debug line = 82:17]
  call void @llvm.dbg.value(metadata !{i5 %k.1}, i64 0, metadata !238), !dbg !237 ; [debug line = 82:17] [debug variable = k]
  br label %3, !dbg !237                          ; [debug line = 82:17]

; <label>:6                                       ; preds = %3
  %7 = call i32 (...)* @_ssdm_op_SpecRegionEnd([4 x i8]* @.str1, i32 %tmp.1), !dbg !239 ; [#uses=0 type=i32] [debug line = 87:1]
  %8 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @.str, i32 %tmp), !dbg !239 ; [#uses=0 type=i32] [debug line = 87:1]
  %tmp.18 = add i32 %threadIdx.x, 1, !dbg !232    ; [#uses=1 type=i32] [debug line = 79:45]
  br label %.preheader, !dbg !232                 ; [debug line = 79:45]

; <label>:9                                       ; preds = %.preheader
  %tmp. = add i32 %threadIdx.y, 1, !dbg !222      ; [#uses=1 type=i32] [debug line = 78:45]
  br label %.preheader2, !dbg !222                ; [debug line = 78:45]

; <label>:10                                      ; preds = %.preheader2
  %threadIdx.z = add i32 %threadIdx.2, 1, !dbg !240 ; [#uses=1 type=i32] [debug line = 77:45]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx.z}, i64 0, metadata !241), !dbg !240 ; [debug line = 77:45] [debug variable = threadIdx.z]
  br label %1, !dbg !240                          ; [debug line = 77:45]

.loopexit:                                        ; preds = %1
  ret void, !dbg !242                             ; [debug line = 92:1]
}

; [#uses=0]
define void @matrixMul(float* %C, float* %A, float* %B, i32 %wA, i32 %wB, i32 %gridDim.x, i32 %gridDim.y, i32 %gridDim.z, i32 %blockDim.x, i32 %blockDim.y, i32 %blockDim.z) {
  call void (...)* @_ssdm_op_SpecBitsMap(float* %C), !map !243
  call void (...)* @_ssdm_op_SpecBitsMap(float* %A), !map !249
  call void (...)* @_ssdm_op_SpecBitsMap(float* %B), !map !255
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %wA), !map !261
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %wB), !map !267
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %gridDim.x), !map !271
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %gridDim.y), !map !275
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %gridDim.z), !map !279
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %blockDim.x), !map !283
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %blockDim.y), !map !287
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %blockDim.z), !map !291
  call void (...)* @_ssdm_op_SpecTopModule([10 x i8]* @matrixMul.str) nounwind
  %Csub_block_block0 = alloca [16 x [16 x float]], align 16 ; [#uses=3 type=[16 x [16 x float]]*]
  %As = alloca [16 x [16 x float]], align 16      ; [#uses=2 type=[16 x [16 x float]]*]
  %Bs = alloca [16 x [16 x float]], align 16      ; [#uses=2 type=[16 x [16 x float]]*]
  call void @llvm.dbg.value(metadata !{float* %C}, i64 0, metadata !295), !dbg !296 ; [debug line = 102:27] [debug variable = C]
  call void @llvm.dbg.value(metadata !{float* %A}, i64 0, metadata !297), !dbg !298 ; [debug line = 102:41] [debug variable = A]
  call void @llvm.dbg.value(metadata !{float* %B}, i64 0, metadata !299), !dbg !300 ; [debug line = 102:55] [debug variable = B]
  call void @llvm.dbg.value(metadata !{i32 %wA}, i64 0, metadata !301), !dbg !302 ; [debug line = 102:62] [debug variable = wA]
  call void @llvm.dbg.value(metadata !{i32 %wB}, i64 0, metadata !303), !dbg !304 ; [debug line = 102:70] [debug variable = wB]
  call void @llvm.dbg.declare(metadata !{[16 x [16 x float]]* %Csub_block_block0}, metadata !305), !dbg !307 ; [debug line = 111:10] [debug variable = Csub_block_block0]
  %bStep_block0 = shl i32 %wB, 4, !dbg !308       ; [#uses=1 type=i32] [debug line = 141:1]
  br label %1, !dbg !313                          ; [debug line = 122:6]

; <label>:1                                       ; preds = %12, %0
  %blockIdx_block0.y = phi i32 [ 0, %0 ], [ %blockIdx_loop.y, %12 ] ; [#uses=4 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %blockIdx_block0.y}, i64 0, metadata !314), !dbg !316 ; [debug line = 124:1] [debug variable = blockIdx_block0.y]
  %tmp. = icmp eq i32 %blockIdx_block0.y, %gridDim.y, !dbg !313 ; [#uses=1 type=i1] [debug line = 122:6]
  br i1 %tmp., label %13, label %.preheader.preheader, !dbg !313 ; [debug line = 122:6]

.preheader.preheader:                             ; preds = %1
  %aBegin_block = mul i32 %blockIdx_block0.y, %wA, !dbg !317 ; [#uses=1 type=i32] [debug line = 137:1]
  %aBegin_block1 = trunc i32 %aBegin_block to i28, !dbg !317 ; [#uses=1 type=i28] [debug line = 137:1]
  %aBegin_block2 = zext i28 %aBegin_block1 to i32, !dbg !317 ; [#uses=1 type=i32] [debug line = 137:1]
  %a_block0.2 = shl nuw i32 %aBegin_block2, 4, !dbg !317 ; [#uses=2 type=i32] [debug line = 137:1]
  %tmp1 = add i32 %a_block0.2, -1, !dbg !318      ; [#uses=1 type=i32] [debug line = 138:1]
  %aEnd_block0 = add i32 %tmp1, %wA, !dbg !318    ; [#uses=1 type=i32] [debug line = 138:1]
  %tmp.22 = mul i32 %blockIdx_block0.y, %wB, !dbg !319 ; [#uses=1 type=i32] [debug line = 160:1]
  br label %.preheader, !dbg !320                 ; [debug line = 125:61]

.preheader:                                       ; preds = %10, %.preheader.preheader
  %blockIdx_loop.x = phi i32 [ %tmp.25, %10 ], [ 0, %.preheader.preheader ] ; [#uses=4 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %blockIdx_loop.x}, i64 0, metadata !321), !dbg !320 ; [debug line = 125:61] [debug variable = blockIdx_loop.x]
  %tmp.23 = icmp eq i32 %blockIdx_loop.x, %gridDim.x, !dbg !323 ; [#uses=1 type=i1] [debug line = 125:6]
  br i1 %tmp.23, label %12, label %2, !dbg !323   ; [debug line = 125:6]

; <label>:2                                       ; preds = %.preheader
  %tmp.2 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @.str2), !dbg !324 ; [#uses=1 type=i32] [debug line = 126:2]
  call void @llvm.dbg.value(metadata !{i32 %blockIdx_loop.x}, i64 0, metadata !325), !dbg !326 ; [debug line = 127:1] [debug variable = blockIdx_block0.x]
  call void (...)* @_ssdm_op_SpecInterface(float* %A, [7 x i8]* @.str3, i32 0, i32 0, i32 0, i32 3840, [1 x i8]* @.str4, [1 x i8]* @.str4, [1 x i8]* @.str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str4) nounwind, !dbg !327 ; [debug line = 132:1]
  call void (...)* @_ssdm_op_SpecInterface(float* %B, [7 x i8]* @.str3, i32 0, i32 0, i32 0, i32 6144, [1 x i8]* @.str4, [1 x i8]* @.str4, [1 x i8]* @.str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str4) nounwind, !dbg !328 ; [debug line = 133:1]
  call void (...)* @_ssdm_op_SpecInterface(float* %C, [7 x i8]* @.str3, i32 0, i32 0, i32 0, i32 10240, [1 x i8]* @.str4, [1 x i8]* @.str4, [1 x i8]* @.str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @.str4) nounwind, !dbg !329 ; [debug line = 134:1]
  call void @llvm.dbg.value(metadata !{i32 %blockIdx_loop.x}, i64 0, metadata !330), !dbg !331 ; [debug line = 135:1] [debug variable = bx_block0]
  call void @llvm.dbg.value(metadata !{i32 %blockIdx_block0.y}, i64 0, metadata !332), !dbg !333 ; [debug line = 136:1] [debug variable = by_block0]
  call void @llvm.dbg.value(metadata !{i32 %a_block0.2}, i64 0, metadata !334), !dbg !335 ; [debug line = 147:6] [debug variable = a_block0]
  call void @llvm.dbg.value(metadata !{i32 %a_block0.2}, i64 0, metadata !337), !dbg !317 ; [debug line = 137:1] [debug variable = aBegin_block0]
  call void @llvm.dbg.value(metadata !{i32 %aEnd_block0}, i64 0, metadata !338), !dbg !318 ; [debug line = 138:1] [debug variable = aEnd_block0]
  %b_block0.2 = shl nsw i32 %blockIdx_loop.x, 4, !dbg !339 ; [#uses=1 type=i32] [debug line = 140:1]
  call void @llvm.dbg.value(metadata !{i32 %b_block0.2}, i64 0, metadata !340), !dbg !335 ; [debug line = 147:6] [debug variable = b_block0]
  call void @llvm.dbg.value(metadata !{i32 %b_block0.2}, i64 0, metadata !341), !dbg !339 ; [debug line = 140:1] [debug variable = bBegin_block0]
  call void @llvm.dbg.value(metadata !{i32 %bStep_block0}, i64 0, metadata !342), !dbg !308 ; [debug line = 141:1] [debug variable = bStep_block0]
  call void @llvm.dbg.value(metadata !{[16 x [16 x float]]* %Csub_block_block0}, i64 0, metadata !343), !dbg !345 ; [debug line = 6:102@142:1] [debug variable = Csub_block]
  br label %3, !dbg !346                          ; [debug line = 12:6@142:1]

; <label>:3                                       ; preds = %8, %2
  %threadIdx.2.i = phi i32 [ 0, %2 ], [ %threadIdx.z, %8 ] ; [#uses=2 type=i32]
  %exitcond2.i = icmp eq i32 %threadIdx.2.i, %blockDim.z, !dbg !346 ; [#uses=1 type=i1] [debug line = 12:6@142:1]
  br i1 %exitcond2.i, label %matrixMul_CMP_5.exit.preheader, label %.preheader.i.preheader, !dbg !346 ; [debug line = 12:6@142:1]

.preheader.i.preheader:                           ; preds = %3
  br label %.preheader.i, !dbg !350               ; [debug line = 13:45@142:1]

matrixMul_CMP_5.exit.preheader:                   ; preds = %3
  br label %matrixMul_CMP_5.exit, !dbg !335       ; [debug line = 147:6]

.preheader.i:                                     ; preds = %7, %.preheader.i.preheader
  %threadIdx.y = phi i32 [ %tmp.23.i, %7 ], [ 0, %.preheader.i.preheader ] ; [#uses=3 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx.y}, i64 0, metadata !352), !dbg !350 ; [debug line = 13:45@142:1] [debug variable = threadIdx.y]
  %exitcond1.i = icmp eq i32 %threadIdx.y, %blockDim.y, !dbg !354 ; [#uses=1 type=i1] [debug line = 13:6@142:1]
  br i1 %exitcond1.i, label %8, label %4, !dbg !354 ; [debug line = 13:6@142:1]

; <label>:4                                       ; preds = %.preheader.i
  %tmp..i = zext i32 %threadIdx.y to i64, !dbg !355 ; [#uses=1 type=i64] [debug line = 17:1@142:1]
  br label %5, !dbg !358                          ; [debug line = 14:6@142:1]

; <label>:5                                       ; preds = %6, %4
  %threadIdx.i = phi i32 [ 0, %4 ], [ %threadIdx.x, %6 ] ; [#uses=3 type=i32]
  %exitcond.i = icmp eq i32 %threadIdx.i, %blockDim.x, !dbg !358 ; [#uses=1 type=i1] [debug line = 14:6@142:1]
  br i1 %exitcond.i, label %7, label %6, !dbg !358 ; [debug line = 14:6@142:1]

; <label>:6                                       ; preds = %5
  %tmp.24.i = zext i32 %threadIdx.i to i64, !dbg !355 ; [#uses=1 type=i64] [debug line = 17:1@142:1]
  %Csub_block.assign.addr = getelementptr [16 x [16 x float]]* %Csub_block_block0, i64 0, i64 %tmp..i, i64 %tmp.24.i, !dbg !355 ; [#uses=1 type=float*] [debug line = 17:1@142:1]
  store float 0.000000e+00, float* %Csub_block.assign.addr, align 4, !dbg !355 ; [debug line = 17:1@142:1]
  %threadIdx.x = add i32 %threadIdx.i, 1, !dbg !359 ; [#uses=1 type=i32] [debug line = 14:45@142:1]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx.x}, i64 0, metadata !360), !dbg !359 ; [debug line = 14:45@142:1] [debug variable = threadIdx.x]
  br label %5, !dbg !359                          ; [debug line = 14:45@142:1]

; <label>:7                                       ; preds = %5
  %tmp.23.i = add i32 %threadIdx.y, 1, !dbg !350  ; [#uses=1 type=i32] [debug line = 13:45@142:1]
  br label %.preheader.i, !dbg !350               ; [debug line = 13:45@142:1]

; <label>:8                                       ; preds = %.preheader.i
  %threadIdx.z = add i32 %threadIdx.2.i, 1, !dbg !361 ; [#uses=1 type=i32] [debug line = 12:45@142:1]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx.z}, i64 0, metadata !362), !dbg !361 ; [debug line = 12:45@142:1] [debug variable = threadIdx.z]
  br label %3, !dbg !361                          ; [debug line = 12:45@142:1]

matrixMul_CMP_5.exit:                             ; preds = %9, %matrixMul_CMP_5.exit.preheader
  %a_block = phi i32 [ %a_block0, %9 ], [ %a_block0.2, %matrixMul_CMP_5.exit.preheader ] ; [#uses=3 type=i32]
  %b_block = phi i32 [ %b_block0, %9 ], [ %b_block0.2, %matrixMul_CMP_5.exit.preheader ] ; [#uses=2 type=i32]
  %tmp.24 = icmp sgt i32 %a_block, %aEnd_block0, !dbg !335 ; [#uses=1 type=i1] [debug line = 147:6]
  br i1 %tmp.24, label %10, label %9, !dbg !335   ; [debug line = 147:6]

; <label>:9                                       ; preds = %matrixMul_CMP_5.exit
  call void @llvm.dbg.declare(metadata !{[16 x [16 x float]]* %As}, metadata !363), !dbg !365 ; [debug line = 149:10] [debug variable = As]
  call void @llvm.dbg.declare(metadata !{[16 x [16 x float]]* %Bs}, metadata !366), !dbg !367 ; [debug line = 150:10] [debug variable = Bs]
  call fastcc void @matrixMul_TRN_6(i32 %blockDim.x, i32 %blockDim.y, i32 %blockDim.z, [16 x [16 x float]]* %As, float* %A, i32 %a_block, i32 %wA, [16 x [16 x float]]* %Bs, float* %B, i32 %b_block, i32 %wB), !dbg !368 ; [debug line = 153:1]
  call fastcc void @matrixMul_SNC_7(i32 %blockDim.x, i32 %blockDim.y, i32 %blockDim.z, [16 x [16 x float]]* %Csub_block_block0, [16 x [16 x float]]* %As, [16 x [16 x float]]* %Bs), !dbg !369 ; [debug line = 157:1]
  %a_block0 = add nsw i32 %a_block, 16, !dbg !370 ; [#uses=1 type=i32] [debug line = 147:83]
  call void @llvm.dbg.value(metadata !{i32 %a_block0}, i64 0, metadata !334), !dbg !370 ; [debug line = 147:83] [debug variable = a_block0]
  %b_block0 = add nsw i32 %b_block, %bStep_block0, !dbg !370 ; [#uses=1 type=i32] [debug line = 147:83]
  call void @llvm.dbg.value(metadata !{i32 %b_block0}, i64 0, metadata !340), !dbg !370 ; [debug line = 147:83] [debug variable = b_block0]
  br label %matrixMul_CMP_5.exit, !dbg !370       ; [debug line = 147:83]

; <label>:10                                      ; preds = %matrixMul_CMP_5.exit
  %tmp = add i32 %tmp.22, %blockIdx_loop.x        ; [#uses=1 type=i32]
  %tmp3 = trunc i32 %tmp to i28, !dbg !319        ; [#uses=1 type=i28] [debug line = 160:1]
  %tmp4 = zext i28 %tmp3 to i32, !dbg !319        ; [#uses=1 type=i32] [debug line = 160:1]
  %c_block0 = shl nuw i32 %tmp4, 4, !dbg !319     ; [#uses=1 type=i32] [debug line = 160:1]
  call void @llvm.dbg.value(metadata !{i32 %c_block0}, i64 0, metadata !371), !dbg !319 ; [debug line = 160:1] [debug variable = c_block0]
  call fastcc void @matrixMul_TRN_10_wrapper(i32 %blockDim.x, i32 %blockDim.y, i32 %blockDim.z, float* %C, [16 x [16 x float]]* %Csub_block_block0, i32 %c_block0, i32 %wB), !dbg !372 ; [debug line = 163:1]
  %11 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @.str2, i32 %tmp.2), !dbg !373 ; [#uses=0 type=i32] [debug line = 166:1]
  %tmp.25 = add i32 %blockIdx_loop.x, 1, !dbg !320 ; [#uses=1 type=i32] [debug line = 125:61]
  br label %.preheader, !dbg !320                 ; [debug line = 125:61]

; <label>:12                                      ; preds = %.preheader
  %blockIdx_loop.y = add i32 %blockIdx_block0.y, 1, !dbg !374 ; [#uses=1 type=i32] [debug line = 122:61]
  call void @llvm.dbg.value(metadata !{i32 %blockIdx_loop.y}, i64 0, metadata !375), !dbg !374 ; [debug line = 122:61] [debug variable = blockIdx_loop.y]
  br label %1, !dbg !374                          ; [debug line = 122:61]

; <label>:13                                      ; preds = %1
  ret void, !dbg !376                             ; [debug line = 168:1]
}

; [#uses=53]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=3]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
declare void @_ssdm_op_SpecTopModule(...)

; [#uses=3]
declare i32 @_ssdm_op_SpecRegionEnd(...)

; [#uses=3]
declare i32 @_ssdm_op_SpecRegionBegin(...)

; [#uses=1]
declare i32 @_ssdm_op_SpecLoopTripCount(...)

; [#uses=1]
declare void @_ssdm_op_SpecLoopName(...) nounwind

; [#uses=7]
declare void @_ssdm_op_SpecInterface(...) nounwind

; [#uses=3]
declare i32 @_ssdm_op_SpecBurst(...)

; [#uses=11]
declare void @_ssdm_op_SpecBitsMap(...)

; [#uses=1]
declare void @_GLOBAL__I_a() nounwind section ".text.startup"

!llvm.dbg.cu = !{!0}
!opencl.kernels = !{!81, !88, !94, !100, !106, !108, !112, !112, !118, !118}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!124}

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
!61 = metadata !{i32 786478, i32 0, metadata !6, metadata !"matrixMul", metadata !"matrixMul", metadata !"_Z9matrixMulPfS_S_ii4dim3S0_", metadata !6, i32 102, metadata !62, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !21, i32 103} ; [ DW_TAG_subprogram ]
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
!108 = metadata !{null, metadata !109, metadata !102, metadata !110, metadata !104, metadata !111, metadata !87}
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
!124 = metadata !{metadata !125, [1 x i32]* @llvm.global_ctors.0}
!125 = metadata !{metadata !126}
!126 = metadata !{i32 0, i32 31, metadata !127}
!127 = metadata !{metadata !128}
!128 = metadata !{metadata !"llvm.global_ctors.0", metadata !129, metadata !"", i32 0, i32 31}
!129 = metadata !{metadata !130}
!130 = metadata !{i32 0, i32 0, i32 1}
!131 = metadata !{i32 786689, metadata !54, metadata !"As", null, i32 46, metadata !132, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!132 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8192, i64 32, i32 0, i32 0, metadata !46, metadata !133, i32 0, i32 0} ; [ DW_TAG_array_type ]
!133 = metadata !{metadata !49, metadata !49}
!134 = metadata !{i32 46, i32 102, metadata !54, null}
!135 = metadata !{i32 786689, metadata !54, metadata !"A", metadata !6, i32 100663342, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!136 = metadata !{i32 46, i32 125, metadata !54, null}
!137 = metadata !{i32 786689, metadata !54, metadata !"a", metadata !6, i32 117440558, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!138 = metadata !{i32 46, i32 132, metadata !54, null}
!139 = metadata !{i32 786689, metadata !54, metadata !"wA", metadata !6, i32 134217774, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!140 = metadata !{i32 46, i32 139, metadata !54, null}
!141 = metadata !{i32 786689, metadata !54, metadata !"Bs", null, i32 46, metadata !132, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!142 = metadata !{i32 46, i32 152, metadata !54, null}
!143 = metadata !{i32 786689, metadata !54, metadata !"B", metadata !6, i32 167772206, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!144 = metadata !{i32 46, i32 175, metadata !54, null}
!145 = metadata !{i32 786689, metadata !54, metadata !"b", metadata !6, i32 184549422, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!146 = metadata !{i32 46, i32 182, metadata !54, null}
!147 = metadata !{i32 786689, metadata !54, metadata !"wB", metadata !6, i32 201326638, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!148 = metadata !{i32 46, i32 189, metadata !54, null}
!149 = metadata !{i32 52, i32 6, metadata !150, null}
!150 = metadata !{i32 786443, metadata !151, i32 52, i32 1, metadata !6, i32 14} ; [ DW_TAG_lexical_block ]
!151 = metadata !{i32 786443, metadata !152, i32 50, i32 1, metadata !6, i32 13} ; [ DW_TAG_lexical_block ]
!152 = metadata !{i32 786443, metadata !54, i32 47, i32 1, metadata !6, i32 12} ; [ DW_TAG_lexical_block ]
!153 = metadata !{i32 53, i32 45, metadata !154, null}
!154 = metadata !{i32 786443, metadata !150, i32 53, i32 1, metadata !6, i32 15} ; [ DW_TAG_lexical_block ]
!155 = metadata !{i32 790529, metadata !156, metadata !"threadIdx.y", null, i32 48, metadata !157, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!156 = metadata !{i32 786688, metadata !152, metadata !"threadIdx", metadata !6, i32 48, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!157 = metadata !{i32 786438, null, metadata !"dim3", metadata !11, i32 429, i64 32, i64 32, i32 0, i32 0, null, metadata !158, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!158 = metadata !{metadata !15}
!159 = metadata !{i32 53, i32 6, metadata !154, null}
!160 = metadata !{i32 57, i32 1, metadata !161, null}
!161 = metadata !{i32 786443, metadata !162, i32 55, i32 1, metadata !6, i32 17} ; [ DW_TAG_lexical_block ]
!162 = metadata !{i32 786443, metadata !154, i32 54, i32 1, metadata !6, i32 16} ; [ DW_TAG_lexical_block ]
!163 = metadata !{i32 58, i32 1, metadata !161, null}
!164 = metadata !{i32 54, i32 6, metadata !162, null}
!165 = metadata !{i32 54, i32 45, metadata !162, null}
!166 = metadata !{i32 790529, metadata !156, metadata !"threadIdx.x", null, i32 48, metadata !167, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!167 = metadata !{i32 786438, null, metadata !"dim3", metadata !11, i32 429, i64 32, i64 32, i32 0, i32 0, null, metadata !168, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!168 = metadata !{metadata !13}
!169 = metadata !{i32 52, i32 45, metadata !150, null}
!170 = metadata !{i32 790529, metadata !156, metadata !"threadIdx.z", null, i32 48, metadata !171, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!171 = metadata !{i32 786438, null, metadata !"dim3", metadata !11, i32 429, i64 32, i64 32, i32 0, i32 0, null, metadata !172, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!172 = metadata !{metadata !16}
!173 = metadata !{i32 63, i32 1, metadata !152, null}
!174 = metadata !{i32 786689, metadata !60, metadata !"C", metadata !6, i32 83886175, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!175 = metadata !{i32 95, i32 145, metadata !60, null}
!176 = metadata !{i32 786689, metadata !60, metadata !"Csub_block_block0", null, i32 95, metadata !132, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!177 = metadata !{i32 95, i32 157, metadata !60, null}
!178 = metadata !{i32 786689, metadata !60, metadata !"c_block0", metadata !6, i32 117440607, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!179 = metadata !{i32 95, i32 204, metadata !60, null}
!180 = metadata !{i32 786689, metadata !60, metadata !"wB", metadata !6, i32 134217823, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!181 = metadata !{i32 95, i32 218, metadata !60, null}
!182 = metadata !{i32 97, i32 1, metadata !183, null}
!183 = metadata !{i32 786443, metadata !60, i32 96, i32 1, metadata !6, i32 27} ; [ DW_TAG_lexical_block ]
!184 = metadata !{i32 98, i32 1, metadata !183, null}
!185 = metadata !{i32 786689, metadata !50, metadata !"C", metadata !6, i32 83886106, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!186 = metadata !{i32 26, i32 106, metadata !50, null}
!187 = metadata !{i32 786689, metadata !50, metadata !"Csub_block", null, i32 26, metadata !132, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!188 = metadata !{i32 26, i32 118, metadata !50, null}
!189 = metadata !{i32 786689, metadata !50, metadata !"c", metadata !6, i32 117440538, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!190 = metadata !{i32 26, i32 158, metadata !50, null}
!191 = metadata !{i32 786689, metadata !50, metadata !"wB", metadata !6, i32 134217754, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!192 = metadata !{i32 26, i32 165, metadata !50, null}
!193 = metadata !{i32 32, i32 6, metadata !194, null}
!194 = metadata !{i32 786443, metadata !195, i32 32, i32 1, metadata !6, i32 8} ; [ DW_TAG_lexical_block ]
!195 = metadata !{i32 786443, metadata !196, i32 30, i32 1, metadata !6, i32 7} ; [ DW_TAG_lexical_block ]
!196 = metadata !{i32 786443, metadata !50, i32 27, i32 1, metadata !6, i32 6} ; [ DW_TAG_lexical_block ]
!197 = metadata !{i32 33, i32 45, metadata !198, null}
!198 = metadata !{i32 786443, metadata !194, i32 33, i32 1, metadata !6, i32 9} ; [ DW_TAG_lexical_block ]
!199 = metadata !{i32 790529, metadata !200, metadata !"threadIdx.y", null, i32 28, metadata !157, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!200 = metadata !{i32 786688, metadata !196, metadata !"threadIdx", metadata !6, i32 28, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!201 = metadata !{i32 33, i32 6, metadata !198, null}
!202 = metadata !{i32 37, i32 1, metadata !203, null}
!203 = metadata !{i32 786443, metadata !204, i32 35, i32 1, metadata !6, i32 11} ; [ DW_TAG_lexical_block ]
!204 = metadata !{i32 786443, metadata !198, i32 34, i32 1, metadata !6, i32 10} ; [ DW_TAG_lexical_block ]
!205 = metadata !{i32 34, i32 6, metadata !204, null}
!206 = metadata !{i32 34, i32 45, metadata !204, null}
!207 = metadata !{i32 790529, metadata !200, metadata !"threadIdx.x", null, i32 28, metadata !167, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!208 = metadata !{i32 32, i32 45, metadata !194, null}
!209 = metadata !{i32 790529, metadata !200, metadata !"threadIdx.z", null, i32 28, metadata !171, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!210 = metadata !{i32 42, i32 1, metadata !196, null}
!211 = metadata !{i32 786689, metadata !57, metadata !"Csub_block", null, i32 67, metadata !132, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!212 = metadata !{i32 67, i32 102, metadata !57, null}
!213 = metadata !{i32 786689, metadata !57, metadata !"As", null, i32 67, metadata !132, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!214 = metadata !{i32 67, i32 147, metadata !57, null}
!215 = metadata !{i32 786689, metadata !57, metadata !"Bs", null, i32 67, metadata !132, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!216 = metadata !{i32 67, i32 168, metadata !57, null}
!217 = metadata !{i32 77, i32 6, metadata !218, null}
!218 = metadata !{i32 786443, metadata !219, i32 77, i32 1, metadata !6, i32 21} ; [ DW_TAG_lexical_block ]
!219 = metadata !{i32 786443, metadata !220, i32 74, i32 1, metadata !6, i32 20} ; [ DW_TAG_lexical_block ]
!220 = metadata !{i32 786443, metadata !221, i32 71, i32 1, metadata !6, i32 19} ; [ DW_TAG_lexical_block ]
!221 = metadata !{i32 786443, metadata !57, i32 68, i32 1, metadata !6, i32 18} ; [ DW_TAG_lexical_block ]
!222 = metadata !{i32 78, i32 45, metadata !223, null}
!223 = metadata !{i32 786443, metadata !218, i32 78, i32 1, metadata !6, i32 22} ; [ DW_TAG_lexical_block ]
!224 = metadata !{i32 790529, metadata !225, metadata !"threadIdx.y", null, i32 69, metadata !157, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!225 = metadata !{i32 786688, metadata !221, metadata !"threadIdx", metadata !6, i32 69, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!226 = metadata !{i32 78, i32 6, metadata !223, null}
!227 = metadata !{i32 84, i32 1, metadata !228, null}
!228 = metadata !{i32 786443, metadata !229, i32 83, i32 1, metadata !6, i32 26} ; [ DW_TAG_lexical_block ]
!229 = metadata !{i32 786443, metadata !230, i32 82, i32 1, metadata !6, i32 25} ; [ DW_TAG_lexical_block ]
!230 = metadata !{i32 786443, metadata !231, i32 80, i32 1, metadata !6, i32 24} ; [ DW_TAG_lexical_block ]
!231 = metadata !{i32 786443, metadata !223, i32 79, i32 1, metadata !6, i32 23} ; [ DW_TAG_lexical_block ]
!232 = metadata !{i32 79, i32 45, metadata !231, null}
!233 = metadata !{i32 790529, metadata !225, metadata !"threadIdx.x", null, i32 69, metadata !167, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!234 = metadata !{i32 79, i32 6, metadata !231, null}
!235 = metadata !{i32 80, i32 2, metadata !230, null}
!236 = metadata !{i32 82, i32 6, metadata !229, null}
!237 = metadata !{i32 82, i32 17, metadata !229, null}
!238 = metadata !{i32 786688, metadata !220, metadata !"k", metadata !6, i32 72, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!239 = metadata !{i32 87, i32 1, metadata !230, null}
!240 = metadata !{i32 77, i32 45, metadata !218, null}
!241 = metadata !{i32 790529, metadata !225, metadata !"threadIdx.z", null, i32 69, metadata !171, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!242 = metadata !{i32 92, i32 1, metadata !221, null}
!243 = metadata !{metadata !244}
!244 = metadata !{i32 0, i32 31, metadata !245}
!245 = metadata !{metadata !246}
!246 = metadata !{metadata !"C", metadata !247, metadata !"float", i32 0, i32 31}
!247 = metadata !{metadata !248}
!248 = metadata !{i32 0, i32 10239, i32 1}
!249 = metadata !{metadata !250}
!250 = metadata !{i32 0, i32 31, metadata !251}
!251 = metadata !{metadata !252}
!252 = metadata !{metadata !"A", metadata !253, metadata !"float", i32 0, i32 31}
!253 = metadata !{metadata !254}
!254 = metadata !{i32 0, i32 3839, i32 1}
!255 = metadata !{metadata !256}
!256 = metadata !{i32 0, i32 31, metadata !257}
!257 = metadata !{metadata !258}
!258 = metadata !{metadata !"B", metadata !259, metadata !"float", i32 0, i32 31}
!259 = metadata !{metadata !260}
!260 = metadata !{i32 0, i32 6143, i32 1}
!261 = metadata !{metadata !262}
!262 = metadata !{i32 0, i32 31, metadata !263}
!263 = metadata !{metadata !264}
!264 = metadata !{metadata !"wA", metadata !265, metadata !"int", i32 0, i32 31}
!265 = metadata !{metadata !266}
!266 = metadata !{i32 0, i32 0, i32 0}
!267 = metadata !{metadata !268}
!268 = metadata !{i32 0, i32 31, metadata !269}
!269 = metadata !{metadata !270}
!270 = metadata !{metadata !"wB", metadata !265, metadata !"int", i32 0, i32 31}
!271 = metadata !{metadata !272}
!272 = metadata !{i32 0, i32 31, metadata !273}
!273 = metadata !{metadata !274}
!274 = metadata !{metadata !"gridDim.x", metadata !265, metadata !"unsigned int", i32 0, i32 31}
!275 = metadata !{metadata !276}
!276 = metadata !{i32 0, i32 31, metadata !277}
!277 = metadata !{metadata !278}
!278 = metadata !{metadata !"gridDim.y", metadata !265, metadata !"unsigned int", i32 0, i32 31}
!279 = metadata !{metadata !280}
!280 = metadata !{i32 0, i32 31, metadata !281}
!281 = metadata !{metadata !282}
!282 = metadata !{metadata !"gridDim.z", metadata !265, metadata !"unsigned int", i32 0, i32 31}
!283 = metadata !{metadata !284}
!284 = metadata !{i32 0, i32 31, metadata !285}
!285 = metadata !{metadata !286}
!286 = metadata !{metadata !"blockDim.x", metadata !265, metadata !"unsigned int", i32 0, i32 31}
!287 = metadata !{metadata !288}
!288 = metadata !{i32 0, i32 31, metadata !289}
!289 = metadata !{metadata !290}
!290 = metadata !{metadata !"blockDim.y", metadata !265, metadata !"unsigned int", i32 0, i32 31}
!291 = metadata !{metadata !292}
!292 = metadata !{i32 0, i32 31, metadata !293}
!293 = metadata !{metadata !294}
!294 = metadata !{metadata !"blockDim.z", metadata !265, metadata !"unsigned int", i32 0, i32 31}
!295 = metadata !{i32 786689, metadata !61, metadata !"C", metadata !6, i32 16777318, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!296 = metadata !{i32 102, i32 27, metadata !61, null}
!297 = metadata !{i32 786689, metadata !61, metadata !"A", metadata !6, i32 33554534, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!298 = metadata !{i32 102, i32 41, metadata !61, null}
!299 = metadata !{i32 786689, metadata !61, metadata !"B", metadata !6, i32 50331750, metadata !53, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!300 = metadata !{i32 102, i32 55, metadata !61, null}
!301 = metadata !{i32 786689, metadata !61, metadata !"wA", metadata !6, i32 67108966, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!302 = metadata !{i32 102, i32 62, metadata !61, null}
!303 = metadata !{i32 786689, metadata !61, metadata !"wB", metadata !6, i32 83886182, metadata !9, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!304 = metadata !{i32 102, i32 70, metadata !61, null}
!305 = metadata !{i32 786688, metadata !306, metadata !"Csub_block_block0", metadata !6, i32 111, metadata !132, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!306 = metadata !{i32 786443, metadata !61, i32 103, i32 1, metadata !6, i32 28} ; [ DW_TAG_lexical_block ]
!307 = metadata !{i32 111, i32 10, metadata !306, null}
!308 = metadata !{i32 141, i32 1, metadata !309, null}
!309 = metadata !{i32 786443, metadata !310, i32 126, i32 1, metadata !6, i32 32} ; [ DW_TAG_lexical_block ]
!310 = metadata !{i32 786443, metadata !311, i32 125, i32 1, metadata !6, i32 31} ; [ DW_TAG_lexical_block ]
!311 = metadata !{i32 786443, metadata !312, i32 123, i32 1, metadata !6, i32 30} ; [ DW_TAG_lexical_block ]
!312 = metadata !{i32 786443, metadata !306, i32 122, i32 1, metadata !6, i32 29} ; [ DW_TAG_lexical_block ]
!313 = metadata !{i32 122, i32 6, metadata !312, null}
!314 = metadata !{i32 790529, metadata !315, metadata !"blockIdx_block0.y", null, i32 116, metadata !157, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!315 = metadata !{i32 786688, metadata !306, metadata !"blockIdx_block0", metadata !6, i32 116, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!316 = metadata !{i32 124, i32 1, metadata !311, null}
!317 = metadata !{i32 137, i32 1, metadata !309, null}
!318 = metadata !{i32 138, i32 1, metadata !309, null}
!319 = metadata !{i32 160, i32 1, metadata !309, null}
!320 = metadata !{i32 125, i32 61, metadata !310, null}
!321 = metadata !{i32 790529, metadata !322, metadata !"blockIdx_loop.x", null, i32 121, metadata !167, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!322 = metadata !{i32 786688, metadata !306, metadata !"blockIdx_loop", metadata !6, i32 121, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!323 = metadata !{i32 125, i32 6, metadata !310, null}
!324 = metadata !{i32 126, i32 2, metadata !309, null}
!325 = metadata !{i32 790529, metadata !315, metadata !"blockIdx_block0.x", null, i32 116, metadata !167, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!326 = metadata !{i32 127, i32 1, metadata !309, null}
!327 = metadata !{i32 132, i32 1, metadata !309, null}
!328 = metadata !{i32 133, i32 1, metadata !309, null}
!329 = metadata !{i32 134, i32 1, metadata !309, null}
!330 = metadata !{i32 786688, metadata !306, metadata !"bx_block0", metadata !6, i32 104, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!331 = metadata !{i32 135, i32 1, metadata !309, null}
!332 = metadata !{i32 786688, metadata !306, metadata !"by_block0", metadata !6, i32 105, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!333 = metadata !{i32 136, i32 1, metadata !309, null}
!334 = metadata !{i32 786688, metadata !306, metadata !"a_block0", metadata !6, i32 112, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!335 = metadata !{i32 147, i32 6, metadata !336, null}
!336 = metadata !{i32 786443, metadata !309, i32 147, i32 1, metadata !6, i32 33} ; [ DW_TAG_lexical_block ]
!337 = metadata !{i32 786688, metadata !306, metadata !"aBegin_block0", metadata !6, i32 106, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!338 = metadata !{i32 786688, metadata !306, metadata !"aEnd_block0", metadata !6, i32 107, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!339 = metadata !{i32 140, i32 1, metadata !309, null}
!340 = metadata !{i32 786688, metadata !306, metadata !"b_block0", metadata !6, i32 113, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!341 = metadata !{i32 786688, metadata !306, metadata !"bBegin_block0", metadata !6, i32 109, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!342 = metadata !{i32 786688, metadata !306, metadata !"bStep_block0", metadata !6, i32 110, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!343 = metadata !{i32 786689, metadata !5, metadata !"Csub_block", null, i32 6, metadata !132, i32 0, metadata !344} ; [ DW_TAG_arg_variable ]
!344 = metadata !{i32 142, i32 1, metadata !309, null}
!345 = metadata !{i32 6, i32 102, metadata !5, metadata !344}
!346 = metadata !{i32 12, i32 6, metadata !347, metadata !344}
!347 = metadata !{i32 786443, metadata !348, i32 12, i32 1, metadata !6, i32 2} ; [ DW_TAG_lexical_block ]
!348 = metadata !{i32 786443, metadata !349, i32 10, i32 1, metadata !6, i32 1} ; [ DW_TAG_lexical_block ]
!349 = metadata !{i32 786443, metadata !5, i32 7, i32 1, metadata !6, i32 0} ; [ DW_TAG_lexical_block ]
!350 = metadata !{i32 13, i32 45, metadata !351, metadata !344}
!351 = metadata !{i32 786443, metadata !347, i32 13, i32 1, metadata !6, i32 3} ; [ DW_TAG_lexical_block ]
!352 = metadata !{i32 790529, metadata !353, metadata !"threadIdx.y", null, i32 8, metadata !157, i32 0, metadata !344} ; [ DW_TAG_auto_variable_field ]
!353 = metadata !{i32 786688, metadata !349, metadata !"threadIdx", metadata !6, i32 8, metadata !10, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!354 = metadata !{i32 13, i32 6, metadata !351, metadata !344}
!355 = metadata !{i32 17, i32 1, metadata !356, metadata !344}
!356 = metadata !{i32 786443, metadata !357, i32 15, i32 1, metadata !6, i32 5} ; [ DW_TAG_lexical_block ]
!357 = metadata !{i32 786443, metadata !351, i32 14, i32 1, metadata !6, i32 4} ; [ DW_TAG_lexical_block ]
!358 = metadata !{i32 14, i32 6, metadata !357, metadata !344}
!359 = metadata !{i32 14, i32 45, metadata !357, metadata !344}
!360 = metadata !{i32 790529, metadata !353, metadata !"threadIdx.x", null, i32 8, metadata !167, i32 0, metadata !344} ; [ DW_TAG_auto_variable_field ]
!361 = metadata !{i32 12, i32 45, metadata !347, metadata !344}
!362 = metadata !{i32 790529, metadata !353, metadata !"threadIdx.z", null, i32 8, metadata !171, i32 0, metadata !344} ; [ DW_TAG_auto_variable_field ]
!363 = metadata !{i32 786688, metadata !364, metadata !"As", metadata !6, i32 149, metadata !132, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!364 = metadata !{i32 786443, metadata !336, i32 148, i32 1, metadata !6, i32 34} ; [ DW_TAG_lexical_block ]
!365 = metadata !{i32 149, i32 10, metadata !364, null}
!366 = metadata !{i32 786688, metadata !364, metadata !"Bs", metadata !6, i32 150, metadata !132, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!367 = metadata !{i32 150, i32 10, metadata !364, null}
!368 = metadata !{i32 153, i32 1, metadata !364, null}
!369 = metadata !{i32 157, i32 1, metadata !364, null}
!370 = metadata !{i32 147, i32 83, metadata !336, null}
!371 = metadata !{i32 786688, metadata !306, metadata !"c_block0", metadata !6, i32 115, metadata !9, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!372 = metadata !{i32 163, i32 1, metadata !309, null}
!373 = metadata !{i32 166, i32 1, metadata !309, null}
!374 = metadata !{i32 122, i32 61, metadata !312, null}
!375 = metadata !{i32 790529, metadata !322, metadata !"blockIdx_loop.y", null, i32 121, metadata !157, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!376 = metadata !{i32 168, i32 1, metadata !306, null}
