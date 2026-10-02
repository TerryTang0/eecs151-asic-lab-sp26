// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals

#include "verilated_vcd_c.h"
#include "Vone_bit_comparator_structural_tb__Syms.h"


void Vone_bit_comparator_structural_tb___024root__trace_chg_0_sub_0(Vone_bit_comparator_structural_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp);

void Vone_bit_comparator_structural_tb___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root__trace_chg_0\n"); );
    // Body
    Vone_bit_comparator_structural_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vone_bit_comparator_structural_tb___024root*>(voidSelf);
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    Vone_bit_comparator_structural_tb___024root__trace_chg_0_sub_0((&vlSymsp->TOP), bufp);
}

void Vone_bit_comparator_structural_tb___024root__trace_chg_0_sub_0(Vone_bit_comparator_structural_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root__trace_chg_0_sub_0\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode + 0);
    if (VL_UNLIKELY(((vlSelfRef.__Vm_traceActivity[1U] 
                      | vlSelfRef.__Vm_traceActivity[2U])))) {
        bufp->chgBit(oldp+0,(vlSelfRef.one_bit_comparator_structural_tb__DOT__a));
        bufp->chgBit(oldp+1,(vlSelfRef.one_bit_comparator_structural_tb__DOT__b));
        bufp->chgBit(oldp+2,(((~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__b)) 
                              & (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__a))));
        bufp->chgBit(oldp+3,(((~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__a)) 
                              & (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__b))));
        bufp->chgBit(oldp+4,((1U & (~ ((IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__a) 
                                       ^ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__b))))));
        bufp->chgBit(oldp+5,((1U & (~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__a)))));
        bufp->chgBit(oldp+6,((1U & (~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__b)))));
    }
}

void Vone_bit_comparator_structural_tb___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root__trace_cleanup\n"); );
    // Body
    Vone_bit_comparator_structural_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vone_bit_comparator_structural_tb___024root*>(voidSelf);
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vlSymsp->__Vm_activity = false;
    vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
    vlSymsp->TOP.__Vm_traceActivity[2U] = 0U;
}
