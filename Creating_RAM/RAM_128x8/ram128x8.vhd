library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram128x8 is
    port(
        clk: in std_logic;
        adresse : in std_logic_vector(3 downto 0);
        data_inn : in std_logic_vector(7 downto 0);
        data_ut : out std_logic_vector(7 downto 0);
        we : in std_logic
           );
end entity ram128x8;


architecture RTL of ram128x8 is
type ram_array is array(0 to 31) of std_logic_vector(7 downto 0);
signal memory : ram_array;
signal adresse_int : integer range 0 to 31;

    
begin
adresse_int <= to_integer(unsigned(adresse));
data_ut <= memory(adresse_int);

    p_ram : process(clk)
    begin
        if rising_edge(clk) then
                if we = '1' then
                    memory(adresse_int) <= data_inn;
                end if;
        end if;
    end process;
end architecture RTL;
