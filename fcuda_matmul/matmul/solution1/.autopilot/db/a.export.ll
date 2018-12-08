; ModuleID = '/home/xu67/thesis_fcuda/fcuda/fcuda-benchmarks/matmul/matmul/solution1/.autopilot/db/a.o.2.bc'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@matrixMul_str = internal unnamed_addr constant [10 x i8] c"matrixMul\00"
@llvm_global_ctors_1 = appending global [1 x void ()*] [void ()* @_GLOBAL__I_a]
@llvm_global_ctors_0 = appending global [1 x i32] [i32 65535]
@p_str4 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@p_str3 = private unnamed_addr constant [7 x i8] c"ap_bus\00", align 1
@p_str2 = private unnamed_addr constant [12 x i8] c"hls_label_1\00", align 1
@p_str1 = private unnamed_addr constant [4 x i8] c"lp1\00", align 1
@p_str = private unnamed_addr constant [12 x i8] c"hls_label_0\00", align 1

define internal fastcc void @matrixMul_matrixMul_TRN_6(i32 %blockDim_x, i32 %blockDim_y, i32 %blockDim_z, [256 x float]* nocapture %As, float* %A, i32 %a_r, i32 %wA, [256 x float]* nocapture %Bs, float* %B, i32 %b_r, i32 %wB) {
  call void (...)* @_ssdm_op_SpecInterface(float* %B, [7 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 6144, [1 x i8]* @p_str4, [1 x i8]* @p_str4, [1 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str4) nounwind
  call void (...)* @_ssdm_op_SpecInterface(float* %A, [7 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 3840, [1 x i8]* @p_str4, [1 x i8]* @p_str4, [1 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str4) nounwind
  %wB_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %wB)
  %b_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %b_r)
  %wA_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %wA)
  %a_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %a_r)
  %blockDim_z_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_z)
  %blockDim_y_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_y)
  %blockDim_x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_x)
  br label %.loopexit30

.loopexit30:                                      ; preds = %.preheader, %0
  %threadIdx_2 = phi i32 [ 0, %0 ], [ %threadIdx_z, %.preheader ]
  %exitcond2 = icmp eq i32 %threadIdx_2, %blockDim_z_read
  %threadIdx_z = add i32 %threadIdx_2, 1
  br i1 %exitcond2, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %2, %.loopexit30
  %threadIdx_y = phi i32 [ 0, %.loopexit30 ], [ %tmp_1, %2 ]
  %phi_mul = phi i32 [ 0, %.loopexit30 ], [ %next_mul, %2 ]
  %phi_mul1 = phi i32 [ 0, %.loopexit30 ], [ %next_mul1, %2 ]
  %next_mul1 = add i32 %phi_mul1, %wB_read
  %next_mul = add i32 %phi_mul, %wA_read
  %exitcond1 = icmp eq i32 %threadIdx_y, %blockDim_y_read
  %tmp_1 = add i32 %threadIdx_y, 1
  br i1 %exitcond1, label %.loopexit30, label %1

; <label>:1                                       ; preds = %.preheader
  %tmp = trunc i32 %threadIdx_y to i6
  %tmp_5_cast = call i10 @_ssdm_op_BitConcatenate.i10.i6.i4(i6 %tmp, i4 0)
  %tmp_7 = add i32 %phi_mul, %a_read
  %tmp_s = zext i32 %tmp_7 to i64
  %tmp_2 = add i32 %phi_mul1, %b_read
  %tmp_3 = zext i32 %tmp_2 to i64
  %A_addr = getelementptr inbounds float* %A, i64 %tmp_s
  %B_addr = getelementptr inbounds float* %B, i64 %tmp_3
  %A_addr_1_rd_req = call i1 @_ssdm_op_ReadReq.ap_bus.floatP(float* %A_addr, i32 %blockDim_x_read)
  %B_addr_1_rd_req = call i1 @_ssdm_op_ReadReq.ap_bus.floatP(float* %B_addr, i32 %blockDim_x_read)
  br label %2

