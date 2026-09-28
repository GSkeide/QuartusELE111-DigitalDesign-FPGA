library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity komperator is
    port(
        A, B : in std_logic_vector(3 downto 0);
        A_gt_B ,A_lt_B , A_eq_B : out std_logic
    );
end entity komperator;

architecture RTL of komperator is
    
begin
    pkomp : process(A, B) 
    begin
        A_gt_B <= '0';
        A_lt_B <= '0';
        A_eq_B <= '0';

        for i in 3 downto 0 loop
            if A(i) = '1' and B(i) = '0' then -- A størst;
                A_gt_B <= '1';
                EXIT;
                elsif A(i) = '0' and B(i) = '1' then -- B størst;
                    A_lt_B <= '1';
                EXIT;
                elsif i = 0 then -- AB lik;
                    A_eq_B <= '1';
                End if;
         end loop;
end process;
end architecture RTL;