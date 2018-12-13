set moduleName matrixMul_matrixMul_TRN_6
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName {matrixMul_matrixMul_TRN_6}
set C_modelType { void 0 }
set C_modelArgList {
	{ blockDim_x int 32 regular  }
	{ blockDim_y int 32 regular  }
	{ blockDim_z int 32 regular  }
	{ As float 32 regular {array 256 { 0 3 } 0 1 }  }
	{ A float 32 regular {bus 0}  }
	{ a_r int 32 regular  }
	{ wA int 32 regular  }
	{ Bs float 32 regular {array 256 { 0 3 } 0 1 }  }
	{ B float 32 regular {bus 0}  }
	{ b_r int 32 regular  }
	{ wB int 32 regular  }
}
set C_modelArgMapList {[ 
	{ "Name" : "blockDim_x", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "blockDim_y", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "blockDim_z", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "As", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "A", "interface" : "bus", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "a_r", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "wA", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "Bs", "interface" : "memory", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "B", "interface" : "bus", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "b_r", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} , 
 	{ "Name" : "wB", "interface" : "wire", "bitwidth" : 32, "direction" : "READONLY"} ]}
# RTL Port declarations: 
set portNum 39
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
	{ As_address0 sc_out sc_lv 8 signal 3 } 
	{ As_ce0 sc_out sc_logic 1 signal 3 } 
	{ As_we0 sc_out sc_logic 1 signal 3 } 
	{ As_d0 sc_out sc_lv 32 signal 3 } 
	{ A_req_din sc_out sc_logic 1 signal 4 } 
	{ A_req_full_n sc_in sc_logic 1 signal 4 } 
	{ A_req_write sc_out sc_logic 1 signal 4 } 
	{ A_rsp_empty_n sc_in sc_logic 1 signal 4 } 
	{ A_rsp_read sc_out sc_logic 1 signal 4 } 
	{ A_address sc_out sc_lv 32 signal 4 } 
	{ A_datain sc_in sc_lv 32 signal 4 } 
	{ A_dataout sc_out sc_lv 32 signal 4 } 
	{ A_size sc_out sc_lv 32 signal 4 } 
	{ a_r sc_in sc_lv 32 signal 5 } 
	{ wA sc_in sc_lv 32 signal 6 } 
	{ Bs_address0 sc_out sc_lv 8 signal 7 } 
	{ Bs_ce0 sc_out sc_logic 1 signal 7 } 
	{ Bs_we0 sc_out sc_logic 1 signal 7 } 
	{ Bs_d0 sc_out sc_lv 32 signal 7 } 
	{ B_req_din sc_out sc_logic 1 signal 8 } 
	{ B_req_full_n sc_in sc_logic 1 signal 8 } 
	{ B_req_write sc_out sc_logic 1 signal 8 } 
	{ B_rsp_empty_n sc_in sc_logic 1 signal 8 } 
	{ B_rsp_read sc_out sc_logic 1 signal 8 } 
	{ B_address sc_out sc_lv 32 signal 8 } 
	{ B_datain sc_in sc_lv 32 signal 8 } 
	{ B_dataout sc_out sc_lv 32 signal 8 } 
	{ B_size sc_out sc_lv 32 signal 8 } 
	{ b_r sc_in sc_lv 32 signal 9 } 
	{ wB sc_in sc_lv 32 signal 10 } 
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
 	{ "name": "As_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "As", "role": "address0" }} , 
 	{ "name": "As_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "As", "role": "ce0" }} , 
 	{ "name": "As_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "As", "role": "we0" }} , 
 	{ "name": "As_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "As", "role": "d0" }} , 
 	{ "name": "A_req_din", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "req_din" }} , 
 	{ "name": "A_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "req_full_n" }} , 
 	{ "name": "A_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "req_write" }} , 
 	{ "name": "A_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "rsp_empty_n" }} , 
 	{ "name": "A_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "A", "role": "rsp_read" }} , 
 	{ "name": "A_address", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "address" }} , 
 	{ "name": "A_datain", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "datain" }} , 
 	{ "name": "A_dataout", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "dataout" }} , 
 	{ "name": "A_size", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "A", "role": "size" }} , 
 	{ "name": "a_r", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "a_r", "role": "default" }} , 
 	{ "name": "wA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "wA", "role": "default" }} , 
 	{ "name": "Bs_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "Bs", "role": "address0" }} , 
 	{ "name": "Bs_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Bs", "role": "ce0" }} , 
 	{ "name": "Bs_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "Bs", "role": "we0" }} , 
 	{ "name": "Bs_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "Bs", "role": "d0" }} , 
 	{ "name": "B_req_din", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "req_din" }} , 
 	{ "name": "B_req_full_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "req_full_n" }} , 
 	{ "name": "B_req_write", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "req_write" }} , 
 	{ "name": "B_rsp_empty_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "rsp_empty_n" }} , 
 	{ "name": "B_rsp_read", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "B", "role": "rsp_read" }} , 
 	{ "name": "B_address", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B", "role": "address" }} , 
 	{ "name": "B_datain", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B", "role": "datain" }} , 
 	{ "name": "B_dataout", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B", "role": "dataout" }} , 
 	{ "name": "B_size", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "B", "role": "size" }} , 
 	{ "name": "b_r", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "b_r", "role": "default" }} , 
 	{ "name": "wB", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "wB", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : [], "CDFG" : "matrixMul_matrixMul_TRN_6", "VariableLatency" : "1", "AlignedPipeline" : "0", "UnalignedPipeline" : "0", "ProcessNetwork" : "0", "Combinational" : "0", "ControlExist" : "1",
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
		"SubBlockPort" : []}]}

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "-1", "Max" : "-1"}
	, {"Name" : "Interval", "Min" : "4294967295", "Max" : "4294967295"}
]}

set Spec2ImplPortList { 
	blockDim_x { ap_none {  { blockDim_x in_data 0 32 } } }
	blockDim_y { ap_none {  { blockDim_y in_data 0 32 } } }
	blockDim_z { ap_none {  { blockDim_z in_data 0 32 } } }
	As { ap_memory {  { As_address0 mem_address 1 8 }  { As_ce0 mem_ce 1 1 }  { As_we0 mem_we 1 1 }  { As_d0 mem_din 1 32 } } }
	A { ap_bus {  { A_req_din fifo_data 1 1 }  { A_req_full_n fifo_status 0 1 }  { A_req_write fifo_update 1 1 }  { A_rsp_empty_n fifo_status 0 1 }  { A_rsp_read fifo_update 1 1 }  { A_address unknown 1 32 }  { A_datain unknown 0 32 }  { A_dataout unknown 1 32 }  { A_size unknown 1 32 } } }
	a_r { ap_none {  { a_r in_data 0 32 } } }
	wA { ap_none {  { wA in_data 0 32 } } }
	Bs { ap_memory {  { Bs_address0 mem_address 1 8 }  { Bs_ce0 mem_ce 1 1 }  { Bs_we0 mem_we 1 1 }  { Bs_d0 mem_din 1 32 } } }
	B { ap_bus {  { B_req_din fifo_data 1 1 }  { B_req_full_n fifo_status 0 1 }  { B_req_write fifo_update 1 1 }  { B_rsp_empty_n fifo_status 0 1 }  { B_rsp_read fifo_update 1 1 }  { B_address unknown 1 32 }  { B_datain unknown 0 32 }  { B_dataout unknown 1 32 }  { B_size unknown 1 32 } } }
	b_r { ap_none {  { b_r in_data 0 32 } } }
	wB { ap_none {  { wB in_data 0 32 } } }
}