; <label>:2                                       ; preds = %3, %1
  %threadIdx = phi i32 [ 0, %1 ], [ %threadIdx_x, %3 ]
  %exitcond = icmp eq i32 %threadIdx, %blockDim_x_read
  %threadIdx_x = add i32 %threadIdx, 1
  br i1 %exitcond, label %.preheader, label %3

; <label>:3                                       ; preds = %2
  %A_addr_read = call float @_ssdm_op_Read.ap_bus.floatP(float* %A_addr)
  %tmp_4 = trunc i32 %threadIdx to i10
  %tmp_5 = add i10 %tmp_5_cast, %tmp_4
  %tmp_14_cast = zext i10 %tmp_5 to i64
  %As_addr = getelementptr [256 x float]* %As, i64 0, i64 %tmp_14_cast
  %Bs_addr = getelementptr [256 x float]* %Bs, i64 0, i64 %tmp_14_cast
  store float %A_addr_read, float* %As_addr, align 4
  %B_addr_read = call float @_ssdm_op_Read.ap_bus.floatP(float* %B_addr)
  store float %B_addr_read, float* %Bs_addr, align 4
  br label %2

.loopexit:                                        ; preds = %.loopexit30
  ret void
}

define internal fastcc void @matrixMul_matrixMul_TRN_10_wrapper(i32 %blockDim_x, i32 %blockDim_y, i32 %blockDim_z, float* %C, [256 x float]* nocapture %Csub_block_block0, i32 %c_block0, i32 %wB) {
  call void (...)* @_ssdm_op_SpecInterface(float* %C, [7 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 10240, [1 x i8]* @p_str4, [1 x i8]* @p_str4, [1 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str4) nounwind
  %wB_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %wB)
  %c_block0_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %c_block0)
  %blockDim_z_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_z)
  %blockDim_y_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_y)
  %blockDim_x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_x)
  call fastcc void @matrixMul_matrixMul_TRN_10(i32 %blockDim_x_read, i32 %blockDim_y_read, i32 %blockDim_z_read, float* %C, [256 x float]* %Csub_block_block0, i32 %c_block0_read, i32 %wB_read)
  ret void
}

define internal fastcc void @matrixMul_matrixMul_TRN_10(i32 %blockDim_x, i32 %blockDim_y, i32 %blockDim_z, float* %C, [256 x float]* nocapture %Csub_block, i32 %c_r, i32 %wB) {
  call void (...)* @_ssdm_op_SpecInterface(float* %C, [7 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 10240, [1 x i8]* @p_str4, [1 x i8]* @p_str4, [1 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str4) nounwind
  %wB_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %wB)
  %c_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %c_r)
  %blockDim_z_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_z)
  %blockDim_y_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_y)
  %blockDim_x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_x)
  br label %.loopexit14

.loopexit14:                                      ; preds = %.preheader, %0
  %threadIdx_2 = phi i32 [ 0, %0 ], [ %threadIdx_z, %.preheader ]
  %exitcond2 = icmp eq i32 %threadIdx_2, %blockDim_z_read
  %threadIdx_z = add i32 %threadIdx_2, 1
  br i1 %exitcond2, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %2, %.loopexit14
  %threadIdx_y = phi i32 [ 0, %.loopexit14 ], [ %tmp_6, %2 ]
  %phi_mul = phi i32 [ 0, %.loopexit14 ], [ %next_mul, %2 ]
  %next_mul = add i32 %phi_mul, %wB_read
  %exitcond1 = icmp eq i32 %threadIdx_y, %blockDim_y_read
  %tmp_6 = add i32 %threadIdx_y, 1
  br i1 %exitcond1, label %.loopexit14, label %1

; <label>:1                                       ; preds = %.preheader
  %tmp = trunc i32 %threadIdx_y to i6
  %tmp_17_cast = call i10 @_ssdm_op_BitConcatenate.i10.i6.i4(i6 %tmp, i4 0)
  %tmp_s = add i32 %phi_mul, %c_read
  %tmp_7 = zext i32 %tmp_s to i64
  %C_addr = getelementptr inbounds float* %C, i64 %tmp_7
  br label %2

