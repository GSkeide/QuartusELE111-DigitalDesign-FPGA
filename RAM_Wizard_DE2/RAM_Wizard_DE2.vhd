--Innsignal: SW(17 downto 0), KEY(3 downto 0)
--Utsignal : HEX7(6 downto 0), HEX6(6 downto 0), HEX5(6 downto 0), HEX4(6 downto 0), HEX1(6 downto 0), HEX0(6 downto 0)
--Adressene hentes fra SW15 - SW11. Adressene skal vises p� HEX7 og HEX6.
--DataINN hentes fra SW7 � SW0. DataINN skal vises p� HEX5 og HEX4
--DataUT skal vises p� HEX1 og HEX0
--Write kobles til SW17. 
--Clock kobles til KEY0, 

-- I denne oppgaven skal vi skrive koden for RAM i figur1b
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

ENTITY RAM_WIZARD_DE2 IS
    PORT(SW                                             : IN  STD_LOGIC_VECTOR(17 DOWNTO 0);
         KEY                                            : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
         LEDG                                           : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
         LEDR                                           : OUT STD_LOGIC_VECTOR(17 DOWNTO 0);
         HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0 : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
        );
END;

ARCHITECTURE A OF RAM_WIZARD_DE2 IS
    -- deklarer Rom_7_seg
component ROM_7_seg is
    port(
        adresse : in  std_logic_vector(3 downto 0);
        HEX     : out std_logic_vector(6 downto 0)
    );
end component ROM_7_seg;
    -- deklarere LPM_ram
component ramlpm
	PORT
	(
		address		: IN STD_LOGIC_VECTOR (4 DOWNTO 0);
		clock		: IN STD_LOGIC  := '1';
		data		: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
		wren		: IN STD_LOGIC ;
		q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
	);
end component;

    -- interne signal som kobler SW, HEX og eventuelt LEDR til "kretsens indre del"	:
    --fyll ut
    signal DataUT : std_logic_vector(7 downto 0);
    signal DataINN : std_logic_vector(7 downto 0);
    signal adr : std_logic_vector(4 downto 0);
    signal clock : std_logic;
    signal wren : std_logic;
    --Tabellen:
    --fyll ut
BEGIN
    clock <= KEY(0);
    wren <= SW(17);
    adr <= SW(15 downto 11);
    DataINN <= SW(7 downto 0);
    
    -- kobl sammen
ramlpm_inst : component ramlpm
    port map(
        address => adr,
        clock   => clock,
        data    => dataINN,
        wren    => wren,
        q       => dataUT
    );

    -- konverter adr som er av type Integer til adresse som er type std_logic_vector
    --(du kan gjerne endre navn)

    -- 

    tall0 : ROM_7_seg PORT MAP(adresse => DataUT(3 downto 0), HEX => HEX0);
    tall1 : ROM_7_seg PORT MAP(adresse => DataUT(7 downto 4), HEX => HEX1);
    HEX2 <= "1111111";                  -- av
    HEX3 <= "1111111";                  -- av
    tall4 : ROM_7_seg PORT MAP(adresse => DataINN(3 downto 0), HEX => HEX4);
    tall5 : ROM_7_seg PORT MAP(adresse => DataINN(7 downto 4), HEX => HEX5);
    tall6 : ROM_7_seg PORT MAP(adresse => adr(3 downto 0), HEX => HEX6);
    tall7 : ROM_7_seg PORT MAP(adresse => "000" & adr(4), HEX => HEX7);
END;
