library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity teller0_15 is
    port(
        clk : in std_logic;
        rst : in std_logic;
        count : out std_logic_vector(3 downto 0)
    );
end entity teller0_15;


architecture RTL of teller0_15 is
    signal teller : integer range 0 to 15;
begin
    


    p_tell : process (clk) is
    begin
        if rising_edge(clk) then
            if rst = '0' then
                teller <= 0;
            else
                if teller >= 15 then 
                    teller <= 0;
                else 
                    teller <= teller + 1;
                end if;
            end if;
        end if;
    end process p_tell;
    count <= std_logic_vector(to_unsigned(teller,4));
end architecture RTL;
