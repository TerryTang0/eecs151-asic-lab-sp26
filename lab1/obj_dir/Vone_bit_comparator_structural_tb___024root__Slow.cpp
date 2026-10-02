// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vone_bit_comparator_structural_tb.h for the primary calling header

#include "Vone_bit_comparator_structural_tb__pch.h"

void Vone_bit_comparator_structural_tb___024root___ctor_var_reset(Vone_bit_comparator_structural_tb___024root* vlSelf);

Vone_bit_comparator_structural_tb___024root::Vone_bit_comparator_structural_tb___024root(Vone_bit_comparator_structural_tb__Syms* symsp, const char* namep)
    : __VdlySched{*symsp->_vm_contextp__}
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    Vone_bit_comparator_structural_tb___024root___ctor_var_reset(this);
}

void Vone_bit_comparator_structural_tb___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vone_bit_comparator_structural_tb___024root::~Vone_bit_comparator_structural_tb___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
