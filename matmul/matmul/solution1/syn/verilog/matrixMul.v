// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="matrixMul,hls_ip_2016_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=8.750000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=3,HLS_SYN_DSP=5,HLS_SYN_FF=2206,HLS_SYN_LUT=2545}" *)

module matrixMul (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        C_req_din,
        C_req_full_n,
        C_req_write,
        C_rsp_empty_n,
        C_rsp_read,
        C_address,
        C_datain,
        C_dataout,
        C_size,
        A_req_din,
        A_req_full_n,
        A_req_write,
        A_rsp_empty_n,
        A_rsp_read,
        A_address,
        A_datain,
        A_dataout,
        A_size,
        B_req_din,
        B_req_full_n,
        B_req_write,
        B_rsp_empty_n,
        B_rsp_read,
        B_address,
        B_datain,
        B_dataout,
        B_size,
        wA,
        wB,
        gridDim_x,
        gridDim_y,
        gridDim_z,
        blockDim_x,
        blockDim_y,
        blockDim_z
);

parameter    ap_ST_st1_fsm_0 = 11'b1;
parameter    ap_ST_st2_fsm_1 = 11'b10;
parameter    ap_ST_st3_fsm_2 = 11'b100;
parameter    ap_ST_st4_fsm_3 = 11'b1000;
parameter    ap_ST_st5_fsm_4 = 11'b10000;
parameter    ap_ST_st6_fsm_5 = 11'b100000;
parameter    ap_ST_st7_fsm_6 = 11'b1000000;
parameter    ap_ST_st8_fsm_7 = 11'b10000000;
parameter    ap_ST_st9_fsm_8 = 11'b100000000;
parameter    ap_ST_st10_fsm_9 = 11'b1000000000;
parameter    ap_ST_st11_fsm_10 = 11'b10000000000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv32_5 = 32'b101;
parameter    ap_const_lv32_6 = 32'b110;
parameter    ap_const_lv32_A = 32'b1010;
parameter    ap_const_lv32_9 = 32'b1001;
parameter    ap_const_lv32_8 = 32'b1000;
parameter    ap_const_lv32_7 = 32'b111;
parameter    ap_const_lv32_FFFFFFFF = 32'b11111111111111111111111111111111;
parameter    ap_const_lv4_0 = 4'b0000;
parameter    ap_const_lv32_10 = 32'b10000;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output   C_req_din;
input   C_req_full_n;
output   C_req_write;
input   C_rsp_empty_n;
output   C_rsp_read;
output  [31:0] C_address;
input  [31:0] C_datain;
output  [31:0] C_dataout;
output  [31:0] C_size;
output   A_req_din;
input   A_req_full_n;
output   A_req_write;
input   A_rsp_empty_n;
output   A_rsp_read;
output  [31:0] A_address;
input  [31:0] A_datain;
output  [31:0] A_dataout;
output  [31:0] A_size;
output   B_req_din;
input   B_req_full_n;
output   B_req_write;
input   B_rsp_empty_n;
output   B_rsp_read;
output  [31:0] B_address;
input  [31:0] B_datain;
output  [31:0] B_dataout;
output  [31:0] B_size;
input  [31:0] wA;
input  [31:0] wB;
input  [31:0] gridDim_x;
input  [31:0] gridDim_y;
input  [31:0] gridDim_z;
input  [31:0] blockDim_x;
input  [31:0] blockDim_y;
input  [31:0] blockDim_z;

reg ap_done;
reg ap_idle;
reg ap_ready;

