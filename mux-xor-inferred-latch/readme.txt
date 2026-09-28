Implements MUX / XOR (if statement) hardware in vhdl.

                      In a combinational block like this all conditions of the if statement must have a value, this can be done by giving a default value in the else branch or adding a default value before the if statement.
                        If this is not done it will create a inferred latch, which is usually not desirable in digital design
