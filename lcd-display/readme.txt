LCD display driver for clock (VHDL, DE2 board)

A controller for the 16x2 character LCD (HD44780) on the Altera DE2 board, adapted to display a clock. It shows "KLOKKEN ER:" on the first line and the time as HH:MM:SS on the second line. The time comes from the 24-bit Hex_Display_Data input, which holds six 4-bit digits. A state machine initializes the LCD and then continuously writes the characters, converting each 4-bit value to its ASCII hex digit. It has an active-low asynchronous reset.

It is based on the standard LCD example code for Altera boards, modified for the DE2 and a 24-bit input.