(* fsm_encoding = "none" *) reg   [10:0] ap_CS_fsm;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_26;
wire   [31:0] bStep_block0_fu_280_p2;
reg   [31:0] bStep_block0_reg_477;
wire   [31:0] next_mul2_fu_286_p2;
reg   [31:0] next_mul2_reg_482;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_106;
wire   [31:0] next_mul_fu_291_p2;
reg   [31:0] next_mul_reg_487;
wire   [31:0] blockIdx_loop_y_fu_301_p2;
reg   [31:0] blockIdx_loop_y_reg_495;
wire   [31:0] a_block0_2_fu_307_p2;
reg   [31:0] a_block0_2_reg_500;
wire   [0:0] tmp_s_fu_296_p2;
wire   [31:0] aEnd_block0_fu_319_p2;
reg   [31:0] aEnd_block0_reg_505;
wire   [31:0] tmp_17_fu_329_p2;
reg   [31:0] tmp_17_reg_513;
reg    ap_sig_cseq_ST_st3_fsm_2;
reg    ap_sig_127;
wire   [31:0] b_block0_2_fu_335_p2;
reg   [31:0] b_block0_2_reg_518;
wire   [0:0] tmp_16_fu_324_p2;
wire   [31:0] threadIdx_z_fu_346_p2;
reg   [31:0] threadIdx_z_reg_526;
reg    ap_sig_cseq_ST_st4_fsm_3;
reg    ap_sig_141;
wire   [31:0] tmp_23_i_fu_357_p2;
reg   [31:0] tmp_23_i_reg_534;
reg    ap_sig_cseq_ST_st5_fsm_4;
reg    ap_sig_150;
wire   [9:0] tmp_34_cast_fu_367_p3;
reg   [9:0] tmp_34_cast_reg_539;
wire   [0:0] exitcond1_i_fu_352_p2;
wire   [31:0] threadIdx_x_fu_380_p2;
reg    ap_sig_cseq_ST_st6_fsm_5;
reg    ap_sig_164;
wire   [31:0] a_block0_fu_405_p2;
reg   [31:0] a_block0_reg_555;
reg    ap_sig_cseq_ST_st7_fsm_6;
reg    ap_sig_173;
wire   [0:0] tmp_18_fu_400_p2;
wire   [31:0] b_block0_fu_411_p2;
reg   [31:0] b_block0_reg_560;
wire   [31:0] c_block0_fu_422_p2;
reg   [31:0] c_block0_reg_565;
reg   [7:0] Csub_block_block0_address0;
reg    Csub_block_block0_ce0;
reg    Csub_block_block0_we0;
reg   [31:0] Csub_block_block0_d0;
wire   [31:0] Csub_block_block0_q0;
reg   [7:0] As_address0;
reg    As_ce0;
wire   [31:0] As_q0;
reg   [7:0] Bs_address0;
reg    Bs_ce0;
wire   [31:0] Bs_q0;
wire    grp_matrixMul_matrixMul_SNC_7_fu_239_ap_start;
wire    grp_matrixMul_matrixMul_SNC_7_fu_239_ap_done;
wire    grp_matrixMul_matrixMul_SNC_7_fu_239_ap_idle;
wire    grp_matrixMul_matrixMul_SNC_7_fu_239_ap_ready;
wire   [7:0] grp_matrixMul_matrixMul_SNC_7_fu_239_Csub_block_address0;
wire    grp_matrixMul_matrixMul_SNC_7_fu_239_Csub_block_ce0;
wire    grp_matrixMul_matrixMul_SNC_7_fu_239_Csub_block_we0;
wire   [31:0] grp_matrixMul_matrixMul_SNC_7_fu_239_Csub_block_d0;
wire   [7:0] grp_matrixMul_matrixMul_SNC_7_fu_239_As_address0;
wire    grp_matrixMul_matrixMul_SNC_7_fu_239_As_ce0;
wire   [7:0] grp_matrixMul_matrixMul_SNC_7_fu_239_Bs_address0;
wire    grp_matrixMul_matrixMul_SNC_7_fu_239_Bs_ce0;
wire    grp_matrixMul_matrixMul_TRN_6_fu_249_ap_start;
wire    grp_matrixMul_matrixMul_TRN_6_fu_249_ap_done;
wire    grp_matrixMul_matrixMul_TRN_6_fu_249_ap_idle;
wire    grp_matrixMul_matrixMul_TRN_6_fu_249_ap_ready;
wire   [7:0] grp_matrixMul_matrixMul_TRN_6_fu_249_As_address0;
wire    grp_matrixMul_matrixMul_TRN_6_fu_249_As_ce0;
wire    grp_matrixMul_matrixMul_TRN_6_fu_249_As_we0;
wire   [31:0] grp_matrixMul_matrixMul_TRN_6_fu_249_As_d0;
wire    grp_matrixMul_matrixMul_TRN_6_fu_249_A_req_din;
wire    grp_matrixMul_matrixMul_TRN_6_fu_249_A_req_write;
wire    grp_matrixMul_matrixMul_TRN_6_fu_249_A_rsp_read;
wire   [31:0] grp_matrixMul_matrixMul_TRN_6_fu_249_A_address;
wire   [31:0] grp_matrixMul_matrixMul_TRN_6_fu_249_A_dataout;
wire   [31:0] grp_matrixMul_matrixMul_TRN_6_fu_249_A_size;
wire   [7:0] grp_matrixMul_matrixMul_TRN_6_fu_249_Bs_address0;
wire    grp_matrixMul_matrixMul_TRN_6_fu_249_Bs_ce0;
wire    grp_matrixMul_matrixMul_TRN_6_fu_249_Bs_we0;
wire   [31:0] grp_matrixMul_matrixMul_TRN_6_fu_249_Bs_d0;
wire    grp_matrixMul_matrixMul_TRN_6_fu_249_B_req_din;
wire    grp_matrixMul_matrixMul_TRN_6_fu_249_B_req_write;
wire    grp_matrixMul_matrixMul_TRN_6_fu_249_B_rsp_read;
wire   [31:0] grp_matrixMul_matrixMul_TRN_6_fu_249_B_address;
wire   [31:0] grp_matrixMul_matrixMul_TRN_6_fu_249_B_dataout;
wire   [31:0] grp_matrixMul_matrixMul_TRN_6_fu_249_B_size;
wire    grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_start;
wire    grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_done;
wire    grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_idle;
wire    grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_ready;
wire    grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_req_din;
wire    grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_req_write;
wire    grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_rsp_read;
wire   [31:0] grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_address;
wire   [31:0] grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_dataout;
wire   [31:0] grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_size;
wire   [7:0] grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_Csub_block_block0_address0;
wire    grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_Csub_block_block0_ce0;
reg   [31:0] blockIdx_block0_y_reg_140;
reg   [31:0] phi_mul_reg_151;
reg   [31:0] phi_mul1_reg_162;
reg   [31:0] blockIdx_loop_x_reg_174;
reg    ap_sig_cseq_ST_st11_fsm_10;
reg    ap_sig_309;
reg   [31:0] threadIdx_2_i_reg_186;
reg   [31:0] threadIdx_y_reg_197;
wire   [0:0] exitcond2_i_fu_341_p2;
wire   [0:0] exitcond_i_fu_375_p2;
reg   [31:0] threadIdx_i_reg_208;
reg   [31:0] a_block_reg_219;
reg    ap_sig_cseq_ST_st10_fsm_9;
reg    ap_sig_337;
reg   [31:0] b_block_reg_229;
reg    ap_reg_grp_matrixMul_matrixMul_SNC_7_fu_239_ap_start;
reg    ap_sig_cseq_ST_st9_fsm_8;
reg    ap_sig_353;
reg    ap_reg_grp_matrixMul_matrixMul_TRN_6_fu_249_ap_start;
reg    ap_sig_cseq_ST_st8_fsm_7;
reg    ap_sig_362;
reg    ap_reg_grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_start;
wire   [63:0] tmp_35_cast_fu_395_p1;
wire   [31:0] tmp1_fu_313_p2;
wire   [5:0] tmp_12_fu_363_p1;
wire   [9:0] tmp_13_fu_386_p1;
wire   [9:0] tmp_19_fu_390_p2;
wire   [31:0] tmp_fu_416_p2;
reg   [10:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 11'b1;
#0 ap_reg_grp_matrixMul_matrixMul_SNC_7_fu_239_ap_start = 1'b0;
#0 ap_reg_grp_matrixMul_matrixMul_TRN_6_fu_249_ap_start = 1'b0;
#0 ap_reg_grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_start = 1'b0;
end

matrixMul_Csub_block_block0 #(
    .DataWidth( 32 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
Csub_block_block0_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(Csub_block_block0_address0),
    .ce0(Csub_block_block0_ce0),
    .we0(Csub_block_block0_we0),
    .d0(Csub_block_block0_d0),
    .q0(Csub_block_block0_q0)
);

matrixMul_Csub_block_block0 #(
    .DataWidth( 32 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
As_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(As_address0),
    .ce0(As_ce0),
    .we0(grp_matrixMul_matrixMul_TRN_6_fu_249_As_we0),
    .d0(grp_matrixMul_matrixMul_TRN_6_fu_249_As_d0),
    .q0(As_q0)
);

matrixMul_Csub_block_block0 #(
    .DataWidth( 32 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
Bs_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(Bs_address0),
    .ce0(Bs_ce0),
    .we0(grp_matrixMul_matrixMul_TRN_6_fu_249_Bs_we0),
    .d0(grp_matrixMul_matrixMul_TRN_6_fu_249_Bs_d0),
    .q0(Bs_q0)
);

matrixMul_matrixMul_SNC_7 grp_matrixMul_matrixMul_SNC_7_fu_239(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_matrixMul_matrixMul_SNC_7_fu_239_ap_start),
    .ap_done(grp_matrixMul_matrixMul_SNC_7_fu_239_ap_done),
    .ap_idle(grp_matrixMul_matrixMul_SNC_7_fu_239_ap_idle),
    .ap_ready(grp_matrixMul_matrixMul_SNC_7_fu_239_ap_ready),
    .blockDim_x(blockDim_x),
    .blockDim_y(blockDim_y),
    .blockDim_z(blockDim_z),
    .Csub_block_address0(grp_matrixMul_matrixMul_SNC_7_fu_239_Csub_block_address0),
    .Csub_block_ce0(grp_matrixMul_matrixMul_SNC_7_fu_239_Csub_block_ce0),
    .Csub_block_we0(grp_matrixMul_matrixMul_SNC_7_fu_239_Csub_block_we0),
    .Csub_block_d0(grp_matrixMul_matrixMul_SNC_7_fu_239_Csub_block_d0),
    .Csub_block_q0(Csub_block_block0_q0),
    .As_address0(grp_matrixMul_matrixMul_SNC_7_fu_239_As_address0),
    .As_ce0(grp_matrixMul_matrixMul_SNC_7_fu_239_As_ce0),
    .As_q0(As_q0),
    .Bs_address0(grp_matrixMul_matrixMul_SNC_7_fu_239_Bs_address0),
    .Bs_ce0(grp_matrixMul_matrixMul_SNC_7_fu_239_Bs_ce0),
    .Bs_q0(Bs_q0)
);

