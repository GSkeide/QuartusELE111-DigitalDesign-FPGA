library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sram is
    port(
        SW : in std_logic_vector(17 downto 0);
        KEY : in std_logic_vector(3 downto 0);
        LEDR : out std_logic_vector(17 downto 0);
        SRAM_ADDR : out std_logic_vector(19 downto 0);
        SRAM_DQ : inout std_logic_vector(15 downto 0);
        SRAM_WE_N : buffer std_logic;
        SRAM_CE_N : out std_logic;
        SRAM_OE_N : out std_logic;
        SRAM_UB_N : out std_logic;
        SRAM_LB_N : out std_logic;
        HEX0,HEX1,HEX2,HEX3,HEX4,HEX5,HEX6,HEX7 : out std_logic_vector(6 downto 0)
    );
end entity sram;
architecture RTL of sram is

    component ROM_7_seg is
    port(
        adresse : in  std_logic_vector(3 downto 0);
        HEX     : out std_logic_vector(6 downto 0)
    );
    end component ROM_7_seg;

    signal adr : std_logic_vector(4 downto 0);
    signal dataInn : std_logic_vector(7 downto 0);
    signal dataUt : std_logic_vector(7 downto 0);
begin
    SRAM_CE_N <= '0';
    SRAM_OE_N <= '0';
    SRAM_LB_N <= '0';
    SRAM_UB_N <= '0';
    SRAM_WE_N <= SW(17);

    adr <= SW(15 downto 11);
    dataInn <= SW(7 downto 0);

    SRAM_DQ <= "00000000" & dataInn when SRAM_WE_N = '0'
        else (others => 'Z');
    dataUt <= SRAM_DQ(7 downto 0);

    SRAM_ADDR(19 downto 5) <= (others => '0');
    SRAM_ADDR(4 downto 0) <= adr;

    datautLOW: ROM_7_seg port map (adresse => dataUt(3 downto 0), HEX => HEX0);
    datautHIGH: ROM_7_seg port map (adresse => dataUt(7 downto 4), HEX => HEX1);
    datainnLOW: ROM_7_seg port map (adresse => dataInn(3 downto 0), HEX => HEX4);
    datainnHIGH: ROM_7_seg port map (adresse => datainn(7 downto 4), HEX => HEX5);
    adresseLOW: ROM_7_seg port map (adresse => adr(3 downto 0), HEX => HEX6);
    adresseHIGH: ROM_7_seg port map (adresse => "000"&adr(4), HEX => HEX7);
    HEX3 <= ((others => '1'));
    HEX2 <= ((others => '1'));

end architecture RTL;

