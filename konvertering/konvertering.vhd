library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity konvertering is
    port(
        SW : in std_logic_vector(17 downto 0);
        LEDG : out std_logic_vector(7 downto 0)
    );
end entity konvertering;


architecture RTL of konvertering is
    signal a,b : integer range 0 to 15;
    signal c : integer range 0 to 255;
    signal b_slv : std_logic_vector(3 downto 0);
    signal c_slv : std_logic_vector(7 downto 0);
    
begin
    a <= to_integer(unsigned(SW(3 downto 0)));
    b_slv <= SW(7 downto 4);
    b <= to_integer(unsigned(b_slv));
    c <= a+b; 

    c_slv <= std_logic_vector(to_unsigned(c,8));

    LEDG <= c_slv;
end architecture RTL;