; <label>:2                                       ; preds = %burstWrDataBB, %1
  %threadIdx = phi i32 [ 0, %1 ], [ %threadIdx_x, %burstWrDataBB ]
  %exitcond = icmp eq i32 %threadIdx, %blockDim_x_read
  %threadIdx_x = add i32 %threadIdx, 1
  br i1 %exitcond, label %.preheader, label %3

; <label>:3                                       ; preds = %2
  %tmp_5 = trunc i32 %threadIdx to i10
  %tmp_8 = add i10 %tmp_17_cast, %tmp_5
  %tmp_19_cast = zext i10 %tmp_8 to i64
  %Csub_block_addr = getelementptr [256 x float]* %Csub_block, i64 0, i64 %tmp_19_cast
  %Csub_block_load = load float* %Csub_block_addr, align 4
  %is_0iter = icmp eq i32 %threadIdx, 0
  br i1 %is_0iter, label %burstWrReqBB, label %burstWrDataBB

burstWrReqBB:                                     ; preds = %3
  %C_addr_1_wr_req = call i1 @_ssdm_op_WriteReq.ap_bus.floatP(float* %C_addr, i32 %blockDim_x_read)
  br label %burstWrDataBB

burstWrDataBB:                                    ; preds = %burstWrReqBB, %3
  call void @_ssdm_op_Write.ap_bus.floatP(float* %C_addr, float %Csub_block_load)
  br label %2

.loopexit:                                        ; preds = %.loopexit14
  ret void
}

define internal fastcc void @matrixMul_matrixMul_SNC_7(i32 %blockDim_x, i32 %blockDim_y, i32 %blockDim_z, [256 x float]* nocapture %Csub_block, [256 x float]* nocapture %As, [256 x float]* nocapture %Bs) {
  %blockDim_z_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_z)
  %blockDim_y_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_y)
  %blockDim_x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_x)
  br label %.loopexit18

.loopexit18:                                      ; preds = %.preheader2, %0
  %threadIdx_2 = phi i32 [ 0, %0 ], [ %threadIdx_z, %.preheader2 ]
  %exitcond3 = icmp eq i32 %threadIdx_2, %blockDim_z_read
  %threadIdx_z = add i32 %threadIdx_2, 1
  br i1 %exitcond3, label %.loopexit, label %.preheader2

.preheader2:                                      ; preds = %.preheader, %.loopexit18
  %threadIdx_y = phi i32 [ 0, %.loopexit18 ], [ %tmp_s, %.preheader ]
  %exitcond2 = icmp eq i32 %threadIdx_y, %blockDim_y_read
  %tmp_s = add i32 %threadIdx_y, 1
  br i1 %exitcond2, label %.loopexit18, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader2
  %tmp_6 = trunc i32 %threadIdx_y to i6
  %tmp_23_cast = call i10 @_ssdm_op_BitConcatenate.i10.i6.i4(i6 %tmp_6, i4 0)
  br label %.preheader

.preheader:                                       ; preds = %4, %.preheader.preheader
  %threadIdx_x = phi i32 [ %tmp_9, %4 ], [ 0, %.preheader.preheader ]
  %exitcond1 = icmp eq i32 %threadIdx_x, %blockDim_x_read
  %tmp_9 = add i32 %threadIdx_x, 1
  br i1 %exitcond1, label %.preheader2, label %1

; <label>:1                                       ; preds = %.preheader
  %tmp = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str)
  call void (...)* @_ssdm_op_SpecLoopName([4 x i8]* @p_str1) nounwind
  %tmp_1 = call i32 (...)* @_ssdm_op_SpecRegionBegin([4 x i8]* @p_str1)
  %tmp_7 = trunc i32 %threadIdx_x to i10
  %tmp_10 = add i10 %tmp_23_cast, %tmp_7
  %tmp_24_cast = zext i10 %tmp_10 to i64
  %Csub_block_addr = getelementptr [256 x float]* %Csub_block, i64 0, i64 %tmp_24_cast
  br label %2

