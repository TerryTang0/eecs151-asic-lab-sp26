// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vone_bit_comparator_structural_tb.h for the primary calling header

#include "Vone_bit_comparator_structural_tb__pch.h"

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_static(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_static\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    do {
        vlSelfRef.__VactTriggeredAcc[vlSelfRef.__Vi] 
            = vlSelfRef.__VactTriggered[vlSelfRef.__Vi];
        vlSelfRef.__Vi = ((IData)(1U) + vlSelfRef.__Vi);
    } while ((0U >= vlSelfRef.__Vi));
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG
VL_ATTR_COLD bool Vone_bit_comparator_structural_tb___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in);

VL_ATTR_COLD bool Vone_bit_comparator_structural_tb___024root___eval_stl(Vone_bit_comparator_structural_tb___024root* vlSelf, CData/*0:0*/ firstIteration) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_stl\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VstlExecute;
    // Body
    vlSelfRef.__VstlTriggered[0U] = ((0xfffffffffffffffeULL 
                                      & vlSelfRef.__VstlTriggered[0U]) 
                                     | (IData)((IData)(firstIteration)));
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vone_bit_comparator_structural_tb___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
    }
#endif
    __VstlExecute = Vone_bit_comparator_structural_tb___024root___trigger_anySet__stl(vlSelfRef.__VstlTriggered);
    if (__VstlExecute) {
        {
            // Inlined CFunc: _eval_body__stl
            if ((1ULL & vlSelfRef.__VstlTriggered[0U])) {
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
    return (__VstlExecute);
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__stl(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__stl\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
#ifdef VL_DEBUG
    Vone_bit_comparator_structural_tb___024root___dump_triggers__stl(vlSelfRef.__VstlTriggered, "stl"s);
#endif
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___dump_triggers__ico(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__ico(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__ico\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
#ifdef VL_DEBUG
    Vone_bit_comparator_structural_tb___024root___dump_triggers__ico(vlSelfRef.__VicoTriggered, "ico"s);
#endif
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__act(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__act\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
#ifdef VL_DEBUG
    Vone_bit_comparator_structural_tb___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__nba(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__nba\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
#ifdef VL_DEBUG
    Vone_bit_comparator_structural_tb___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__obs(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__obs\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__react(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__react\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_final(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___eval_final\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___dump_triggers__stl(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___dump_triggers__stl\n"); );
    // Body
    if ((1U & (~ (IData)(Vone_bit_comparator_structural_tb___024root___trigger_anySet__stl(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: Internal 'stl' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD bool Vone_bit_comparator_structural_tb___024root___trigger_anySet__stl(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___trigger_anySet__stl\n"); );
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

bool Vone_bit_comparator_structural_tb___024root___trigger_anySet__ico(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___dump_triggers__ico(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___dump_triggers__ico\n"); );
    // Body
    if ((1U & (~ (IData)(Vone_bit_comparator_structural_tb___024root___trigger_anySet__ico(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: Internal 'ico' trigger - first iteration\n");
    }
}
#endif  // VL_DEBUG

bool Vone_bit_comparator_structural_tb___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(Vone_bit_comparator_structural_tb___024root___trigger_anySet__act(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___ctor_var_reset(Vone_bit_comparator_structural_tb___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vone_bit_comparator_structural_tb___024root___ctor_var_reset\n"); );
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->vlNamep);
    vlSelf->one_bit_comparator_structural_tb__DOT__a = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 2679569462985532803ull);
    vlSelf->one_bit_comparator_structural_tb__DOT__b = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 11391581745377652600ull);
    vlSelf->one_bit_comparator_structural_tb__DOT__DUT__DOT__greater = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 727803781782060428ull);
    vlSelf->one_bit_comparator_structural_tb__DOT__DUT__DOT__less = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 5834737999522949244ull);
    vlSelf->one_bit_comparator_structural_tb__DOT__DUT__DOT__equal = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 9225793451719943621ull);
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VstlTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VicoTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VactTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VactTriggeredAcc[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VnbaTriggered[__Vi0] = 0;
    }
    vlSelf->__Vi = 0;
    for (int __Vi0 = 0; __Vi0 < 3; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = 0;
    }
}
