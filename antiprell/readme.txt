Debouncer state machine (VHDL)

A debouncer for a noisy input signal such as a button or sensor, built as a Moore state machine. The input must stay high for about 1000 clock cycles before the output passering goes high. It must then stay low for about 1000 clock cycles before the output goes low again. Short spikes and bounces in either direction are ignored. It has an active-low synchronous reset, designed to be driven by the reset synchronizer's reset_clk output.
