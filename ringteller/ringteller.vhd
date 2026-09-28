library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ringteller is
    port (
        SW : in std_logic_vector(17 downto 0);
        KEY : in std_logic_vector(3 downto 0);        
        LEDR : out std_logic_vector(7 downto 0)
    );
end entity ringteller;

architecture RTL of ringteller is
    signal clk : std_logic;                          
    signal rst : std_logic;
    signal Qout : std_logic_vector(7 downto 0);
begin

 
    clk <= KEY(0);
    rst <= KEY(3);

    p_ring : process (clk, rst) is
    begin
        if rising_edge(clk) then
            if rst = '0' then
                Qout <= SW(7 downto 0);                    
            else
                Qout <= Qout(0) & Qout(7 downto 1);  
            end if;
        end if;
    end process p_ring;

    LEDR(7 downto 0) <= Qout;                         

end architecture RTL;