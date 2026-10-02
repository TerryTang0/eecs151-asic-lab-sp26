// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vone_bit_comparator_structural_tb__pch.h"
#include "verilated_vcd_c.h"

//============================================================
// Constructors

Vone_bit_comparator_structural_tb::Vone_bit_comparator_structural_tb(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vone_bit_comparator_structural_tb__Syms(contextp(), _vcname__, this)}
    , m_evalLoop{*this, /*convergeLimit:*/ 10000}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
    contextp()->traceBaseModelCbAdd(
        [this](VerilatedTraceBaseC* tfp, int levels, int options) { traceBaseModel(tfp, levels, options); });
}

Vone_bit_comparator_structural_tb::Vone_bit_comparator_structural_tb(const char* _vcname__)
    : Vone_bit_comparator_structural_tb(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vone_bit_comparator_structural_tb::~Vone_bit_comparator_structural_tb() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vone_bit_comparator_structural_tb___024root___eval_debug_assertions(Vone_bit_comparator_structural_tb___024root* vlSelf);
#endif  // VL_DEBUG
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_static(Vone_bit_comparator_structural_tb___024root* vlSelf);
void Vone_bit_comparator_structural_tb___024root___eval_initial(Vone_bit_comparator_structural_tb___024root* vlSelf);
VL_ATTR_COLD bool Vone_bit_comparator_structural_tb___024root___eval_stl(Vone_bit_comparator_structural_tb___024root* vlSelf, CData/*0:0*/ firstIteration);
void Vone_bit_comparator_structural_tb___024root___eval_sample(Vone_bit_comparator_structural_tb___024root* vlSelf);
bool Vone_bit_comparator_structural_tb___024root___eval_ico(Vone_bit_comparator_structural_tb___024root* vlSelf, CData/*0:0*/ firstIteration);
bool Vone_bit_comparator_structural_tb___024root___eval_act(Vone_bit_comparator_structural_tb___024root* vlSelf);
bool Vone_bit_comparator_structural_tb___024root___eval_inact(Vone_bit_comparator_structural_tb___024root* vlSelf);
bool Vone_bit_comparator_structural_tb___024root___eval_nba(Vone_bit_comparator_structural_tb___024root* vlSelf);
bool Vone_bit_comparator_structural_tb___024root___eval_obs(Vone_bit_comparator_structural_tb___024root* vlSelf);
bool Vone_bit_comparator_structural_tb___024root___eval_react(Vone_bit_comparator_structural_tb___024root* vlSelf);
void Vone_bit_comparator_structural_tb___024root___eval_postponed(Vone_bit_comparator_structural_tb___024root* vlSelf);
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_final(Vone_bit_comparator_structural_tb___024root* vlSelf);
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__stl(Vone_bit_comparator_structural_tb___024root* vlSelf);
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__ico(Vone_bit_comparator_structural_tb___024root* vlSelf);
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__act(Vone_bit_comparator_structural_tb___024root* vlSelf);
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__nba(Vone_bit_comparator_structural_tb___024root* vlSelf);
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__obs(Vone_bit_comparator_structural_tb___024root* vlSelf);
VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__react(Vone_bit_comparator_structural_tb___024root* vlSelf);

void Vone_bit_comparator_structural_tb::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vone_bit_comparator_structural_tb::eval_step\n"); );
    m_evalLoop.eval();
}

void Vone_bit_comparator_structural_tb::evalBegin() {
#ifdef VL_DEBUG
    // Debug assertions
    Vone_bit_comparator_structural_tb___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_activity = true;
    vlSymsp->__Vm_deleter.deleteAll();
}

void Vone_bit_comparator_structural_tb::evalEnd() {
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
    vlSymsp->TOP.__VdlySched.cleanupForevered();
}

void Vone_bit_comparator_structural_tb::evalStatic() {
    Vone_bit_comparator_structural_tb___024root___eval_static(&(vlSymsp->TOP));
}

void Vone_bit_comparator_structural_tb::evalInitial() {
    Vone_bit_comparator_structural_tb___024root___eval_initial(&(vlSymsp->TOP));
}

bool Vone_bit_comparator_structural_tb::evalStl(bool firstIteration) {
    return Vone_bit_comparator_structural_tb___024root___eval_stl(&(vlSymsp->TOP), firstIteration);
}

void Vone_bit_comparator_structural_tb::evalSample() {
    Vone_bit_comparator_structural_tb___024root___eval_sample(&(vlSymsp->TOP));
}

bool Vone_bit_comparator_structural_tb::evalIco(bool firstIteration) {
    return Vone_bit_comparator_structural_tb___024root___eval_ico(&(vlSymsp->TOP), firstIteration);
}

bool Vone_bit_comparator_structural_tb::evalAct() {
    return Vone_bit_comparator_structural_tb___024root___eval_act(&(vlSymsp->TOP));
}

bool Vone_bit_comparator_structural_tb::evalInact() {
    return Vone_bit_comparator_structural_tb___024root___eval_inact(&(vlSymsp->TOP));
}

bool Vone_bit_comparator_structural_tb::evalNba() {
    return Vone_bit_comparator_structural_tb___024root___eval_nba(&(vlSymsp->TOP));
}

