// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vone_bit_comparator_structural_tb.h for the primary calling header

#include "Vone_bit_comparator_structural_tb__pch.h"

VlCoroutine Vone_bit_comparator_structural_tb___024root___eval_initial__TOP__Vtiming__0(Vone_bit_comparator_structural_tb___024root* vlSelf);

void Vone_bit_comparator_structural_tb___024root___eval_initial(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_initial\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vone_bit_comparator_structural_tb___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    vlSelfRef.__Vm_traceActivity[1U] = 1U;
}

void Vone_bit_comparator_structural_tb___024root___eval_sample(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_sample\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___dump_triggers__ico(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool Vone_bit_comparator_structural_tb___024root___eval_ico(Vone_bit_comparator_structural_tb___024root* vlSelf, CData/*0:0*/ firstIteration) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_ico\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__VicoTriggered[0U] = ((0xfffffffffffffffeULL 
                                      & vlSelfRef.__VicoTriggered[0U]) 
                                     | (IData)((IData)(firstIteration)));
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vone_bit_comparator_structural_tb___024root___dump_triggers__ico(vlSelfRef.__VicoTriggered, "ico"s);
    }
#endif
    return (0U);
}

void Vone_bit_comparator_structural_tb___024root___trigger_orInto__act_vec_vec(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in);
#ifdef VL_DEBUG
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG
bool Vone_bit_comparator_structural_tb___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in);

bool Vone_bit_comparator_structural_tb___024root___eval_act(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_act\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VactExecute;
    // Body
    {
        // Inlined CFunc: _eval_triggers_vec__act
        vlSelfRef.__VactTriggered[0U] = (QData)((IData)(vlSelfRef.__VdlySched.awaitingCurrentTime()));
    }
    Vone_bit_comparator_structural_tb___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VactTriggered, vlSelfRef.__VactTriggeredAcc);
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vone_bit_comparator_structural_tb___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
    Vone_bit_comparator_structural_tb___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    __VactExecute = Vone_bit_comparator_structural_tb___024root___trigger_anySet__act(vlSelfRef.__VactTriggered);
    if (__VactExecute) {
        vlSelfRef.__VactTriggeredAcc.fill(0ULL);
        {
            // Inlined CFunc: _timing_resume
            if ((1ULL & vlSelfRef.__VactTriggered[0U])) {
                vlSelfRef.__VdlySched.resume();
            }
        }
        {
            // Inlined CFunc: _eval_body__act
            if ((1ULL & vlSelfRef.__VactTriggered[0U])) {
                {
                    // Inlined CFunc: _act_sequent__TOP__0
                    vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__greater 
                        = ((~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__b)) 
                           & (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__a));
                    vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__less 
                        = ((~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__a)) 
                           & (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__b));
                    vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__equal 
                        = (1U & (~ ((IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__a) 
                                    ^ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__b))));
                }
            }
        }
    }
    return (__VactExecute);
}

bool Vone_bit_comparator_structural_tb___024root___eval_inact(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_inact\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VinactExecute;
    // Body
    __VinactExecute = vlSelfRef.__VdlySched.awaitingZeroDelay();
    if (__VinactExecute) {
        VL_FATAL_MT("sim/one_bit_comparator_structural_tb.sv", 6, "", "ZERODLY: Design Verilated with '--no-sched-zero-delay', but #0 delay executed at runtime");
    }
    return (__VinactExecute);
}

void Vone_bit_comparator_structural_tb___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out);

bool Vone_bit_comparator_structural_tb___024root___eval_nba(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_nba\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = Vone_bit_comparator_structural_tb___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        {
            // Inlined CFunc: _eval_body__nba
            if ((1ULL & vlSelfRef.__VnbaTriggered[0U])) {
                {
                    // Inlined CFunc: _act_sequent__TOP__0
                    vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__greater 
                        = ((~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__b)) 
                           & (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__a));
                    vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__less 
                        = ((~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__a)) 
                           & (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__b));
                    vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__equal 
                        = (1U & (~ ((IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__a) 
                                    ^ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__b))));
                }
            }
        }
        Vone_bit_comparator_structural_tb___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

bool Vone_bit_comparator_structural_tb___024root___eval_obs(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_obs\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    return (0U);
}

bool Vone_bit_comparator_structural_tb___024root___eval_react(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_react\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    return (0U);
}

