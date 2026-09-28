library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity O2_flanke_detektor is
    port(
        CLOCK_50 : in std_logic;
        reset_clk : in std_logic;
        sig_inn : std_logic;
        sig_inn_ne : out std_logic
        
    );
end entity O2_flanke_detektor;


architecture RTL of O2_flanke_detektor is
    signal vippeA : std_logic;
    
begin
    p_sync_flanke : process(CLOCK_50)
    begin
        if rising_edge(CLOCK_50) then
            if reset_clk = '1' then
                vippeA <= '0';
                sig_inn_ne <= '0';
            else
                vippeA <= sig_inn;
                sig_inn_ne <= vippeA and (not sig_inn);
            end if; 
        end if;
    end process;
end architecture RTL;
