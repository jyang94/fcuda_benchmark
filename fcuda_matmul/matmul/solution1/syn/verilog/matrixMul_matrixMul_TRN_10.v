// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module matrixMul_matrixMul_TRN_10 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        blockDim_x,
        blockDim_y,
        blockDim_z,
        C_req_din,
        C_req_full_n,
        C_req_write,
        C_rsp_empty_n,
        C_rsp_read,
        C_address,
        C_datain,
        C_dataout,
        C_size,
        Csub_block_address0,
        Csub_block_ce0,
        Csub_block_q0,
        c_r,
        wB
);

parameter    ap_ST_st1_fsm_0 = 6'b1;
parameter    ap_ST_st2_fsm_1 = 6'b10;
parameter    ap_ST_st3_fsm_2 = 6'b100;
parameter    ap_ST_st4_fsm_3 = 6'b1000;
parameter    ap_ST_st5_fsm_4 = 6'b10000;
parameter    ap_ST_st6_fsm_5 = 6'b100000;
parameter    ap_const_lv32_0 = 32'b00000000000000000000000000000000;
parameter    ap_const_lv32_1 = 32'b1;
parameter    ap_const_lv32_2 = 32'b10;
parameter    ap_const_lv32_3 = 32'b11;
parameter    ap_const_lv32_4 = 32'b100;
parameter    ap_const_lv32_5 = 32'b101;
parameter    ap_const_lv4_0 = 4'b0000;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] blockDim_x;
input  [31:0] blockDim_y;
input  [31:0] blockDim_z;
output   C_req_din;
input   C_req_full_n;
output   C_req_write;
input   C_rsp_empty_n;
output   C_rsp_read;
output  [31:0] C_address;
input  [31:0] C_datain;
output  [31:0] C_dataout;
output  [31:0] C_size;
output  [7:0] Csub_block_address0;
output   Csub_block_ce0;
input  [31:0] Csub_block_q0;
input  [31:0] c_r;
input  [31:0] wB;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg C_req_din;
reg C_req_write;
reg Csub_block_ce0;

