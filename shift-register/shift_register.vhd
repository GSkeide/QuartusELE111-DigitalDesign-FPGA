library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity shift_register is
    port(
        clk : in std_logic;
        rst : in std_logic;
        SI : in std_logic;
        SO : out std_logic
    );
end entity shift_register;
architecture RTL of shift_register is

    signal Q : std_logic_vector(3 downto 0);
    
begin
    p_shift_register : process(clk) is
    begin
        if rising_edge(clk) then
            if rst = '1' then
                Q <= (others => '0');
            else 
                -- Q(0) <= Q(1);
                -- Q(1) <= Q(2);
                -- Q(2) <= Q(3);
                -- Q(3) <= SI;
                Q <= SI & Q(3 downto 1);
            end if;
        end if;
    end process;

    SO <= Q(0);

end architecture RTL;

