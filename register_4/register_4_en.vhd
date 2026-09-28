library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity register_4_en is
    port(
        clk : in std_logic;
        EN : in std_logic;
        D : in std_logic_vector(3 downto 0);
        Q : out std_logic_vector(3 downto 0)
    );
end entity register_4_en;

architecture RTL of register_4_en is
    signal Q_internt : std_logic_vector(3 downto 0);
begin
    p_register : process(clk) is
    begin 
        if rising_edge(clk) then
            Q <= D;
        end if;
    end process;

    Q <= Q_internt when EN = '1' else (others => 'Z');
end architecture RTL;
