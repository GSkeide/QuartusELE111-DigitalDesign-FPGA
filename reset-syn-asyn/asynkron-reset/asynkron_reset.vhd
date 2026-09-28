library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity asynkron_reset is
    port(
        clk : in std_logic;
        rst_key3_n : in std_logic;
        rst_clk : out std_logic
    );
end entity asynkron_reset;

architecture RTL of asynkron_reset is
    signal dff : std_logic;
begin
    p_sync_reset : process(clk,rst_key3_n)
    begin
        if rst_key3_n = '0' then
            dff <= '0';
            rst_clk <= '0';
        elsif rising_edge(clk) then
            dff <= '1';
            rst_clk <= dff;
        end if;
    end process;
end architecture RTL;
