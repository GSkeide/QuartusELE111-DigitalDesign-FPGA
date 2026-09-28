library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity flankedetektor is
    port(
        clk : in std_logic;
        rst : in std_logic;
        dataInn : std_logic;
        flankeUt : out std_logic
    );
end entity flankedetektor;


architecture RTL of flankedetektor is
    signal vippeA, vippeB, vippeC : std_logic;
    
begin
    p_sync_flanke : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '0' then
                vippeA <= '0';
                vippeB <= '0';
                vippeC <= '0';
                flankeUt <= '0';
            else
                vippeA <= dataInn;
                vippeB <= vippeA;
                vippeC <= vippeB;
                flankeUt <= vippeC and (not vippeB);
            end if; 
        end if;
    end process;
end architecture RTL;