matrixMul_matrixMul_TRN_6 grp_matrixMul_matrixMul_TRN_6_fu_249(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_matrixMul_matrixMul_TRN_6_fu_249_ap_start),
    .ap_done(grp_matrixMul_matrixMul_TRN_6_fu_249_ap_done),
    .ap_idle(grp_matrixMul_matrixMul_TRN_6_fu_249_ap_idle),
    .ap_ready(grp_matrixMul_matrixMul_TRN_6_fu_249_ap_ready),
    .blockDim_x(blockDim_x),
    .blockDim_y(blockDim_y),
    .blockDim_z(blockDim_z),
    .As_address0(grp_matrixMul_matrixMul_TRN_6_fu_249_As_address0),
    .As_ce0(grp_matrixMul_matrixMul_TRN_6_fu_249_As_ce0),
    .As_we0(grp_matrixMul_matrixMul_TRN_6_fu_249_As_we0),
    .As_d0(grp_matrixMul_matrixMul_TRN_6_fu_249_As_d0),
    .A_req_din(grp_matrixMul_matrixMul_TRN_6_fu_249_A_req_din),
    .A_req_full_n(A_req_full_n),
    .A_req_write(grp_matrixMul_matrixMul_TRN_6_fu_249_A_req_write),
    .A_rsp_empty_n(A_rsp_empty_n),
    .A_rsp_read(grp_matrixMul_matrixMul_TRN_6_fu_249_A_rsp_read),
    .A_address(grp_matrixMul_matrixMul_TRN_6_fu_249_A_address),
    .A_datain(A_datain),
    .A_dataout(grp_matrixMul_matrixMul_TRN_6_fu_249_A_dataout),
    .A_size(grp_matrixMul_matrixMul_TRN_6_fu_249_A_size),
    .a_r(a_block_reg_219),
    .wA(wA),
    .Bs_address0(grp_matrixMul_matrixMul_TRN_6_fu_249_Bs_address0),
    .Bs_ce0(grp_matrixMul_matrixMul_TRN_6_fu_249_Bs_ce0),
    .Bs_we0(grp_matrixMul_matrixMul_TRN_6_fu_249_Bs_we0),
    .Bs_d0(grp_matrixMul_matrixMul_TRN_6_fu_249_Bs_d0),
    .B_req_din(grp_matrixMul_matrixMul_TRN_6_fu_249_B_req_din),
    .B_req_full_n(B_req_full_n),
    .B_req_write(grp_matrixMul_matrixMul_TRN_6_fu_249_B_req_write),
    .B_rsp_empty_n(B_rsp_empty_n),
    .B_rsp_read(grp_matrixMul_matrixMul_TRN_6_fu_249_B_rsp_read),
    .B_address(grp_matrixMul_matrixMul_TRN_6_fu_249_B_address),
    .B_datain(B_datain),
    .B_dataout(grp_matrixMul_matrixMul_TRN_6_fu_249_B_dataout),
    .B_size(grp_matrixMul_matrixMul_TRN_6_fu_249_B_size),
    .b_r(b_block_reg_229),
    .wB(wB)
);

