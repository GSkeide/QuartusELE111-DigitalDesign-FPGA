	Library ieee;
	Use ieee.std_logic_1164.all;
	
	ENTITY LCD_klokke IS
	PORT(clock_50 : in std_logic;
			SW 	:in std_logic_vector(17 downto 0);-- Hex_Display_data
			KEY	:in std_logic_vector(3 downto 0);
			LCD_RS,LCD_EN : out std_logic;
			LCD_RW: out std_logic;
			LCD_ON: out std_logic;
			LCD_DATA: INOUT std_logic_vector(7 downto 0) );
	end;
	
	ARCHITECTURE rtl of LCD_klokke IS
	
	COMPONENT LCD_Display IS
		PORT(reset, clk_48Mhz			: IN	STD_LOGIC;
			 Hex_Display_Data			: IN    STD_LOGIC_VECTOR(23 DOWNTO 0);
			 LCD_RS, LCD_E				: OUT	STD_LOGIC;
			 LCD_RW						: OUT   STD_LOGIC;
			 DATA_BUS					: INOUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
	END COMPONENT LCD_Display;
	
	COMPONENT Reset_synchronizer IS
		Port ( clk: IN std_logic;
			 reset_key3 : IN std_logic;
			 reset_sync: OUT std_logic);-- NB! sjekk hvilke navn du har benyttet!
	End COMPONENT;
	
	Signal bcd : STD_LOGIC_VECTOR(23 DOWNTO 0);
	Signal reset_key3,reset: std_LOGIC;
	BEGIN
	
	LCD_ON <= '1';
	bcd <= "100000" & SW(17 downto 0);
	reset_key3 <= key(3);
	
	reset_synkroniseres: Reset_synchronizer Port map(clk => clock_50, reset_key3 => reset_key3,
														reset_sync => reset );
		
	--Kobler til LCD displayet
	lcd: LCD_Display PORT MAP (reset => reset, clk_48Mhz	=> CLOCK_50		,
			 Hex_Display_Data	=>	bcd	,
			 LCD_RS=>LCD_RS , LCD_E	=>	LCD_EN, LCD_RW	=>	LCD_RW,  DATA_BUS=> LCD_data  );
	END;