; <label>:2                                       ; preds = %3, %1
  %k = phi i5 [ 0, %1 ], [ %k_1, %3 ]
  %exitcond = icmp eq i5 %k, -16
  %empty = call i32 (...)* @_ssdm_op_SpecLoopTripCount(i64 16, i64 16, i64 16)
  %k_1 = add i5 %k, 1
  br i1 %exitcond, label %4, label %3

; <label>:3                                       ; preds = %2
  %tmp_19_cast = zext i5 %k to i10
  %tmp_11 = add i10 %tmp_19_cast, %tmp_23_cast
  %tmp_25_cast = zext i10 %tmp_11 to i64
  %As_addr = getelementptr [256 x float]* %As, i64 0, i64 %tmp_25_cast
  %tmp_12 = call i9 @_ssdm_op_BitConcatenate.i9.i5.i4(i5 %k, i4 0)
  %tmp_27_cast = zext i9 %tmp_12 to i10
  %tmp_13 = add i10 %tmp_7, %tmp_27_cast
  %tmp_28_cast = zext i10 %tmp_13 to i64
  %Bs_addr = getelementptr [256 x float]* %Bs, i64 0, i64 %tmp_28_cast
  %As_load = load float* %As_addr, align 4
  %Bs_load = load float* %Bs_addr, align 4
  %tmp_14 = fmul float %As_load, %Bs_load
  %Csub_block_load = load float* %Csub_block_addr, align 4
  %tmp_15 = fadd float %Csub_block_load, %tmp_14
  store float %tmp_15, float* %Csub_block_addr, align 4
  br label %2

; <label>:4                                       ; preds = %2
  %empty_3 = call i32 (...)* @_ssdm_op_SpecRegionEnd([4 x i8]* @p_str1, i32 %tmp_1)
  %empty_4 = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str, i32 %tmp)
  br label %.preheader

.loopexit:                                        ; preds = %.loopexit18
  ret void
}

define void @matrixMul(float* %C, float* %A, float* %B, i32 %wA, i32 %wB, i32 %gridDim_x, i32 %gridDim_y, i32 %gridDim_z, i32 %blockDim_x, i32 %blockDim_y, i32 %blockDim_z) {
  call void (...)* @_ssdm_op_SpecBitsMap(float* %C), !map !50
  call void (...)* @_ssdm_op_SpecBitsMap(float* %A), !map !56
  call void (...)* @_ssdm_op_SpecBitsMap(float* %B), !map !62
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %wA), !map !68
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %wB), !map !74
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %gridDim_x), !map !78
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %gridDim_y), !map !82
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %gridDim_z), !map !86
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %blockDim_x), !map !90
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %blockDim_y), !map !94
  call void (...)* @_ssdm_op_SpecBitsMap(i32 %blockDim_z), !map !98
  call void (...)* @_ssdm_op_SpecTopModule([10 x i8]* @matrixMul_str) nounwind
  %blockDim_z_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_z)
  %blockDim_y_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_y)
  %blockDim_x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %blockDim_x)
  %gridDim_y_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %gridDim_y)
  %gridDim_x_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %gridDim_x)
  %wB_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %wB)
  %wA_read = call i32 @_ssdm_op_Read.ap_auto.i32(i32 %wA)
  %Csub_block_block0 = alloca [256 x float], align 4
  %As = alloca [256 x float], align 4
  %Bs = alloca [256 x float], align 4
  %bStep_block0 = shl i32 %wB_read, 4
  br label %.loopexit10

