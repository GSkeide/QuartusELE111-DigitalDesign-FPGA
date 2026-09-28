4-bit counter with variable (VHDL)

A 4-bit counter that counts from 0 to 15 and wraps around, written with a variable instead of a signal. It shows that a variable updates immediately inside the process, so the check A = 14 uses the new value from the same clock cycle. The output test is 0 when the counter is at 14 and 1 otherwise. The count is output on A_ut. It has an active-high synchronous reset.
