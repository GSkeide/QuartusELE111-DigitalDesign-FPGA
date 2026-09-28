library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity o4_tell_biler is
    port(
        clock_50 : in std_logic;
        reset_clk : in std_logic;
        bil_inn : in std_logic;
        bil_ut : in std_logic;
        antall_biler : out std_logic_vector(7 downto 0)
    );
end entity o4_tell_biler;

architecture RTL of o4_tell_biler is
    signal count : integer range 0 to 255;
begin
    teller : process(clock_50) is
    begin

        if rising_edge(clock_50) then
            if reset_clk = '1' then 
                count <= 0;
            end if;
            if bil_inn = '1' then
                if (count < 255) then  -- Sjekk for maksimum 255
                    count <= count + 1;
                end if;
            elsif bil_ut = '1' then
                if (count > 0) then  -- Sjekk for minimum 0
                    count <= count - 1;
                end if;
            end if;
        end if;
        antall_biler <= std_logic_vector(to_unsigned(count, 8));
    end process;
end architecture RTL;

