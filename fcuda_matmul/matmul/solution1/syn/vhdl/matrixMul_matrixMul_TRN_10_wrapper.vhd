-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2016.2
-- Copyright (C) 1986-2016 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity matrixMul_matrixMul_TRN_10_wrapper is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    blockDim_x : IN STD_LOGIC_VECTOR (31 downto 0);
    blockDim_y : IN STD_LOGIC_VECTOR (31 downto 0);
    blockDim_z : IN STD_LOGIC_VECTOR (31 downto 0);
    C_req_din : OUT STD_LOGIC;
    C_req_full_n : IN STD_LOGIC;
    C_req_write : OUT STD_LOGIC;
    C_rsp_empty_n : IN STD_LOGIC;
    C_rsp_read : OUT STD_LOGIC;
    C_address : OUT STD_LOGIC_VECTOR (31 downto 0);
    C_datain : IN STD_LOGIC_VECTOR (31 downto 0);
    C_dataout : OUT STD_LOGIC_VECTOR (31 downto 0);
    C_size : OUT STD_LOGIC_VECTOR (31 downto 0);
    Csub_block_block0_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    Csub_block_block0_ce0 : OUT STD_LOGIC;
    Csub_block_block0_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
    c_block0 : IN STD_LOGIC_VECTOR (31 downto 0);
    wB : IN STD_LOGIC_VECTOR (31 downto 0) );
end;


architecture behav of matrixMul_matrixMul_TRN_10_wrapper is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";

    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_19 : BOOLEAN;
    signal grp_matrixMul_matrixMul_TRN_10_fu_58_ap_start : STD_LOGIC;
    signal grp_matrixMul_matrixMul_TRN_10_fu_58_ap_done : STD_LOGIC;
    signal grp_matrixMul_matrixMul_TRN_10_fu_58_ap_idle : STD_LOGIC;
    signal grp_matrixMul_matrixMul_TRN_10_fu_58_ap_ready : STD_LOGIC;
    signal grp_matrixMul_matrixMul_TRN_10_fu_58_C_req_din : STD_LOGIC;
    signal grp_matrixMul_matrixMul_TRN_10_fu_58_C_req_write : STD_LOGIC;
    signal grp_matrixMul_matrixMul_TRN_10_fu_58_C_rsp_read : STD_LOGIC;
    signal grp_matrixMul_matrixMul_TRN_10_fu_58_C_address : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_matrixMul_matrixMul_TRN_10_fu_58_C_dataout : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_matrixMul_matrixMul_TRN_10_fu_58_C_size : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_matrixMul_matrixMul_TRN_10_fu_58_Csub_block_address0 : STD_LOGIC_VECTOR (7 downto 0);
    signal grp_matrixMul_matrixMul_TRN_10_fu_58_Csub_block_ce0 : STD_LOGIC;
    signal ap_reg_grp_matrixMul_matrixMul_TRN_10_fu_58_ap_start : STD_LOGIC := '0';
    signal ap_sig_cseq_ST_st2_fsm_1 : STD_LOGIC;
    signal ap_sig_91 : BOOLEAN;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);

    component matrixMul_matrixMul_TRN_10 IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        blockDim_x : IN STD_LOGIC_VECTOR (31 downto 0);
        blockDim_y : IN STD_LOGIC_VECTOR (31 downto 0);
        blockDim_z : IN STD_LOGIC_VECTOR (31 downto 0);
        C_req_din : OUT STD_LOGIC;
        C_req_full_n : IN STD_LOGIC;
        C_req_write : OUT STD_LOGIC;
        C_rsp_empty_n : IN STD_LOGIC;
        C_rsp_read : OUT STD_LOGIC;
        C_address : OUT STD_LOGIC_VECTOR (31 downto 0);
        C_datain : IN STD_LOGIC_VECTOR (31 downto 0);
        C_dataout : OUT STD_LOGIC_VECTOR (31 downto 0);
        C_size : OUT STD_LOGIC_VECTOR (31 downto 0);
        Csub_block_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
        Csub_block_ce0 : OUT STD_LOGIC;
        Csub_block_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        c_r : IN STD_LOGIC_VECTOR (31 downto 0);
        wB : IN STD_LOGIC_VECTOR (31 downto 0) );
    end component;



