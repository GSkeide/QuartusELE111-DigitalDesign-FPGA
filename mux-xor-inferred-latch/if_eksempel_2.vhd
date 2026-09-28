library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity if_eksempel_2 is
    port(
        clk : in std_logic;
        rst : in std_logic
    );
end entity if_eksempel_2;

architecture RTL of if_eksempel_2 is
    
begin
   mux_Num_Sel : process(a,b,sel) is
   begin
   if sel < 5 then
   x <= a;
  -- elsif 
   --x <= b;
   else
   x <= b;
   end if sel;
   
    
end architecture RTL;


-- 