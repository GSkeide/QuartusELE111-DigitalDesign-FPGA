Counts the number of cars in a parking area, for example. Each pulse on bil_inn increases the count by one, and each pulse on bil_ut decreases it by one. The count stays within 0–255 and is output as an 8-bit value on antall_biler. The inputs are meant to be single-clock pulses, for example from an edge detector, so each car is counted only once.

A couple of things to check:

Reset priority: The reset doesn't take priority, because the bil_inn/bil_ut check comes after it and can override it. Putting the counting logic in an else branch under the reset fixes that.
Reset polarity: The reset here is active-high. If reset_clk comes from your reset synchronizer, that output is active-low, so you'd want reset_clk = '0'.
