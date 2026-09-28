Latch vs. flip-flop demo (VHDL, DE2 board)

A small exam exercise comparing a D latch with a D flip-flop on the DE2 board. The latch (LEDR0) is transparent while SW1 is high: it follows SW0, then holds its value when SW1 goes low. The flip-flop (LEDR1) samples SW2 on each rising edge of the 50 MHz clock. The flip-flop is reset through a two-stage reset synchronizer, and KEY0 serves as the asynchronous reset input.

One small thing: the latch process has d in its sensitivity list instead of sw(0). Synthesis will still build the latch correctly, but in simulation Qa won't follow changes on SW0 while SW1 is high. Changing it to process(sw(0), sw(1)) fixes that.
