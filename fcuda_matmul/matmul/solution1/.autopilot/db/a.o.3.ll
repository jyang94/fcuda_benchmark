; ModuleID = '/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matmul/solution1/.autopilot/db/a.o.3.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@matrixMul_str = internal unnamed_addr constant [10 x i8] c"matrixMul\00" ; [#uses=1 type=[10 x i8]*]
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a] ; [#uses=0 type=[1 x void ()*]*]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535] ; [#uses=0 type=[1 x i32]*]
@p_str4 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1 ; [#uses=28 type=[1 x i8]*]
@p_str3 = private unnamed_addr constant [7 x i8] c"ap_bus\00", align 1 ; [#uses=7 type=[7 x i8]*]
@p_str2 = private unnamed_addr constant [12 x i8] c"hls_label_1\00", align 1 ; [#uses=2 type=[12 x i8]*]
@p_str1 = private unnamed_addr constant [4 x i8] c"lp1\00", align 1 ; [#uses=3 type=[4 x i8]*]
@p_str = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1 ; [#uses=2 type=[12 x i8]*]

; [#uses=1]
define internal fastcc void @matrixMul_matrixMul_TRN_6(i32 %blockDim_x, i32 %blockDim_y, i32 %blockDim_z, [256 x float]* nocapture %As, float* %A, i32 %a, i32 %wA, [256 x float]* nocapture %Bs, float* %B, i32 %b, i32 %wB) {
  call void (...)* @_ssdm_op_SpecInterface(float* %B, [7 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 6144, [1 x i8]* @p_str4, [1 x i8]* @p_str4, [1 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str4) nounwind
  call void (...)* @_ssdm_op_SpecInterface(float* %A, [7 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 3840, [1 x i8]* @p_str4, [1 x i8]* @p_str4, [1 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str4) nounwind
  %wB_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %wB) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %wB_read}, i64 0, metadata !50), !dbg !97 ; [debug line = 46:189] [debug variable = wB]
  %b_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %b) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %b_read}, i64 0, metadata !98), !dbg !99 ; [debug line = 46:182] [debug variable = b]
  %wA_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %wA) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %wA_read}, i64 0, metadata !100), !dbg !101 ; [debug line = 46:139] [debug variable = wA]
  %a_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %a) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %a_read}, i64 0, metadata !102), !dbg !103 ; [debug line = 46:132] [debug variable = a]
  %blockDim_z_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_z) ; [#uses=1 type=i32]
  %blockDim_y_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_y) ; [#uses=1 type=i32]
  %blockDim_x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_x) ; [#uses=3 type=i32]
  call void @llvm.dbg.value(metadata !{[256 x float]* %As}, i64 0, metadata !104), !dbg !107 ; [debug line = 46:102] [debug variable = As]
  call void @llvm.dbg.value(metadata !{float* %A}, i64 0, metadata !108), !dbg !109 ; [debug line = 46:125] [debug variable = A]
  call void @llvm.dbg.value(metadata !{i32 %a}, i64 0, metadata !102), !dbg !103 ; [debug line = 46:132] [debug variable = a]
  call void @llvm.dbg.value(metadata !{i32 %wA}, i64 0, metadata !100), !dbg !101 ; [debug line = 46:139] [debug variable = wA]
  call void @llvm.dbg.value(metadata !{[256 x float]* %Bs}, i64 0, metadata !110), !dbg !111 ; [debug line = 46:152] [debug variable = Bs]
  call void @llvm.dbg.value(metadata !{float* %B}, i64 0, metadata !112), !dbg !113 ; [debug line = 46:175] [debug variable = B]
  call void @llvm.dbg.value(metadata !{i32 %b}, i64 0, metadata !98), !dbg !99 ; [debug line = 46:182] [debug variable = b]
  call void @llvm.dbg.value(metadata !{i32 %wB}, i64 0, metadata !50), !dbg !97 ; [debug line = 46:189] [debug variable = wB]
  br label %.loopexit30, !dbg !114                ; [debug line = 52:6]

.loopexit30:                                      ; preds = %.preheader, %0
  %threadIdx_2 = phi i32 [ 0, %0 ], [ %threadIdx_z, %.preheader ] ; [#uses=2 type=i32]
  %exitcond2 = icmp eq i32 %threadIdx_2, %blockDim_z_read, !dbg !114 ; [#uses=1 type=i1] [debug line = 52:6]
  %threadIdx_z = add i32 %threadIdx_2, 1, !dbg !118 ; [#uses=1 type=i32] [debug line = 52:45]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx_z}, i64 0, metadata !119), !dbg !118 ; [debug line = 52:45] [debug variable = threadIdx.z]
  br i1 %exitcond2, label %.loopexit, label %.preheader, !dbg !114 ; [debug line = 52:6]

.preheader:                                       ; preds = %2, %.loopexit30
  %threadIdx_y = phi i32 [ 0, %.loopexit30 ], [ %tmp_1, %2 ] ; [#uses=3 type=i32]
  %phi_mul = phi i32 [ 0, %.loopexit30 ], [ %next_mul, %2 ] ; [#uses=2 type=i32]
  %phi_mul1 = phi i32 [ 0, %.loopexit30 ], [ %next_mul1, %2 ] ; [#uses=2 type=i32]
  %next_mul1 = add i32 %phi_mul1, %wB_read        ; [#uses=1 type=i32]
  %next_mul = add i32 %phi_mul, %wA_read          ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx_y}, i64 0, metadata !123), !dbg !126 ; [debug line = 53:45] [debug variable = threadIdx.y]
  %exitcond1 = icmp eq i32 %threadIdx_y, %blockDim_y_read, !dbg !128 ; [#uses=1 type=i1] [debug line = 53:6]
  %tmp_1 = add i32 %threadIdx_y, 1, !dbg !126     ; [#uses=1 type=i32] [debug line = 53:45]
  br i1 %exitcond1, label %.loopexit30, label %1, !dbg !128 ; [debug line = 53:6]

; <label>:1                                       ; preds = %.preheader
  %tmp = trunc i32 %threadIdx_y to i6             ; [#uses=1 type=i6]
  %tmp_5_cast = call i10 @_ssdm_op_BitConcatenate.i10.i6.i4(i6 %tmp, i4 0), !dbg !129 ; [#uses=1 type=i10] [debug line = 57:1]
  %tmp_7 = add i32 %phi_mul, %a_read, !dbg !129   ; [#uses=1 type=i32] [debug line = 57:1]
  %tmp_s = zext i32 %tmp_7 to i64, !dbg !129      ; [#uses=1 type=i64] [debug line = 57:1]
  %tmp_2 = add i32 %phi_mul1, %b_read, !dbg !132  ; [#uses=1 type=i32] [debug line = 58:1]
  %tmp_3 = zext i32 %tmp_2 to i64, !dbg !132      ; [#uses=1 type=i64] [debug line = 58:1]
  %A_addr = getelementptr inbounds float* %A, i64 %tmp_s, !dbg !129 ; [#uses=2 type=float*] [debug line = 57:1]
  %B_addr = getelementptr inbounds float* %B, i64 %tmp_3, !dbg !132 ; [#uses=2 type=float*] [debug line = 58:1]
  %A_addr_1_rd_req = call i1 @_ssdm_op_ReadReq.ap_bus.floatP(float* %A_addr, i32 %blockDim_x_read), !dbg !129 ; [#uses=0 type=i1] [debug line = 57:1]
  %B_addr_1_rd_req = call i1 @_ssdm_op_ReadReq.ap_bus.floatP(float* %B_addr, i32 %blockDim_x_read), !dbg !132 ; [#uses=0 type=i1] [debug line = 58:1]
  br label %2, !dbg !133                          ; [debug line = 54:6]

; <label>:2                                       ; preds = %3, %1
  %threadIdx = phi i32 [ 0, %1 ], [ %threadIdx_x, %3 ] ; [#uses=3 type=i32]
  %exitcond = icmp eq i32 %threadIdx, %blockDim_x_read, !dbg !133 ; [#uses=1 type=i1] [debug line = 54:6]
  %threadIdx_x = add i32 %threadIdx, 1, !dbg !134 ; [#uses=1 type=i32] [debug line = 54:45]
  br i1 %exitcond, label %.preheader, label %3, !dbg !133 ; [debug line = 54:6]

; <label>:3                                       ; preds = %2
  %A_addr_read = call float @_ssdm_op_Read.ap_bus.floatP(float* %A_addr), !dbg !129 ; [#uses=1 type=float] [debug line = 57:1]
  %tmp_4 = trunc i32 %threadIdx to i10, !dbg !129 ; [#uses=1 type=i10] [debug line = 57:1]
  %tmp_5 = add i10 %tmp_5_cast, %tmp_4, !dbg !129 ; [#uses=1 type=i10] [debug line = 57:1]
  %tmp_14_cast = zext i10 %tmp_5 to i64, !dbg !129 ; [#uses=2 type=i64] [debug line = 57:1]
  %As_addr = getelementptr [256 x float]* %As, i64 0, i64 %tmp_14_cast, !dbg !129 ; [#uses=1 type=float*] [debug line = 57:1]
  %Bs_addr = getelementptr [256 x float]* %Bs, i64 0, i64 %tmp_14_cast, !dbg !132 ; [#uses=1 type=float*] [debug line = 58:1]
  store float %A_addr_read, float* %As_addr, align 4, !dbg !129 ; [debug line = 57:1]
  %B_addr_read = call float @_ssdm_op_Read.ap_bus.floatP(float* %B_addr), !dbg !132 ; [#uses=1 type=float] [debug line = 58:1]
  store float %B_addr_read, float* %Bs_addr, align 4, !dbg !132 ; [debug line = 58:1]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx_x}, i64 0, metadata !135), !dbg !134 ; [debug line = 54:45] [debug variable = threadIdx.x]
  br label %2, !dbg !134                          ; [debug line = 54:45]

.loopexit:                                        ; preds = %.loopexit30
  ret void, !dbg !138                             ; [debug line = 63:1]
}

; [#uses=1]
define internal fastcc void @matrixMul_matrixMul_TRN_10_wrapper(i32 %blockDim_x, i32 %blockDim_y, i32 %blockDim_z, float* %C, [256 x float]* nocapture %Csub_block_block0, i32 %c_block0, i32 %wB) {
  call void (...)* @_ssdm_op_SpecInterface(float* %C, [7 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 10240, [1 x i8]* @p_str4, [1 x i8]* @p_str4, [1 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str4) nounwind
  %wB_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %wB) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %wB_read}, i64 0, metadata !139), !dbg !143 ; [debug line = 95:218] [debug variable = wB]
  %c_block0_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %c_block0) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %c_block0_read}, i64 0, metadata !144), !dbg !145 ; [debug line = 95:204] [debug variable = c_block0]
  %blockDim_z_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_z) ; [#uses=1 type=i32]
  %blockDim_y_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_y) ; [#uses=1 type=i32]
  %blockDim_x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_x) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{float* %C}, i64 0, metadata !146), !dbg !147 ; [debug line = 95:145] [debug variable = C]
  call void @llvm.dbg.value(metadata !{[256 x float]* %Csub_block_block0}, i64 0, metadata !148), !dbg !149 ; [debug line = 95:157] [debug variable = Csub_block_block0]
  call void @llvm.dbg.value(metadata !{i32 %c_block0}, i64 0, metadata !144), !dbg !145 ; [debug line = 95:204] [debug variable = c_block0]
  call void @llvm.dbg.value(metadata !{i32 %wB}, i64 0, metadata !139), !dbg !143 ; [debug line = 95:218] [debug variable = wB]
  call fastcc void @matrixMul_matrixMul_TRN_10(i32 %blockDim_x_read, i32 %blockDim_y_read, i32 %blockDim_z_read, float* %C, [256 x float]* %Csub_block_block0, i32 %c_block0_read, i32 %wB_read), !dbg !150 ; [debug line = 97:1]
  ret void, !dbg !152                             ; [debug line = 98:1]
}

; [#uses=1]
define internal fastcc void @matrixMul_matrixMul_TRN_10(i32 %blockDim_x, i32 %blockDim_y, i32 %blockDim_z, float* %C, [256 x float]* nocapture %Csub_block, i32 %c, i32 %wB) {
  call void (...)* @_ssdm_op_SpecInterface(float* %C, [7 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 10240, [1 x i8]* @p_str4, [1 x i8]* @p_str4, [1 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str4) nounwind
  %wB_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %wB) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %wB_read}, i64 0, metadata !153), !dbg !155 ; [debug line = 26:165] [debug variable = wB]
  %c_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %c) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %c_read}, i64 0, metadata !156), !dbg !157 ; [debug line = 26:158] [debug variable = c]
  %blockDim_z_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_z) ; [#uses=1 type=i32]
  %blockDim_y_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_y) ; [#uses=1 type=i32]
  %blockDim_x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_x) ; [#uses=2 type=i32]
  call void @llvm.dbg.value(metadata !{float* %C}, i64 0, metadata !158), !dbg !159 ; [debug line = 26:106] [debug variable = C]
  call void @llvm.dbg.value(metadata !{[256 x float]* %Csub_block}, i64 0, metadata !160), !dbg !161 ; [debug line = 26:118] [debug variable = Csub_block]
  call void @llvm.dbg.value(metadata !{i32 %c}, i64 0, metadata !156), !dbg !157 ; [debug line = 26:158] [debug variable = c]
  call void @llvm.dbg.value(metadata !{i32 %wB}, i64 0, metadata !153), !dbg !155 ; [debug line = 26:165] [debug variable = wB]
  br label %.loopexit14, !dbg !162                ; [debug line = 32:6]

.loopexit14:                                      ; preds = %.preheader, %0
  %threadIdx_2 = phi i32 [ 0, %0 ], [ %threadIdx_z, %.preheader ] ; [#uses=2 type=i32]
  %exitcond2 = icmp eq i32 %threadIdx_2, %blockDim_z_read, !dbg !162 ; [#uses=1 type=i1] [debug line = 32:6]
  %threadIdx_z = add i32 %threadIdx_2, 1, !dbg !166 ; [#uses=1 type=i32] [debug line = 32:45]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx_z}, i64 0, metadata !167), !dbg !166 ; [debug line = 32:45] [debug variable = threadIdx.z]
  br i1 %exitcond2, label %.loopexit, label %.preheader, !dbg !162 ; [debug line = 32:6]

.preheader:                                       ; preds = %2, %.loopexit14
  %threadIdx_y = phi i32 [ 0, %.loopexit14 ], [ %tmp_6, %2 ] ; [#uses=3 type=i32]
  %phi_mul = phi i32 [ 0, %.loopexit14 ], [ %next_mul, %2 ] ; [#uses=2 type=i32]
  %next_mul = add i32 %phi_mul, %wB_read          ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx_y}, i64 0, metadata !169), !dbg !170 ; [debug line = 33:45] [debug variable = threadIdx.y]
  %exitcond1 = icmp eq i32 %threadIdx_y, %blockDim_y_read, !dbg !172 ; [#uses=1 type=i1] [debug line = 33:6]
  %tmp_6 = add i32 %threadIdx_y, 1, !dbg !170     ; [#uses=1 type=i32] [debug line = 33:45]
  br i1 %exitcond1, label %.loopexit14, label %1, !dbg !172 ; [debug line = 33:6]

; <label>:1                                       ; preds = %.preheader
  %tmp = trunc i32 %threadIdx_y to i6             ; [#uses=1 type=i6]
  %tmp_17_cast = call i10 @_ssdm_op_BitConcatenate.i10.i6.i4(i6 %tmp, i4 0), !dbg !173 ; [#uses=1 type=i10] [debug line = 37:1]
  %tmp_s = add i32 %phi_mul, %c_read, !dbg !173   ; [#uses=1 type=i32] [debug line = 37:1]
  %tmp_7 = zext i32 %tmp_s to i64, !dbg !173      ; [#uses=1 type=i64] [debug line = 37:1]
  %C_addr = getelementptr inbounds float* %C, i64 %tmp_7, !dbg !173 ; [#uses=2 type=float*] [debug line = 37:1]
  br label %2, !dbg !176                          ; [debug line = 34:6]

; <label>:2                                       ; preds = %burstWrDataBB, %1
  %threadIdx = phi i32 [ 0, %1 ], [ %threadIdx_x, %burstWrDataBB ] ; [#uses=4 type=i32]
  %exitcond = icmp eq i32 %threadIdx, %blockDim_x_read, !dbg !176 ; [#uses=1 type=i1] [debug line = 34:6]
  %threadIdx_x = add i32 %threadIdx, 1, !dbg !177 ; [#uses=1 type=i32] [debug line = 34:45]
  br i1 %exitcond, label %.preheader, label %3, !dbg !176 ; [debug line = 34:6]

; <label>:3                                       ; preds = %2
  %tmp_5 = trunc i32 %threadIdx to i10, !dbg !173 ; [#uses=1 type=i10] [debug line = 37:1]
  %tmp_8 = add i10 %tmp_17_cast, %tmp_5, !dbg !173 ; [#uses=1 type=i10] [debug line = 37:1]
  %tmp_19_cast = zext i10 %tmp_8 to i64, !dbg !173 ; [#uses=1 type=i64] [debug line = 37:1]
  %Csub_block_addr = getelementptr [256 x float]* %Csub_block, i64 0, i64 %tmp_19_cast, !dbg !173 ; [#uses=1 type=float*] [debug line = 37:1]
  %Csub_block_load = load float* %Csub_block_addr, align 4, !dbg !173 ; [#uses=1 type=float] [debug line = 37:1]
  %is_0iter = icmp eq i32 %threadIdx, 0, !dbg !173 ; [#uses=1 type=i1] [debug line = 37:1]
  br i1 %is_0iter, label %burstWrReqBB, label %burstWrDataBB

burstWrReqBB:                                     ; preds = %3
  %C_addr_1_wr_req = call i1 @_ssdm_op_WriteReq.ap_bus.floatP(float* %C_addr, i32 %blockDim_x_read), !dbg !173 ; [#uses=0 type=i1] [debug line = 37:1]
  br label %burstWrDataBB

burstWrDataBB:                                    ; preds = %burstWrReqBB, %3
  call void @_ssdm_op_Write.ap_bus.floatP(float* %C_addr, float %Csub_block_load), !dbg !173 ; [debug line = 37:1]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx_x}, i64 0, metadata !178), !dbg !177 ; [debug line = 34:45] [debug variable = threadIdx.x]
  br label %2, !dbg !177                          ; [debug line = 34:45]

.loopexit:                                        ; preds = %.loopexit14
  ret void, !dbg !179                             ; [debug line = 42:1]
}

; [#uses=1]
define internal fastcc void @matrixMul_matrixMul_SNC_7(i32 %blockDim_x, i32 %blockDim_y, i32 %blockDim_z, [256 x float]* nocapture %Csub_block, [256 x float]* nocapture %As, [256 x float]* nocapture %Bs) {
  %blockDim_z_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_z) ; [#uses=1 type=i32]
  %blockDim_y_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_y) ; [#uses=1 type=i32]
  %blockDim_x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_x) ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{[256 x float]* %Csub_block}, i64 0, metadata !180), !dbg !184 ; [debug line = 67:102] [debug variable = Csub_block]
  call void @llvm.dbg.value(metadata !{[256 x float]* %As}, i64 0, metadata !185), !dbg !186 ; [debug line = 67:147] [debug variable = As]
  call void @llvm.dbg.value(metadata !{[256 x float]* %Bs}, i64 0, metadata !187), !dbg !188 ; [debug line = 67:168] [debug variable = Bs]
  br label %.loopexit18, !dbg !189                ; [debug line = 77:6]

.loopexit18:                                      ; preds = %.preheader2, %0
  %threadIdx_2 = phi i32 [ 0, %0 ], [ %threadIdx_z, %.preheader2 ] ; [#uses=2 type=i32]
  %exitcond3 = icmp eq i32 %threadIdx_2, %blockDim_z_read, !dbg !189 ; [#uses=1 type=i1] [debug line = 77:6]
  %threadIdx_z = add i32 %threadIdx_2, 1, !dbg !194 ; [#uses=1 type=i32] [debug line = 77:45]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx_z}, i64 0, metadata !195), !dbg !194 ; [debug line = 77:45] [debug variable = threadIdx.z]
  br i1 %exitcond3, label %.loopexit, label %.preheader2, !dbg !189 ; [debug line = 77:6]

.preheader2:                                      ; preds = %.preheader, %.loopexit18
  %threadIdx_y = phi i32 [ 0, %.loopexit18 ], [ %tmp_s, %.preheader ] ; [#uses=3 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx_y}, i64 0, metadata !197), !dbg !198 ; [debug line = 78:45] [debug variable = threadIdx.y]
  %exitcond2 = icmp eq i32 %threadIdx_y, %blockDim_y_read, !dbg !200 ; [#uses=1 type=i1] [debug line = 78:6]
  %tmp_s = add i32 %threadIdx_y, 1, !dbg !198     ; [#uses=1 type=i32] [debug line = 78:45]
  br i1 %exitcond2, label %.loopexit18, label %.preheader.preheader, !dbg !200 ; [debug line = 78:6]

.preheader.preheader:                             ; preds = %.preheader2
  %tmp_6 = trunc i32 %threadIdx_y to i6           ; [#uses=1 type=i6]
  %tmp_23_cast = call i10 @_ssdm_op_BitConcatenate.i10.i6.i4(i6 %tmp_6, i4 0), !dbg !201 ; [#uses=2 type=i10] [debug line = 79:45]
  br label %.preheader, !dbg !201                 ; [debug line = 79:45]

.preheader:                                       ; preds = %4, %.preheader.preheader
  %threadIdx_x = phi i32 [ %tmp_9, %4 ], [ 0, %.preheader.preheader ] ; [#uses=3 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx_x}, i64 0, metadata !203), !dbg !201 ; [debug line = 79:45] [debug variable = threadIdx.x]
  %exitcond1 = icmp eq i32 %threadIdx_x, %blockDim_x_read, !dbg !204 ; [#uses=1 type=i1] [debug line = 79:6]
  %tmp_9 = add i32 %threadIdx_x, 1, !dbg !201     ; [#uses=1 type=i32] [debug line = 79:45]
  br i1 %exitcond1, label %.preheader2, label %1, !dbg !204 ; [debug line = 79:6]

; <label>:1                                       ; preds = %.preheader
  %tmp = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str), !dbg !205 ; [#uses=1 type=i32] [debug line = 80:2]
  call void (...)* @_ssdm_op_SpecLoopName([4 x i8]* @p_str1) nounwind, !dbg !205 ; [debug line = 80:2]
  %tmp_1 = call i32 (...)* @_ssdm_op_SpecRegionBegin([4 x i8]* @p_str1), !dbg !205 ; [#uses=1 type=i32] [debug line = 80:2]
  %tmp_7 = trunc i32 %threadIdx_x to i10, !dbg !207 ; [#uses=2 type=i10] [debug line = 84:1]
  %tmp_10 = add i10 %tmp_23_cast, %tmp_7, !dbg !207 ; [#uses=1 type=i10] [debug line = 84:1]
  %tmp_24_cast = zext i10 %tmp_10 to i64, !dbg !207 ; [#uses=1 type=i64] [debug line = 84:1]
  %Csub_block_addr = getelementptr [256 x float]* %Csub_block, i64 0, i64 %tmp_24_cast, !dbg !207 ; [#uses=2 type=float*] [debug line = 84:1]
  br label %2, !dbg !210                          ; [debug line = 82:6]

; <label>:2                                       ; preds = %3, %1
  %k = phi i5 [ 0, %1 ], [ %k_1, %3 ]             ; [#uses=4 type=i5]
  %exitcond = icmp eq i5 %k, -16, !dbg !210       ; [#uses=1 type=i1] [debug line = 82:6]
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 16, i64 16, i64 16) ; [#uses=0 type=i32]
  %k_1 = add i5 %k, 1, !dbg !211                  ; [#uses=1 type=i5] [debug line = 82:17]
  br i1 %exitcond, label %4, label %3, !dbg !210  ; [debug line = 82:6]

; <label>:3                                       ; preds = %2
  %tmp_19_cast = zext i5 %k to i10, !dbg !207     ; [#uses=1 type=i10] [debug line = 84:1]
  %tmp_11 = add i10 %tmp_19_cast, %tmp_23_cast, !dbg !207 ; [#uses=1 type=i10] [debug line = 84:1]
  %tmp_25_cast = zext i10 %tmp_11 to i64, !dbg !207 ; [#uses=1 type=i64] [debug line = 84:1]
  %As_addr = getelementptr [256 x float]* %As, i64 0, i64 %tmp_25_cast, !dbg !207 ; [#uses=1 type=float*] [debug line = 84:1]
  %tmp_12 = call i9 @_ssdm_op_BitConcatenate.i9.i5.i4(i5 %k, i4 0) ; [#uses=1 type=i9]
  %tmp_27_cast = zext i9 %tmp_12 to i10, !dbg !207 ; [#uses=1 type=i10] [debug line = 84:1]
  %tmp_13 = add i10 %tmp_7, %tmp_27_cast, !dbg !207 ; [#uses=1 type=i10] [debug line = 84:1]
  %tmp_28_cast = zext i10 %tmp_13 to i64, !dbg !207 ; [#uses=1 type=i64] [debug line = 84:1]
  %Bs_addr = getelementptr [256 x float]* %Bs, i64 0, i64 %tmp_28_cast, !dbg !207 ; [#uses=1 type=float*] [debug line = 84:1]
  %As_load = load float* %As_addr, align 4, !dbg !207 ; [#uses=1 type=float] [debug line = 84:1]
  %Bs_load = load float* %Bs_addr, align 4, !dbg !207 ; [#uses=1 type=float] [debug line = 84:1]
  %tmp_14 = fmul float %As_load, %Bs_load, !dbg !207 ; [#uses=1 type=float] [debug line = 84:1]
  %Csub_block_load = load float* %Csub_block_addr, align 4, !dbg !207 ; [#uses=1 type=float] [debug line = 84:1]
  %tmp_15 = fadd float %Csub_block_load, %tmp_14, !dbg !207 ; [#uses=1 type=float] [debug line = 84:1]
  store float %tmp_15, float* %Csub_block_addr, align 4, !dbg !207 ; [debug line = 84:1]
  call void @llvm.dbg.value(metadata !{i5 %k_1}, i64 0, metadata !212), !dbg !211 ; [debug line = 82:17] [debug variable = k]
  br label %2, !dbg !211                          ; [debug line = 82:17]

; <label>:4                                       ; preds = %2
  %empty_3 = call i32 (...)* @_ssdm_op_SpecRegionEnd([4 x i8]* @p_str1, i32 %tmp_1), !dbg !213 ; [#uses=0 type=i32] [debug line = 87:1]
  %empty_4 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str, i32 %tmp), !dbg !213 ; [#uses=0 type=i32] [debug line = 87:1]
  br label %.preheader, !dbg !201                 ; [debug line = 79:45]

.loopexit:                                        ; preds = %.loopexit18
  ret void, !dbg !214                             ; [debug line = 92:1]
}

; [#uses=0]
define void @matrixMul(float* %C, float* %A, float* %B, i32 %wA, i32 %wB, i32 %gridDim_x, i32 %gridDim_y, i32 %gridDim_z, i32 %blockDim_x, i32 %blockDim_y, i32 %blockDim_z) {
  call void (...)* @_ssdm_op_SpecBitsMap(float* %C), !map !215
  call void (...)* @_ssdm_op_SpecBitsMap(float* %A), !map !221
  call void (...)* @_ssdm_op_SpecBitsMap(float* %B), !map !227
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %wA), !map !233
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %wB), !map !239
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %gridDim_x), !map !243
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %gridDim_y), !map !247
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %gridDim_z), !map !251
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %blockDim_x), !map !255
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %blockDim_y), !map !259
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %blockDim_z), !map !263
  call void (...)* @_ssdm_op_SpecTopModule([10 x i8]* @matrixMul_str) nounwind
  %blockDim_z_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_z) ; [#uses=4 type=i32]
  %blockDim_y_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_y) ; [#uses=4 type=i32]
  %blockDim_x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_x) ; [#uses=4 type=i32]
  %gridDim_y_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %gridDim_y) ; [#uses=1 type=i32]
  %gridDim_x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %gridDim_x) ; [#uses=1 type=i32]
  %wB_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %wB) ; [#uses=4 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %wB_read}, i64 0, metadata !267), !dbg !271 ; [debug line = 102:70] [debug variable = wB]
  %wA_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %wA) ; [#uses=3 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %wA_read}, i64 0, metadata !272), !dbg !273 ; [debug line = 102:62] [debug variable = wA]
  %Csub_block_block0 = alloca [256 x float], align 4 ; [#uses=3 type=[256 x float]*]
  %As = alloca [256 x float], align 4             ; [#uses=2 type=[256 x float]*]
  %Bs = alloca [256 x float], align 4             ; [#uses=2 type=[256 x float]*]
  call void @llvm.dbg.value(metadata !{float* %C}, i64 0, metadata !274), !dbg !275 ; [debug line = 102:27] [debug variable = C]
  call void @llvm.dbg.value(metadata !{float* %A}, i64 0, metadata !276), !dbg !277 ; [debug line = 102:41] [debug variable = A]
  call void @llvm.dbg.value(metadata !{float* %B}, i64 0, metadata !278), !dbg !279 ; [debug line = 102:55] [debug variable = B]
  call void @llvm.dbg.value(metadata !{i32 %wA}, i64 0, metadata !272), !dbg !273 ; [debug line = 102:62] [debug variable = wA]
  call void @llvm.dbg.value(metadata !{i32 %wB}, i64 0, metadata !267), !dbg !271 ; [debug line = 102:70] [debug variable = wB]
  call void @llvm.dbg.declare(metadata !{[256 x float]* %Csub_block_block0}, metadata !280), !dbg !282 ; [debug line = 111:10] [debug variable = Csub_block_block0]
  %bStep_block0 = shl i32 %wB_read, 4, !dbg !283  ; [#uses=1 type=i32] [debug line = 141:1]
  br label %.loopexit10, !dbg !288                ; [debug line = 122:6]

.loopexit10:                                      ; preds = %.preheader, %0
  %blockIdx_block0_y = phi i32 [ 0, %0 ], [ %blockIdx_loop_y, %.preheader ] ; [#uses=2 type=i32]
  %phi_mul = phi i32 [ 0, %0 ], [ %next_mul, %.preheader ] ; [#uses=2 type=i32]
  %phi_mul1 = phi i32 [ 0, %0 ], [ %next_mul2, %.preheader ] ; [#uses=2 type=i32]
  %next_mul2 = add i32 %phi_mul1, %wB_read        ; [#uses=1 type=i32]
  %next_mul = add i32 %phi_mul, %wA_read          ; [#uses=1 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %blockIdx_block0_y}, i64 0, metadata !289), !dbg !291 ; [debug line = 124:1] [debug variable = blockIdx_block0.y]
  %tmp_s = icmp eq i32 %blockIdx_block0_y, %gridDim_y_read, !dbg !288 ; [#uses=1 type=i1] [debug line = 122:6]
  %blockIdx_loop_y = add i32 %blockIdx_block0_y, 1, !dbg !292 ; [#uses=1 type=i32] [debug line = 122:61]
  call void @llvm.dbg.value(metadata !{i32 %blockIdx_loop_y}, i64 0, metadata !293), !dbg !292 ; [debug line = 122:61] [debug variable = blockIdx_loop.y]
  br i1 %tmp_s, label %7, label %.preheader.preheader, !dbg !288 ; [debug line = 122:6]

.preheader.preheader:                             ; preds = %.loopexit10
  %a_block0_2 = shl i32 %phi_mul, 4, !dbg !295    ; [#uses=2 type=i32] [debug line = 137:1]
  %tmp1 = add i32 -1, %a_block0_2, !dbg !296      ; [#uses=1 type=i32] [debug line = 138:1]
  %aEnd_block0 = add i32 %wA_read, %tmp1, !dbg !296 ; [#uses=1 type=i32] [debug line = 138:1]
  br label %.preheader, !dbg !297                 ; [debug line = 125:61]

.preheader:                                       ; preds = %6, %.preheader.preheader
  %blockIdx_loop_x = phi i32 [ %tmp_17, %6 ], [ 0, %.preheader.preheader ] ; [#uses=4 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %blockIdx_loop_x}, i64 0, metadata !298), !dbg !297 ; [debug line = 125:61] [debug variable = blockIdx_loop.x]
  %tmp_16 = icmp eq i32 %blockIdx_loop_x, %gridDim_x_read, !dbg !299 ; [#uses=1 type=i1] [debug line = 125:6]
  %tmp_17 = add i32 %blockIdx_loop_x, 1, !dbg !297 ; [#uses=1 type=i32] [debug line = 125:61]
  br i1 %tmp_16, label %.loopexit10, label %1, !dbg !299 ; [debug line = 125:6]

; <label>:1                                       ; preds = %.preheader
  %tmp_2 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str2), !dbg !300 ; [#uses=1 type=i32] [debug line = 126:2]
  call void @llvm.dbg.value(metadata !{i32 %blockIdx_loop_x}, i64 0, metadata !301), !dbg !302 ; [debug line = 127:1] [debug variable = blockIdx_block0.x]
  call void (...)* @_ssdm_op_SpecInterface(float* %A, [7 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 3840, [1 x i8]* @p_str4, [1 x i8]* @p_str4, [1 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str4) nounwind, !dbg !303 ; [debug line = 132:1]
  call void (...)* @_ssdm_op_SpecInterface(float* %B, [7 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 6144, [1 x i8]* @p_str4, [1 x i8]* @p_str4, [1 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str4) nounwind, !dbg !304 ; [debug line = 133:1]
  call void (...)* @_ssdm_op_SpecInterface(float* %C, [7 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 10240, [1 x i8]* @p_str4, [1 x i8]* @p_str4, [1 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str4) nounwind, !dbg !305 ; [debug line = 134:1]
  call void @llvm.dbg.value(metadata !{i32 %blockIdx_loop_x}, i64 0, metadata !306), !dbg !307 ; [debug line = 135:1] [debug variable = bx_block0]
  call void @llvm.dbg.value(metadata !{i32 %blockIdx_block0_y}, i64 0, metadata !308), !dbg !309 ; [debug line = 136:1] [debug variable = by_block0]
  call void @llvm.dbg.value(metadata !{i32 %a_block0_2}, i64 0, metadata !310), !dbg !311 ; [debug line = 147:6] [debug variable = a_block0]
  call void @llvm.dbg.value(metadata !{i32 %a_block0_2}, i64 0, metadata !313), !dbg !295 ; [debug line = 137:1] [debug variable = aBegin_block0]
  call void @llvm.dbg.value(metadata !{i32 %aEnd_block0}, i64 0, metadata !314), !dbg !296 ; [debug line = 138:1] [debug variable = aEnd_block0]
  %b_block0_2 = shl i32 %blockIdx_loop_x, 4, !dbg !315 ; [#uses=1 type=i32] [debug line = 140:1]
  call void @llvm.dbg.value(metadata !{i32 %b_block0_2}, i64 0, metadata !316), !dbg !311 ; [debug line = 147:6] [debug variable = b_block0]
  call void @llvm.dbg.value(metadata !{i32 %b_block0_2}, i64 0, metadata !317), !dbg !315 ; [debug line = 140:1] [debug variable = bBegin_block0]
  call void @llvm.dbg.value(metadata !{i32 %bStep_block0}, i64 0, metadata !318), !dbg !283 ; [debug line = 141:1] [debug variable = bStep_block0]
  call void @llvm.dbg.value(metadata !{[256 x float]* %Csub_block_block0}, i64 0, metadata !319), !dbg !324 ; [debug line = 6:102@142:1] [debug variable = Csub_block]
  br label %.loopexit, !dbg !325                  ; [debug line = 12:6@142:1]

.loopexit:                                        ; preds = %.preheader.i, %1
  %threadIdx_2_i = phi i32 [ 0, %1 ], [ %threadIdx_z, %.preheader.i ] ; [#uses=2 type=i32]
  %exitcond2_i = icmp eq i32 %threadIdx_2_i, %blockDim_z_read, !dbg !325 ; [#uses=1 type=i1] [debug line = 12:6@142:1]
  %threadIdx_z = add i32 %threadIdx_2_i, 1, !dbg !329 ; [#uses=1 type=i32] [debug line = 12:45@142:1]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx_z}, i64 0, metadata !330), !dbg !329 ; [debug line = 12:45@142:1] [debug variable = threadIdx.z]
  br i1 %exitcond2_i, label %matrixMul_CMP_5.exit, label %.preheader.i, !dbg !325 ; [debug line = 12:6@142:1]

.preheader.i:                                     ; preds = %3, %.loopexit
  %threadIdx_y = phi i32 [ 0, %.loopexit ], [ %tmp_23_i, %3 ] ; [#uses=3 type=i32]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx_y}, i64 0, metadata !332), !dbg !333 ; [debug line = 13:45@142:1] [debug variable = threadIdx.y]
  %exitcond1_i = icmp eq i32 %threadIdx_y, %blockDim_y_read, !dbg !335 ; [#uses=1 type=i1] [debug line = 13:6@142:1]
  %tmp_23_i = add i32 %threadIdx_y, 1, !dbg !333  ; [#uses=1 type=i32] [debug line = 13:45@142:1]
  br i1 %exitcond1_i, label %.loopexit, label %2, !dbg !335 ; [debug line = 13:6@142:1]

; <label>:2                                       ; preds = %.preheader.i
  %tmp_12 = trunc i32 %threadIdx_y to i6          ; [#uses=1 type=i6]
  %tmp_34_cast = call i10 @_ssdm_op_BitConcatenate.i10.i6.i4(i6 %tmp_12, i4 0), !dbg !336 ; [#uses=1 type=i10] [debug line = 14:6@142:1]
  br label %3, !dbg !336                          ; [debug line = 14:6@142:1]

; <label>:3                                       ; preds = %4, %2
  %threadIdx_i = phi i32 [ 0, %2 ], [ %threadIdx_x, %4 ] ; [#uses=3 type=i32]
  %exitcond_i = icmp eq i32 %threadIdx_i, %blockDim_x_read, !dbg !336 ; [#uses=1 type=i1] [debug line = 14:6@142:1]
  %threadIdx_x = add i32 %threadIdx_i, 1, !dbg !338 ; [#uses=1 type=i32] [debug line = 14:45@142:1]
  br i1 %exitcond_i, label %.preheader.i, label %4, !dbg !336 ; [debug line = 14:6@142:1]

; <label>:4                                       ; preds = %3
  %tmp_13 = trunc i32 %threadIdx_i to i10, !dbg !339 ; [#uses=1 type=i10] [debug line = 17:1@142:1]
  %tmp_19 = add i10 %tmp_34_cast, %tmp_13, !dbg !339 ; [#uses=1 type=i10] [debug line = 17:1@142:1]
  %tmp_35_cast = zext i10 %tmp_19 to i64, !dbg !339 ; [#uses=1 type=i64] [debug line = 17:1@142:1]
  %Csub_block_block0_addr = getelementptr [256 x float]* %Csub_block_block0, i64 0, i64 %tmp_35_cast, !dbg !339 ; [#uses=1 type=float*] [debug line = 17:1@142:1]
  store float 0.000000e+00, float* %Csub_block_block0_addr, align 4, !dbg !339 ; [debug line = 17:1@142:1]
  call void @llvm.dbg.value(metadata !{i32 %threadIdx_x}, i64 0, metadata !341), !dbg !338 ; [debug line = 14:45@142:1] [debug variable = threadIdx.x]
  br label %3, !dbg !338                          ; [debug line = 14:45@142:1]

matrixMul_CMP_5.exit:                             ; preds = %5, %.loopexit
  %a_block = phi i32 [ %a_block0, %5 ], [ %a_block0_2, %.loopexit ] ; [#uses=3 type=i32]
  %b_block = phi i32 [ %b_block0, %5 ], [ %b_block0_2, %.loopexit ] ; [#uses=2 type=i32]
  %tmp_18 = icmp sgt i32 %a_block, %aEnd_block0, !dbg !311 ; [#uses=1 type=i1] [debug line = 147:6]
  br i1 %tmp_18, label %6, label %5, !dbg !311    ; [debug line = 147:6]

; <label>:5                                       ; preds = %matrixMul_CMP_5.exit
  call void @llvm.dbg.declare(metadata !{[256 x float]* %As}, metadata !342), !dbg !344 ; [debug line = 149:10] [debug variable = As]
  call void @llvm.dbg.declare(metadata !{[256 x float]* %Bs}, metadata !345), !dbg !346 ; [debug line = 150:10] [debug variable = Bs]
  call fastcc void @matrixMul_matrixMul_TRN_6(i32 %blockDim_x_read, i32 %blockDim_y_read, i32 %blockDim_z_read, [256 x float]* %As, float* %A, i32 %a_block, i32 %wA_read, [256 x float]* %Bs, float* %B, i32 %b_block, i32 %wB_read), !dbg !347 ; [debug line = 153:1]
  call fastcc void @matrixMul_matrixMul_SNC_7(i32 %blockDim_x_read, i32 %blockDim_y_read, i32 %blockDim_z_read, [256 x float]* %Csub_block_block0, [256 x float]* %As, [256 x float]* %Bs), !dbg !348 ; [debug line = 157:1]
  %a_block0 = add nsw i32 %a_block, 16, !dbg !349 ; [#uses=1 type=i32] [debug line = 147:83]
  call void @llvm.dbg.value(metadata !{i32 %a_block0}, i64 0, metadata !310), !dbg !349 ; [debug line = 147:83] [debug variable = a_block0]
  %b_block0 = add nsw i32 %bStep_block0, %b_block, !dbg !349 ; [#uses=1 type=i32] [debug line = 147:83]
  call void @llvm.dbg.value(metadata !{i32 %b_block0}, i64 0, metadata !316), !dbg !349 ; [debug line = 147:83] [debug variable = b_block0]
  br label %matrixMul_CMP_5.exit, !dbg !349       ; [debug line = 147:83]

; <label>:6                                       ; preds = %matrixMul_CMP_5.exit
  %tmp = add i32 %phi_mul1, %blockIdx_loop_x      ; [#uses=1 type=i32]
  %c_block0 = shl i32 %tmp, 4, !dbg !350          ; [#uses=1 type=i32] [debug line = 160:1]
  call void @llvm.dbg.value(metadata !{i32 %c_block0}, i64 0, metadata !351), !dbg !350 ; [debug line = 160:1] [debug variable = c_block0]
  call fastcc void @matrixMul_matrixMul_TRN_10_wrapper(i32 %blockDim_x_read, i32 %blockDim_y_read, i32 %blockDim_z_read, float* %C, [256 x float]* %Csub_block_block0, i32 %c_block0, i32 %wB_read), !dbg !352 ; [debug line = 163:1]
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str2, i32 %tmp_2), !dbg !353 ; [#uses=0 type=i32] [debug line = 166:1]
  br label %.preheader, !dbg !297                 ; [debug line = 125:61]

; <label>:7                                       ; preds = %.loopexit10
  ret void, !dbg !354                             ; [debug line = 168:1]
}

; [#uses=63]
declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

; [#uses=3]
declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

; [#uses=1]
define weak i1 @_ssdm_op_WriteReq.ap_bus.floatP(float*, i32) {
entry:
  ret i1 true
}

; [#uses=1]
define weak void @_ssdm_op_Write.ap_bus.floatP(float*, float) {
entry:
  store float %1, float* %0
  ret void
}

; [#uses=1]
define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

; [#uses=3]
define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

; [#uses=3]
define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

; [#uses=1]
define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

; [#uses=1]
define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

; [#uses=7]
define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

; [#uses=11]
define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

; [#uses=2]
define weak i1 @_ssdm_op_ReadReq.ap_bus.floatP(float*, i32) {
entry:
  ret i1 true
}

; [#uses=2]
define weak float @_ssdm_op_Read.ap_bus.floatP(float*) {
entry:
  %empty = load float* %0                         ; [#uses=1 type=float]
  ret float %empty
}

; [#uses=27]
define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

; [#uses=0]
declare i6 @_ssdm_op_PartSelect.i6.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i28 @_ssdm_op_PartSelect.i28.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=0]
declare i10 @_ssdm_op_PartSelect.i10.i32.i32.i32(i32, i32, i32) nounwind readnone

; [#uses=1]
define weak i9 @_ssdm_op_BitConcatenate.i9.i5.i4(i5, i4) nounwind readnone {
entry:
  %empty = zext i5 %0 to i9                       ; [#uses=1 type=i9]
  %empty_5 = zext i4 %1 to i9                     ; [#uses=1 type=i9]
  %empty_6 = shl i9 %empty, 4                     ; [#uses=1 type=i9]
  %empty_7 = or i9 %empty_6, %empty_5             ; [#uses=1 type=i9]
  ret i9 %empty_7
}

; [#uses=0]
declare i32 @_ssdm_op_BitConcatenate.i32.i28.i4(i28, i4) nounwind readnone

; [#uses=4]
define weak i10 @_ssdm_op_BitConcatenate.i10.i6.i4(i6, i4) nounwind readnone {
entry:
  %empty = zext i6 %0 to i10                      ; [#uses=1 type=i10]
  %empty_8 = zext i4 %1 to i10                    ; [#uses=1 type=i10]
  %empty_9 = shl i10 %empty, 4                    ; [#uses=1 type=i10]
  %empty_10 = or i10 %empty_9, %empty_8           ; [#uses=1 type=i10]
  ret i10 %empty_10
}

; [#uses=1]
declare void @_GLOBAL__I_a() nounwind section ".text.startup"

!opencl.kernels = !{!0, !7, !13, !19, !25, !27, !31, !31, !37, !37}
!hls.encrypted.func = !{}
!llvm.map.gv = !{!43}

!0 = metadata !{null, metadata !1, metadata !2, metadata !3, metadata !4, metadata !5, metadata !6}
!1 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 1}
!2 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!3 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"struct dim3", metadata !"struct dim3", metadata !"struct dim3", metadata !"DATATYPE [16]*"}
!4 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!5 = metadata !{metadata !"kernel_arg_name", metadata !"guard_matrixMul_CMP_5", metadata !"blockDim", metadata !"gridDim", metadata !"blockIdx", metadata !"Csub_block"}
!6 = metadata !{metadata !"reqd_work_group_size", i32 1, i32 1, i32 1}
!7 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !12, metadata !6}
!8 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 0, i32 0}
!9 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!10 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"struct dim3", metadata !"struct dim3", metadata !"struct dim3", metadata !"DATATYPE*", metadata !"DATATYPE [16]*", metadata !"int", metadata !"int"}
!11 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!12 = metadata !{metadata !"kernel_arg_name", metadata !"guard_matrixMul_TRN_10", metadata !"blockDim", metadata !"gridDim", metadata !"blockIdx", metadata !"C", metadata !"Csub_block", metadata !"c", metadata !"wB"}
!13 = metadata !{null, metadata !14, metadata !15, metadata !16, metadata !17, metadata !18, metadata !6}
!14 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 0, i32 0, i32 1, i32 1, i32 0, i32 0}
!15 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!16 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"struct dim3", metadata !"struct dim3", metadata !"struct dim3", metadata !"DATATYPE [16]*", metadata !"DATATYPE*", metadata !"int", metadata !"int", metadata !"DATATYPE [16]*", metadata !"DATATYPE*", metadata !"int", metadata !"int"}
!17 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!18 = metadata !{metadata !"kernel_arg_name", metadata !"guard_matrixMul_TRN_6", metadata !"blockDim", metadata !"gridDim", metadata !"blockIdx", metadata !"As", metadata !"A", metadata !"a", metadata !"wA", metadata !"Bs", metadata !"B", metadata !"b", metadata !"wB"}
!19 = metadata !{null, metadata !20, metadata !21, metadata !22, metadata !23, metadata !24, metadata !6}
!20 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1}
!21 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none", metadata !"none"}
!22 = metadata !{metadata !"kernel_arg_type", metadata !"int", metadata !"struct dim3", metadata !"struct dim3", metadata !"struct dim3", metadata !"DATATYPE [16]*", metadata !"DATATYPE [16]*", metadata !"DATATYPE [16]*"}
!23 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !"", metadata !""}
!24 = metadata !{metadata !"kernel_arg_name", metadata !"guard_matrixMul_SNC_7", metadata !"blockDim", metadata !"gridDim", metadata !"blockIdx", metadata !"Csub_block", metadata !"As", metadata !"Bs"}
!25 = metadata !{null, metadata !8, metadata !9, metadata !10, metadata !11, metadata !26, metadata !6}
!26 = metadata !{metadata !"kernel_arg_name", metadata !"guard_matrixMul_TRN_10_block0", metadata !"blockDim", metadata !"gridDim", metadata !"blockIdx_matrixMul_TRN_10_block0", metadata !"C", metadata !"Csub_block_block0", metadata !"c_block0", metadata !"wB"}
!27 = metadata !{null, metadata !28, metadata !21, metadata !29, metadata !23, metadata !30, metadata !6}
!28 = metadata !{metadata !"kernel_arg_addr_space", i32 1, i32 1, i32 1, i32 0, i32 0, i32 0, i32 0}
!29 = metadata !{metadata !"kernel_arg_type", metadata !"DATATYPE*", metadata !"DATATYPE*", metadata !"DATATYPE*", metadata !"int", metadata !"int", metadata !"struct dim3", metadata !"struct dim3"}
!30 = metadata !{metadata !"kernel_arg_name", metadata !"C", metadata !"A", metadata !"B", metadata !"wA", metadata !"wB", metadata !"gridDim", metadata !"blockDim"}
!31 = metadata !{null, metadata !32, metadata !33, metadata !34, metadata !35, metadata !36, metadata !6}
!32 = metadata !{metadata !"kernel_arg_addr_space"}
!33 = metadata !{metadata !"kernel_arg_access_qual"}
!34 = metadata !{metadata !"kernel_arg_type"}
!35 = metadata !{metadata !"kernel_arg_type_qual"}
!36 = metadata !{metadata !"kernel_arg_name"}
!37 = metadata !{null, metadata !38, metadata !39, metadata !40, metadata !41, metadata !42, metadata !6}
!38 = metadata !{metadata !"kernel_arg_addr_space", i32 0, i32 0, i32 0}
!39 = metadata !{metadata !"kernel_arg_access_qual", metadata !"none", metadata !"none", metadata !"none"}
!40 = metadata !{metadata !"kernel_arg_type", metadata !"uint", metadata !"uint", metadata !"uint"}
!41 = metadata !{metadata !"kernel_arg_type_qual", metadata !"", metadata !"", metadata !""}
!42 = metadata !{metadata !"kernel_arg_name", metadata !"x", metadata !"y", metadata !"z"}
!43 = metadata !{metadata !44, [1 x i32]* @llvm_global_ctors_0}
!44 = metadata !{metadata !45}
!45 = metadata !{i32 0, i32 31, metadata !46}
!46 = metadata !{metadata !47}
!47 = metadata !{metadata !"llvm.global_ctors.0", metadata !48, metadata !"", i32 0, i32 31}
!48 = metadata !{metadata !49}
!49 = metadata !{i32 0, i32 0, i32 1}
!50 = metadata !{i32 786689, metadata !51, metadata !"wB", metadata !52, i32 201326638, metadata !55, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!51 = metadata !{i32 786478, i32 0, metadata !52, metadata !"matrixMul_TRN_6", metadata !"matrixMul_TRN_6", metadata !"_Z15matrixMul_TRN_6i4dim3S_S_PA16_fPfiiS1_S2_ii", metadata !52, i32 46, metadata !53, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !67, i32 47} ; [ DW_TAG_subprogram ]
!52 = metadata !{i32 786473, metadata !"fcuda_gen/fcuda_gen_matmul.cpp", metadata !"/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul", null} ; [ DW_TAG_file_type ]
!53 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !54, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!54 = metadata !{null, metadata !55, metadata !56, metadata !56, metadata !56, metadata !90, metadata !96, metadata !55, metadata !55, metadata !90, metadata !96, metadata !55, metadata !55}
!55 = metadata !{i32 786468, null, metadata !"int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 5} ; [ DW_TAG_base_type ]
!56 = metadata !{i32 786434, null, metadata !"dim3", metadata !57, i32 429, i64 96, i64 32, i32 0, i32 0, null, metadata !58, i32 0, null, null} ; [ DW_TAG_class_type ]
!57 = metadata !{i32 786473, metadata !"/home/xu67/thesis_fcuda/fcuda/fcuda_src/include/cuda_include/vector_types.h", metadata !"/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul", null} ; [ DW_TAG_file_type ]
!58 = metadata !{metadata !59, metadata !61, metadata !62, metadata !63, metadata !69, metadata !87}
!59 = metadata !{i32 786445, metadata !56, metadata !"x", metadata !57, i32 431, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!60 = metadata !{i32 786468, null, metadata !"unsigned int", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 7} ; [ DW_TAG_base_type ]
!61 = metadata !{i32 786445, metadata !56, metadata !"y", metadata !57, i32 431, i64 32, i64 32, i64 32, i32 0, metadata !60} ; [ DW_TAG_member ]
!62 = metadata !{i32 786445, metadata !56, metadata !"z", metadata !57, i32 431, i64 32, i64 32, i64 64, i32 0, metadata !60} ; [ DW_TAG_member ]
!63 = metadata !{i32 786478, i32 0, metadata !56, metadata !"dim3", metadata !"dim3", metadata !"", metadata !57, i32 433, metadata !64, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !67, i32 433} ; [ DW_TAG_subprogram ]
!64 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !65, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!65 = metadata !{null, metadata !66, metadata !60, metadata !60, metadata !60}
!66 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !56} ; [ DW_TAG_pointer_type ]
!67 = metadata !{metadata !68}
!68 = metadata !{i32 786468}                      ; [ DW_TAG_base_type ]
!69 = metadata !{i32 786478, i32 0, metadata !56, metadata !"dim3", metadata !"dim3", metadata !"", metadata !57, i32 434, metadata !70, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !67, i32 434} ; [ DW_TAG_subprogram ]
!70 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !71, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!71 = metadata !{null, metadata !66, metadata !72}
!72 = metadata !{i32 786454, null, metadata !"uint3", metadata !57, i32 375, i64 0, i64 0, i64 0, i32 0, metadata !73} ; [ DW_TAG_typedef ]
!73 = metadata !{i32 786434, null, metadata !"uint3", metadata !57, i32 180, i64 96, i64 32, i32 0, i32 0, null, metadata !74, i32 0, null, null} ; [ DW_TAG_class_type ]
!74 = metadata !{metadata !75, metadata !76, metadata !77, metadata !78, metadata !82}
!75 = metadata !{i32 786445, metadata !73, metadata !"x", metadata !57, i32 182, i64 32, i64 32, i64 0, i32 0, metadata !60} ; [ DW_TAG_member ]
!76 = metadata !{i32 786445, metadata !73, metadata !"y", metadata !57, i32 182, i64 32, i64 32, i64 32, i32 0, metadata !60} ; [ DW_TAG_member ]
!77 = metadata !{i32 786445, metadata !73, metadata !"z", metadata !57, i32 182, i64 32, i64 32, i64 64, i32 0, metadata !60} ; [ DW_TAG_member ]
!78 = metadata !{i32 786478, i32 0, metadata !73, metadata !"uint3", metadata !"uint3", metadata !"", metadata !57, i32 180, metadata !79, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !67, i32 180} ; [ DW_TAG_subprogram ]
!79 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !80, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!80 = metadata !{null, metadata !81}
!81 = metadata !{i32 786447, i32 0, metadata !"", i32 0, i32 0, i64 64, i64 64, i64 0, i32 64, metadata !73} ; [ DW_TAG_pointer_type ]
!82 = metadata !{i32 786478, i32 0, metadata !73, metadata !"uint3", metadata !"uint3", metadata !"", metadata !57, i32 180, metadata !83, i1 false, i1 false, i32 0, i32 0, null, i32 320, i1 false, null, null, i32 0, metadata !67, i32 180} ; [ DW_TAG_subprogram ]
!83 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !84, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!84 = metadata !{null, metadata !81, metadata !85}
!85 = metadata !{i32 786448, null, null, null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !86} ; [ DW_TAG_reference_type ]
!86 = metadata !{i32 786470, null, metadata !"", null, i32 0, i64 0, i64 0, i64 0, i32 0, metadata !73} ; [ DW_TAG_const_type ]
!87 = metadata !{i32 786478, i32 0, metadata !56, metadata !"operator uint3", metadata !"operator uint3", metadata !"_ZN4dim3cv5uint3Ev", metadata !57, i32 435, metadata !88, i1 false, i1 false, i32 0, i32 0, null, i32 256, i1 false, null, null, i32 0, metadata !67, i32 435} ; [ DW_TAG_subprogram ]
!88 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !89, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!89 = metadata !{metadata !72, metadata !66}
!90 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !91} ; [ DW_TAG_pointer_type ]
!91 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 512, i64 32, i32 0, i32 0, metadata !92, metadata !94, i32 0, i32 0} ; [ DW_TAG_array_type ]
!92 = metadata !{i32 786454, null, metadata !"DATATYPE", metadata !52, i32 51, i64 0, i64 0, i64 0, i32 0, metadata !93} ; [ DW_TAG_typedef ]
!93 = metadata !{i32 786468, null, metadata !"float", null, i32 0, i64 32, i64 32, i64 0, i32 0, i32 4} ; [ DW_TAG_base_type ]
!94 = metadata !{metadata !95}
!95 = metadata !{i32 786465, i64 0, i64 15}       ; [ DW_TAG_subrange_type ]
!96 = metadata !{i32 786447, null, metadata !"", null, i32 0, i64 64, i64 64, i64 0, i32 0, metadata !92} ; [ DW_TAG_pointer_type ]
!97 = metadata !{i32 46, i32 189, metadata !51, null}
!98 = metadata !{i32 786689, metadata !51, metadata !"b", metadata !52, i32 184549422, metadata !55, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!99 = metadata !{i32 46, i32 182, metadata !51, null}
!100 = metadata !{i32 786689, metadata !51, metadata !"wA", metadata !52, i32 134217774, metadata !55, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!101 = metadata !{i32 46, i32 139, metadata !51, null}
!102 = metadata !{i32 786689, metadata !51, metadata !"a", metadata !52, i32 117440558, metadata !55, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!103 = metadata !{i32 46, i32 132, metadata !51, null}
!104 = metadata !{i32 786689, metadata !51, metadata !"As", null, i32 46, metadata !105, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!105 = metadata !{i32 786433, null, metadata !"", null, i32 0, i64 8192, i64 32, i32 0, i32 0, metadata !92, metadata !106, i32 0, i32 0} ; [ DW_TAG_array_type ]
!106 = metadata !{metadata !95, metadata !95}
!107 = metadata !{i32 46, i32 102, metadata !51, null}
!108 = metadata !{i32 786689, metadata !51, metadata !"A", metadata !52, i32 100663342, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!109 = metadata !{i32 46, i32 125, metadata !51, null}
!110 = metadata !{i32 786689, metadata !51, metadata !"Bs", null, i32 46, metadata !105, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!111 = metadata !{i32 46, i32 152, metadata !51, null}
!112 = metadata !{i32 786689, metadata !51, metadata !"B", metadata !52, i32 167772206, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!113 = metadata !{i32 46, i32 175, metadata !51, null}
!114 = metadata !{i32 52, i32 6, metadata !115, null}
!115 = metadata !{i32 786443, metadata !116, i32 52, i32 1, metadata !52, i32 14} ; [ DW_TAG_lexical_block ]
!116 = metadata !{i32 786443, metadata !117, i32 50, i32 1, metadata !52, i32 13} ; [ DW_TAG_lexical_block ]
!117 = metadata !{i32 786443, metadata !51, i32 47, i32 1, metadata !52, i32 12} ; [ DW_TAG_lexical_block ]
!118 = metadata !{i32 52, i32 45, metadata !115, null}
!119 = metadata !{i32 790529, metadata !120, metadata !"threadIdx.z", null, i32 48, metadata !121, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!120 = metadata !{i32 786688, metadata !117, metadata !"threadIdx", metadata !52, i32 48, metadata !56, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!121 = metadata !{i32 786438, null, metadata !"dim3", metadata !57, i32 429, i64 32, i64 32, i32 0, i32 0, null, metadata !122, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!122 = metadata !{metadata !62}
!123 = metadata !{i32 790529, metadata !120, metadata !"threadIdx.y", null, i32 48, metadata !124, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!124 = metadata !{i32 786438, null, metadata !"dim3", metadata !57, i32 429, i64 32, i64 32, i32 0, i32 0, null, metadata !125, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!125 = metadata !{metadata !61}
!126 = metadata !{i32 53, i32 45, metadata !127, null}
!127 = metadata !{i32 786443, metadata !115, i32 53, i32 1, metadata !52, i32 15} ; [ DW_TAG_lexical_block ]
!128 = metadata !{i32 53, i32 6, metadata !127, null}
!129 = metadata !{i32 57, i32 1, metadata !130, null}
!130 = metadata !{i32 786443, metadata !131, i32 55, i32 1, metadata !52, i32 17} ; [ DW_TAG_lexical_block ]
!131 = metadata !{i32 786443, metadata !127, i32 54, i32 1, metadata !52, i32 16} ; [ DW_TAG_lexical_block ]
!132 = metadata !{i32 58, i32 1, metadata !130, null}
!133 = metadata !{i32 54, i32 6, metadata !131, null}
!134 = metadata !{i32 54, i32 45, metadata !131, null}
!135 = metadata !{i32 790529, metadata !120, metadata !"threadIdx.x", null, i32 48, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!136 = metadata !{i32 786438, null, metadata !"dim3", metadata !57, i32 429, i64 32, i64 32, i32 0, i32 0, null, metadata !137, i32 0, null, null} ; [ DW_TAG_class_field_type ]
!137 = metadata !{metadata !59}
!138 = metadata !{i32 63, i32 1, metadata !117, null}
!139 = metadata !{i32 786689, metadata !140, metadata !"wB", metadata !52, i32 134217823, metadata !55, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!140 = metadata !{i32 786478, i32 0, metadata !52, metadata !"matrixMul_TRN_10_wrapper", metadata !"matrixMul_TRN_10_wrapper", metadata !"_Z24matrixMul_TRN_10_wrapperi4dim3S_S_PfPA16_fii", metadata !52, i32 95, metadata !141, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !67, i32 96} ; [ DW_TAG_subprogram ]
!141 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !142, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!142 = metadata !{null, metadata !55, metadata !56, metadata !56, metadata !56, metadata !96, metadata !90, metadata !55, metadata !55}
!143 = metadata !{i32 95, i32 218, metadata !140, null}
!144 = metadata !{i32 786689, metadata !140, metadata !"c_block0", metadata !52, i32 117440607, metadata !55, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!145 = metadata !{i32 95, i32 204, metadata !140, null}
!146 = metadata !{i32 786689, metadata !140, metadata !"C", metadata !52, i32 83886175, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!147 = metadata !{i32 95, i32 145, metadata !140, null}
!148 = metadata !{i32 786689, metadata !140, metadata !"Csub_block_block0", null, i32 95, metadata !105, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!149 = metadata !{i32 95, i32 157, metadata !140, null}
!150 = metadata !{i32 97, i32 1, metadata !151, null}
!151 = metadata !{i32 786443, metadata !140, i32 96, i32 1, metadata !52, i32 27} ; [ DW_TAG_lexical_block ]
!152 = metadata !{i32 98, i32 1, metadata !151, null}
!153 = metadata !{i32 786689, metadata !154, metadata !"wB", metadata !52, i32 134217754, metadata !55, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!154 = metadata !{i32 786478, i32 0, metadata !52, metadata !"matrixMul_TRN_10", metadata !"matrixMul_TRN_10", metadata !"_Z16matrixMul_TRN_10i4dim3S_S_PfPA16_fii", metadata !52, i32 26, metadata !141, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !67, i32 27} ; [ DW_TAG_subprogram ]
!155 = metadata !{i32 26, i32 165, metadata !154, null}
!156 = metadata !{i32 786689, metadata !154, metadata !"c", metadata !52, i32 117440538, metadata !55, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!157 = metadata !{i32 26, i32 158, metadata !154, null}
!158 = metadata !{i32 786689, metadata !154, metadata !"C", metadata !52, i32 83886106, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!159 = metadata !{i32 26, i32 106, metadata !154, null}
!160 = metadata !{i32 786689, metadata !154, metadata !"Csub_block", null, i32 26, metadata !105, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!161 = metadata !{i32 26, i32 118, metadata !154, null}
!162 = metadata !{i32 32, i32 6, metadata !163, null}
!163 = metadata !{i32 786443, metadata !164, i32 32, i32 1, metadata !52, i32 8} ; [ DW_TAG_lexical_block ]
!164 = metadata !{i32 786443, metadata !165, i32 30, i32 1, metadata !52, i32 7} ; [ DW_TAG_lexical_block ]
!165 = metadata !{i32 786443, metadata !154, i32 27, i32 1, metadata !52, i32 6} ; [ DW_TAG_lexical_block ]
!166 = metadata !{i32 32, i32 45, metadata !163, null}
!167 = metadata !{i32 790529, metadata !168, metadata !"threadIdx.z", null, i32 28, metadata !121, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!168 = metadata !{i32 786688, metadata !165, metadata !"threadIdx", metadata !52, i32 28, metadata !56, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!169 = metadata !{i32 790529, metadata !168, metadata !"threadIdx.y", null, i32 28, metadata !124, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!170 = metadata !{i32 33, i32 45, metadata !171, null}
!171 = metadata !{i32 786443, metadata !163, i32 33, i32 1, metadata !52, i32 9} ; [ DW_TAG_lexical_block ]
!172 = metadata !{i32 33, i32 6, metadata !171, null}
!173 = metadata !{i32 37, i32 1, metadata !174, null}
!174 = metadata !{i32 786443, metadata !175, i32 35, i32 1, metadata !52, i32 11} ; [ DW_TAG_lexical_block ]
!175 = metadata !{i32 786443, metadata !171, i32 34, i32 1, metadata !52, i32 10} ; [ DW_TAG_lexical_block ]
!176 = metadata !{i32 34, i32 6, metadata !175, null}
!177 = metadata !{i32 34, i32 45, metadata !175, null}
!178 = metadata !{i32 790529, metadata !168, metadata !"threadIdx.x", null, i32 28, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!179 = metadata !{i32 42, i32 1, metadata !165, null}
!180 = metadata !{i32 786689, metadata !181, metadata !"Csub_block", null, i32 67, metadata !105, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!181 = metadata !{i32 786478, i32 0, metadata !52, metadata !"matrixMul_SNC_7", metadata !"matrixMul_SNC_7", metadata !"_Z15matrixMul_SNC_7i4dim3S_S_PA16_fS1_S1_", metadata !52, i32 67, metadata !182, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !67, i32 68} ; [ DW_TAG_subprogram ]
!182 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !183, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!183 = metadata !{null, metadata !55, metadata !56, metadata !56, metadata !56, metadata !90, metadata !90, metadata !90}
!184 = metadata !{i32 67, i32 102, metadata !181, null}
!185 = metadata !{i32 786689, metadata !181, metadata !"As", null, i32 67, metadata !105, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!186 = metadata !{i32 67, i32 147, metadata !181, null}
!187 = metadata !{i32 786689, metadata !181, metadata !"Bs", null, i32 67, metadata !105, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!188 = metadata !{i32 67, i32 168, metadata !181, null}
!189 = metadata !{i32 77, i32 6, metadata !190, null}
!190 = metadata !{i32 786443, metadata !191, i32 77, i32 1, metadata !52, i32 21} ; [ DW_TAG_lexical_block ]
!191 = metadata !{i32 786443, metadata !192, i32 74, i32 1, metadata !52, i32 20} ; [ DW_TAG_lexical_block ]
!192 = metadata !{i32 786443, metadata !193, i32 71, i32 1, metadata !52, i32 19} ; [ DW_TAG_lexical_block ]
!193 = metadata !{i32 786443, metadata !181, i32 68, i32 1, metadata !52, i32 18} ; [ DW_TAG_lexical_block ]
!194 = metadata !{i32 77, i32 45, metadata !190, null}
!195 = metadata !{i32 790529, metadata !196, metadata !"threadIdx.z", null, i32 69, metadata !121, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!196 = metadata !{i32 786688, metadata !193, metadata !"threadIdx", metadata !52, i32 69, metadata !56, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!197 = metadata !{i32 790529, metadata !196, metadata !"threadIdx.y", null, i32 69, metadata !124, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!198 = metadata !{i32 78, i32 45, metadata !199, null}
!199 = metadata !{i32 786443, metadata !190, i32 78, i32 1, metadata !52, i32 22} ; [ DW_TAG_lexical_block ]
!200 = metadata !{i32 78, i32 6, metadata !199, null}
!201 = metadata !{i32 79, i32 45, metadata !202, null}
!202 = metadata !{i32 786443, metadata !199, i32 79, i32 1, metadata !52, i32 23} ; [ DW_TAG_lexical_block ]
!203 = metadata !{i32 790529, metadata !196, metadata !"threadIdx.x", null, i32 69, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!204 = metadata !{i32 79, i32 6, metadata !202, null}
!205 = metadata !{i32 80, i32 2, metadata !206, null}
!206 = metadata !{i32 786443, metadata !202, i32 80, i32 1, metadata !52, i32 24} ; [ DW_TAG_lexical_block ]
!207 = metadata !{i32 84, i32 1, metadata !208, null}
!208 = metadata !{i32 786443, metadata !209, i32 83, i32 1, metadata !52, i32 26} ; [ DW_TAG_lexical_block ]
!209 = metadata !{i32 786443, metadata !206, i32 82, i32 1, metadata !52, i32 25} ; [ DW_TAG_lexical_block ]
!210 = metadata !{i32 82, i32 6, metadata !209, null}
!211 = metadata !{i32 82, i32 17, metadata !209, null}
!212 = metadata !{i32 786688, metadata !192, metadata !"k", metadata !52, i32 72, metadata !55, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!213 = metadata !{i32 87, i32 1, metadata !206, null}
!214 = metadata !{i32 92, i32 1, metadata !193, null}
!215 = metadata !{metadata !216}
!216 = metadata !{i32 0, i32 31, metadata !217}
!217 = metadata !{metadata !218}
!218 = metadata !{metadata !"C", metadata !219, metadata !"float", i32 0, i32 31}
!219 = metadata !{metadata !220}
!220 = metadata !{i32 0, i32 10239, i32 1}
!221 = metadata !{metadata !222}
!222 = metadata !{i32 0, i32 31, metadata !223}
!223 = metadata !{metadata !224}
!224 = metadata !{metadata !"A", metadata !225, metadata !"float", i32 0, i32 31}
!225 = metadata !{metadata !226}
!226 = metadata !{i32 0, i32 3839, i32 1}
!227 = metadata !{metadata !228}
!228 = metadata !{i32 0, i32 31, metadata !229}
!229 = metadata !{metadata !230}
!230 = metadata !{metadata !"B", metadata !231, metadata !"float", i32 0, i32 31}
!231 = metadata !{metadata !232}
!232 = metadata !{i32 0, i32 6143, i32 1}
!233 = metadata !{metadata !234}
!234 = metadata !{i32 0, i32 31, metadata !235}
!235 = metadata !{metadata !236}
!236 = metadata !{metadata !"wA", metadata !237, metadata !"int", i32 0, i32 31}
!237 = metadata !{metadata !238}
!238 = metadata !{i32 0, i32 0, i32 0}
!239 = metadata !{metadata !240}
!240 = metadata !{i32 0, i32 31, metadata !241}
!241 = metadata !{metadata !242}
!242 = metadata !{metadata !"wB", metadata !237, metadata !"int", i32 0, i32 31}
!243 = metadata !{metadata !244}
!244 = metadata !{i32 0, i32 31, metadata !245}
!245 = metadata !{metadata !246}
!246 = metadata !{metadata !"gridDim.x", metadata !237, metadata !"unsigned int", i32 0, i32 31}
!247 = metadata !{metadata !248}
!248 = metadata !{i32 0, i32 31, metadata !249}
!249 = metadata !{metadata !250}
!250 = metadata !{metadata !"gridDim.y", metadata !237, metadata !"unsigned int", i32 0, i32 31}
!251 = metadata !{metadata !252}
!252 = metadata !{i32 0, i32 31, metadata !253}
!253 = metadata !{metadata !254}
!254 = metadata !{metadata !"gridDim.z", metadata !237, metadata !"unsigned int", i32 0, i32 31}
!255 = metadata !{metadata !256}
!256 = metadata !{i32 0, i32 31, metadata !257}
!257 = metadata !{metadata !258}
!258 = metadata !{metadata !"blockDim.x", metadata !237, metadata !"unsigned int", i32 0, i32 31}
!259 = metadata !{metadata !260}
!260 = metadata !{i32 0, i32 31, metadata !261}
!261 = metadata !{metadata !262}
!262 = metadata !{metadata !"blockDim.y", metadata !237, metadata !"unsigned int", i32 0, i32 31}
!263 = metadata !{metadata !264}
!264 = metadata !{i32 0, i32 31, metadata !265}
!265 = metadata !{metadata !266}
!266 = metadata !{metadata !"blockDim.z", metadata !237, metadata !"unsigned int", i32 0, i32 31}
!267 = metadata !{i32 786689, metadata !268, metadata !"wB", metadata !52, i32 83886182, metadata !55, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!268 = metadata !{i32 786478, i32 0, metadata !52, metadata !"matrixMul", metadata !"matrixMul", metadata !"_Z9matrixMulPfS_S_ii4dim3S0_", metadata !52, i32 102, metadata !269, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !67, i32 103} ; [ DW_TAG_subprogram ]
!269 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !270, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!270 = metadata !{null, metadata !96, metadata !96, metadata !96, metadata !55, metadata !55, metadata !56, metadata !56}
!271 = metadata !{i32 102, i32 70, metadata !268, null}
!272 = metadata !{i32 786689, metadata !268, metadata !"wA", metadata !52, i32 67108966, metadata !55, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!273 = metadata !{i32 102, i32 62, metadata !268, null}
!274 = metadata !{i32 786689, metadata !268, metadata !"C", metadata !52, i32 16777318, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!275 = metadata !{i32 102, i32 27, metadata !268, null}
!276 = metadata !{i32 786689, metadata !268, metadata !"A", metadata !52, i32 33554534, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!277 = metadata !{i32 102, i32 41, metadata !268, null}
!278 = metadata !{i32 786689, metadata !268, metadata !"B", metadata !52, i32 50331750, metadata !96, i32 0, i32 0} ; [ DW_TAG_arg_variable ]
!279 = metadata !{i32 102, i32 55, metadata !268, null}
!280 = metadata !{i32 786688, metadata !281, metadata !"Csub_block_block0", metadata !52, i32 111, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!281 = metadata !{i32 786443, metadata !268, i32 103, i32 1, metadata !52, i32 28} ; [ DW_TAG_lexical_block ]
!282 = metadata !{i32 111, i32 10, metadata !281, null}
!283 = metadata !{i32 141, i32 1, metadata !284, null}
!284 = metadata !{i32 786443, metadata !285, i32 126, i32 1, metadata !52, i32 32} ; [ DW_TAG_lexical_block ]
!285 = metadata !{i32 786443, metadata !286, i32 125, i32 1, metadata !52, i32 31} ; [ DW_TAG_lexical_block ]
!286 = metadata !{i32 786443, metadata !287, i32 123, i32 1, metadata !52, i32 30} ; [ DW_TAG_lexical_block ]
!287 = metadata !{i32 786443, metadata !281, i32 122, i32 1, metadata !52, i32 29} ; [ DW_TAG_lexical_block ]
!288 = metadata !{i32 122, i32 6, metadata !287, null}
!289 = metadata !{i32 790529, metadata !290, metadata !"blockIdx_block0.y", null, i32 116, metadata !124, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!290 = metadata !{i32 786688, metadata !281, metadata !"blockIdx_block0", metadata !52, i32 116, metadata !56, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!291 = metadata !{i32 124, i32 1, metadata !286, null}
!292 = metadata !{i32 122, i32 61, metadata !287, null}
!293 = metadata !{i32 790529, metadata !294, metadata !"blockIdx_loop.y", null, i32 121, metadata !124, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!294 = metadata !{i32 786688, metadata !281, metadata !"blockIdx_loop", metadata !52, i32 121, metadata !56, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!295 = metadata !{i32 137, i32 1, metadata !284, null}
!296 = metadata !{i32 138, i32 1, metadata !284, null}
!297 = metadata !{i32 125, i32 61, metadata !285, null}
!298 = metadata !{i32 790529, metadata !294, metadata !"blockIdx_loop.x", null, i32 121, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!299 = metadata !{i32 125, i32 6, metadata !285, null}
!300 = metadata !{i32 126, i32 2, metadata !284, null}
!301 = metadata !{i32 790529, metadata !290, metadata !"blockIdx_block0.x", null, i32 116, metadata !136, i32 0, i32 0} ; [ DW_TAG_auto_variable_field ]
!302 = metadata !{i32 127, i32 1, metadata !284, null}
!303 = metadata !{i32 132, i32 1, metadata !284, null}
!304 = metadata !{i32 133, i32 1, metadata !284, null}
!305 = metadata !{i32 134, i32 1, metadata !284, null}
!306 = metadata !{i32 786688, metadata !281, metadata !"bx_block0", metadata !52, i32 104, metadata !55, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!307 = metadata !{i32 135, i32 1, metadata !284, null}
!308 = metadata !{i32 786688, metadata !281, metadata !"by_block0", metadata !52, i32 105, metadata !55, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!309 = metadata !{i32 136, i32 1, metadata !284, null}
!310 = metadata !{i32 786688, metadata !281, metadata !"a_block0", metadata !52, i32 112, metadata !55, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!311 = metadata !{i32 147, i32 6, metadata !312, null}
!312 = metadata !{i32 786443, metadata !284, i32 147, i32 1, metadata !52, i32 33} ; [ DW_TAG_lexical_block ]
!313 = metadata !{i32 786688, metadata !281, metadata !"aBegin_block0", metadata !52, i32 106, metadata !55, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!314 = metadata !{i32 786688, metadata !281, metadata !"aEnd_block0", metadata !52, i32 107, metadata !55, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!315 = metadata !{i32 140, i32 1, metadata !284, null}
!316 = metadata !{i32 786688, metadata !281, metadata !"b_block0", metadata !52, i32 113, metadata !55, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!317 = metadata !{i32 786688, metadata !281, metadata !"bBegin_block0", metadata !52, i32 109, metadata !55, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!318 = metadata !{i32 786688, metadata !281, metadata !"bStep_block0", metadata !52, i32 110, metadata !55, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!319 = metadata !{i32 786689, metadata !320, metadata !"Csub_block", null, i32 6, metadata !105, i32 0, metadata !323} ; [ DW_TAG_arg_variable ]
!320 = metadata !{i32 786478, i32 0, metadata !52, metadata !"matrixMul_CMP_5", metadata !"matrixMul_CMP_5", metadata !"_Z15matrixMul_CMP_5i4dim3S_S_PA16_f", metadata !52, i32 6, metadata !321, i1 false, i1 true, i32 0, i32 0, null, i32 256, i1 false, null, null, null, metadata !67, i32 7} ; [ DW_TAG_subprogram ]
!321 = metadata !{i32 786453, i32 0, metadata !"", i32 0, i32 0, i64 0, i64 0, i64 0, i32 0, null, metadata !322, i32 0, i32 0} ; [ DW_TAG_subroutine_type ]
!322 = metadata !{null, metadata !55, metadata !56, metadata !56, metadata !56, metadata !90}
!323 = metadata !{i32 142, i32 1, metadata !284, null}
!324 = metadata !{i32 6, i32 102, metadata !320, metadata !323}
!325 = metadata !{i32 12, i32 6, metadata !326, metadata !323}
!326 = metadata !{i32 786443, metadata !327, i32 12, i32 1, metadata !52, i32 2} ; [ DW_TAG_lexical_block ]
!327 = metadata !{i32 786443, metadata !328, i32 10, i32 1, metadata !52, i32 1} ; [ DW_TAG_lexical_block ]
!328 = metadata !{i32 786443, metadata !320, i32 7, i32 1, metadata !52, i32 0} ; [ DW_TAG_lexical_block ]
!329 = metadata !{i32 12, i32 45, metadata !326, metadata !323}
!330 = metadata !{i32 790529, metadata !331, metadata !"threadIdx.z", null, i32 8, metadata !121, i32 0, metadata !323} ; [ DW_TAG_auto_variable_field ]
!331 = metadata !{i32 786688, metadata !328, metadata !"threadIdx", metadata !52, i32 8, metadata !56, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!332 = metadata !{i32 790529, metadata !331, metadata !"threadIdx.y", null, i32 8, metadata !124, i32 0, metadata !323} ; [ DW_TAG_auto_variable_field ]
!333 = metadata !{i32 13, i32 45, metadata !334, metadata !323}
!334 = metadata !{i32 786443, metadata !326, i32 13, i32 1, metadata !52, i32 3} ; [ DW_TAG_lexical_block ]
!335 = metadata !{i32 13, i32 6, metadata !334, metadata !323}
!336 = metadata !{i32 14, i32 6, metadata !337, metadata !323}
!337 = metadata !{i32 786443, metadata !334, i32 14, i32 1, metadata !52, i32 4} ; [ DW_TAG_lexical_block ]
!338 = metadata !{i32 14, i32 45, metadata !337, metadata !323}
!339 = metadata !{i32 17, i32 1, metadata !340, metadata !323}
!340 = metadata !{i32 786443, metadata !337, i32 15, i32 1, metadata !52, i32 5} ; [ DW_TAG_lexical_block ]
!341 = metadata !{i32 790529, metadata !331, metadata !"threadIdx.x", null, i32 8, metadata !136, i32 0, metadata !323} ; [ DW_TAG_auto_variable_field ]
!342 = metadata !{i32 786688, metadata !343, metadata !"As", metadata !52, i32 149, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!343 = metadata !{i32 786443, metadata !312, i32 148, i32 1, metadata !52, i32 34} ; [ DW_TAG_lexical_block ]
!344 = metadata !{i32 149, i32 10, metadata !343, null}
!345 = metadata !{i32 786688, metadata !343, metadata !"Bs", metadata !52, i32 150, metadata !105, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!346 = metadata !{i32 150, i32 10, metadata !343, null}
!347 = metadata !{i32 153, i32 1, metadata !343, null}
!348 = metadata !{i32 157, i32 1, metadata !343, null}
!349 = metadata !{i32 147, i32 83, metadata !312, null}
!350 = metadata !{i32 160, i32 1, metadata !284, null}
!351 = metadata !{i32 786688, metadata !281, metadata !"c_block0", metadata !52, i32 115, metadata !55, i32 0, i32 0} ; [ DW_TAG_auto_variable ]
!352 = metadata !{i32 163, i32 1, metadata !284, null}
!353 = metadata !{i32 166, i32 1, metadata !284, null}
!354 = metadata !{i32 168, i32 1, metadata !281, null}
