set C_TypeInfoList {{ 
"matrixMul" : [[], { "return": [[], "void"]} , [{"ExternC" : 0}], [ {"C": [[],{ "pointer": "0"}] }, {"A": [[],{ "pointer": "0"}] }, {"B": [[],{ "pointer": "0"}] }, {"wA": [[], {"scalar": "int"}] }, {"wB": [[], {"scalar": "int"}] }, {"gridDim": [[],"1"] }, {"blockDim": [[],"1"] }],[],""], 
"0": [ "DATATYPE", {"typedef": [[[], {"scalar": "float"}],""]}], 
"1": [ "dim3", {"struct": [[{"pack": 0}],[],[{ "x": [[],  {"scalar": "unsigned int"}]},{ "y": [[],  {"scalar": "unsigned int"}]},{ "z": [[],  {"scalar": "unsigned int"}]}],""]}]
}}
set moduleName matrixMul
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName {matrixMul}
set C_modelType { void 0 }
set C_modelArgList {
	{ C float 32 regular {bus 1}  }
	{ A float 32 regular {bus 0}  }
	{ B float 32 regular {bus 0}  }
	{ wA int 32 regular  }
	{ wB int 32 regular  }
	{ gridDim_x int 32 regular  }
	{ gridDim_y int 32 regular  }
	{ gridDim_z int 32 unused  }
	{ blockDim_x int 32 regular  }
	{ blockDim_y int 32 regular  }
	{ blockDim_z int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "C", "interface" : "bus", "bitwidth" : 32, "direction" : "WRITEONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "C","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 10239,"step" : 1}]}]}]} , 
 	{ "Name" : "A", "interface" : "bus", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "A","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 3839,"step" : 1}]}]}]} , 
 	{ "Name" : "B", "interface" : "bus", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "B","cData": "float","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 6143,"step" : 1}]}]}]} , 
 	{ "Name" : "wA", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "wA","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "wB", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "wB","cData": "int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "gridDim_x", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "gridDim.x","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "gridDim_y", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "gridDim.y","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "gridDim_z", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "gridDim.z","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "blockDim_x", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "blockDim.x","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "blockDim_y", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "blockDim.y","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} , 
 	{ "Name" : "blockDim_z", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY", "bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "blockDim.z","cData": "unsigned int","bit_use": { "low": 0,"up": 31},"cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}]} ]}
# RTL Port declarations: 
set portNum 41
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ C_req_din sc_out sc_logic 1 signal 0 } 
	{ C_req_full_n sc_in sc_logic 1 signal 0 } 
	{ C_req_write sc_out sc_logic 1 signal 0 } 
	{ C_rsp_empty_n sc_in sc_logic 1 signal 0 } 
	{ C_rsp_read sc_out sc_logic 1 signal 0 } 
	{ C_address sc_out sc_lv 32 signal 0 } 
	{ C_datain sc_in sc_lv 32 signal 0 } 
	{ C_dataout sc_out sc_lv 32 signal 0 } 
	{ C_size sc_out sc_lv 32 signal 0 } 
	{ A_req_din sc_out sc_logic 1 signal 1 } 
	{ A_req_full_n sc_in sc_logic 1 signal 1 } 
	{ A_req_write sc_out sc_logic 1 signal 1 } 
	{ A_rsp_empty_n sc_in sc_logic 1 signal 1 } 
	{ A_rsp_read sc_out sc_logic 1 signal 1 } 
	{ A_address sc_out sc_lv 32 signal 1 } 
	{ A_datain sc_in sc_lv 32 signal 1 } 
	{ A_dataout sc_out sc_lv 32 signal 1 } 
	{ A_size sc_out sc_lv 32 signal 1 } 
	{ B_req_din sc_out sc_logic 1 signal 2 } 
	{ B_req_full_n sc_in sc_logic 1 signal 2 } 
	{ B_req_write sc_out sc_logic 1 signal 2 } 
	{ B_rsp_empty_n sc_in sc_logic 1 signal 2 } 
	{ B_rsp_read sc_out sc_logic 1 signal 2 } 
	{ B_address sc_out sc_lv 32 signal 2 } 
	{ B_datain sc_in sc_lv 32 signal 2 } 
	{ B_dataout sc_out sc_lv 32 signal 2 } 
	{ B_size sc_out sc_lv 32 signal 2 } 
	{ wA sc_in sc_lv 32 signal 3 } 
	{ wB sc_in sc_lv 32 signal 4 } 
	{ gridDim_x sc_in sc_lv 32 signal 5 } 
	{ gridDim_y sc_in sc_lv 32 signal 6 } 
	{ gridDim_z sc_in sc_lv 32 signal 7 } 
	{ blockDim_x sc_in sc_lv 32 signal 8 } 
	{ blockDim_y sc_in sc_lv 32 signal 9 } 
	{ blockDim_z sc_in sc_lv 32 signal 10 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "C_req_din", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "req_din" }} , 
 	{ "name": "C_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "req_full_n" }} , 
 	{ "name": "C_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "req_write" }} , 
 	{ "name": "C_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "rsp_empty_n" }} , 
 	{ "name": "C_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "rsp_read" }} , 
 	{ "name": "C_address", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C", "role": "address" }} , 
 	{ "name": "C_datain", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C", "role": "datain" }} , 
 	{ "name": "C_dataout", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C", "role": "dataout" }} , 
 	{ "name": "C_size", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C", "role": "size" }} , 
 	{ "name": "A_req_din", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "req_din" }} , 
 	{ "name": "A_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "req_full_n" }} , 
 	{ "name": "A_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "req_write" }} , 
 	{ "name": "A_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "rsp_empty_n" }} , 
 	{ "name": "A_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "rsp_read" }} , 
 	{ "name": "A_address", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "address" }} , 
 	{ "name": "A_datain", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "datain" }} , 
 	{ "name": "A_dataout", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "dataout" }} , 
 	{ "name": "A_size", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "size" }} , 
 	{ "name": "B_req_din", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "req_din" }} , 
 	{ "name": "B_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "req_full_n" }} , 
 	{ "name": "B_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "req_write" }} , 
 	{ "name": "B_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "rsp_empty_n" }} , 
 	{ "name": "B_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "rsp_read" }} , 
 	{ "name": "B_address", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B", "role": "address" }} , 
 	{ "name": "B_datain", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B", "role": "datain" }} , 
 	{ "name": "B_dataout", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B", "role": "dataout" }} , 
 	{ "name": "B_size", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B", "role": "size" }} , 
 	{ "name": "wA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "wA", "role": "default" }} , 
 	{ "name": "wB", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "wB", "role": "default" }} , 
 	{ "name": "gridDim_x", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gridDim_x", "role": "default" }} , 
 	{ "name": "gridDim_y", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gridDim_y", "role": "default" }} , 
 	{ "name": "gridDim_z", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "gridDim_z", "role": "default" }} , 
 	{ "name": "blockDim_x", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "blockDim_x", "role": "default" }} , 
 	{ "name": "blockDim_y", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "blockDim_y", "role": "default" }} , 
 	{ "name": "blockDim_z", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "blockDim_z", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2", "3", "4", "7", "8"], "CDFG" : "matrixMul", "VariableLatency" : "1", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "ProcessNetwork" : "0", "Combinational" : "0", "ControlExist" : "1",
		"Port" : [
		{"Name" : "C", "Type" : "Bus", "Direction" : "O", "BlockSignal" : [], "SubConnect" : [
			{"SubInst" : "grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268", "Port" : "C"}]}, 
		{"Name" : "A", "Type" : "Bus", "Direction" : "I", "BlockSignal" : [], "SubConnect" : [
			{"SubInst" : "grp_matrixMul_matrixMul_TRN_6_fu_249", "Port" : "A"}]}, 
		{"Name" : "B", "Type" : "Bus", "Direction" : "I", "BlockSignal" : [], "SubConnect" : [
			{"SubInst" : "grp_matrixMul_matrixMul_TRN_6_fu_249", "Port" : "B"}]}, 
		{"Name" : "wA", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "wB", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "gridDim_x", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "gridDim_y", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "gridDim_z", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "blockDim_x", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "blockDim_y", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "blockDim_z", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}],
		"WaitState" : [
		{"State" : "ap_ST_st10_fsm_9", "FSM" : "ap_CS_fsm", "SubInst" : "grp_matrixMul_matrixMul_SNC_7_fu_239"},
		{"State" : "ap_ST_st8_fsm_7", "FSM" : "ap_CS_fsm", "SubInst" : "grp_matrixMul_matrixMul_TRN_6_fu_249"},
		{"State" : "ap_ST_st11_fsm_10", "FSM" : "ap_CS_fsm", "SubInst" : "grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268"}],
		"SubBlockPort" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.Csub_block_block0_U", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.As_U", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.Bs_U", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixMul_matrixMul_SNC_7_fu_239", "Parent" : "0", "Child" : ["5", "6"], "CDFG" : "matrixMul_matrixMul_SNC_7", "VariableLatency" : "1", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "ProcessNetwork" : "0", "Combinational" : "0", "ControlExist" : "1",
		"Port" : [
		{"Name" : "blockDim_x", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "blockDim_y", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "blockDim_z", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "Csub_block", "Type" : "Memory", "Direction" : "IO", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "As", "Type" : "Memory", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "Bs", "Type" : "Memory", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}],
		"WaitState" : [],
		"SubBlockPort" : []},
	{"Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixMul_matrixMul_SNC_7_fu_239.matrixMul_fadd_32ns_32ns_32_5_full_dsp_U12", "Parent" : "4", "Child" : []},
	{"Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixMul_matrixMul_SNC_7_fu_239.matrixMul_fmul_32ns_32ns_32_4_max_dsp_U13", "Parent" : "4", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixMul_matrixMul_TRN_6_fu_249", "Parent" : "0", "Child" : [], "CDFG" : "matrixMul_matrixMul_TRN_6", "VariableLatency" : "1", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "ProcessNetwork" : "0", "Combinational" : "0", "ControlExist" : "1",
		"Port" : [
		{"Name" : "blockDim_x", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "blockDim_y", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "blockDim_z", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "As", "Type" : "Memory", "Direction" : "O", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "A", "Type" : "Bus", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "a_r", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "wA", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "Bs", "Type" : "Memory", "Direction" : "O", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "B", "Type" : "Bus", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "b_r", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "wB", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}],
		"WaitState" : [],
		"SubBlockPort" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268", "Parent" : "0", "Child" : ["9"], "CDFG" : "matrixMul_matrixMul_TRN_10_wrapper", "VariableLatency" : "1", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "ProcessNetwork" : "0", "Combinational" : "0", "ControlExist" : "1",
		"Port" : [
		{"Name" : "blockDim_x", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "blockDim_y", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "blockDim_z", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "C", "Type" : "Bus", "Direction" : "O", "BlockSignal" : [], "SubConnect" : [
			{"SubInst" : "grp_matrixMul_matrixMul_TRN_10_fu_58", "Port" : "C"}]}, 
		{"Name" : "Csub_block_block0", "Type" : "Memory", "Direction" : "I", "BlockSignal" : [], "SubConnect" : [
			{"SubInst" : "grp_matrixMul_matrixMul_TRN_10_fu_58", "Port" : "Csub_block"}]}, 
		{"Name" : "c_block0", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "wB", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}],
		"WaitState" : [
		{"State" : "ap_ST_st2_fsm_1", "FSM" : "ap_CS_fsm", "SubInst" : "grp_matrixMul_matrixMul_TRN_10_fu_58"}],
		"SubBlockPort" : []},
	{"Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_matrixMul_matrixMul_TRN_10_wrapper_fu_268.grp_matrixMul_matrixMul_TRN_10_fu_58", "Parent" : "8", "Child" : [], "CDFG" : "matrixMul_matrixMul_TRN_10", "VariableLatency" : "1", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "ProcessNetwork" : "0", "Combinational" : "0", "ControlExist" : "1",
		"Port" : [
		{"Name" : "blockDim_x", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "blockDim_y", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "blockDim_z", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "C", "Type" : "Bus", "Direction" : "O", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "Csub_block", "Type" : "Memory", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "c_r", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "wB", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}],
		"WaitState" : [],
		"SubBlockPort" : []}]}

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "0", "Max" : "0"}
]}

set Spec2ImplPortList { 
	C { ap_bus {  { C_req_din fifo_data 1 1 }  { C_req_full_n fifo_status 0 1 }  { C_req_write fifo_update 1 1 }  { C_rsp_empty_n fifo_status 0 1 }  { C_rsp_read fifo_update 1 1 }  { C_address unknown 1 32 }  { C_datain unknown 0 32 }  { C_dataout unknown 1 32 }  { C_size unknown 1 32 } } }
	A { ap_bus {  { A_req_din fifo_data 1 1 }  { A_req_full_n fifo_status 0 1 }  { A_req_write fifo_update 1 1 }  { A_rsp_empty_n fifo_status 0 1 }  { A_rsp_read fifo_update 1 1 }  { A_address unknown 1 32 }  { A_datain unknown 0 32 }  { A_dataout unknown 1 32 }  { A_size unknown 1 32 } } }
	B { ap_bus {  { B_req_din fifo_data 1 1 }  { B_req_full_n fifo_status 0 1 }  { B_req_write fifo_update 1 1 }  { B_rsp_empty_n fifo_status 0 1 }  { B_rsp_read fifo_update 1 1 }  { B_address unknown 1 32 }  { B_datain unknown 0 32 }  { B_dataout unknown 1 32 }  { B_size unknown 1 32 } } }
	wA { ap_none {  { wA in_data 0 32 } } }
	wB { ap_none {  { wB in_data 0 32 } } }
	gridDim_x { ap_none {  { gridDim_x in_data 0 32 } } }
	gridDim_y { ap_none {  { gridDim_y in_data 0 32 } } }
	gridDim_z { ap_none {  { gridDim_z in_data 0 32 } } }
	blockDim_x { ap_none {  { blockDim_x in_data 0 32 } } }
	blockDim_y { ap_none {  { blockDim_y in_data 0 32 } } }
	blockDim_z { ap_none {  { blockDim_z in_data 0 32 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
	{ C 1 }
	{ A 1 }
	{ B 1 }
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
	{ C 1 }
	{ A 1 }
	{ B 1 }
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
