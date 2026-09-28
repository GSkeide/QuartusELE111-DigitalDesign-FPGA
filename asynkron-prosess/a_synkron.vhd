library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity a_synkron is
    port(
        clk : in std_logic;
        a : in std_logic;
        b : in std_logic;
        c : in std_logic;
        y : out std_logic;
        x : out std_logic
    );
end entity a_synkron;

architecture RTL of a_synkron is
    
begin


sync : process (clk) is
begin

if rising_edge(clk) then
   x <= a or (b and c);
end if;
end process sync;


async: process (a,b,c) is
begin
  y <= a or (b and c);
end process async;
    
end architecture RTL;

