library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity O5_parkeringshuset is
    port(
        CLOCK_50 : in std_logic;
        KEY : in std_logic_vector(3 downto 0);
        LEDR : out std_logic_vector(17 downto 0);
        SW : in std_logic_vector(17 downto 0);
        HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7 : out std_logic_vector(6 downto 0)
    );
end entity O5_parkeringshuset;


architecture RTL of O5_parkeringshuset is
    component O1_Reset_Synchronizer is
        port(
            clk : in std_logic;
            areset_n : in std_logic;
            reset_clk : out std_logic
        );
    end component O1_Reset_Synchronizer;
    component skiftregister is
        port(
            clk : in std_logic;                     
            rst : in std_logic;                 
            sensor_inn : in std_logic;          
            sync_inn: out std_logic;
            sensor_ut : in std_logic;          
            sync_ut: out std_logic      
        );
    end component skiftregister;
    component O3_antiprell is
        port (
            clk        : in std_logic;
            reset_clk  : in std_logic;
            input      : in std_logic;
            passering   : out std_logic
        );
    end component O3_antiprell;
    component O2_flanke_detektor is
        port(
            CLOCK_50 : in std_logic;
            reset_clk : in std_logic;
            sig_inn : std_logic;
            sig_inn_ne : out std_logic
            
        );
    end component O2_flanke_detektor;
    component o4_tell_biler is
        port(
            clock_50 : in std_logic;
            reset_clk : in std_logic;
            bil_inn : in std_logic;
            bil_ut : in std_logic;
            antall_biler : out std_logic_vector(7 downto 0)
        );
    end component o4_tell_biler;
    component bin2bcd is
        port(
            bin_in  : in  std_logic_vector(8 downto 0);
            bcd_out : out std_logic_vector(11 downto 0)
        );
    end component bin2bcd;
    component ROM_7_seg is
        port(
            adresse : in  std_logic_vector(3 downto 0);
            HEX     : out std_logic_vector(6 downto 0)
        );
    end component ROM_7_seg;

    signal rst_clk : std_logic;
    signal sensor_inn_qq : std_logic;
    signal sensor_ut_qq: std_logic;
    signal passering_inn : std_logic;
    signal passering_ut: std_logic;
    signal bil_inn : std_logic;
    signal bil_ut: std_logic;
    signal antall_bilerr : std_logic_vector(7 downto 0);
    signal bcd_out : std_logic_vector(11 downto 0);

begin
    LEDR(7 downto 0) <= antall_bilerr;
    O1 : O1_Reset_Synchronizer
    port map(
        clk => CLOCK_50,
        areset_n => KEY(3),
        reset_clk => rst_clk
    );

    sensor_synking : skiftregister
    port map(
        clk => CLOCK_50,                   
        rst => rst_clk,                
        sensor_inn => KEY(1),          
        sync_inn => sensor_inn_qq,
        sensor_ut => KEY(0),    
        sync_ut =>  sensor_ut_qq  
    );
    O3inn : O3_antiprell
    port map(
        clk => CLOCK_50,
        reset_clk => rst_clk,
        input => sensor_inn_qq,
        passering => passering_inn
    );
    O3ut : O3_antiprell
    port map(
        clk => CLOCK_50,
        reset_clk => rst_clk,
        input => sensor_ut_qq,
        passering => passering_ut
    );
    O2inn : O2_flanke_detektor
    port map(
        CLOCK_50 => clock_50,
        reset_clk => rst_clk,
        sig_inn => passering_inn,
        sig_inn_ne => bil_inn
    );
    O2ut : O2_flanke_detektor
    port map(
        CLOCK_50 => clock_50,
        reset_clk => rst_clk,
        sig_inn => passering_ut,
        sig_inn_ne => bil_ut
    );
    O4 : O4_tell_biler
    port map(
        CLOCK_50 => clock_50,
        reset_clk => rst_clk,
        bil_inn => bil_inn,
        bil_ut  => bil_ut,
        antall_biler => antall_bilerr
    );
    bcd : bin2bcd
    port map(
        bin_in => "0" & antall_bilerr,
        bcd_out => bcd_out
    );


    eg1 : ROM_7_seg
    port map(
        adresse => bcd_out(3 downto 0),
        HEX => HEX0
    );
    eg2 : ROM_7_seg
    port map(
        adresse => bcd_out(7 downto 4),
        HEX => HEX1
    );
    eg3 : ROM_7_seg
    port map(
        adresse => bcd_out(11 downto 8),
        HEX => HEX2
    );
    
end architecture RTL;