(* fsm_encoding = "none" *) reg   [5:0] ap_CS_fsm;
reg    ap_sig_cseq_ST_st1_fsm_0;
reg    ap_sig_23;
wire   [31:0] threadIdx_z_fu_136_p2;
reg   [31:0] threadIdx_z_reg_245;
reg    ap_sig_cseq_ST_st2_fsm_1;
reg    ap_sig_72;
wire   [31:0] next_mul_fu_142_p2;
reg   [31:0] next_mul_reg_250;
reg    ap_sig_cseq_ST_st3_fsm_2;
reg    ap_sig_81;
wire   [31:0] tmp_6_fu_152_p2;
reg   [31:0] tmp_6_reg_258;
wire   [9:0] tmp_17_cast_fu_162_p3;
reg   [9:0] tmp_17_cast_reg_263;
wire   [0:0] exitcond1_fu_147_p2;
reg   [31:0] C_addr_reg_268;
wire   [31:0] threadIdx_x_fu_190_p2;
reg   [31:0] threadIdx_x_reg_276;
reg    ap_sig_cseq_ST_st4_fsm_3;
reg    ap_sig_100;
wire   [0:0] exitcond_fu_185_p2;
wire   [0:0] is_0iter_fu_210_p2;
reg   [0:0] is_0iter_reg_286;
reg   [31:0] Csub_block_load_reg_290;
reg    ap_sig_cseq_ST_st5_fsm_4;
reg    ap_sig_115;
reg   [31:0] threadIdx_2_reg_87;
reg   [31:0] threadIdx_y_reg_98;
wire   [0:0] exitcond2_fu_131_p2;
reg   [31:0] phi_mul_reg_109;
reg   [31:0] threadIdx_reg_120;
reg    ap_sig_cseq_ST_st6_fsm_5;
reg    ap_sig_137;
wire   [63:0] tmp_19_cast_fu_205_p1;
wire   [63:0] tmp_7_fu_175_p1;
wire   [5:0] tmp_fu_158_p1;
wire   [31:0] tmp_s_fu_170_p2;
wire   [9:0] tmp_5_fu_196_p1;
wire   [9:0] tmp_8_fu_200_p2;
reg   [5:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 6'b1;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_st1_fsm_0;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st4_fsm_3) & ~(1'b0 == exitcond_fu_185_p2))) begin
        phi_mul_reg_109 <= next_mul_reg_250;
    end else if (((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & (1'b0 == exitcond2_fu_131_p2))) begin
        phi_mul_reg_109 <= ap_const_lv32_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & ~(exitcond1_fu_147_p2 == 1'b0))) begin
        threadIdx_2_reg_87 <= threadIdx_z_reg_245;
    end else if (((1'b1 == ap_sig_cseq_ST_st1_fsm_0) & ~(ap_start == 1'b0))) begin
        threadIdx_2_reg_87 <= ap_const_lv32_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st6_fsm_5) & ~(C_req_full_n == 1'b0))) begin
        threadIdx_reg_120 <= threadIdx_x_reg_276;
    end else if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & (exitcond1_fu_147_p2 == 1'b0))) begin
        threadIdx_reg_120 <= ap_const_lv32_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st4_fsm_3) & ~(1'b0 == exitcond_fu_185_p2))) begin
        threadIdx_y_reg_98 <= tmp_6_reg_258;
    end else if (((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & (1'b0 == exitcond2_fu_131_p2))) begin
        threadIdx_y_reg_98 <= ap_const_lv32_0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st3_fsm_2) & (exitcond1_fu_147_p2 == 1'b0))) begin
        C_addr_reg_268 <= tmp_7_fu_175_p1;
        tmp_17_cast_reg_263[9 : 4] <= tmp_17_cast_fu_162_p3[9 : 4];
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st5_fsm_4)) begin
        Csub_block_load_reg_290 <= Csub_block_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_sig_cseq_ST_st4_fsm_3) & (1'b0 == exitcond_fu_185_p2))) begin
        is_0iter_reg_286 <= is_0iter_fu_210_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st3_fsm_2)) begin
        next_mul_reg_250 <= next_mul_fu_142_p2;
        tmp_6_reg_258 <= tmp_6_fu_152_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        threadIdx_x_reg_276 <= threadIdx_x_fu_190_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_sig_cseq_ST_st2_fsm_1)) begin
        threadIdx_z_reg_245 <= threadIdx_z_fu_136_p2;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st6_fsm_5) & ~(C_req_full_n == 1'b0))) begin
        C_req_din = 1'b1;
    end else begin
        C_req_din = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_sig_cseq_ST_st6_fsm_5) & ~(C_req_full_n == 1'b0))) begin
        C_req_write = 1'b1;
    end else begin
        C_req_write = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_sig_cseq_ST_st4_fsm_3)) begin
        Csub_block_ce0 = 1'b1;
    end else begin
        Csub_block_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_start) & (1'b1 == ap_sig_cseq_ST_st1_fsm_0)) | ((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & ~(1'b0 == exitcond2_fu_131_p2)))) begin
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
    if (((1'b1 == ap_sig_cseq_ST_st2_fsm_1) & ~(1'b0 == exitcond2_fu_131_p2))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_23) begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st1_fsm_0 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_72) begin
        ap_sig_cseq_ST_st2_fsm_1 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st2_fsm_1 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_81) begin
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
    if (ap_sig_115) begin
        ap_sig_cseq_ST_st5_fsm_4 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st5_fsm_4 = 1'b0;
    end
end

