library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ram16x8 is
    port(
        clk: in std_logic;
        adresse : in std_logic_vector(2 downto 0);
        data_inn : in std_logic_vector(7 downto 0);
        data_ut : out std_logic_vector(7 downto 0);
        we_n, cs_n, oe_n : in std_logic
           );
end entity ram16x8;


architecture RTL of ram16x8 is
type ram_array is array(0 to 15) of std_logic_vector(7 downto 0);
signal memory : ram_array;
signal adresse_int : integer range 0 to 15;

    
begin
adresse_int <= to_integer(unsigned(adresse));

    p_ram : process(clk)
    begin
        if rising_edge(clk) then
            if cs_n = '0' then
                if we_n = '0' then
                    memory(adresse_int) <= data_inn;
                end if;
                if oe_n = '0' then
                    data_ut <= memory(adresse_int);
                end if;
            
            end if;
        end if;
    end process;
end architecture RTL;

