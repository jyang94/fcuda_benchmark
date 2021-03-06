#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("C_req_din", 1, hls_out, 0, "ap_bus", "fifo_data", 1),
	Port_Property("C_req_full_n", 1, hls_in, 0, "ap_bus", "fifo_status", 1),
	Port_Property("C_req_write", 1, hls_out, 0, "ap_bus", "fifo_update", 1),
	Port_Property("C_rsp_empty_n", 1, hls_in, 0, "ap_bus", "fifo_status", 1),
	Port_Property("C_rsp_read", 1, hls_out, 0, "ap_bus", "fifo_update", 1),
	Port_Property("C_address", 32, hls_out, 0, "ap_bus", "unknown", 1),
	Port_Property("C_datain", 32, hls_in, 0, "ap_bus", "unknown", 1),
	Port_Property("C_dataout", 32, hls_out, 0, "ap_bus", "unknown", 1),
	Port_Property("C_size", 32, hls_out, 0, "ap_bus", "unknown", 1),
	Port_Property("A_req_din", 1, hls_out, 1, "ap_bus", "fifo_data", 1),
	Port_Property("A_req_full_n", 1, hls_in, 1, "ap_bus", "fifo_status", 1),
	Port_Property("A_req_write", 1, hls_out, 1, "ap_bus", "fifo_update", 1),
	Port_Property("A_rsp_empty_n", 1, hls_in, 1, "ap_bus", "fifo_status", 1),
	Port_Property("A_rsp_read", 1, hls_out, 1, "ap_bus", "fifo_update", 1),
	Port_Property("A_address", 32, hls_out, 1, "ap_bus", "unknown", 1),
	Port_Property("A_datain", 32, hls_in, 1, "ap_bus", "unknown", 1),
	Port_Property("A_dataout", 32, hls_out, 1, "ap_bus", "unknown", 1),
	Port_Property("A_size", 32, hls_out, 1, "ap_bus", "unknown", 1),
	Port_Property("B_req_din", 1, hls_out, 2, "ap_bus", "fifo_data", 1),
	Port_Property("B_req_full_n", 1, hls_in, 2, "ap_bus", "fifo_status", 1),
	Port_Property("B_req_write", 1, hls_out, 2, "ap_bus", "fifo_update", 1),
	Port_Property("B_rsp_empty_n", 1, hls_in, 2, "ap_bus", "fifo_status", 1),
	Port_Property("B_rsp_read", 1, hls_out, 2, "ap_bus", "fifo_update", 1),
	Port_Property("B_address", 32, hls_out, 2, "ap_bus", "unknown", 1),
	Port_Property("B_datain", 32, hls_in, 2, "ap_bus", "unknown", 1),
	Port_Property("B_dataout", 32, hls_out, 2, "ap_bus", "unknown", 1),
	Port_Property("B_size", 32, hls_out, 2, "ap_bus", "unknown", 1),
	Port_Property("wA", 32, hls_in, 3, "ap_none", "in_data", 1),
	Port_Property("wB", 32, hls_in, 4, "ap_none", "in_data", 1),
	Port_Property("gridDim_x", 32, hls_in, 5, "ap_none", "in_data", 1),
	Port_Property("gridDim_y", 32, hls_in, 6, "ap_none", "in_data", 1),
	Port_Property("gridDim_z", 32, hls_in, 7, "ap_none", "in_data", 1),
	Port_Property("blockDim_x", 32, hls_in, 8, "ap_none", "in_data", 1),
	Port_Property("blockDim_y", 32, hls_in, 9, "ap_none", "in_data", 1),
	Port_Property("blockDim_z", 32, hls_in, 10, "ap_none", "in_data", 1),
};
const char* HLS_Design_Meta::dut_name = "matrixMul";
