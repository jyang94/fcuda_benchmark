// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module matrixMul_matrixMul_SNC_7 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        blockDim_x,
        blockDim_y,
        blockDim_z,
        Csub_block_address0,
        Csub_block_ce0,
        Csub_block_we0,
        Csub_block_d0,
        Csub_block_q0,
        As_address0,
        As_ce0,
        As_q0,
        Bs_address0,
        Bs_ce0,
        Bs_q0
);

parameter    ap_ST_st1_fsm_0 = 15'b1;
parameter    ap_ST_st2_fsm_1 = 15'b10;
parameter    ap_ST_st3_fsm_2 = 15'b100;
parameter    ap_ST_st4_fsm_3 = 15'b1000;
parameter    ap_ST_st5_fsm_4 = 15'b10000;
parameter    ap_ST_st6_fsm_5 = 15'b100000;
parameter    ap_ST_st7_fsm_6 = 15'b1000000;
parameter    ap_ST_st8_fsm_7 = 15'b10000000;
parameter    ap_ST_st9_fsm_8 = 15'b100000000;
parameter    ap_ST_st10_fsm_9 = 15'b1000000000;
parameter    ap_ST_st11_fsm_10 = 15'b10000000000;
parameter    ap_ST_st12_fsm_11 = 15'b100000000000;
parameter    ap_ST_st13_fsm_12 = 15'b1000000000000;
parameter    ap_ST_st14_fsm_13 = 15'b10000000000000;
parameter    ap_ST_st15_fsm_14 = 15'b100000000000000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv32_5 = 32'b101;
parameter    ap_const_lv32_8 = 32'b1000;
parameter    ap_const_lv32_D = 32'b1101;
parameter    ap_const_lv5_0 = 5'b00000;
parameter    ap_const_lv32_E = 32'b1110;
parameter    ap_const_lv32_7 = 32'b111;
parameter    ap_const_lv32_9 = 32'b1001;
parameter    ap_const_lv4_0 = 4'b0000;
parameter    ap_const_lv5_10 = 5'b10000;
parameter    ap_const_lv5_1 = 5'b1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] blockDim_x;
input  [31:0] blockDim_y;
input  [31:0] blockDim_z;
output  [7:0] Csub_block_address0;
output   Csub_block_ce0;
output   Csub_block_we0;
output  [31:0] Csub_block_d0;
input  [31:0] Csub_block_q0;
output  [7:0] As_address0;
output   As_ce0;
input  [31:0] As_q0;
output  [7:0] Bs_address0;
output   Bs_ce0;
input  [31:0] Bs_q0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg Csub_block_ce0;
reg Csub_block_we0;
reg As_ce0;
reg Bs_ce0;