begin
    grp_matrixMul_matrixMul_TRN_10_fu_58 : component matrixMul_matrixMul_TRN_10
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => grp_matrixMul_matrixMul_TRN_10_fu_58_ap_start,
        ap_done => grp_matrixMul_matrixMul_TRN_10_fu_58_ap_done,
        ap_idle => grp_matrixMul_matrixMul_TRN_10_fu_58_ap_idle,
        ap_ready => grp_matrixMul_matrixMul_TRN_10_fu_58_ap_ready,
        blockDim_x => blockDim_x,
        blockDim_y => blockDim_y,
        blockDim_z => blockDim_z,
        C_req_din => grp_matrixMul_matrixMul_TRN_10_fu_58_C_req_din,
        C_req_full_n => C_req_full_n,
        C_req_write => grp_matrixMul_matrixMul_TRN_10_fu_58_C_req_write,
        C_rsp_empty_n => C_rsp_empty_n,
        C_rsp_read => grp_matrixMul_matrixMul_TRN_10_fu_58_C_rsp_read,
        C_address => grp_matrixMul_matrixMul_TRN_10_fu_58_C_address,
        C_datain => C_datain,
        C_dataout => grp_matrixMul_matrixMul_TRN_10_fu_58_C_dataout,
        C_size => grp_matrixMul_matrixMul_TRN_10_fu_58_C_size,
        Csub_block_address0 => grp_matrixMul_matrixMul_TRN_10_fu_58_Csub_block_address0,
        Csub_block_ce0 => grp_matrixMul_matrixMul_TRN_10_fu_58_Csub_block_ce0,
        Csub_block_q0 => Csub_block_block0_q0,
        c_r => c_block0,
        wB => wB);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_reg_grp_matrixMul_matrixMul_TRN_10_fu_58_ap_start_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_reg_grp_matrixMul_matrixMul_TRN_10_fu_58_ap_start <= ap_const_logic_0;
            else
                if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ap_start = ap_const_logic_0)))) then 
                    ap_reg_grp_matrixMul_matrixMul_TRN_10_fu_58_ap_start <= ap_const_logic_1;
                elsif ((ap_const_logic_1 = grp_matrixMul_matrixMul_TRN_10_fu_58_ap_ready)) then 
                    ap_reg_grp_matrixMul_matrixMul_TRN_10_fu_58_ap_start <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, grp_matrixMul_matrixMul_TRN_10_fu_58_ap_done)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not((ap_start = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if (not((ap_const_logic_0 = grp_matrixMul_matrixMul_TRN_10_fu_58_ap_done))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;
    C_address <= grp_matrixMul_matrixMul_TRN_10_fu_58_C_address;
    C_dataout <= grp_matrixMul_matrixMul_TRN_10_fu_58_C_dataout;
    C_req_din <= grp_matrixMul_matrixMul_TRN_10_fu_58_C_req_din;
    C_req_write <= grp_matrixMul_matrixMul_TRN_10_fu_58_C_req_write;
    C_rsp_read <= grp_matrixMul_matrixMul_TRN_10_fu_58_C_rsp_read;
    C_size <= grp_matrixMul_matrixMul_TRN_10_fu_58_C_size;
    Csub_block_block0_address0 <= grp_matrixMul_matrixMul_TRN_10_fu_58_Csub_block_address0;
    Csub_block_block0_ce0 <= grp_matrixMul_matrixMul_TRN_10_fu_58_Csub_block_ce0;

    ap_done_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0, grp_matrixMul_matrixMul_TRN_10_fu_58_ap_done, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if ((((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0)) or ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_const_logic_0 = grp_matrixMul_matrixMul_TRN_10_fu_58_ap_done))))) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_start, ap_sig_cseq_ST_st1_fsm_0)
    begin
        if (((ap_const_logic_0 = ap_start) and (ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(grp_matrixMul_matrixMul_TRN_10_fu_58_ap_done, ap_sig_cseq_ST_st2_fsm_1)
    begin
        if (((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not((ap_const_logic_0 = grp_matrixMul_matrixMul_TRN_10_fu_58_ap_done)))) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_19_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_19 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    ap_sig_91_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_91 <= (ap_const_lv1_1 = ap_CS_fsm(1 downto 1));
    end process;


    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_19)
    begin
        if (ap_sig_19) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_cseq_ST_st2_fsm_1_assign_proc : process(ap_sig_91)
    begin
        if (ap_sig_91) then 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_0;
        end if; 
    end process;

    grp_matrixMul_matrixMul_TRN_10_fu_58_ap_start <= ap_reg_grp_matrixMul_matrixMul_TRN_10_fu_58_ap_start;
end behav;