.loopexit10:                                      ; preds = %.preheader, %0
  %blockIdx_block0_y = phi i32 [ 0, %0 ], [ %blockIdx_loop_y, %.preheader ]
  %phi_mul = phi i32 [ 0, %0 ], [ %next_mul, %.preheader ]
  %phi_mul1 = phi i32 [ 0, %0 ], [ %next_mul2, %.preheader ]
  %next_mul2 = add i32 %phi_mul1, %wB_read
  %next_mul = add i32 %phi_mul, %wA_read
  %tmp_s = icmp eq i32 %blockIdx_block0_y, %gridDim_y_read
  %blockIdx_loop_y = add i32 %blockIdx_block0_y, 1
  br i1 %tmp_s, label %7, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.loopexit10
  %a_block0_2 = shl i32 %phi_mul, 4
  %tmp1 = add i32 -1, %a_block0_2
  %aEnd_block0 = add i32 %wA_read, %tmp1
  br label %.preheader

.preheader:                                       ; preds = %6, %.preheader.preheader
  %blockIdx_loop_x = phi i32 [ %tmp_17, %6 ], [ 0, %.preheader.preheader ]
  %tmp_16 = icmp eq i32 %blockIdx_loop_x, %gridDim_x_read
  %tmp_17 = add i32 %blockIdx_loop_x, 1
  br i1 %tmp_16, label %.loopexit10, label %1