matrixMul_matrixMul_TRN_10_wrapper grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_start),
    .ap_done(grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_done),
    .ap_idle(grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_idle),
    .ap_ready(grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_ready),
    .blockDim_x(blockDim_x),
    .blockDim_y(blockDim_y),
    .blockDim_z(blockDim_z),
    .C_req_din(grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_req_din),
    .C_req_full_n(C_req_full_n),
    .C_req_write(grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_req_write),
    .C_rsp_empty_n(C_rsp_empty_n),
    .C_rsp_read(grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_rsp_read),
    .C_address(grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_address),
    .C_datain(C_datain),
    .C_dataout(grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_dataout),
    .C_size(grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_size),
    .Csub_block_block0_address0(grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_Csub_block_block0_address0),
    .Csub_block_block0_ce0(grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_Csub_block_block0_ce0),
    .Csub_block_block0_q0(Csub_block_block0_q0),
    .c_block0(c_block0_reg_565),
    .wB(wB)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_reg_grp_matrixMul_matrixMul_SNC_7_fu_239_ap_start <= 1'b0;
    end else begin
        if ((1'b1 == ap_sig_cseq_ST_st9_fsm_8)) begin
            ap_reg_grp_matrixMul_matrixMul_SNC_7_fu_239_ap_start <= 1'b1;
        end else if ((1'b1 == grp_matrixMul_matrixMul_SNC_7_fu_239_ap_ready)) begin
            ap_reg_grp_matrixMul_matrixMul_SNC_7_fu_239_ap_start <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_reg_grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_start <= 1'b0;
    end else begin
        if (((1'b1 == ap_sig_cseq_ST_st7_fsm_6) & ~(1'b0 == tmp_18_fu_400_p2))) begin
            ap_reg_grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_start <= 1'b1;
        end else if ((1'b1 == grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_ready)) begin
            ap_reg_grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_start <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_reg_grp_matrixMul_matrixMul_TRN_6_fu_249_ap_start <= 1'b0;
    end else begin
        if (((1'b1 == ap_sig_cseq_ST_st7_fsm_6) & (1'b0 == tmp_18_fu_400_p2))) begin
            ap_reg_grp_matrixMul_matrixMul_TRN_6_fu_249_ap_start <= 1'b1;
        end else if ((1'b1 == grp_matrixMul_matrixMul_TRN_6_fu_249_ap_ready)) begin
            ap_reg_grp_matrixMul_matrixMul_TRN_6_fu_249_ap_start <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st4_fsm_3) & ~(1'b0 == exitcond2_i_fu_341_p2))) begin
        a_block_reg_219 <= a_block0_2_reg_500;
    end else if (((1'b1 == ap_sig_cseq_ST_st10_fsm_9) & ~(1'b0 == grp_matrixMul_matrixMul_SNC_7_fu_239_ap_done))) begin
        a_block_reg_219 <= a_block0_reg_555;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st4_fsm_3) & ~(1'b0 == exitcond2_i_fu_341_p2))) begin
        b_block_reg_229 <= b_block0_2_reg_518;
    end else if (((1'b1 == ap_sig_cseq_ST_st10_fsm_9) & ~(1'b0 == grp_matrixMul_matrixMul_SNC_7_fu_239_ap_done))) begin
        b_block_reg_229 <= b_block0_reg_560;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & ~(1'b0 == tmp_16_fu_324_p2))) begin
        blockIdx_block0_y_reg_140 <= blockIdx_loop_y_reg_495;
    end else if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == 1'b0))) begin
        blockIdx_block0_y_reg_140 <= ap_const_lv32_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & (tmp_s_fu_296_p2 == 1'b0))) begin
        blockIdx_loop_x_reg_174 <= ap_const_lv32_0;
    end else if (((1'b1 == ap_sig_cseq_ST_st11_fsm_10) & ~(1'b0 == grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_done))) begin
        blockIdx_loop_x_reg_174 <= tmp_17_reg_513;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & ~(1'b0 == tmp_16_fu_324_p2))) begin
        phi_mul1_reg_162 <= next_mul2_reg_482;
    end else if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == 1'b0))) begin
        phi_mul1_reg_162 <= ap_const_lv32_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & ~(1'b0 == tmp_16_fu_324_p2))) begin
        phi_mul_reg_151 <= next_mul_reg_487;
    end else if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == 1'b0))) begin
        phi_mul_reg_151 <= ap_const_lv32_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st5_fsm_4) & ~(1'b0 == exitcond1_i_fu_352_p2))) begin
        threadIdx_2_i_reg_186 <= threadIdx_z_reg_526;
    end else if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & (1'b0 == tmp_16_fu_324_p2))) begin
        threadIdx_2_i_reg_186 <= ap_const_lv32_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st6_fsm_5) & (1'b0 == exitcond_i_fu_375_p2))) begin
        threadIdx_i_reg_208 <= threadIdx_x_fu_380_p2;
    end else if (((1'b1 == ap_sig_cseq_ST_st5_fsm_4) & (1'b0 == exitcond1_i_fu_352_p2))) begin
        threadIdx_i_reg_208 <= ap_const_lv32_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st6_fsm_5) & ~(1'b0 == exitcond_i_fu_375_p2))) begin
        threadIdx_y_reg_197 <= tmp_23_i_reg_534;
    end else if (((1'b1 == ap_sig_cseq_ST_st4_fsm_3) & (1'b0 == exitcond2_i_fu_341_p2))) begin
        threadIdx_y_reg_197 <= ap_const_lv32_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & (tmp_s_fu_296_p2 == 1'b0))) begin
        aEnd_block0_reg_505 <= aEnd_block0_fu_319_p2;
        a_block0_2_reg_500[31 : 4] <= a_block0_2_fu_307_p2[31 : 4];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st7_fsm_6) & (1'b0 == tmp_18_fu_400_p2))) begin
        a_block0_reg_555 <= a_block0_fu_405_p2;
        b_block0_reg_560 <= b_block0_fu_411_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == 1'b0))) begin
        bStep_block0_reg_477[31 : 4] <= bStep_block0_fu_280_p2[31 : 4];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & (1'b0 == tmp_16_fu_324_p2))) begin
        b_block0_2_reg_518[31 : 4] <= b_block0_2_fu_335_p2[31 : 4];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        blockIdx_loop_y_reg_495 <= blockIdx_loop_y_fu_301_p2;
        next_mul2_reg_482 <= next_mul2_fu_286_p2;
        next_mul_reg_487 <= next_mul_fu_291_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st7_fsm_6) & ~(1'b0 == tmp_18_fu_400_p2))) begin
        c_block0_reg_565[31 : 4] <= c_block0_fu_422_p2[31 : 4];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        threadIdx_z_reg_526 <= threadIdx_z_fu_346_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st3_fsm_2)) begin
        tmp_17_reg_513 <= tmp_17_fu_329_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        tmp_23_i_reg_534 <= tmp_23_i_fu_357_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st5_fsm_4) & (1'b0 == exitcond1_i_fu_352_p2))) begin
        tmp_34_cast_reg_539[9 : 4] <= tmp_34_cast_fu_367_p3[9 : 4];
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st8_fsm_7)) begin
        As_address0 = grp_matrixMul_matrixMul_TRN_6_fu_249_As_address0;
    end else if ((1'b1 == ap_sig_cseq_ST_st10_fsm_9)) begin
        As_address0 = grp_matrixMul_matrixMul_SNC_7_fu_239_As_address0;
    end else begin
        As_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st8_fsm_7)) begin
        As_ce0 = grp_matrixMul_matrixMul_TRN_6_fu_249_As_ce0;
    end else if ((1'b1 == ap_sig_cseq_ST_st10_fsm_9)) begin
        As_ce0 = grp_matrixMul_matrixMul_SNC_7_fu_239_As_ce0;
    end else begin
        As_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st8_fsm_7)) begin
        Bs_address0 = grp_matrixMul_matrixMul_TRN_6_fu_249_Bs_address0;
    end else if ((1'b1 == ap_sig_cseq_ST_st10_fsm_9)) begin
        Bs_address0 = grp_matrixMul_matrixMul_SNC_7_fu_239_Bs_address0;
    end else begin
        Bs_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st8_fsm_7)) begin
        Bs_ce0 = grp_matrixMul_matrixMul_TRN_6_fu_249_Bs_ce0;
    end else if ((1'b1 == ap_sig_cseq_ST_st10_fsm_9)) begin
        Bs_ce0 = grp_matrixMul_matrixMul_SNC_7_fu_239_Bs_ce0;
    end else begin
        Bs_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st6_fsm_5)) begin
        Csub_block_block0_address0 = tmp_35_cast_fu_395_p1;
    end else if ((1'b1 == ap_sig_cseq_ST_st11_fsm_10)) begin
        Csub_block_block0_address0 = grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_Csub_block_block0_address0;
    end else if ((1'b1 == ap_sig_cseq_ST_st10_fsm_9)) begin
        Csub_block_block0_address0 = grp_matrixMul_matrixMul_SNC_7_fu_239_Csub_block_address0;
    end else begin
        Csub_block_block0_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st6_fsm_5)) begin
        Csub_block_block0_ce0 = 1'b1;
    end else if ((1'b1 == ap_sig_cseq_ST_st11_fsm_10)) begin
        Csub_block_block0_ce0 = grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_Csub_block_block0_ce0;
    end else if ((1'b1 == ap_sig_cseq_ST_st10_fsm_9)) begin
        Csub_block_block0_ce0 = grp_matrixMul_matrixMul_SNC_7_fu_239_Csub_block_ce0;
    end else begin
        Csub_block_block0_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st6_fsm_5)) begin
        Csub_block_block0_d0 = ap_const_lv32_0;
    end else if ((1'b1 == ap_sig_cseq_ST_st10_fsm_9)) begin
        Csub_block_block0_d0 = grp_matrixMul_matrixMul_SNC_7_fu_239_Csub_block_d0;
    end else begin
        Csub_block_block0_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st6_fsm_5) & (1'b0 == exitcond_i_fu_375_p2))) begin
        Csub_block_block0_we0 = 1'b1;
    end else if ((1'b1 == ap_sig_cseq_ST_st10_fsm_9)) begin
        Csub_block_block0_we0 = grp_matrixMul_matrixMul_SNC_7_fu_239_Csub_block_we0;
    end else begin
        Csub_block_block0_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & ~(tmp_s_fu_296_p2 == 1'b0))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_start) & (1'b1 == ap_sig_cseq_ST_st1_fsm_0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & ~(tmp_s_fu_296_p2 == 1'b0))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_337) begin
        ap_sig_cseq_ST_st10_fsm_9 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st10_fsm_9 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_309) begin
        ap_sig_cseq_ST_st11_fsm_10 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st11_fsm_10 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_26) begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_106) begin
        ap_sig_cseq_ST_st2_fsm_1 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_127) begin
        ap_sig_cseq_ST_st3_fsm_2 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st3_fsm_2 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_141) begin
        ap_sig_cseq_ST_st4_fsm_3 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st4_fsm_3 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_150) begin
        ap_sig_cseq_ST_st5_fsm_4 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st5_fsm_4 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_164) begin
        ap_sig_cseq_ST_st6_fsm_5 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st6_fsm_5 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_173) begin
        ap_sig_cseq_ST_st7_fsm_6 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st7_fsm_6 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_362) begin
        ap_sig_cseq_ST_st8_fsm_7 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st8_fsm_7 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_353) begin
        ap_sig_cseq_ST_st9_fsm_8 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st9_fsm_8 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_st1_fsm_0 : begin
            if (~(ap_start == 1'b0)) begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end else begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end
        end
        ap_ST_st2_fsm_1 : begin
            if (~(tmp_s_fu_296_p2 == 1'b0)) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end
        end
        ap_ST_st3_fsm_2 : begin
            if ((1'b0 == tmp_16_fu_324_p2)) begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end
        end
        ap_ST_st4_fsm_3 : begin
            if (~(1'b0 == exitcond2_i_fu_341_p2)) begin
                ap_NS_fsm = ap_ST_st7_fsm_6;
            end else begin
                ap_NS_fsm = ap_ST_st5_fsm_4;
            end
        end
        ap_ST_st5_fsm_4 : begin
            if ((1'b0 == exitcond1_i_fu_352_p2)) begin
                ap_NS_fsm = ap_ST_st6_fsm_5;
            end else begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end
        end
        ap_ST_st6_fsm_5 : begin
            if ((1'b0 == exitcond_i_fu_375_p2)) begin
                ap_NS_fsm = ap_ST_st6_fsm_5;
            end else begin
                ap_NS_fsm = ap_ST_st5_fsm_4;
            end
        end
        ap_ST_st7_fsm_6 : begin
            if (~(1'b0 == tmp_18_fu_400_p2)) begin
                ap_NS_fsm = ap_ST_st11_fsm_10;
            end else begin
                ap_NS_fsm = ap_ST_st8_fsm_7;
            end
        end
        ap_ST_st8_fsm_7 : begin
            if (~(1'b0 == grp_matrixMul_matrixMul_TRN_6_fu_249_ap_done)) begin
                ap_NS_fsm = ap_ST_st9_fsm_8;
            end else begin
                ap_NS_fsm = ap_ST_st8_fsm_7;
            end
        end
        ap_ST_st9_fsm_8 : begin
            ap_NS_fsm = ap_ST_st10_fsm_9;
        end
        ap_ST_st10_fsm_9 : begin
            if (~(1'b0 == grp_matrixMul_matrixMul_SNC_7_fu_239_ap_done)) begin
                ap_NS_fsm = ap_ST_st7_fsm_6;
            end else begin
                ap_NS_fsm = ap_ST_st10_fsm_9;
            end
        end
        ap_ST_st11_fsm_10 : begin
            if (~(1'b0 == grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_done)) begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end else begin
                ap_NS_fsm = ap_ST_st11_fsm_10;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign A_address = grp_matrixMul_matrixMul_TRN_6_fu_249_A_address;

assign A_dataout = grp_matrixMul_matrixMul_TRN_6_fu_249_A_dataout;

assign A_req_din = grp_matrixMul_matrixMul_TRN_6_fu_249_A_req_din;

assign A_req_write = grp_matrixMul_matrixMul_TRN_6_fu_249_A_req_write;

assign A_rsp_read = grp_matrixMul_matrixMul_TRN_6_fu_249_A_rsp_read;

assign A_size = grp_matrixMul_matrixMul_TRN_6_fu_249_A_size;

assign B_address = grp_matrixMul_matrixMul_TRN_6_fu_249_B_address;

assign B_dataout = grp_matrixMul_matrixMul_TRN_6_fu_249_B_dataout;

assign B_req_din = grp_matrixMul_matrixMul_TRN_6_fu_249_B_req_din;

assign B_req_write = grp_matrixMul_matrixMul_TRN_6_fu_249_B_req_write;

assign B_rsp_read = grp_matrixMul_matrixMul_TRN_6_fu_249_B_rsp_read;

assign B_size = grp_matrixMul_matrixMul_TRN_6_fu_249_B_size;

assign C_address = grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_address;

assign C_dataout = grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_dataout;

assign C_req_din = grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_req_din;

assign C_req_write = grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_req_write;

assign C_rsp_read = grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_rsp_read;

assign C_size = grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_C_size;

assign aEnd_block0_fu_319_p2 = (wA + tmp1_fu_313_p2);

assign a_block0_2_fu_307_p2 = phi_mul_reg_151 << ap_const_lv32_4;

assign a_block0_fu_405_p2 = (a_block_reg_219 + ap_const_lv32_10);

always @ (*) begin
    ap_sig_106 = (1'b1 == ap_CS_fsm[ap_const_lv32_1]);
end

always @ (*) begin
    ap_sig_127 = (1'b1 == ap_CS_fsm[ap_const_lv32_2]);
end

always @ (*) begin
    ap_sig_141 = (1'b1 == ap_CS_fsm[ap_const_lv32_3]);
end

always @ (*) begin
    ap_sig_150 = (1'b1 == ap_CS_fsm[ap_const_lv32_4]);
end

always @ (*) begin
    ap_sig_164 = (1'b1 == ap_CS_fsm[ap_const_lv32_5]);
end

always @ (*) begin
    ap_sig_173 = (1'b1 == ap_CS_fsm[ap_const_lv32_6]);
end

always @ (*) begin
    ap_sig_26 = (ap_CS_fsm[ap_const_lv32_0] == 1'b1);
end

always @ (*) begin
    ap_sig_309 = (1'b1 == ap_CS_fsm[ap_const_lv32_A]);
end

always @ (*) begin
    ap_sig_337 = (1'b1 == ap_CS_fsm[ap_const_lv32_9]);
end

always @ (*) begin
    ap_sig_353 = (1'b1 == ap_CS_fsm[ap_const_lv32_8]);
end

always @ (*) begin
    ap_sig_362 = (1'b1 == ap_CS_fsm[ap_const_lv32_7]);
end

assign bStep_block0_fu_280_p2 = wB << ap_const_lv32_4;

assign b_block0_2_fu_335_p2 = blockIdx_loop_x_reg_174 << ap_const_lv32_4;

assign b_block0_fu_411_p2 = (bStep_block0_reg_477 + b_block_reg_229);

assign blockIdx_loop_y_fu_301_p2 = (blockIdx_block0_y_reg_140 + ap_const_lv32_1);

assign c_block0_fu_422_p2 = tmp_fu_416_p2 << ap_const_lv32_4;

assign exitcond1_i_fu_352_p2 = ((threadIdx_y_reg_197 == blockDim_y) ? 1'b1 : 1'b0);

assign exitcond2_i_fu_341_p2 = ((threadIdx_2_i_reg_186 == blockDim_z) ? 1'b1 : 1'b0);

assign exitcond_i_fu_375_p2 = ((threadIdx_i_reg_208 == blockDim_x) ? 1'b1 : 1'b0);

assign grp_matrixMul_matrixMul_SNC_7_fu_239_ap_start = ap_reg_grp_matrixMul_matrixMul_SNC_7_fu_239_ap_start;

assign grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_start = ap_reg_grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268_ap_start;

assign grp_matrixMul_matrixMul_TRN_6_fu_249_ap_start = ap_reg_grp_matrixMul_matrixMul_TRN_6_fu_249_ap_start;

assign next_mul2_fu_286_p2 = (phi_mul1_reg_162 + wB);

assign next_mul_fu_291_p2 = (phi_mul_reg_151 + wA);

assign threadIdx_x_fu_380_p2 = (threadIdx_i_reg_208 + ap_const_lv32_1);

assign threadIdx_z_fu_346_p2 = (threadIdx_2_i_reg_186 + ap_const_lv32_1);

assign tmp1_fu_313_p2 = ($signed(ap_const_lv32_FFFFFFFF) + $signed(a_block0_2_fu_307_p2));

assign tmp_12_fu_363_p1 = threadIdx_y_reg_197[5:0];

assign tmp_13_fu_386_p1 = threadIdx_i_reg_208[9:0];

assign tmp_16_fu_324_p2 = ((blockIdx_loop_x_reg_174 == gridDim_x) ? 1'b1 : 1'b0);

assign tmp_17_fu_329_p2 = (blockIdx_loop_x_reg_174 + ap_const_lv32_1);

assign tmp_18_fu_400_p2 = (($signed(a_block_reg_219) > $signed(aEnd_block0_reg_505)) ? 1'b1 : 1'b0);

assign tmp_19_fu_390_p2 = (tmp_34_cast_reg_539 + tmp_13_fu_386_p1);

assign tmp_23_i_fu_357_p2 = (threadIdx_y_reg_197 + ap_const_lv32_1);

assign tmp_34_cast_fu_367_p3 = {{tmp_12_fu_363_p1}, {ap_const_lv4_0}};

assign tmp_35_cast_fu_395_p1 = tmp_19_fu_390_p2;

assign tmp_fu_416_p2 = (phi_mul1_reg_162 + blockIdx_loop_x_reg_174);

assign tmp_s_fu_296_p2 = ((blockIdx_block0_y_reg_140 == gridDim_y) ? 1'b1 : 1'b0);

always @ (posedge ap_clk) begin
    bStep_block0_reg_477[3:0] <= 4'b0000;
    a_block0_2_reg_500[3:0] <= 4'b0000;
    b_block0_2_reg_518[3:0] <= 4'b0000;
    tmp_34_cast_reg_539[3:0] <= 4'b0000;
    c_block0_reg_565[3:0] <= 4'b0000;
end

endmodule //matrixMul