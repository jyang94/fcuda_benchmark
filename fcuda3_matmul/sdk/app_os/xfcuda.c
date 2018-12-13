// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.4
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
// 
// ==============================================================

/***************************** Include Files *********************************/
#include "xfcuda.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XFcuda_CfgInitialize(XFcuda *InstancePtr, XFcuda_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Axi4lites_BaseAddress = ConfigPtr->Axi4lites_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XFcuda_Start(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_AP_CTRL) & 0x80;
    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_AP_CTRL, Data | 0x01);
}

u32 XFcuda_IsDone(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XFcuda_IsIdle(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XFcuda_IsReady(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XFcuda_EnableAutoRestart(XFcuda *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_AP_CTRL, 0x80);
}

void XFcuda_DisableAutoRestart(XFcuda *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_AP_CTRL, 0);
}

void XFcuda_SetC_addr(XFcuda *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_C_ADDR_DATA, Data);
}

u32 XFcuda_GetC_addr(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_C_ADDR_DATA);
    return Data;
}

void XFcuda_SetA_addr(XFcuda *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_A_ADDR_DATA, Data);
}

u32 XFcuda_GetA_addr(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_A_ADDR_DATA);
    return Data;
}

void XFcuda_SetB_addr(XFcuda *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_B_ADDR_DATA, Data);
}

u32 XFcuda_GetB_addr(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_B_ADDR_DATA);
    return Data;
}

void XFcuda_SetWa(XFcuda *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_WA_DATA, Data);
}

u32 XFcuda_GetWa(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_WA_DATA);
    return Data;
}

void XFcuda_SetWb(XFcuda *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_WB_DATA, Data);
}

u32 XFcuda_GetWb(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_WB_DATA);
    return Data;
}

void XFcuda_SetGriddim_x(XFcuda *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_GRIDDIM_X_DATA, Data);
}

u32 XFcuda_GetGriddim_x(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_GRIDDIM_X_DATA);
    return Data;
}

void XFcuda_SetGriddim_y(XFcuda *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_GRIDDIM_Y_DATA, Data);
}

u32 XFcuda_GetGriddim_y(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_GRIDDIM_Y_DATA);
    return Data;
}

void XFcuda_SetGriddim_z(XFcuda *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_GRIDDIM_Z_DATA, Data);
}

u32 XFcuda_GetGriddim_z(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_GRIDDIM_Z_DATA);
    return Data;
}

void XFcuda_SetBlockdim_x(XFcuda *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_BLOCKDIM_X_DATA, Data);
}

u32 XFcuda_GetBlockdim_x(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_BLOCKDIM_X_DATA);
    return Data;
}

void XFcuda_SetBlockdim_y(XFcuda *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_BLOCKDIM_Y_DATA, Data);
}

u32 XFcuda_GetBlockdim_y(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_BLOCKDIM_Y_DATA);
    return Data;
}

void XFcuda_SetBlockdim_z(XFcuda *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_BLOCKDIM_Z_DATA, Data);
}

u32 XFcuda_GetBlockdim_z(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_BLOCKDIM_Z_DATA);
    return Data;
}

void XFcuda_SetEn_fcuda1(XFcuda *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_EN_FCUDA1_DATA, Data);
}

u32 XFcuda_GetEn_fcuda1(XFcuda *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_EN_FCUDA1_DATA);
    return Data;
}

void XFcuda_InterruptGlobalEnable(XFcuda *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_GIE, 1);
}

void XFcuda_InterruptGlobalDisable(XFcuda *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_GIE, 0);
}

void XFcuda_InterruptEnable(XFcuda *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_IER);
    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_IER, Register | Mask);
}

void XFcuda_InterruptDisable(XFcuda *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_IER);
    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_IER, Register & (~Mask));
}

void XFcuda_InterruptClear(XFcuda *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFcuda_WriteReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_ISR, Mask);
}

u32 XFcuda_InterruptGetEnabled(XFcuda *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_IER);
}

u32 XFcuda_InterruptGetStatus(XFcuda *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XFcuda_ReadReg(InstancePtr->Axi4lites_BaseAddress, XFCUDA_AXI4LITES_ADDR_ISR);
}