; <label>:1                                       ; preds = %.preheader
  %tmp_2 = call i32 (...)* @_ssdm_op_SpecRegionBegin([12 x i8]* @p_str2)
  call void (...)* @_ssdm_op_SpecInterface(float* %A, [7 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 3840, [1 x i8]* @p_str4, [1 x i8]* @p_str4, [1 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str4) nounwind
  call void (...)* @_ssdm_op_SpecInterface(float* %B, [7 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 6144, [1 x i8]* @p_str4, [1 x i8]* @p_str4, [1 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str4) nounwind
  call void (...)* @_ssdm_op_SpecInterface(float* %C, [7 x i8]* @p_str3, i32 0, i32 0, i32 0, i32 10240, [1 x i8]* @p_str4, [1 x i8]* @p_str4, [1 x i8]* @p_str4, i32 0, i32 0, i32 0, i32 0, [1 x i8]* @p_str4) nounwind
  %b_block0_2 = shl i32 %blockIdx_loop_x, 4
  br label %.loopexit

.loopexit:                                        ; preds = %.preheader.i, %1
  %threadIdx_2_i = phi i32 [ 0, %1 ], [ %threadIdx_z, %.preheader.i ]
  %exitcond2_i = icmp eq i32 %threadIdx_2_i, %blockDim_z_read
  %threadIdx_z = add i32 %threadIdx_2_i, 1
  br i1 %exitcond2_i, label %matrixMul_CMP_5.exit, label %.preheader.i

.preheader.i:                                     ; preds = %3, %.loopexit
  %threadIdx_y = phi i32 [ 0, %.loopexit ], [ %tmp_23_i, %3 ]
  %exitcond1_i = icmp eq i32 %threadIdx_y, %blockDim_y_read
  %tmp_23_i = add i32 %threadIdx_y, 1
  br i1 %exitcond1_i, label %.loopexit, label %2

; <label>:2                                       ; preds = %.preheader.i
  %tmp_12 = trunc i32 %threadIdx_y to i6
  %tmp_34_cast = call i10 @_ssdm_op_BitConcatenate.i10.i6.i4(i6 %tmp_12, i4 0)
  br label %3

; <label>:3                                       ; preds = %4, %2
  %threadIdx_i = phi i32 [ 0, %2 ], [ %threadIdx_x, %4 ]
  %exitcond_i = icmp eq i32 %threadIdx_i, %blockDim_x_read
  %threadIdx_x = add i32 %threadIdx_i, 1
  br i1 %exitcond_i, label %.preheader.i, label %4

; <label>:4                                       ; preds = %3
  %tmp_13 = trunc i32 %threadIdx_i to i10
  %tmp_19 = add i10 %tmp_34_cast, %tmp_13
  %tmp_35_cast = zext i10 %tmp_19 to i64
  %Csub_block_block0_addr = getelementptr [256 x float]* %Csub_block_block0, i64 0, i64 %tmp_35_cast
  store float 0.000000e+00, float* %Csub_block_block0_addr, align 4
  br label %3

matrixMul_CMP_5.exit:                             ; preds = %.loopexit, %5
  %a_block = phi i32 [ %a_block0, %5 ], [ %a_block0_2, %.loopexit ]
  %b_block = phi i32 [ %b_block0, %5 ], [ %b_block0_2, %.loopexit ]
  %tmp_18 = icmp sgt i32 %a_block, %aEnd_block0
  br i1 %tmp_18, label %6, label %5

; <label>:5                                       ; preds = %matrixMul_CMP_5.exit
  call fastcc void @matrixMul_matrixMul_TRN_6(i32 %blockDim_x_read, i32 %blockDim_y_read, i32 %blockDim_z_read, [256 x float]* %As, float* %A, i32 %a_block, i32 %wA_read, [256 x float]* %Bs, float* %B, i32 %b_block, i32 %wB_read)
  call fastcc void @matrixMul_matrixMul_SNC_7(i32 %blockDim_x_read, i32 %blockDim_y_read, i32 %blockDim_z_read, [256 x float]* %Csub_block_block0, [256 x float]* %As, [256 x float]* %Bs)
  %a_block0 = add nsw i32 %a_block, 16
  %b_block0 = add nsw i32 %bStep_block0, %b_block
  br label %matrixMul_CMP_5.exit

; <label>:6                                       ; preds = %matrixMul_CMP_5.exit
  %tmp = add i32 %phi_mul1, %blockIdx_loop_x
  %c_block0 = shl i32 %tmp, 4
  call fastcc void @matrixMul_matrixMul_TRN_10_wrapper(i32 %blockDim_x_read, i32 %blockDim_y_read, i32 %blockDim_z_read, float* %C, [256 x float]* %Csub_block_block0, i32 %c_block0, i32 %wB_read)
  %empty = call i32 (...)* @_ssdm_op_SpecRegionEnd([12 x i8]* @p_str2, i32 %tmp_2)
  br label %.preheader

; <label>:7                                       ; preds = %.loopexit10
  ret void
}

declare void @llvm.dbg.value(metadata, i64, metadata) nounwind readnone

declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone

define weak i1 @_ssdm_op_WriteReq.ap_bus.floatP(float*, i32) {
entry:
  ret i1 true
}

define weak void @_ssdm_op_Write.ap_bus.floatP(float*, float) {
entry:
  store float %1, float* %0
  ret void
}

define weak void @_ssdm_op_SpecTopModule(...) {
entry:
  ret void
}

define weak i32 @_ssdm_op_SpecRegionEnd(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecRegionBegin(...) {
entry:
  ret i32 0
}

define weak i32 @_ssdm_op_SpecLoopTripCount(...) {
entry:
  ret i32 0
}

define weak void @_ssdm_op_SpecLoopName(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecInterface(...) nounwind {
entry:
  ret void
}

define weak void @_ssdm_op_SpecBitsMap(...) {
entry:
  ret void
}

define weak i1 @_ssdm_op_ReadReq.ap_bus.floatP(float*, i32) {
entry:
  ret i1 true
}

define weak float @_ssdm_op_Read.ap_bus.floatP(float*) {
entry:
  %empty = load float* %0
  ret float %empty
}

define weak i32 @_ssdm_op_Read.ap_auto.i32(i32) {
entry:
  ret i32 %0
}

declare i6 @_ssdm_op_PartSelect.i6.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i28 @_ssdm_op_PartSelect.i28.i32.i32.i32(i32, i32, i32) nounwind readnone

declare i10 @_ssdm_op_PartSelect.i10.i32.i32.i32(i32, i32, i32) nounwind readnone

define weak i9 @_ssdm_op_BitConcatenate.i9.i5.i4(i5, i4) nounwind readnone {
entry:
  %empty = zext i5 %0 to i9
  %empty_5 = zext i4 %1 to i9
  %empty_6 = shl i9 %empty, 4
  %empty_7 = or i9 %empty_6, %empty_5
  ret i9 %empty_7
}

declare i32 @_ssdm_op_BitConcatenate.i32.i28.i4(i28, i4) nounwind readnone

define weak i10 @_ssdm_op_BitConcatenate.i10.i6.i4(i6, i4) nounwind readnone {
entry:
  %empty = zext i6 %0 to i10
  %empty_8 = zext i4 %1 to i10
  %empty_9 = shl i10 %empty, 4
  %empty_10 = or i10 %empty_9, %empty_8
  ret i10 %empty_10
}

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
!50 = metadata !{metadata !51}
!51 = metadata !{i32 0, i32 31, metadata !52}
!52 = metadata !{metadata !53}
!53 = metadata !{metadata !"C", metadata !54, metadata !"float", i32 0, i32 31}
!54 = metadata !{metadata !55}
!55 = metadata !{i32 0, i32 10239, i32 1}
!56 = metadata !{metadata !57}
!57 = metadata !{i32 0, i32 31, metadata !58}
!58 = metadata !{metadata !59}
!59 = metadata !{metadata !"A", metadata !60, metadata !"float", i32 0, i32 31}
!60 = metadata !{metadata !61}
!61 = metadata !{i32 0, i32 3839, i32 1}
!62 = metadata !{metadata !63}
!63 = metadata !{i32 0, i32 31, metadata !64}
!64 = metadata !{metadata !65}
!65 = metadata !{metadata !"B", metadata !66, metadata !"float", i32 0, i32 31}
!66 = metadata !{metadata !67}
!67 = metadata !{i32 0, i32 6143, i32 1}
!68 = metadata !{metadata !69}
!69 = metadata !{i32 0, i32 31, metadata !70}
!70 = metadata !{metadata !71}
!71 = metadata !{metadata !"wA", metadata !72, metadata !"int", i32 0, i32 31}
!72 = metadata !{metadata !73}
!73 = metadata !{i32 0, i32 0, i32 0}
!74 = metadata !{metadata !75}
!75 = metadata !{i32 0, i32 31, metadata !76}
!76 = metadata !{metadata !77}
!77 = metadata !{metadata !"wB", metadata !72, metadata !"int", i32 0, i32 31}
!78 = metadata !{metadata !79}
!79 = metadata !{i32 0, i32 31, metadata !80}
!80 = metadata !{metadata !81}
!81 = metadata !{metadata !"gridDim.x", metadata !72, metadata !"unsigned int", i32 0, i32 31}
!82 = metadata !{metadata !83}
!83 = metadata !{i32 0, i32 31, metadata !84}
!84 = metadata !{metadata !85}
!85 = metadata !{metadata !"gridDim.y", metadata !72, metadata !"unsigned int", i32 0, i32 31}
!86 = metadata !{metadata !87}
!87 = metadata !{i32 0, i32 31, metadata !88}
!88 = metadata !{metadata !89}
!89 = metadata !{metadata !"gridDim.z", metadata !72, metadata !"unsigned int", i32 0, i32 31}
!90 = metadata !{metadata !91}
!91 = metadata !{i32 0, i32 31, metadata !92}
!92 = metadata !{metadata !93}
!93 = metadata !{metadata !"blockDim.x", metadata !72, metadata !"unsigned int", i32 0, i32 31}
!94 = metadata !{metadata !95}
!95 = metadata !{i32 0, i32 31, metadata !96}
!96 = metadata !{metadata !97}
!97 = metadata !{metadata !"blockDim.y", metadata !72, metadata !"unsigned int", i32 0, i32 31}
!98 = metadata !{metadata !99}
!99 = metadata !{i32 0, i32 31, metadata !100}
!100 = metadata !{metadata !101}
!101 = metadata !{metadata !"blockDim.z", metadata !72, metadata !"unsigned int", i32 0, i32 31}