bool Vone_bit_comparator_structural_tb::evalObs() {
    return Vone_bit_comparator_structural_tb___024root___eval_obs(&(vlSymsp->TOP));
}

bool Vone_bit_comparator_structural_tb::evalReact() {
    return Vone_bit_comparator_structural_tb___024root___eval_react(&(vlSymsp->TOP));
}

void Vone_bit_comparator_structural_tb::evalPostponed() {
    Vone_bit_comparator_structural_tb___024root___eval_postponed(&(vlSymsp->TOP));
}

void Vone_bit_comparator_structural_tb::evalFinal() {
    Vone_bit_comparator_structural_tb___024root___eval_final(&(vlSymsp->TOP));
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb::dumpTriggersStl() {
    Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__stl(&(vlSymsp->TOP));
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb::dumpTriggersIco() {
    Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__ico(&(vlSymsp->TOP));
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb::dumpTriggersAct() {
    Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__act(&(vlSymsp->TOP));
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb::dumpTriggersNba() {
    Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__nba(&(vlSymsp->TOP));
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb::dumpTriggersObs() {
    Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__obs(&(vlSymsp->TOP));
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb::dumpTriggersReact() {
    Vone_bit_comparator_structural_tb___024root___eval_dump_triggers__react(&(vlSymsp->TOP));
}

void Vone_bit_comparator_structural_tb::eval_end_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+eval_end_step Vone_bit_comparator_structural_tb::eval_end_step\n"); );
#ifdef VM_TRACE
    // Tracing
    if (VL_UNLIKELY(vlSymsp->__Vm_dumping)) vlSymsp->_traceDump();
#endif  // VM_TRACE
}

//============================================================
// Events and timing
bool Vone_bit_comparator_structural_tb::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty() && !contextp()->gotFinish(); }

uint64_t Vone_bit_comparator_structural_tb::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Vone_bit_comparator_structural_tb::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

VL_ATTR_COLD void Vone_bit_comparator_structural_tb::final() {
    contextp()->executingFinal(true);
    evalFinal();
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vone_bit_comparator_structural_tb::hierName() const { return vlSymsp->name(); }
const char* Vone_bit_comparator_structural_tb::modelName() const { return "Vone_bit_comparator_structural_tb"; }
unsigned Vone_bit_comparator_structural_tb::threads() const { return 1; }
void Vone_bit_comparator_structural_tb::prepareClone() const { contextp()->prepareClone(); }
void Vone_bit_comparator_structural_tb::atClone() const {
    contextp()->threadPoolpOnClone();
}
std::unique_ptr<VerilatedTraceConfig> Vone_bit_comparator_structural_tb::traceConfig() const {
    return std::unique_ptr<VerilatedTraceConfig>{new VerilatedTraceConfig{false}};
};

//============================================================
// Trace configuration

void Vone_bit_comparator_structural_tb___024root__trace_decl_types(VerilatedVcd* tracep);

void Vone_bit_comparator_structural_tb___024root__trace_init_top(Vone_bit_comparator_structural_tb___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD static void trace_init(void* voidSelf, VerilatedVcd* tracep, uint32_t code) {
    // Callback from tracep->open()
    Vone_bit_comparator_structural_tb___024root* const __restrict vlSelf VL_ATTR_UNUSED = static_cast<Vone_bit_comparator_structural_tb___024root*>(voidSelf);
    Vone_bit_comparator_structural_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (!vlSymsp->_vm_contextp__->calcUnusedSigs()) {
        VL_FATAL_MT(__FILE__, __LINE__, __FILE__,
            "Turning on wave traces requires Verilated::traceEverOn(true) call before time 0.");
    }
    vlSymsp->__Vm_baseCode = code;
    tracep->pushPrefix(vlSymsp->name(), VerilatedTracePrefixType::SCOPE_MODULE);
    Vone_bit_comparator_structural_tb___024root__trace_decl_types(tracep);
    Vone_bit_comparator_structural_tb___024root__trace_init_top(vlSelf, tracep);
    tracep->popPrefix();
}

VL_ATTR_COLD void Vone_bit_comparator_structural_tb___024root__trace_register(Vone_bit_comparator_structural_tb___024root* vlSelf, VerilatedVcd* tracep);

VL_ATTR_COLD void Vone_bit_comparator_structural_tb::traceBaseModel(VerilatedTraceBaseC* tfp, int levels, int options) {
    (void)levels; (void)options;
    VerilatedVcdC* const stfp = dynamic_cast<VerilatedVcdC*>(tfp);
    if (VL_UNLIKELY(!stfp)) {
        vl_fatal(__FILE__, __LINE__, __FILE__,"'Vone_bit_comparator_structural_tb::trace()' called on non-VerilatedVcdC object;"
            " use --trace-fst with VerilatedFst object, and --trace-vcd with VerilatedVcd object");
    }
    stfp->spTrace()->addModel(this);
    stfp->spTrace()->addInitCb(&trace_init, &(vlSymsp->TOP), name(), false, 7);
    Vone_bit_comparator_structural_tb___024root__trace_register(&(vlSymsp->TOP), stfp->spTrace());
}
