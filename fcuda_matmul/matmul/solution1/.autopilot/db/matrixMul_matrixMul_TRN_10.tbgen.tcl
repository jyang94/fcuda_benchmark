set moduleName matrixMul_matrixMul_TRN_10
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName {matrixMul_matrixMul_TRN_10}
set C_modelType { void 0 }
set C_modelArgList {
	{ blockDim_x int 32 regular  }
	{ blockDim_y int 32 regular  }
	{ blockDim_z int 32 regular  }
	{ C float 32 regular {bus 1}  }
	{ Csub_block float 32 regular {array 256 { 1 3 } 1 1 }  }
	{ c_r int 32 regular  }
	{ wB int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "blockDim_x", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "blockDim_y", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "blockDim_z", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "C", "interface" : "bus", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "Csub_block", "interface" : "memory", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "c_r", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "wB", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 23
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
	{ C_req_din sc_out sc_logic 1 signal 3 } 
	{ C_req_full_n sc_in sc_logic 1 signal 3 } 
	{ C_req_write sc_out sc_logic 1 signal 3 } 
	{ C_rsp_empty_n sc_in sc_logic 1 signal 3 } 
	{ C_rsp_read sc_out sc_logic 1 signal 3 } 
	{ C_address sc_out sc_lv 32 signal 3 } 
	{ C_datain sc_in sc_lv 32 signal 3 } 
	{ C_dataout sc_out sc_lv 32 signal 3 } 
	{ C_size sc_out sc_lv 32 signal 3 } 
	{ Csub_block_address0 sc_out sc_lv 8 signal 4 } 
	{ Csub_block_ce0 sc_out sc_logic 1 signal 4 } 
	{ Csub_block_q0 sc_in sc_lv 32 signal 4 } 
	{ c_r sc_in sc_lv 32 signal 5 } 
	{ wB sc_in sc_lv 32 signal 6 } 
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
 	{ "name": "C_req_din", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "req_din" }} , 
 	{ "name": "C_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "req_full_n" }} , 
 	{ "name": "C_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "req_write" }} , 
 	{ "name": "C_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "rsp_empty_n" }} , 
 	{ "name": "C_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "C", "role": "rsp_read" }} , 
 	{ "name": "C_address", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C", "role": "address" }} , 
 	{ "name": "C_datain", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C", "role": "datain" }} , 
 	{ "name": "C_dataout", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C", "role": "dataout" }} , 
 	{ "name": "C_size", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "C", "role": "size" }} , 
 	{ "name": "Csub_block_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "Csub_block", "role": "address0" }} , 
 	{ "name": "Csub_block_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Csub_block", "role": "ce0" }} , 
 	{ "name": "Csub_block_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Csub_block", "role": "q0" }} , 
 	{ "name": "c_r", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "c_r", "role": "default" }} , 
 	{ "name": "wB", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "wB", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : [], "CDFG" : "matrixMul_matrixMul_TRN_10", "VariableLatency" : "1", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "ProcessNetwork" : "0", "Combinational" : "0", "ControlExist" : "1",
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
	, {"Name" : "Interval", "Min" : "4294967295", "Max" : "4294967295"}
]}

set Spec2ImplPortList { 
	blockDim_x { ap_none {  { blockDim_x in_data 0 32 } } }
	blockDim_y { ap_none {  { blockDim_y in_data 0 32 } } }
	blockDim_z { ap_none {  { blockDim_z in_data 0 32 } } }
	C { ap_bus {  { C_req_din fifo_data 1 1 }  { C_req_full_n fifo_status 0 1 }  { C_req_write fifo_update 1 1 }  { C_rsp_empty_n fifo_status 0 1 }  { C_rsp_read fifo_update 1 1 }  { C_address unknown 1 32 }  { C_datain unknown 0 32 }  { C_dataout unknown 1 32 }  { C_size unknown 1 32 } } }
	Csub_block { ap_memory {  { Csub_block_address0 mem_address 1 8 }  { Csub_block_ce0 mem_ce 1 1 }  { Csub_block_q0 mem_dout 0 32 } } }
	c_r { ap_none {  { c_r in_data 0 32 } } }
	wB { ap_none {  { wB in_data 0 32 } } }
}
