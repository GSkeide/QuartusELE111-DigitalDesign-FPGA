3-bit Gray code counter (VHDL)

A 3-bit Gray code counter built as a state machine with eight states. On each rising edge of CLOCK_50, it moves to the next state and outputs the matching Gray code on Q (000, 001, 011, 010, 110, 111, 101, 100), then wraps back to the start. Only one bit changes between each step. The output depends only on the current state, so it is a Moore machine. It has an active-low synchronous reset that returns it to state s0.
