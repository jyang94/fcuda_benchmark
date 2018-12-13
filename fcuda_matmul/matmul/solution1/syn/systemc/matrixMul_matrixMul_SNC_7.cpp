// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2016.2
// Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#include "matrixMul_matrixMul_SNC_7.h"
#include "AESL_pkg.h"

using namespace std;

namespace ap_rtl {

const sc_logic matrixMul_matrixMul_SNC_7::ap_const_logic_1 = sc_dt::Log_1;
const sc_logic matrixMul_matrixMul_SNC_7::ap_const_logic_0 = sc_dt::Log_0;
const sc_lv<15> matrixMul_matrixMul_SNC_7::ap_ST_st1_fsm_0 = "1";
const sc_lv<15> matrixMul_matrixMul_SNC_7::ap_ST_st2_fsm_1 = "10";
const sc_lv<15> matrixMul_matrixMul_SNC_7::ap_ST_st3_fsm_2 = "100";
const sc_lv<15> matrixMul_matrixMul_SNC_7::ap_ST_st4_fsm_3 = "1000";
const sc_lv<15> matrixMul_matrixMul_SNC_7::ap_ST_st5_fsm_4 = "10000";
const sc_lv<15> matrixMul_matrixMul_SNC_7::ap_ST_st6_fsm_5 = "100000";
const sc_lv<15> matrixMul_matrixMul_SNC_7::ap_ST_st7_fsm_6 = "1000000";
const sc_lv<15> matrixMul_matrixMul_SNC_7::ap_ST_st8_fsm_7 = "10000000";
const sc_lv<15> matrixMul_matrixMul_SNC_7::ap_ST_st9_fsm_8 = "100000000";
const sc_lv<15> matrixMul_matrixMul_SNC_7::ap_ST_st10_fsm_9 = "1000000000";
const sc_lv<15> matrixMul_matrixMul_SNC_7::ap_ST_st11_fsm_10 = "10000000000";
const sc_lv<15> matrixMul_matrixMul_SNC_7::ap_ST_st12_fsm_11 = "100000000000";
const sc_lv<15> matrixMul_matrixMul_SNC_7::ap_ST_st13_fsm_12 = "1000000000000";
const sc_lv<15> matrixMul_matrixMul_SNC_7::ap_ST_st14_fsm_13 = "10000000000000";
const sc_lv<15> matrixMul_matrixMul_SNC_7::ap_ST_st15_fsm_14 = "100000000000000";
const sc_lv<32> matrixMul_matrixMul_SNC_7::ap_const_lv32_0 = "00000000000000000000000000000000";
const sc_lv<1> matrixMul_matrixMul_SNC_7::ap_const_lv1_1 = "1";
const sc_lv<32> matrixMul_matrixMul_SNC_7::ap_const_lv32_1 = "1";
const sc_lv<32> matrixMul_matrixMul_SNC_7::ap_const_lv32_2 = "10";
const sc_lv<1> matrixMul_matrixMul_SNC_7::ap_const_lv1_0 = "0";
const sc_lv<32> matrixMul_matrixMul_SNC_7::ap_const_lv32_3 = "11";
const sc_lv<32> matrixMul_matrixMul_SNC_7::ap_const_lv32_4 = "100";
const sc_lv<32> matrixMul_matrixMul_SNC_7::ap_const_lv32_5 = "101";
const sc_lv<32> matrixMul_matrixMul_SNC_7::ap_const_lv32_8 = "1000";
const sc_lv<32> matrixMul_matrixMul_SNC_7::ap_const_lv32_D = "1101";
const sc_lv<5> matrixMul_matrixMul_SNC_7::ap_const_lv5_0 = "00000";
const sc_lv<32> matrixMul_matrixMul_SNC_7::ap_const_lv32_E = "1110";
const sc_lv<32> matrixMul_matrixMul_SNC_7::ap_const_lv32_7 = "111";
const sc_lv<32> matrixMul_matrixMul_SNC_7::ap_const_lv32_9 = "1001";
const sc_lv<4> matrixMul_matrixMul_SNC_7::ap_const_lv4_0 = "0000";
const sc_lv<5> matrixMul_matrixMul_SNC_7::ap_const_lv5_10 = "10000";
const sc_lv<5> matrixMul_matrixMul_SNC_7::ap_const_lv5_1 = "1";

matrixMul_matrixMul_SNC_7::matrixMul_matrixMul_SNC_7(sc_module_name name) : sc_module(name), mVcdFile(0) {
    matrixMul_fadd_32ns_32ns_32_5_full_dsp_U12 = new matrixMul_fadd_32ns_32ns_32_5_full_dsp<1,5,32,32,32>("matrixMul_fadd_32ns_32ns_32_5_full_dsp_U12");
    matrixMul_fadd_32ns_32ns_32_5_full_dsp_U12->clk(ap_clk);
    matrixMul_fadd_32ns_32ns_32_5_full_dsp_U12->reset(ap_rst);
    matrixMul_fadd_32ns_32ns_32_5_full_dsp_U12->din0(Csub_block_load_reg_348);
    matrixMul_fadd_32ns_32ns_32_5_full_dsp_U12->din1(tmp_14_reg_343);
    matrixMul_fadd_32ns_32ns_32_5_full_dsp_U12->ce(ap_var_for_const0);
    matrixMul_fadd_32ns_32ns_32_5_full_dsp_U12->dout(grp_fu_143_p2);
    matrixMul_fmul_32ns_32ns_32_4_max_dsp_U13 = new matrixMul_fmul_32ns_32ns_32_4_max_dsp<1,4,32,32,32>("matrixMul_fmul_32ns_32ns_32_4_max_dsp_U13");
    matrixMul_fmul_32ns_32ns_32_4_max_dsp_U13->clk(ap_clk);
    matrixMul_fmul_32ns_32ns_32_4_max_dsp_U13->reset(ap_rst);
    matrixMul_fmul_32ns_32ns_32_4_max_dsp_U13->din0(As_q0);
    matrixMul_fmul_32ns_32ns_32_4_max_dsp_U13->din1(Bs_q0);
    matrixMul_fmul_32ns_32ns_32_4_max_dsp_U13->ce(ap_var_for_const0);
    matrixMul_fmul_32ns_32ns_32_4_max_dsp_U13->dout(grp_fu_147_p2);

    SC_METHOD(thread_ap_clk_no_reset_);
    dont_initialize();
    sensitive << ( ap_clk.pos() );

    SC_METHOD(thread_As_address0);
    sensitive << ( ap_sig_cseq_ST_st5_fsm_4 );
    sensitive << ( tmp_25_cast_fu_233_p1 );

    SC_METHOD(thread_As_ce0);
    sensitive << ( ap_sig_cseq_ST_st5_fsm_4 );

    SC_METHOD(thread_Bs_address0);
    sensitive << ( ap_sig_cseq_ST_st5_fsm_4 );
    sensitive << ( tmp_28_cast_fu_255_p1 );

    SC_METHOD(thread_Bs_ce0);
    sensitive << ( ap_sig_cseq_ST_st5_fsm_4 );

    SC_METHOD(thread_Csub_block_address0);
    sensitive << ( Csub_block_addr_reg_310 );
    sensitive << ( ap_sig_cseq_ST_st15_fsm_14 );
    sensitive << ( ap_sig_cseq_ST_st8_fsm_7 );

    SC_METHOD(thread_Csub_block_ce0);
    sensitive << ( ap_sig_cseq_ST_st15_fsm_14 );
    sensitive << ( ap_sig_cseq_ST_st8_fsm_7 );

    SC_METHOD(thread_Csub_block_d0);
    sensitive << ( tmp_15_reg_353 );
    sensitive << ( ap_sig_cseq_ST_st15_fsm_14 );

    SC_METHOD(thread_Csub_block_we0);
    sensitive << ( ap_sig_cseq_ST_st15_fsm_14 );

    SC_METHOD(thread_ap_done);
    sensitive << ( ap_start );
    sensitive << ( ap_sig_cseq_ST_st1_fsm_0 );
    sensitive << ( ap_sig_cseq_ST_st2_fsm_1 );
    sensitive << ( exitcond3_fu_153_p2 );

    SC_METHOD(thread_ap_idle);
    sensitive << ( ap_start );
    sensitive << ( ap_sig_cseq_ST_st1_fsm_0 );

    SC_METHOD(thread_ap_ready);
    sensitive << ( ap_sig_cseq_ST_st2_fsm_1 );
    sensitive << ( exitcond3_fu_153_p2 );

    SC_METHOD(thread_ap_sig_100);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_sig_116);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_sig_131);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_sig_141);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_sig_151);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_sig_176);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_sig_186);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_sig_197);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_sig_32);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_sig_76);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_sig_85);
    sensitive << ( ap_CS_fsm );

    SC_METHOD(thread_ap_sig_cseq_ST_st10_fsm_9);
    sensitive << ( ap_sig_197 );

    SC_METHOD(thread_ap_sig_cseq_ST_st14_fsm_13);
    sensitive << ( ap_sig_151 );

    SC_METHOD(thread_ap_sig_cseq_ST_st15_fsm_14);
    sensitive << ( ap_sig_176 );

    SC_METHOD(thread_ap_sig_cseq_ST_st1_fsm_0);
    sensitive << ( ap_sig_32 );

    SC_METHOD(thread_ap_sig_cseq_ST_st2_fsm_1);
    sensitive << ( ap_sig_76 );

    SC_METHOD(thread_ap_sig_cseq_ST_st3_fsm_2);
    sensitive << ( ap_sig_85 );

    SC_METHOD(thread_ap_sig_cseq_ST_st4_fsm_3);
    sensitive << ( ap_sig_100 );

    SC_METHOD(thread_ap_sig_cseq_ST_st5_fsm_4);
    sensitive << ( ap_sig_116 );

    SC_METHOD(thread_ap_sig_cseq_ST_st6_fsm_5);
    sensitive << ( ap_sig_131 );

    SC_METHOD(thread_ap_sig_cseq_ST_st8_fsm_7);
    sensitive << ( ap_sig_186 );

    SC_METHOD(thread_ap_sig_cseq_ST_st9_fsm_8);
    sensitive << ( ap_sig_141 );

    SC_METHOD(thread_exitcond1_fu_187_p2);
    sensitive << ( blockDim_x );
    sensitive << ( ap_sig_cseq_ST_st4_fsm_3 );
    sensitive << ( threadIdx_x_reg_121 );

    SC_METHOD(thread_exitcond2_fu_164_p2);
    sensitive << ( blockDim_y );
    sensitive << ( ap_sig_cseq_ST_st3_fsm_2 );
    sensitive << ( threadIdx_y_reg_110 );

    SC_METHOD(thread_exitcond3_fu_153_p2);
    sensitive << ( blockDim_z );
    sensitive << ( ap_sig_cseq_ST_st2_fsm_1 );
    sensitive << ( threadIdx_2_reg_99 );

    SC_METHOD(thread_exitcond_fu_212_p2);
    sensitive << ( ap_sig_cseq_ST_st5_fsm_4 );
    sensitive << ( k_reg_132 );

    SC_METHOD(thread_k_1_fu_218_p2);
    sensitive << ( k_reg_132 );

    SC_METHOD(thread_threadIdx_z_fu_158_p2);
    sensitive << ( threadIdx_2_reg_99 );

    SC_METHOD(thread_tmp_10_fu_202_p2);
    sensitive << ( tmp_23_cast_reg_291 );
    sensitive << ( tmp_7_fu_198_p1 );

    SC_METHOD(thread_tmp_11_fu_228_p2);
    sensitive << ( tmp_23_cast_reg_291 );
    sensitive << ( tmp_19_cast_fu_224_p1 );

    SC_METHOD(thread_tmp_12_fu_238_p3);
    sensitive << ( k_reg_132 );

    SC_METHOD(thread_tmp_13_fu_250_p2);
    sensitive << ( tmp_7_reg_305 );
    sensitive << ( tmp_27_cast_fu_246_p1 );

    SC_METHOD(thread_tmp_19_cast_fu_224_p1);
    sensitive << ( k_reg_132 );

    SC_METHOD(thread_tmp_23_cast_fu_179_p3);
    sensitive << ( tmp_6_fu_175_p1 );

    SC_METHOD(thread_tmp_24_cast_fu_207_p1);
    sensitive << ( tmp_10_fu_202_p2 );

    SC_METHOD(thread_tmp_25_cast_fu_233_p1);
    sensitive << ( tmp_11_fu_228_p2 );

    SC_METHOD(thread_tmp_27_cast_fu_246_p1);
    sensitive << ( tmp_12_fu_238_p3 );

    SC_METHOD(thread_tmp_28_cast_fu_255_p1);
    sensitive << ( tmp_13_fu_250_p2 );

    SC_METHOD(thread_tmp_6_fu_175_p1);
    sensitive << ( threadIdx_y_reg_110 );

    SC_METHOD(thread_tmp_7_fu_198_p1);
    sensitive << ( threadIdx_x_reg_121 );

    SC_METHOD(thread_tmp_9_fu_192_p2);
    sensitive << ( threadIdx_x_reg_121 );

    SC_METHOD(thread_tmp_s_fu_169_p2);
    sensitive << ( threadIdx_y_reg_110 );

    SC_METHOD(thread_ap_NS_fsm);
    sensitive << ( ap_start );
    sensitive << ( ap_CS_fsm );
    sensitive << ( exitcond2_fu_164_p2 );
    sensitive << ( exitcond1_fu_187_p2 );
    sensitive << ( exitcond_fu_212_p2 );
    sensitive << ( exitcond3_fu_153_p2 );

    SC_THREAD(thread_ap_var_for_const0);

    ap_CS_fsm = "000000000000001";
    static int apTFileNum = 0;
    stringstream apTFilenSS;
    apTFilenSS << "matrixMul_matrixMul_SNC_7_sc_trace_" << apTFileNum ++;
    string apTFn = apTFilenSS.str();
    mVcdFile = sc_create_vcd_trace_file(apTFn.c_str());
    mVcdFile->set_time_unit(1, SC_PS);
    if (1) {
#ifdef __HLS_TRACE_LEVEL_PORT_HIER__
    sc_trace(mVcdFile, ap_clk, "(port)ap_clk");
    sc_trace(mVcdFile, ap_rst, "(port)ap_rst");
    sc_trace(mVcdFile, ap_start, "(port)ap_start");
    sc_trace(mVcdFile, ap_done, "(port)ap_done");
    sc_trace(mVcdFile, ap_idle, "(port)ap_idle");
    sc_trace(mVcdFile, ap_ready, "(port)ap_ready");
    sc_trace(mVcdFile, blockDim_x, "(port)blockDim_x");
    sc_trace(mVcdFile, blockDim_y, "(port)blockDim_y");
    sc_trace(mVcdFile, blockDim_z, "(port)blockDim_z");
    sc_trace(mVcdFile, Csub_block_address0, "(port)Csub_block_address0");
    sc_trace(mVcdFile, Csub_block_ce0, "(port)Csub_block_ce0");
    sc_trace(mVcdFile, Csub_block_we0, "(port)Csub_block_we0");
    sc_trace(mVcdFile, Csub_block_d0, "(port)Csub_block_d0");
    sc_trace(mVcdFile, Csub_block_q0, "(port)Csub_block_q0");
    sc_trace(mVcdFile, As_address0, "(port)As_address0");
    sc_trace(mVcdFile, As_ce0, "(port)As_ce0");
    sc_trace(mVcdFile, As_q0, "(port)As_q0");
    sc_trace(mVcdFile, Bs_address0, "(port)Bs_address0");
    sc_trace(mVcdFile, Bs_ce0, "(port)Bs_ce0");
    sc_trace(mVcdFile, Bs_q0, "(port)Bs_q0");
#endif
#ifdef __HLS_TRACE_LEVEL_INT__
    sc_trace(mVcdFile, ap_CS_fsm, "ap_CS_fsm");
    sc_trace(mVcdFile, ap_sig_cseq_ST_st1_fsm_0, "ap_sig_cseq_ST_st1_fsm_0");
    sc_trace(mVcdFile, ap_sig_32, "ap_sig_32");
    sc_trace(mVcdFile, threadIdx_z_fu_158_p2, "threadIdx_z_fu_158_p2");
    sc_trace(mVcdFile, threadIdx_z_reg_278, "threadIdx_z_reg_278");
    sc_trace(mVcdFile, ap_sig_cseq_ST_st2_fsm_1, "ap_sig_cseq_ST_st2_fsm_1");
    sc_trace(mVcdFile, ap_sig_76, "ap_sig_76");
    sc_trace(mVcdFile, tmp_s_fu_169_p2, "tmp_s_fu_169_p2");
    sc_trace(mVcdFile, tmp_s_reg_286, "tmp_s_reg_286");
    sc_trace(mVcdFile, ap_sig_cseq_ST_st3_fsm_2, "ap_sig_cseq_ST_st3_fsm_2");
    sc_trace(mVcdFile, ap_sig_85, "ap_sig_85");
    sc_trace(mVcdFile, tmp_23_cast_fu_179_p3, "tmp_23_cast_fu_179_p3");
    sc_trace(mVcdFile, tmp_23_cast_reg_291, "tmp_23_cast_reg_291");
    sc_trace(mVcdFile, exitcond2_fu_164_p2, "exitcond2_fu_164_p2");
    sc_trace(mVcdFile, tmp_9_fu_192_p2, "tmp_9_fu_192_p2");
    sc_trace(mVcdFile, tmp_9_reg_300, "tmp_9_reg_300");
    sc_trace(mVcdFile, ap_sig_cseq_ST_st4_fsm_3, "ap_sig_cseq_ST_st4_fsm_3");
    sc_trace(mVcdFile, ap_sig_100, "ap_sig_100");
    sc_trace(mVcdFile, tmp_7_fu_198_p1, "tmp_7_fu_198_p1");
    sc_trace(mVcdFile, tmp_7_reg_305, "tmp_7_reg_305");
    sc_trace(mVcdFile, exitcond1_fu_187_p2, "exitcond1_fu_187_p2");
    sc_trace(mVcdFile, Csub_block_addr_reg_310, "Csub_block_addr_reg_310");
    sc_trace(mVcdFile, k_1_fu_218_p2, "k_1_fu_218_p2");
    sc_trace(mVcdFile, k_1_reg_318, "k_1_reg_318");
    sc_trace(mVcdFile, ap_sig_cseq_ST_st5_fsm_4, "ap_sig_cseq_ST_st5_fsm_4");
    sc_trace(mVcdFile, ap_sig_116, "ap_sig_116");
    sc_trace(mVcdFile, exitcond_fu_212_p2, "exitcond_fu_212_p2");
    sc_trace(mVcdFile, ap_sig_cseq_ST_st6_fsm_5, "ap_sig_cseq_ST_st6_fsm_5");
    sc_trace(mVcdFile, ap_sig_131, "ap_sig_131");
    sc_trace(mVcdFile, grp_fu_147_p2, "grp_fu_147_p2");
    sc_trace(mVcdFile, tmp_14_reg_343, "tmp_14_reg_343");
    sc_trace(mVcdFile, ap_sig_cseq_ST_st9_fsm_8, "ap_sig_cseq_ST_st9_fsm_8");
    sc_trace(mVcdFile, ap_sig_141, "ap_sig_141");
    sc_trace(mVcdFile, Csub_block_load_reg_348, "Csub_block_load_reg_348");
    sc_trace(mVcdFile, grp_fu_143_p2, "grp_fu_143_p2");
    sc_trace(mVcdFile, tmp_15_reg_353, "tmp_15_reg_353");
    sc_trace(mVcdFile, ap_sig_cseq_ST_st14_fsm_13, "ap_sig_cseq_ST_st14_fsm_13");
    sc_trace(mVcdFile, ap_sig_151, "ap_sig_151");
    sc_trace(mVcdFile, threadIdx_2_reg_99, "threadIdx_2_reg_99");
    sc_trace(mVcdFile, threadIdx_y_reg_110, "threadIdx_y_reg_110");
    sc_trace(mVcdFile, exitcond3_fu_153_p2, "exitcond3_fu_153_p2");
    sc_trace(mVcdFile, threadIdx_x_reg_121, "threadIdx_x_reg_121");
    sc_trace(mVcdFile, k_reg_132, "k_reg_132");
    sc_trace(mVcdFile, ap_sig_cseq_ST_st15_fsm_14, "ap_sig_cseq_ST_st15_fsm_14");
    sc_trace(mVcdFile, ap_sig_176, "ap_sig_176");
    sc_trace(mVcdFile, tmp_24_cast_fu_207_p1, "tmp_24_cast_fu_207_p1");
    sc_trace(mVcdFile, tmp_25_cast_fu_233_p1, "tmp_25_cast_fu_233_p1");
    sc_trace(mVcdFile, tmp_28_cast_fu_255_p1, "tmp_28_cast_fu_255_p1");
    sc_trace(mVcdFile, ap_sig_cseq_ST_st8_fsm_7, "ap_sig_cseq_ST_st8_fsm_7");
    sc_trace(mVcdFile, ap_sig_186, "ap_sig_186");
    sc_trace(mVcdFile, ap_sig_cseq_ST_st10_fsm_9, "ap_sig_cseq_ST_st10_fsm_9");
    sc_trace(mVcdFile, ap_sig_197, "ap_sig_197");
    sc_trace(mVcdFile, tmp_6_fu_175_p1, "tmp_6_fu_175_p1");
    sc_trace(mVcdFile, tmp_10_fu_202_p2, "tmp_10_fu_202_p2");
    sc_trace(mVcdFile, tmp_19_cast_fu_224_p1, "tmp_19_cast_fu_224_p1");
    sc_trace(mVcdFile, tmp_11_fu_228_p2, "tmp_11_fu_228_p2");
    sc_trace(mVcdFile, tmp_12_fu_238_p3, "tmp_12_fu_238_p3");
    sc_trace(mVcdFile, tmp_27_cast_fu_246_p1, "tmp_27_cast_fu_246_p1");
    sc_trace(mVcdFile, tmp_13_fu_250_p2, "tmp_13_fu_250_p2");
    sc_trace(mVcdFile, ap_NS_fsm, "ap_NS_fsm");
#endif

    }
}

