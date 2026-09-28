library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ROM_Hallo is
    port(
        adresse : in std_logic_vector(2 downto 0);
        data_ut : out std_logic_vector(6 downto 0)
    );
end entity ROM_hallo;

architecture RTL of ROM_hallo is
    type ROM_ARRAY is array(0 to 7) of std_logic_vector(6 downto 0);
    constant HALLO_ROM : ROM_ARRAY := ("0001001","0001000","1000111",
    "1000111","1000000", others => "1111111");
begin
    data_ut <= HALLO_ROM(to_integer(unsigned(adresse)));
end architecture RTL;

