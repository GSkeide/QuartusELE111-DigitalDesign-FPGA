Traffic light controller (VHDL, DE2 board)

A traffic light controller built as a state machine with six phases. Each phase lasts a set number of time ticks (30, 5, 3, 40, 5 and 3). The active phase is shown on LEDR5–0 and sent to GPIO5–0 to drive external traffic lights. The tick rate comes from an Enable_gen component, and SW2–0 select its speed, which makes testing easier. LEDR17 blinks as a heartbeat to show the design is running. GPIO35–32 are read back and shown on LEDR16–13. KEY3 resets the design through a reset synchronizer.
