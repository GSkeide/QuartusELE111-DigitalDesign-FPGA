Noise filter / debouncer (VHDL)

A simple digital noise filter that cleans up a noisy input signal. 
The input SI is sampled into a 4-bit shift register on each rising clock edge. 
The output SO only changes when the signal has been stable for three consecutive samples: 
it goes to 1 after three 1s in a row and to 0 after three 0s in a row, and otherwise keeps its previous value.
It has an active-high synchronous reset.
