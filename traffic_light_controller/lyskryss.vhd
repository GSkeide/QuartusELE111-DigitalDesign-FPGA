library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity lyskryss is
    port(
        CLOCK_50 : in std_logic;
        KEY : in std_logic_vector(3 downto 0);
        SW : in std_logic_vector(17 downto 0);
        GPIO : inout std_logic_vector(35 downto 0);
        LEDR : out std_logic_vector(17 downto 0)
    );
end entity lyskryss;

architecture RTL of lyskryss is
    component Enable_gen Is
        Port ( clock_50 : in std_logic;
                 resetn : in std_logic;
                 velg_enable:in std_logic_vector(2 downto 0);
                 Enable: out std_logic);
        End component Enable_gen;
        component O1_Reset_Synchronizer is
            port(
            clk : in std_logic;
            areset_n : in std_logic;
            reset_clk : out std_logic
            );
            end component O1_Reset_Synchronizer;
        signal enable_signal : std_logic;
        signal enable_hallo : std_logic;
        signal hallo_count : std_logic;
        signal resetn : std_logic;
        signal hallo : std_logic;
        type tilstand_type is (fase1, fase2, fase3, fase4, fase5, fase6);
        signal tilstand : tilstand_type := fase1;
        signal utsignal : std_logic_vector(5 downto 0);
        --signal tid : integer range 0 to 45 := 0;
        type rom_type is array (tilstand_type) of std_logic_vector(5 downto 0);
constant rom_values : rom_type := (
    fase1 => "000001",  -- Verdier for hver tilstand
    fase2 => "000010",
    fase3 => "000100",
    fase4 => "001000",
    fase5 => "010000",
    fase6 => "100000"
);
type tid_tabell is array(0 to 5) of integer range 0 to 127;
constant fase_tid: tid_tabell:= (30,5,3,40,5,3);
begin

    reset_sync : O1_Reset_Synchronizer
    port map (
        clk => CLOCK_50,
        areset_n => KEY(3),
        reset_clk => resetn
  );

    LEDR(17) <= hallo;
    enable_gen_inst : Enable_gen
      port map (
        clock_50 => CLOCK_50,
        resetn => resetn,
        velg_enable => SW(2 downto 0), -- 000 for trinn 1
        Enable => enable_signal
    );

    enable_gen_inst2 : Enable_gen
      port map (
        clock_50 => CLOCK_50,
        resetn => resetn,
        velg_enable => "001", -- 000 for trinn 1
        Enable => enable_hallo
    );

    process(CLOCK_50)
    begin
        
        if rising_edge(CLOCK_50) then
           if resetn = '0' then
              hallo <= '0';
            elsif enable_hallo = '1' then
                hallo_count <= not hallo_count;
                if hallo_count = '1' then
                    hallo <= not hallo;
                end if;
            end if;
        end if;
    end process;

    p_tilstandsmasking : process(clock_50) is
        variable tid : integer := 0; -- Declare a variable
    begin

        

        if rising_edge(clock_50) then
            if resetn = '0' then
                tilstand <= fase1;
            else
                if enable_signal = '1' then
                    tid := tid+1;
                case tilstand is
                    when fase1 =>

                        if tid = fase_tid(0) then
                            tid := 0;
                        tilstand <= fase2;
                        end if;
                    when fase2 =>
                        if tid = fase_tid(1) then
                            tid := 0;
                        tilstand <= fase3;
                    end if;
                    when fase3 =>
                        if tid = fase_tid(2) then
                            tid := 0;
                        tilstand <= fase4;
                    end if;
                    when fase4 =>
                        if tid = fase_tid(3) then
                            tid := 0;
                        tilstand <= fase5;
                    end if;
                    when fase5 =>
                        if tid = fase_tid(4) then
                            tid := 0;
                        tilstand <= fase6;
                    end if;
                    when fase6 =>
                        if tid = fase_tid(5) then
                            tid := 0;
                        tilstand <= fase1;
                    end if;
                end case;
            end if;
            end if;
            end if;
        end process;


    
        process(tilstand) is
        begin
            -- Hent verdien fra ROM basert på tilstanden
            utsignal <= rom_values(tilstand);
        end process;

    --     p_passering : process(tilstand) is
    --     begin
    --     case tilstand is
    --     when fase1 =>
    --         utsignal <= "000001";
    --     when fase2 =>
    --          utsignal <= "000010";
    --     when fase3 =>
    --         utsignal <= "000100";
    --     when fase4 =>
    --         utsignal <= "001000";
    --     when fase5 =>
    --         utsignal <= "010000";
    --     when fase6 =>
    --         utsignal <= "100000";
    -- end case;
    -- end process p_passering;
    
        LEDR(5 downto 0) <= utsignal;
        GPIO(5 downto 0) <= utsignal;
        LEDR(16 downto 13) <= GPIO(35 downto 32);
    end architecture RTL;
    