always @ (*) begin
    if (ap_sig_137) begin
        ap_sig_cseq_ST_st6_fsm_5 = 1'b1;
    end else begin
        ap_sig_cseq_ST_st6_fsm_5 = 1'b0;
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
            if (~(1'b0 == exitcond2_fu_131_p2)) begin
                ap_NS_fsm = ap_ST_st1_fsm_0;
            end else begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end
        end
        ap_ST_st3_fsm_2 : begin
            if ((exitcond1_fu_147_p2 == 1'b0)) begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_st2_fsm_1;
            end
        end
        ap_ST_st4_fsm_3 : begin
            if ((1'b0 == exitcond_fu_185_p2)) begin
                ap_NS_fsm = ap_ST_st5_fsm_4;
            end else begin
                ap_NS_fsm = ap_ST_st3_fsm_2;
            end
        end
        ap_ST_st5_fsm_4 : begin
            ap_NS_fsm = ap_ST_st6_fsm_5;
        end
        ap_ST_st6_fsm_5 : begin
            if (~(C_req_full_n == 1'b0)) begin
                ap_NS_fsm = ap_ST_st4_fsm_3;
            end else begin
                ap_NS_fsm = ap_ST_st6_fsm_5;
            end
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign C_address = C_addr_reg_268;

assign C_dataout = Csub_block_load_reg_290;

assign C_rsp_read = 1'b0;

assign C_size = blockDim_x;

assign Csub_block_address0 = tmp_19_cast_fu_205_p1;

always @ (*) begin
    ap_sig_100 = (1'b1 == ap_CS_fsm[ap_const_lv32_3]);
end

always @ (*) begin
    ap_sig_115 = (1'b1 == ap_CS_fsm[ap_const_lv32_4]);
end

always @ (*) begin
    ap_sig_137 = (1'b1 == ap_CS_fsm[ap_const_lv32_5]);
end

always @ (*) begin
    ap_sig_23 = (ap_CS_fsm[ap_const_lv32_0] == 1'b1);
end

always @ (*) begin
    ap_sig_72 = (1'b1 == ap_CS_fsm[ap_const_lv32_1]);
end

always @ (*) begin
    ap_sig_81 = (1'b1 == ap_CS_fsm[ap_const_lv32_2]);
end

assign exitcond1_fu_147_p2 = ((threadIdx_y_reg_98 == blockDim_y) ? 1'b1 : 1'b0);

assign exitcond2_fu_131_p2 = ((threadIdx_2_reg_87 == blockDim_z) ? 1'b1 : 1'b0);

assign exitcond_fu_185_p2 = ((threadIdx_reg_120 == blockDim_x) ? 1'b1 : 1'b0);

assign is_0iter_fu_210_p2 = ((threadIdx_reg_120 == ap_const_lv32_0) ? 1'b1 : 1'b0);

assign next_mul_fu_142_p2 = (phi_mul_reg_109 + wB);

assign threadIdx_x_fu_190_p2 = (threadIdx_reg_120 + ap_const_lv32_1);

assign threadIdx_z_fu_136_p2 = (threadIdx_2_reg_87 + ap_const_lv32_1);

assign tmp_17_cast_fu_162_p3 = {{tmp_fu_158_p1}, {ap_const_lv4_0}};

assign tmp_19_cast_fu_205_p1 = tmp_8_fu_200_p2;

assign tmp_5_fu_196_p1 = threadIdx_reg_120[9:0];

assign tmp_6_fu_152_p2 = (threadIdx_y_reg_98 + ap_const_lv32_1);

assign tmp_7_fu_175_p1 = tmp_s_fu_170_p2;

assign tmp_8_fu_200_p2 = (tmp_17_cast_reg_263 + tmp_5_fu_196_p1);

assign tmp_fu_158_p1 = threadIdx_y_reg_98[5:0];

assign tmp_s_fu_170_p2 = (phi_mul_reg_109 + c_r);

always @ (posedge ap_clk) begin
    tmp_17_cast_reg_263[3:0] <= 4'b0000;
end

endmodule //matrixMul_matrixMul_TRN_10
