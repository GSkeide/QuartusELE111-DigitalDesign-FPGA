library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity bin2bcd is
    port(
        bin_in  : in  std_logic_vector(8 downto 0);
        bcd_out : out std_logic_vector(11 downto 0)
    );
end entity bin2bcd;

architecture behavior of bin2bcd is

begin
    p_convert : process(bin_in)
        variable integer_tier : integer range 0 to 9;
        variable integer_hundre : integer range 0 to 9;
        variable integer_ener  : integer range 0 to 9;
        variable temp         : integer range 0 to 999;
    begin
        -- fra std_logic_vector til integer
        temp         := to_integer(unsigned(bin_in));
        -- 100-er -siffer
        integer_hundre := temp / 100;
        -- 10-er -siffer
        integer_tier := (temp - integer_hundre*100)/10;
        -- 1-er siffer
        integer_ener  := temp - integer_tier * 10 - integer_hundre*100;

        -- tilbake til std_logic_vector:
        bcd_out(3 downto 0) <= std_logic_vector(to_unsigned(integer_ener, 4));
        bcd_out(7 downto 4) <= std_logic_vector(to_unsigned(integer_tier, 4));
        bcd_out(11 downto 8) <= std_logic_vector(to_unsigned(integer_hundre, 4));
    end process;

end architecture behavior;

