library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gray_code1 is
    port(
        CLOCK_50 : in std_logic;
        Q : out std_logic_vector(2 downto 0);
        reset_n : in std_logic
    );
end entity gray_code1;

architecture RTL of gray_code1 is
    type tilstandstype is (s0,s1,s2,s3,s4,s5,s6,s7);
    signal tilstand : tilstandstype;
begin
    p_tilstand : process(CLOCK_50)
    begin
        if rising_edge(CLOCK_50) then
            if reset_n = '0' then
                    tilstand <= s0;
                else
                    case tilstand is
                        when s0 =>
                            tilstand <= s1;
                        when s1 =>
                            tilstand <= s2;
                        when s2 =>
                            tilstand <= s3;
                        when s3 =>
                            tilstand <= s4;
                        when s4 =>
                            tilstand <= s5;
                        when s5 =>
                            tilstand <= s6;
                        when s6 =>
                            tilstand <= s7;
                        when s7 =>
                            tilstand <= s0;
                    end case;
            end if;
        end if;
    end process;

    utgang : with tilstand select
        Q <=
            "000" when s0,
            "001" when s1,
            "011" when s2,
            "010" when s3,
            "110" when s4,
            "111" when s5,
            "101" when s6,
            "100" when s7,
            "000" when others;
    
end architecture RTL;



