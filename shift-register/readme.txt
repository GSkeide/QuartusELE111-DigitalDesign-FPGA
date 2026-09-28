4-bit shift register (VHDL)

A serial-in, serial-out shift register. On each rising clock edge, the input SI is shifted into the top bit and the contents move one step to the right.
The bit that reaches the bottom comes out on SO, so the output is the input delayed by four clock cycles. 
It has an active-high synchronous reset that clears the register to 0.
