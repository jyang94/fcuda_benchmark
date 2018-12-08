set moduleName matrixMul_matrixMul_SNC_7
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName {matrixMul_matrixMul_SNC_7}
set C_modelType { void 0 }
set C_modelArgList {
	{ blockDim_x int 32 regular  }
	{ blockDim_y int 32 regular  }
	{ blockDim_z int 32 regular  }
	{ Csub_block float 32 regular {array 256 { 2 3 } 1 1 }  }
	{ As float 32 regular {array 256 { 1 3 } 1 1 }  }
	{ Bs float 32 regular {array 256 { 1 3 } 1 1 }  }
}
set C_modelArgMapList {[ 
	{ "Name" : "blockDim_x", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "blockDim_y", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "blockDim_z", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "Csub_block", "interface" : "memory", "bitwidth" : 32, "direction" : "READWRITE"} , 
 	{ "Name" : "As", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "Bs", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 20
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ blockDim_x sc_in sc_lv 32 signal 0 } 
	{ blockDim_y sc_in sc_lv 32 signal 1 } 
	{ blockDim_z sc_in sc_lv 32 signal 2 } 
	{ Csub_block_address0 sc_out sc_lv 8 signal 3 } 
	{ Csub_block_ce0 sc_out sc_logic 1 signal 3 } 
	{ Csub_block_we0 sc_out sc_logic 1 signal 3 } 
	{ Csub_block_d0 sc_out sc_lv 32 signal 3 } 
	{ Csub_block_q0 sc_in sc_lv 32 signal 3 } 
	{ As_address0 sc_out sc_lv 8 signal 4 } 
	{ As_ce0 sc_out sc_logic 1 signal 4 } 
	{ As_q0 sc_in sc_lv 32 signal 4 } 
	{ Bs_address0 sc_out sc_lv 8 signal 5 } 
	{ Bs_ce0 sc_out sc_logic 1 signal 5 } 
	{ Bs_q0 sc_in sc_lv 32 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "blockDim_x", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "blockDim_x", "role": "default" }} , 
 	{ "name": "blockDim_y", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "blockDim_y", "role": "default" }} , 
 	{ "name": "blockDim_z", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "blockDim_z", "role": "default" }} , 
 	{ "name": "Csub_block_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "Csub_block", "role": "address0" }} , 
 	{ "name": "Csub_block_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Csub_block", "role": "ce0" }} , 
 	{ "name": "Csub_block_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Csub_block", "role": "we0" }} , 
 	{ "name": "Csub_block_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Csub_block", "role": "d0" }} , 
 	{ "name": "Csub_block_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Csub_block", "role": "q0" }} , 
 	{ "name": "As_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "As", "role": "address0" }} , 
 	{ "name": "As_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "As", "role": "ce0" }} , 
 	{ "name": "As_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "As", "role": "q0" }} , 
 	{ "name": "Bs_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "Bs", "role": "address0" }} , 
 	{ "name": "Bs_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Bs", "role": "ce0" }} , 
 	{ "name": "Bs_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Bs", "role": "q0" }}  ]}

set RtlHierarchyInfo {[
	{"Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1", "2"], "CDFG" : "matrixMul_matrixMul_SNC_7", "VariableLatency" : "1", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "ProcessNetwork" : "0", "Combinational" : "0", "ControlExist" : "1",
		"Port" : [
		{"Name" : "blockDim_x", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "blockDim_y", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "blockDim_z", "Type" : "None", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "Csub_block", "Type" : "Memory", "Direction" : "IO", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "As", "Type" : "Memory", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}, 
		{"Name" : "Bs", "Type" : "Memory", "Direction" : "I", "BlockSignal" : [], "SubConnect" : []}],
		"WaitState" : [],
		"SubBlockPort" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.matrixMul_fadd_32ns_32ns_32_5_full_dsp_U12", "Parent" : "0", "Child" : []},
	{"Level" : "1", "Path" : "`AUTOTB_DUT_INST.matrixMul_fmul_32ns_32ns_32_4_max_dsp_U13", "Parent" : "0", "Child" : []}]}

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "4294967295", "Max" : "4294967295"}
]}

set Spec2ImplPortList { 
	blockDim_x { ap_none {  { blockDim_x in_data 0 32 } } }
	blockDim_y { ap_none {  { blockDim_y in_data 0 32 } } }
	blockDim_z { ap_none {  { blockDim_z in_data 0 32 } } }
	Csub_block { ap_memory {  { Csub_block_address0 mem_address 1 8 }  { Csub_block_ce0 mem_ce 1 1 }  { Csub_block_we0 mem_we 1 1 }  { Csub_block_d0 mem_din 1 32 }  { Csub_block_q0 mem_dout 0 32 } } }
	As { ap_memory {  { As_address0 mem_address 1 8 }  { As_ce0 mem_ce 1 1 }  { As_q0 mem_dout 0 32 } } }
	Bs { ap_memory {  { Bs_address0 mem_address 1 8 }  { Bs_ce0 mem_ce 1 1 }  { Bs_q0 mem_dout 0 32 } } }
}
