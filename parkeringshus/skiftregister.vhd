library ieee;
use ieee.std_logic_1164.all;

entity skiftregister is
    port(
        clk : in std_logic;                     
        rst : in std_logic;                 
        sensor_inn : in std_logic;          
        sync_inn: out std_logic;
        sensor_ut : in std_logic;          
        sync_ut: out std_logic      
    );
end entity skiftregister;

architecture Behavioral of skiftregister is
    signal reginn1 : std_logic := '0';           
    signal reginn2 : std_logic := '0';      
    signal regut1 : std_logic := '0';           
    signal regut2 : std_logic := '0';  
begin

    process(clk, rst) is
    begin
        if rst = '1' then
            reginn1 <= '0';                  
            reginn2 <= '0';       
            
            regut1 <= '0';                  
            regut2 <= '0';  
        elsif rising_edge(clk) then
            reginn1 <= sensor_inn;              
            reginn2 <= reginn1;      
            
            regut1 <= sensor_ut;              
            regut2 <= regut1;   
        end if;
    end process;

    sync_inn <= reginn2; 
    sync_ut <= regut2; 

end architecture Behavioral;