(* fsm_encoding = "none" *) reg   [14:0] ap_CS_fsm;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_32;
wire   [31:0] threadIdx_z_fu_158_p2;
reg   [31:0] threadIdx_z_reg_278;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_76;
wire   [31:0] tmp_s_fu_169_p2;
reg   [31:0] tmp_s_reg_286;
reg    ap_sig_cseq_ST_st3_fsm_2;
reg    ap_sig_85;
wire   [9:0] tmp_23_cast_fu_179_p3;
reg   [9:0] tmp_23_cast_reg_291;
wire   [0:0] exitcond2_fu_164_p2;
wire   [31:0] tmp_9_fu_192_p2;
reg   [31:0] tmp_9_reg_300;
reg    ap_sig_cseq_ST_st4_fsm_3;
reg    ap_sig_100;
wire   [9:0] tmp_7_fu_198_p1;
reg   [9:0] tmp_7_reg_305;
wire   [0:0] exitcond1_fu_187_p2;
reg   [7:0] Csub_block_addr_reg_310;
wire   [4:0] k_1_fu_218_p2;
reg   [4:0] k_1_reg_318;
reg    ap_sig_cseq_ST_st5_fsm_4;
reg    ap_sig_116;
wire   [0:0] exitcond_fu_212_p2;
reg    ap_sig_cseq_ST_st6_fsm_5;
reg    ap_sig_131;
wire   [31:0] grp_fu_147_p2;
reg   [31:0] tmp_14_reg_343;
reg    ap_sig_cseq_ST_st9_fsm_8;
reg    ap_sig_141;
reg   [31:0] Csub_block_load_reg_348;
wire   [31:0] grp_fu_143_p2;
reg   [31:0] tmp_15_reg_353;
reg    ap_sig_cseq_ST_st14_fsm_13;
reg    ap_sig_151;
reg   [31:0] threadIdx_2_reg_99;
reg   [31:0] threadIdx_y_reg_110;
wire   [0:0] exitcond3_fu_153_p2;
reg   [31:0] threadIdx_x_reg_121;
reg   [4:0] k_reg_132;
reg    ap_sig_cseq_ST_st15_fsm_14;
reg    ap_sig_176;
wire   [63:0] tmp_24_cast_fu_207_p1;
wire   [63:0] tmp_25_cast_fu_233_p1;
wire   [63:0] tmp_28_cast_fu_255_p1;
reg    ap_sig_cseq_ST_st8_fsm_7;
reg    ap_sig_186;
reg    ap_sig_cseq_ST_st10_fsm_9;
reg    ap_sig_197;
wire   [5:0] tmp_6_fu_175_p1;
wire   [9:0] tmp_10_fu_202_p2;
wire   [9:0] tmp_19_cast_fu_224_p1;
wire   [9:0] tmp_11_fu_228_p2;
wire   [8:0] tmp_12_fu_238_p3;
wire   [9:0] tmp_27_cast_fu_246_p1;
wire   [9:0] tmp_13_fu_250_p2;
reg   [14:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 15'b1;
end

matrixMul_fadd_32ns_32ns_32_5_full_dsp #(
    .ID( 1 ),
    .NUM_STAGE( 5 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
matrixMul_fadd_32ns_32ns_32_5_full_dsp_U12(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(Csub_block_load_reg_348),
    .din1(tmp_14_reg_343),
    .ce(1'b1),
    .dout(grp_fu_143_p2)
);

matrixMul_fmul_32ns_32ns_32_4_max_dsp #(
    .ID( 1 ),
    .NUM_STAGE( 4 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
matrixMul_fmul_32ns_32ns_32_4_max_dsp_U13(
    .clk(ap_clk),
    .reset(ap_rst),
    .din0(As_q0),
    .din1(Bs_q0),
    .ce(1'b1),
    .dout(grp_fu_147_p2)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st15_fsm_14)) begin
        k_reg_132 <= k_1_reg_318;
    end else if (((1'b1 == ap_sig_cseq_ST_st4_fsm_3) & (1'b0 == exitcond1_fu_187_p2))) begin
        k_reg_132 <= ap_const_lv5_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & ~(exitcond2_fu_164_p2 == 1'b0))) begin
        threadIdx_2_reg_99 <= threadIdx_z_reg_278;
    end else if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == 1'b0))) begin
        threadIdx_2_reg_99 <= ap_const_lv32_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & (exitcond2_fu_164_p2 == 1'b0))) begin
        threadIdx_x_reg_121 <= ap_const_lv32_0;
    end else if (((1'b1 == ap_sig_cseq_ST_st5_fsm_4) & ~(1'b0 == exitcond_fu_212_p2))) begin
        threadIdx_x_reg_121 <= tmp_9_reg_300;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st4_fsm_3) & ~(1'b0 == exitcond1_fu_187_p2))) begin
        threadIdx_y_reg_110 <= tmp_s_reg_286;
    end else if (((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & (1'b0 == exitcond3_fu_153_p2))) begin
        threadIdx_y_reg_110 <= ap_const_lv32_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st4_fsm_3) & (1'b0 == exitcond1_fu_187_p2))) begin
        Csub_block_addr_reg_310 <= tmp_24_cast_fu_207_p1;
        tmp_7_reg_305 <= tmp_7_fu_198_p1;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st9_fsm_8)) begin
        Csub_block_load_reg_348 <= Csub_block_q0;
        tmp_14_reg_343 <= grp_fu_147_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        k_1_reg_318 <= k_1_fu_218_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        threadIdx_z_reg_278 <= threadIdx_z_fu_158_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st14_fsm_13)) begin
        tmp_15_reg_353 <= grp_fu_143_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & (exitcond2_fu_164_p2 == 1'b0))) begin
        tmp_23_cast_reg_291[9 : 4] <= tmp_23_cast_fu_179_p3[9 : 4];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        tmp_9_reg_300 <= tmp_9_fu_192_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st3_fsm_2)) begin
        tmp_s_reg_286 <= tmp_s_fu_169_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        As_ce0 = 1'b1;
    end else begin
        As_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        Bs_ce0 = 1'b1;
    end else begin
        Bs_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st15_fsm_14) | (1'b1 == ap_sig_cseq_ST_st8_fsm_7))) begin
        Csub_block_ce0 = 1'b1;
    end else begin
        Csub_block_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st15_fsm_14)) begin
        Csub_block_we0 = 1'b1;
    end else begin
        Csub_block_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_start) & (1'b1 == ap_sig_cseq_ST_st1_fsm_0)) | ((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & ~(1'b0 == exitcond3_fu_153_p2)))) begin
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
    if (((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & ~(1'b0 == exitcond3_fu_153_p2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_197) begin
        ap_sig_cseq_ST_st10_fsm_9 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st10_fsm_9 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_151) begin
        ap_sig_cseq_ST_st14_fsm_13 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st14_fsm_13 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_176) begin
        ap_sig_cseq_ST_st15_fsm_14 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st15_fsm_14 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_32) begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_76) begin
        ap_sig_cseq_ST_st2_fsm_1 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_85) begin
        ap_sig_cseq_ST_st3_fsm_2 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st3_fsm_2 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_100) begin
        ap_sig_cseq_ST_st4_fsm_3 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st4_fsm_3 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_116) begin
        ap_sig_cseq_ST_st5_fsm_4 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st5_fsm_4 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_131) begin
        ap_sig_cseq_ST_st6_fsm_5 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st6_fsm_5 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_186) begin
        ap_sig_cseq_ST_st8_fsm_7 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st8_fsm_7 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_141) begin
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
            if (~(1'b0 == exitcond3_fu_153_p2)) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end
        end
        ap_ST_st3_fsm_2 : begin
            if ((exitcond2_fu_164_p2 == 1'b0)) begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end
        end
        ap_ST_st4_fsm_3 : begin
            if ((1'b0 == exitcond1_fu_187_p2)) begin
                ap_NS_fsm = ap_ST_st5_fsm_4;
            end else begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end
        end
        ap_ST_st5_fsm_4 : begin
            if (~(1'b0 == exitcond_fu_212_p2)) begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_st6_fsm_5;
            end
        end
        ap_ST_st6_fsm_5 : begin
            ap_NS_fsm = ap_ST_st7_fsm_6;
        end
        ap_ST_st7_fsm_6 : begin
            ap_NS_fsm = ap_ST_st8_fsm_7;
        end
        ap_ST_st8_fsm_7 : begin
            ap_NS_fsm = ap_ST_st9_fsm_8;
        end
        ap_ST_st9_fsm_8 : begin
            ap_NS_fsm = ap_ST_st10_fsm_9;
        end
        ap_ST_st10_fsm_9 : begin
            ap_NS_fsm = ap_ST_st11_fsm_10;
        end
        ap_ST_st11_fsm_10 : begin
            ap_NS_fsm = ap_ST_st12_fsm_11;
        end
        ap_ST_st12_fsm_11 : begin
            ap_NS_fsm = ap_ST_st13_fsm_12;
        end
        ap_ST_st13_fsm_12 : begin
            ap_NS_fsm = ap_ST_st14_fsm_13;
        end
        ap_ST_st14_fsm_13 : begin
            ap_NS_fsm = ap_ST_st15_fsm_14;
        end
        ap_ST_st15_fsm_14 : begin
            ap_NS_fsm = ap_ST_st5_fsm_4;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign As_address0 = tmp_25_cast_fu_233_p1;

assign Bs_address0 = tmp_28_cast_fu_255_p1;

assign Csub_block_address0 = Csub_block_addr_reg_310;

assign Csub_block_d0 = tmp_15_reg_353;

always @ (*) begin
    ap_sig_100 = (1'b1 == ap_CS_fsm[ap_const_lv32_3]);
end

always @ (*) begin
    ap_sig_116 = (1'b1 == ap_CS_fsm[ap_const_lv32_4]);
end

always @ (*) begin
    ap_sig_131 = (1'b1 == ap_CS_fsm[ap_const_lv32_5]);
end

always @ (*) begin
    ap_sig_141 = (1'b1 == ap_CS_fsm[ap_const_lv32_8]);
end

always @ (*) begin
    ap_sig_151 = (1'b1 == ap_CS_fsm[ap_const_lv32_D]);
end

always @ (*) begin
    ap_sig_176 = (1'b1 == ap_CS_fsm[ap_const_lv32_E]);
end

always @ (*) begin
    ap_sig_186 = (1'b1 == ap_CS_fsm[ap_const_lv32_7]);
end

always @ (*) begin
    ap_sig_197 = (1'b1 == ap_CS_fsm[ap_const_lv32_9]);
end

always @ (*) begin
    ap_sig_32 = (ap_CS_fsm[ap_const_lv32_0] == 1'b1);
end

always @ (*) begin
    ap_sig_76 = (1'b1 == ap_CS_fsm[ap_const_lv32_1]);
end

always @ (*) begin
    ap_sig_85 = (1'b1 == ap_CS_fsm[ap_const_lv32_2]);
end

assign exitcond1_fu_187_p2 = ((threadIdx_x_reg_121 == blockDim_x) ? 1'b1 : 1'b0);

assign exitcond2_fu_164_p2 = ((threadIdx_y_reg_110 == blockDim_y) ? 1'b1 : 1'b0);

assign exitcond3_fu_153_p2 = ((threadIdx_2_reg_99 == blockDim_z) ? 1'b1 : 1'b0);

assign exitcond_fu_212_p2 = ((k_reg_132 == ap_const_lv5_10) ? 1'b1 : 1'b0);

assign k_1_fu_218_p2 = (k_reg_132 + ap_const_lv5_1);

assign threadIdx_z_fu_158_p2 = (threadIdx_2_reg_99 + ap_const_lv32_1);

assign tmp_10_fu_202_p2 = (tmp_23_cast_reg_291 + tmp_7_fu_198_p1);

assign tmp_11_fu_228_p2 = (tmp_19_cast_fu_224_p1 + tmp_23_cast_reg_291);

assign tmp_12_fu_238_p3 = {{k_reg_132}, {ap_const_lv4_0}};

assign tmp_13_fu_250_p2 = (tmp_7_reg_305 + tmp_27_cast_fu_246_p1);

assign tmp_19_cast_fu_224_p1 = k_reg_132;

assign tmp_23_cast_fu_179_p3 = {{tmp_6_fu_175_p1}, {ap_const_lv4_0}};

assign tmp_24_cast_fu_207_p1 = tmp_10_fu_202_p2;

assign tmp_25_cast_fu_233_p1 = tmp_11_fu_228_p2;

assign tmp_27_cast_fu_246_p1 = tmp_12_fu_238_p3;

assign tmp_28_cast_fu_255_p1 = tmp_13_fu_250_p2;

assign tmp_6_fu_175_p1 = threadIdx_y_reg_110[5:0];

assign tmp_7_fu_198_p1 = threadIdx_x_reg_121[9:0];

assign tmp_9_fu_192_p2 = (threadIdx_x_reg_121 + ap_const_lv32_1);

assign tmp_s_fu_169_p2 = (threadIdx_y_reg_110 + ap_const_lv32_1);

always @ (posedge ap_clk) begin
    tmp_23_cast_reg_291[3:0] <= 4'b0000;
end

endmodule //matrixMul_matrixMul_SNC_7