void Vone_bit_comparator_structural_tb___024root___eval_postponed(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_postponed\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VlCoroutine Vone_bit_comparator_structural_tb___024root___eval_initial__TOP__Vtiming__0(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_initial__TOP__Vtiming__0\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSymsp->_vm_contextp__->dumpfile("one_bit_comparator_structural_tb.fst"s);
    vlSymsp->_traceDumpOpen();
    vlSelfRef.one_bit_comparator_structural_tb__DOT__a = 0U;
    vlSelfRef.one_bit_comparator_structural_tb__DOT__b = 0U;
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "sim/one_bit_comparator_structural_tb.sv", 
                                         28);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    vlSelfRef.one_bit_comparator_structural_tb__DOT__a = 0U;
    vlSelfRef.one_bit_comparator_structural_tb__DOT__b = 1U;
    if (vlSymsp->_vm_contextp__->assertCtlGet(VerilatedAssertCtlQuery::ASSERT_CTL_ON, 2, 1)) {
        if (vlSymsp->_vm_contextp__->assertCtlGet(VerilatedAssertCtlQuery::ASSERT_CTL_FAIL_ON, 2, 1)) {
            if (VL_UNLIKELY(((1U & (~ (((~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__greater)) 
                                        & (~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__less))) 
                                       & (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__equal))))))) {
                VL_WRITEF_NX("[%0t] %%Fatal: one_bit_comparator_structural_tb.sv:30: Assertion failed in %m: a=0 b=0 expected equal=1\n",3, 'M',vlSymsp->name(),"one_bit_comparator_structural_tb", 'T',-9
                             , '#',64,VL_TIME_UNITED_Q(1));
                VL_STOP_MT("sim/one_bit_comparator_structural_tb.sv", 30, "", false);
            }
        }
    }
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "sim/one_bit_comparator_structural_tb.sv", 
                                         34);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    vlSelfRef.one_bit_comparator_structural_tb__DOT__a = 1U;
    vlSelfRef.one_bit_comparator_structural_tb__DOT__b = 0U;
    if (vlSymsp->_vm_contextp__->assertCtlGet(VerilatedAssertCtlQuery::ASSERT_CTL_ON, 2, 1)) {
        if (vlSymsp->_vm_contextp__->assertCtlGet(VerilatedAssertCtlQuery::ASSERT_CTL_FAIL_ON, 2, 1)) {
            if (VL_UNLIKELY(((1U & (~ (((~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__greater)) 
                                        & (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__less)) 
                                       & (~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__equal)))))))) {
                VL_WRITEF_NX("[%0t] %%Fatal: one_bit_comparator_structural_tb.sv:36: Assertion failed in %m: a=0 b=1 expected less=1\n",3, 'M',vlSymsp->name(),"one_bit_comparator_structural_tb", 'T',-9
                             , '#',64,VL_TIME_UNITED_Q(1));
                VL_STOP_MT("sim/one_bit_comparator_structural_tb.sv", 36, "", false);
            }
        }
    }
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "sim/one_bit_comparator_structural_tb.sv", 
                                         40);
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    vlSelfRef.one_bit_comparator_structural_tb__DOT__a = 1U;
    vlSelfRef.one_bit_comparator_structural_tb__DOT__b = 1U;
    if (vlSymsp->_vm_contextp__->assertCtlGet(VerilatedAssertCtlQuery::ASSERT_CTL_ON, 2, 1)) {
        if (vlSymsp->_vm_contextp__->assertCtlGet(VerilatedAssertCtlQuery::ASSERT_CTL_FAIL_ON, 2, 1)) {
            if (VL_UNLIKELY(((1U & (~ (((IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__greater) 
                                        & (~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__less))) 
                                       & (~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__equal)))))))) {
                VL_WRITEF_NX("[%0t] %%Fatal: one_bit_comparator_structural_tb.sv:42: Assertion failed in %m: a=1 b=0 expected greater=1\n",3, 'M',vlSymsp->name(),"one_bit_comparator_structural_tb", 'T',-9
                             , '#',64,VL_TIME_UNITED_Q(1));
                VL_STOP_MT("sim/one_bit_comparator_structural_tb.sv", 42, "", false);
            }
        }
    }
    co_await vlSelfRef.__VdlySched.delay(1ULL, nullptr, 
                                         "sim/one_bit_comparator_structural_tb.sv", 
                                         46);
    if (vlSymsp->_vm_contextp__->assertCtlGet(VerilatedAssertCtlQuery::ASSERT_CTL_ON, 2, 1)) {
        if (vlSymsp->_vm_contextp__->assertCtlGet(VerilatedAssertCtlQuery::ASSERT_CTL_FAIL_ON, 2, 1)) {
            if (VL_UNLIKELY(((1U & (~ (((~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__greater)) 
                                        & (~ (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__less))) 
                                       & (IData)(vlSelfRef.one_bit_comparator_structural_tb__DOT__DUT__DOT__equal))))))) {
                VL_WRITEF_NX("[%0t] %%Fatal: one_bit_comparator_structural_tb.sv:48: Assertion failed in %m: a=1 b=1 expected equal=1\n",3, 'M',vlSymsp->name(),"one_bit_comparator_structural_tb", 'T',-9
                             , '#',64,VL_TIME_UNITED_Q(1));
                VL_STOP_MT("sim/one_bit_comparator_structural_tb.sv", 48, "", false);
            }
        }
    }
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    VL_WRITEF_NX("All tests passed!\n",0);
    VL_FINISH_MT("sim/one_bit_comparator_structural_tb.sv", 55, "");
    vlSelfRef.__Vm_traceActivity[2U] = 1U;
    co_return;
}

bool Vone_bit_comparator_structural_tb___024root___trigger_anySet__ico(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___trigger_anySet__ico\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((1U > n));
    return (0U);
}

bool Vone_bit_comparator_structural_tb___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___trigger_anySet__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((1U > n));
    return (0U);
}

void Vone_bit_comparator_structural_tb___024root___trigger_orInto__act_vec_vec(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___trigger_orInto__act_vec_vec\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = (out[n] | in[n]);
        n = ((IData)(1U) + n);
    } while ((0U >= n));
}

void Vone_bit_comparator_structural_tb___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

#ifdef VL_DEBUG
void Vone_bit_comparator_structural_tb___024root___eval_debug_assertions(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_debug_assertions\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
