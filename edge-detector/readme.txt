Edge detector (VHDL)

A synchronized falling-edge detector. The input dataInn first passes through two flip-flops, which synchronize it to the clock and reduce the risk of metastability. A third flip-flop holds the previous value. When the signal changes from 1 to 0, flankeUt outputs a pulse lasting one clock cycle. It has an active-low synchronous reset.