matrixMul_matrixMul_SNC_7::~matrixMul_matrixMul_SNC_7() {
    if (mVcdFile) 
        sc_close_vcd_trace_file(mVcdFile);

    delete matrixMul_fadd_32ns_32ns_32_5_full_dsp_U12;
    delete matrixMul_fmul_32ns_32ns_32_4_max_dsp_U13;
}

void matrixMul_matrixMul_SNC_7::thread_ap_var_for_const0() {
    ap_var_for_const0 = ap_const_logic_1;
}

void matrixMul_matrixMul_SNC_7::thread_ap_clk_no_reset_() {
    if ( ap_rst.read() == ap_const_logic_1) {
        ap_CS_fsm = ap_ST_st1_fsm_0;
    } else {
        ap_CS_fsm = ap_NS_fsm.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st15_fsm_14.read())) {
        k_reg_132 = k_1_reg_318.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st4_fsm_3.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_0, exitcond1_fu_187_p2.read()))) {
        k_reg_132 = ap_const_lv5_0;
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st3_fsm_2.read()) && 
         !esl_seteq<1,1,1>(exitcond2_fu_164_p2.read(), ap_const_lv1_0))) {
        threadIdx_2_reg_99 = threadIdx_z_reg_278.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st1_fsm_0.read()) && 
                !esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0))) {
        threadIdx_2_reg_99 = ap_const_lv32_0;
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st3_fsm_2.read()) && 
         esl_seteq<1,1,1>(exitcond2_fu_164_p2.read(), ap_const_lv1_0))) {
        threadIdx_x_reg_121 = ap_const_lv32_0;
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st5_fsm_4.read()) && 
                !esl_seteq<1,1,1>(ap_const_lv1_0, exitcond_fu_212_p2.read()))) {
        threadIdx_x_reg_121 = tmp_9_reg_300.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st4_fsm_3.read()) && 
         !esl_seteq<1,1,1>(ap_const_lv1_0, exitcond1_fu_187_p2.read()))) {
        threadIdx_y_reg_110 = tmp_s_reg_286.read();
    } else if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st2_fsm_1.read()) && 
                esl_seteq<1,1,1>(ap_const_lv1_0, exitcond3_fu_153_p2.read()))) {
        threadIdx_y_reg_110 = ap_const_lv32_0;
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st4_fsm_3.read()) && esl_seteq<1,1,1>(ap_const_lv1_0, exitcond1_fu_187_p2.read()))) {
        Csub_block_addr_reg_310 =  (sc_lv<8>) (tmp_24_cast_fu_207_p1.read());
        tmp_7_reg_305 = tmp_7_fu_198_p1.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st9_fsm_8.read())) {
        Csub_block_load_reg_348 = Csub_block_q0.read();
        tmp_14_reg_343 = grp_fu_147_p2.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st5_fsm_4.read())) {
        k_1_reg_318 = k_1_fu_218_p2.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st2_fsm_1.read())) {
        threadIdx_z_reg_278 = threadIdx_z_fu_158_p2.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st14_fsm_13.read())) {
        tmp_15_reg_353 = grp_fu_143_p2.read();
    }
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st3_fsm_2.read()) && esl_seteq<1,1,1>(exitcond2_fu_164_p2.read(), ap_const_lv1_0))) {
        tmp_23_cast_reg_291 = tmp_23_cast_fu_179_p3.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st4_fsm_3.read())) {
        tmp_9_reg_300 = tmp_9_fu_192_p2.read();
    }
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st3_fsm_2.read())) {
        tmp_s_reg_286 = tmp_s_fu_169_p2.read();
    }
}

