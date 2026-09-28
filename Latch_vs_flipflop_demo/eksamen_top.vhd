library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity eksamen_top is
    port(
        CLOCK_50 : in std_logic;
        SW : in std_logic_vector(17 downto 0);
        KEY : in std_logic_vector(3 downto 0);
        LEDR : out std_logic_vector(17 downto 0);
        LEDG : out std_logic_vector(7 downto 0);
        HEX0 : out std_logic_vector(6 downto 0)
    );
end entity eksamen_top;

architecture RTL of eksamen_top is
   signal D : std_logic;
   signal A : std_logic;
   signal Qa : std_logic;
   signal Qb : std_logic;
   signal dff : std_logic;

   signal rst_clk : std_logic;
begin
    LEDR(0) <= Qa;
    Ledr(1) <= Qb;

    
    oA : process(d,sw(1))
    begin
        if sw(1) = '1' then
            qa <= sw(0);
        end if;
    end process;

    oB : process(clock_50)
    begin
        if rising_edge(clock_50) then
            if rst_clk = '0' then
                Qb <= '0';
            else
            Qb <= Sw(2);   -- On clock rising edge, latch the value of D to Q
            end if;
        end if;


    end process;

    p_reset : process(clock_50, key(0))
    begin
        if (key(0)) = '0' then
            dff <= '0';
            rst_clk <= '0';
        elsif (rising_edge(clock_50)) then
            dff <= '1';
            rst_clk <= dff;
        end if;
        end process;


    
end architecture RTL;

