library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity stoyfilter is
    port(
        clk : in std_logic;
        rst : in std_logic;
        SI : in std_logic;
        SO : OUT std_logic
    );
end entity stoyfilter;

architecture RTL of stoyfilter is
    signal shift_register : std_logic_vector(3 downto 0);

begin
    

    p_filter : process(clk)
    begin
        if rising_edge(clk) then
            if rst = '1' then
                shift_register <= (others => '0');
                SO <= '0';
            else
                shift_register <= SI & shift_register(3 downto 1);
                if shift_register(2 downto 0) = "000" then
                    SO <= '0';
                elsif shift_register(2 downto 0) = "111" then
                    SO <= '1';
                else
                    null; -- SO beholder gammel verdi
                end if; -- shift_register 2 dt 0
            end if; -- rst
        end if; --clk
    end process;



end architecture RTL;
