library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity teller is
    port(
        clk : in std_logic;
        rst : in std_logic;
        test : out std_logic;
        A_ut : out std_logic_vector(3 downto 0)
    );
end entity teller;


architecture RTL of teller is
begin
    p_teller : process(clk)
        variable A : unsigned(3 downto 0);
    begin
        if rising_edge(clk) then
            if rst = '1' then
                --E_int <= 0;
                A := "0000";
                test <= '0';
            elsif (A = 15) then
                A := "0000";
            else
                A := A + 1;
            end if;
            if A = 14 then
                test <= '0';
            else
            test <= '1';
            end if;
            A_ut <= std_logic_vector(A);
        end if;
    end process;
end architecture RTL;
