library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity datatyper is
    port(
        clk : in std_logic;
        rst : in std_logic
    );
end entity datatyper;

architecture RTL of datatyper is
    type tabell is array (0 to 4) of std_logic_vector(2 downto 0);

    signal liste : tabell := ("000", "001", "010", "011", "100");
    signal c : std_logic_vector(2 downto 0);

    type tilstander is (T1, T2, T3);
    signal state : tilstander;
begin
    c <= liste(2);
    liste(3) <= "111";

    pTilstandsmaskin : process (clk) is
    begin
        if rising_edge(clk) then
            if rst = '1' then
                
            else
                if state = T1 then 
                    state <= T2;
                elsif state = T2 then
                    state <= T3;
                else
                    state <= T1;
                end if; -- state
            end if; -- rst
        end if; -- rising edge
    end process pTilstandsmaskin;

    
    
end architecture RTL;
