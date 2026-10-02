// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vone_bit_comparator_structural_tb.h for the primary calling header

#ifndef VERILATED_VONE_BIT_COMPARATOR_STRUCTURAL_TB___024ROOT_H_
#define VERILATED_VONE_BIT_COMPARATOR_STRUCTURAL_TB___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vone_bit_comparator_structural_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vone_bit_comparator_structural_tb___024root final {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ one_bit_comparator_structural_tb__DOT__a;
    CData/*0:0*/ one_bit_comparator_structural_tb__DOT__b;
    CData/*0:0*/ one_bit_comparator_structural_tb__DOT__DUT__DOT__greater;
    CData/*0:0*/ one_bit_comparator_structural_tb__DOT__DUT__DOT__less;
    CData/*0:0*/ one_bit_comparator_structural_tb__DOT__DUT__DOT__equal;
    IData/*31:0*/ __Vi;
    VlUnpacked<QData/*63:0*/, 1> __VstlTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VicoTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggeredAcc;
    VlUnpacked<QData/*63:0*/, 1> __VnbaTriggered;
    VlUnpacked<CData/*0:0*/, 3> __Vm_traceActivity;
    VlDelayScheduler __VdlySched;

    // INTERNAL VARIABLES
    Vone_bit_comparator_structural_tb__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Vone_bit_comparator_structural_tb___024root(Vone_bit_comparator_structural_tb__Syms* symsp, const char* namep);
    ~Vone_bit_comparator_structural_tb___024root();
    VL_UNCOPYABLE(Vone_bit_comparator_structural_tb___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
