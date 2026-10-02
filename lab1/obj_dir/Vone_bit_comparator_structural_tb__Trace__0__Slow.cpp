// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals

#include "verilated_vcd_c.h"
#include "Vone_bit_comparator_structural_tb__Syms.h"


VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root__trace_init_sub__TOP__0(Vone_bit_comparator_structural_tb___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root__trace_init_sub__TOP__0\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const int c = vlSymsp->__Vm_baseCode;
    VL_TRACE_PUSH_PREFIX(tracep, "one_bit_comparator_structural_tb", VerilatedTracePrefixType::SCOPE_MODULE, 0, 0);
    VL_TRACE_DECL_BIT(tracep,c+0,0,"a",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC);
    VL_TRACE_DECL_BIT(tracep,c+1,0,"b",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC);
    VL_TRACE_DECL_BIT(tracep,c+2,0,"greater",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC);
    VL_TRACE_DECL_BIT(tracep,c+3,0,"less",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC);
    VL_TRACE_DECL_BIT(tracep,c+4,0,"equal",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC);
    VL_TRACE_PUSH_PREFIX(tracep, "DUT", VerilatedTracePrefixType::SCOPE_MODULE, 0, 0);
    VL_TRACE_DECL_BIT(tracep,c+0,0,"a",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC);
    VL_TRACE_DECL_BIT(tracep,c+1,0,"b",-1, VerilatedTraceSigDirection::INPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC);
    VL_TRACE_DECL_BIT(tracep,c+2,0,"greater",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC);
    VL_TRACE_DECL_BIT(tracep,c+3,0,"less",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC);
    VL_TRACE_DECL_BIT(tracep,c+4,0,"equal",-1, VerilatedTraceSigDirection::OUTPUT, VerilatedTraceSigKind::WIRE, VerilatedTraceSigType::LOGIC);
    VL_TRACE_DECL_BIT(tracep,c+5,0,"a_not",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC);
    VL_TRACE_DECL_BIT(tracep,c+6,0,"b_not",-1, VerilatedTraceSigDirection::NONE, VerilatedTraceSigKind::VAR, VerilatedTraceSigType::LOGIC);
    VL_TRACE_POP_PREFIX(tracep);
    VL_TRACE_POP_PREFIX(tracep);
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root__trace_init_top(Vone_bit_comparator_structural_tb___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root__trace_init_top\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vone_bit_comparator_structural_tb___024root__trace_init_sub__TOP__0(vlSelf, tracep);
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vone_bit_comparator_structural_tb___024root__trace_chg_0(void* voidSelf, VerilatedVcd::Buffer* bufp);
void Vone_bit_comparator_structural_tb___024root__trace_cleanup(void* voidSelf, VerilatedVcd* /*unused*/);

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root__trace_register(Vone_bit_comparator_structural_tb___024root* vlSelf, VerilatedVcd* tracep) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root__trace_register\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    tracep->addConstCb(&Vone_bit_comparator_structural_tb___024root__trace_const_0, 0, vlSelf);
    tracep->addFullCb(&Vone_bit_comparator_structural_tb___024root__trace_full_0, 0, vlSelf);
    tracep->addChgCb(&Vone_bit_comparator_structural_tb___024root__trace_chg_0, 0, vlSelf);
    tracep->addCleanupCb(&Vone_bit_comparator_structural_tb___024root__trace_cleanup, vlSelf);
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root__trace_const_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root__trace_const_0\n"); );
    // Body
    Vone_bit_comparator_structural_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vone_bit_comparator_structural_tb___024root*>(voidSelf);
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root__trace_full_0_sub_0(Vone_bit_comparator_structural_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp);

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root__trace_full_0(void* voidSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root__trace_full_0\n"); );
    // Body
    Vone_bit_comparator_structural_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vone_bit_comparator_structural_tb___024root*>(voidSelf);
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    Vone_bit_comparator_structural_tb___024root__trace_full_0_sub_0((&vlSymsp->TOP), bufp);
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root__trace_full_0_sub_0(Vone_bit_comparator_structural_tb___024root* vlSelf, VerilatedVcd::Buffer* bufp) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root__trace_full_0_sub_0\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    uint32_t* const oldp VL_ATTR_UNUSED = bufp->oldp(vlSymsp->__Vm_baseCode);
    bufp->fullBit(oldp+0,(vlSelfRef.one_bit_comparator_structural_tb__DOT__a));
    bufp->fullBit(oldp+1,(vlSelfRef.one_bit_comparator_structural_tb__DOT__b));
    bufp->fullBit(oldp+2,(((~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__b)) 
                           & (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__a))));
    bufp->fullBit(oldp+3,(((~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__a)) 
                           & (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__b))));
    bufp->fullBit(oldp+4,((1U & (~ ((IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__a) 
                                    ^ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__b))))));
    bufp->fullBit(oldp+5,((1U & (~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__a)))));
    bufp->fullBit(oldp+6,((1U & (~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__b)))));
}