void matrixMul_matrixMul_SNC_7::thread_As_address0() {
    As_address0 =  (sc_lv<8>) (tmp_25_cast_fu_233_p1.read());
}

void matrixMul_matrixMul_SNC_7::thread_As_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st5_fsm_4.read())) {
        As_ce0 = ap_const_logic_1;
    } else {
        As_ce0 = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_Bs_address0() {
    Bs_address0 =  (sc_lv<8>) (tmp_28_cast_fu_255_p1.read());
}

void matrixMul_matrixMul_SNC_7::thread_Bs_ce0() {
    if (esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st5_fsm_4.read())) {
        Bs_ce0 = ap_const_logic_1;
    } else {
        Bs_ce0 = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_Csub_block_address0() {
    Csub_block_address0 = Csub_block_addr_reg_310.read();
}

void matrixMul_matrixMul_SNC_7::thread_Csub_block_ce0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st15_fsm_14.read()) || 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st8_fsm_7.read()))) {
        Csub_block_ce0 = ap_const_logic_1;
    } else {
        Csub_block_ce0 = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_Csub_block_d0() {
    Csub_block_d0 = tmp_15_reg_353.read();
}

void matrixMul_matrixMul_SNC_7::thread_Csub_block_we0() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st15_fsm_14.read()))) {
        Csub_block_we0 = ap_const_logic_1;
    } else {
        Csub_block_we0 = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_ap_done() {
    if (((esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) && 
          esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st1_fsm_0.read())) || 
         (esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st2_fsm_1.read()) && 
          !esl_seteq<1,1,1>(ap_const_lv1_0, exitcond3_fu_153_p2.read())))) {
        ap_done = ap_const_logic_1;
    } else {
        ap_done = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_ap_idle() {
    if ((esl_seteq<1,1,1>(ap_const_logic_0, ap_start.read()) && 
         esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st1_fsm_0.read()))) {
        ap_idle = ap_const_logic_1;
    } else {
        ap_idle = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_ap_ready() {
    if ((esl_seteq<1,1,1>(ap_const_logic_1, ap_sig_cseq_ST_st2_fsm_1.read()) && 
         !esl_seteq<1,1,1>(ap_const_lv1_0, exitcond3_fu_153_p2.read()))) {
        ap_ready = ap_const_logic_1;
    } else {
        ap_ready = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_100() {
    ap_sig_100 = esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm.read().range(3, 3));
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_116() {
    ap_sig_116 = esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm.read().range(4, 4));
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_131() {
    ap_sig_131 = esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm.read().range(5, 5));
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_141() {
    ap_sig_141 = esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm.read().range(8, 8));
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_151() {
    ap_sig_151 = esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm.read().range(13, 13));
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_176() {
    ap_sig_176 = esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm.read().range(14, 14));
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_186() {
    ap_sig_186 = esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm.read().range(7, 7));
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_197() {
    ap_sig_197 = esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm.read().range(9, 9));
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_32() {
    ap_sig_32 = esl_seteq<1,1,1>(ap_CS_fsm.read().range(0, 0), ap_const_lv1_1);
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_76() {
    ap_sig_76 = esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm.read().range(1, 1));
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_85() {
    ap_sig_85 = esl_seteq<1,1,1>(ap_const_lv1_1, ap_CS_fsm.read().range(2, 2));
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_cseq_ST_st10_fsm_9() {
    if (ap_sig_197.read()) {
        ap_sig_cseq_ST_st10_fsm_9 = ap_const_logic_1;
    } else {
        ap_sig_cseq_ST_st10_fsm_9 = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_cseq_ST_st14_fsm_13() {
    if (ap_sig_151.read()) {
        ap_sig_cseq_ST_st14_fsm_13 = ap_const_logic_1;
    } else {
        ap_sig_cseq_ST_st14_fsm_13 = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_cseq_ST_st15_fsm_14() {
    if (ap_sig_176.read()) {
        ap_sig_cseq_ST_st15_fsm_14 = ap_const_logic_1;
    } else {
        ap_sig_cseq_ST_st15_fsm_14 = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_cseq_ST_st1_fsm_0() {
    if (ap_sig_32.read()) {
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_1;
    } else {
        ap_sig_cseq_ST_st1_fsm_0 = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_cseq_ST_st2_fsm_1() {
    if (ap_sig_76.read()) {
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_1;
    } else {
        ap_sig_cseq_ST_st2_fsm_1 = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_cseq_ST_st3_fsm_2() {
    if (ap_sig_85.read()) {
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_1;
    } else {
        ap_sig_cseq_ST_st3_fsm_2 = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_cseq_ST_st4_fsm_3() {
    if (ap_sig_100.read()) {
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_1;
    } else {
        ap_sig_cseq_ST_st4_fsm_3 = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_cseq_ST_st5_fsm_4() {
    if (ap_sig_116.read()) {
        ap_sig_cseq_ST_st5_fsm_4 = ap_const_logic_1;
    } else {
        ap_sig_cseq_ST_st5_fsm_4 = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_cseq_ST_st6_fsm_5() {
    if (ap_sig_131.read()) {
        ap_sig_cseq_ST_st6_fsm_5 = ap_const_logic_1;
    } else {
        ap_sig_cseq_ST_st6_fsm_5 = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_cseq_ST_st8_fsm_7() {
    if (ap_sig_186.read()) {
        ap_sig_cseq_ST_st8_fsm_7 = ap_const_logic_1;
    } else {
        ap_sig_cseq_ST_st8_fsm_7 = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_ap_sig_cseq_ST_st9_fsm_8() {
    if (ap_sig_141.read()) {
        ap_sig_cseq_ST_st9_fsm_8 = ap_const_logic_1;
    } else {
        ap_sig_cseq_ST_st9_fsm_8 = ap_const_logic_0;
    }
}

void matrixMul_matrixMul_SNC_7::thread_exitcond1_fu_187_p2() {
    exitcond1_fu_187_p2 = (!threadIdx_x_reg_121.read().is_01() || !blockDim_x.read().is_01())? sc_lv<1>(): sc_lv<1>(threadIdx_x_reg_121.read() == blockDim_x.read());
}

void matrixMul_matrixMul_SNC_7::thread_exitcond2_fu_164_p2() {
    exitcond2_fu_164_p2 = (!threadIdx_y_reg_110.read().is_01() || !blockDim_y.read().is_01())? sc_lv<1>(): sc_lv<1>(threadIdx_y_reg_110.read() == blockDim_y.read());
}

void matrixMul_matrixMul_SNC_7::thread_exitcond3_fu_153_p2() {
    exitcond3_fu_153_p2 = (!threadIdx_2_reg_99.read().is_01() || !blockDim_z.read().is_01())? sc_lv<1>(): sc_lv<1>(threadIdx_2_reg_99.read() == blockDim_z.read());
}

void matrixMul_matrixMul_SNC_7::thread_exitcond_fu_212_p2() {
    exitcond_fu_212_p2 = (!k_reg_132.read().is_01() || !ap_const_lv5_10.is_01())? sc_lv<1>(): sc_lv<1>(k_reg_132.read() == ap_const_lv5_10);
}

void matrixMul_matrixMul_SNC_7::thread_k_1_fu_218_p2() {
    k_1_fu_218_p2 = (!k_reg_132.read().is_01() || !ap_const_lv5_1.is_01())? sc_lv<5>(): (sc_biguint<5>(k_reg_132.read()) + sc_biguint<5>(ap_const_lv5_1));
}

void matrixMul_matrixMul_SNC_7::thread_threadIdx_z_fu_158_p2() {
    threadIdx_z_fu_158_p2 = (!threadIdx_2_reg_99.read().is_01() || !ap_const_lv32_1.is_01())? sc_lv<32>(): (sc_biguint<32>(threadIdx_2_reg_99.read()) + sc_biguint<32>(ap_const_lv32_1));
}

void matrixMul_matrixMul_SNC_7::thread_tmp_10_fu_202_p2() {
    tmp_10_fu_202_p2 = (!tmp_23_cast_reg_291.read().is_01() || !tmp_7_fu_198_p1.read().is_01())? sc_lv<10>(): (sc_biguint<10>(tmp_23_cast_reg_291.read()) + sc_biguint<10>(tmp_7_fu_198_p1.read()));
}

void matrixMul_matrixMul_SNC_7::thread_tmp_11_fu_228_p2() {
    tmp_11_fu_228_p2 = (!tmp_19_cast_fu_224_p1.read().is_01() || !tmp_23_cast_reg_291.read().is_01())? sc_lv<10>(): (sc_biguint<10>(tmp_19_cast_fu_224_p1.read()) + sc_biguint<10>(tmp_23_cast_reg_291.read()));
}

void matrixMul_matrixMul_SNC_7::thread_tmp_12_fu_238_p3() {
    tmp_12_fu_238_p3 = esl_concat<5,4>(k_reg_132.read(), ap_const_lv4_0);
}

void matrixMul_matrixMul_SNC_7::thread_tmp_13_fu_250_p2() {
    tmp_13_fu_250_p2 = (!tmp_7_reg_305.read().is_01() || !tmp_27_cast_fu_246_p1.read().is_01())? sc_lv<10>(): (sc_biguint<10>(tmp_7_reg_305.read()) + sc_biguint<10>(tmp_27_cast_fu_246_p1.read()));
}

void matrixMul_matrixMul_SNC_7::thread_tmp_19_cast_fu_224_p1() {
    tmp_19_cast_fu_224_p1 = esl_zext<10,5>(k_reg_132.read());
}

void matrixMul_matrixMul_SNC_7::thread_tmp_23_cast_fu_179_p3() {
    tmp_23_cast_fu_179_p3 = esl_concat<6,4>(tmp_6_fu_175_p1.read(), ap_const_lv4_0);
}

void matrixMul_matrixMul_SNC_7::thread_tmp_24_cast_fu_207_p1() {
    tmp_24_cast_fu_207_p1 = esl_zext<64,10>(tmp_10_fu_202_p2.read());
}

void matrixMul_matrixMul_SNC_7::thread_tmp_25_cast_fu_233_p1() {
    tmp_25_cast_fu_233_p1 = esl_zext<64,10>(tmp_11_fu_228_p2.read());
}

void matrixMul_matrixMul_SNC_7::thread_tmp_27_cast_fu_246_p1() {
    tmp_27_cast_fu_246_p1 = esl_zext<10,9>(tmp_12_fu_238_p3.read());
}

void matrixMul_matrixMul_SNC_7::thread_tmp_28_cast_fu_255_p1() {
    tmp_28_cast_fu_255_p1 = esl_zext<64,10>(tmp_13_fu_250_p2.read());
}

void matrixMul_matrixMul_SNC_7::thread_tmp_6_fu_175_p1() {
    tmp_6_fu_175_p1 = threadIdx_y_reg_110.read().range(6-1, 0);
}

void matrixMul_matrixMul_SNC_7::thread_tmp_7_fu_198_p1() {
    tmp_7_fu_198_p1 = threadIdx_x_reg_121.read().range(10-1, 0);
}

void matrixMul_matrixMul_SNC_7::thread_tmp_9_fu_192_p2() {
    tmp_9_fu_192_p2 = (!threadIdx_x_reg_121.read().is_01() || !ap_const_lv32_1.is_01())? sc_lv<32>(): (sc_biguint<32>(threadIdx_x_reg_121.read()) + sc_biguint<32>(ap_const_lv32_1));
}

void matrixMul_matrixMul_SNC_7::thread_tmp_s_fu_169_p2() {
    tmp_s_fu_169_p2 = (!threadIdx_y_reg_110.read().is_01() || !ap_const_lv32_1.is_01())? sc_lv<32>(): (sc_biguint<32>(threadIdx_y_reg_110.read()) + sc_biguint<32>(ap_const_lv32_1));
}

void matrixMul_matrixMul_SNC_7::thread_ap_NS_fsm() {
    switch (ap_CS_fsm.read().to_uint64()) {
        case 1 : 
            if (!esl_seteq<1,1,1>(ap_start.read(), ap_const_logic_0)) {
                ap_NS_fsm = ap_ST_st2_fsm_1;
            } else {
                ap_NS_fsm = ap_ST_st1_fsm_0;
            }
            break;
        case 2 : 
            if (!esl_seteq<1,1,1>(ap_const_lv1_0, exitcond3_fu_153_p2.read())) {
                ap_NS_fsm = ap_ST_st1_fsm_0;
            } else {
                ap_NS_fsm = ap_ST_st3_fsm_2;
            }
            break;
        case 4 : 
            if (esl_seteq<1,1,1>(exitcond2_fu_164_p2.read(), ap_const_lv1_0)) {
                ap_NS_fsm = ap_ST_st4_fsm_3;
            } else {
                ap_NS_fsm = ap_ST_st2_fsm_1;
            }
            break;
        case 8 : 
            if (esl_seteq<1,1,1>(ap_const_lv1_0, exitcond1_fu_187_p2.read())) {
                ap_NS_fsm = ap_ST_st5_fsm_4;
            } else {
                ap_NS_fsm = ap_ST_st3_fsm_2;
            }
            break;
        case 16 : 
            if (!esl_seteq<1,1,1>(ap_const_lv1_0, exitcond_fu_212_p2.read())) {
                ap_NS_fsm = ap_ST_st4_fsm_3;
            } else {
                ap_NS_fsm = ap_ST_st6_fsm_5;
            }
            break;
        case 32 : 
            ap_NS_fsm = ap_ST_st7_fsm_6;
            break;
        case 64 : 
            ap_NS_fsm = ap_ST_st8_fsm_7;
            break;
        case 128 : 
            ap_NS_fsm = ap_ST_st9_fsm_8;
            break;
        case 256 : 
            ap_NS_fsm = ap_ST_st10_fsm_9;
            break;
        case 512 : 
            ap_NS_fsm = ap_ST_st11_fsm_10;
            break;
        case 1024 : 
            ap_NS_fsm = ap_ST_st12_fsm_11;
            break;
        case 2048 : 
            ap_NS_fsm = ap_ST_st13_fsm_12;
            break;
        case 4096 : 
            ap_NS_fsm = ap_ST_st14_fsm_13;
            break;
        case 8192 : 
            ap_NS_fsm = ap_ST_st15_fsm_14;
            break;
        case 16384 : 
            ap_NS_fsm = ap_ST_st5_fsm_4;
            break;
        default : 
            ap_NS_fsm = "XXXXXXXXXXXXXXX";
            break;
    }
}

}

