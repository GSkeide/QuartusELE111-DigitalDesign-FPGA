library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity O3_antiprell is
    port (
        clk        : in std_logic;
        reset_clk  : in std_logic;
        input      : in std_logic;
        passering   : out std_logic
    );
end entity O3_antiprell;

architecture RTL of O3_antiprell is
    -- deklarer tilstander
    type tilstand_type is (start, vent, funnet_1, ligger_hoegt, til_null);
    signal tilstand : tilstand_type;
    signal count : integer range 0 to 1000;
    
begin
    -- process for tilstandsmaskin
    p_tilstandsmaskin : process(clk) is
    -- fyll ut
    begin
        if rising_edge(clk) then
             if reset_clk = '1' then
                 tilstand <= start;
                 count <= 0;
             elsif reset_clk = '0' then
        case tilstand is
            when start =>
                tilstand <= vent;
                count <= 0;

            when vent =>
                if input = '1' then
                    tilstand <= Funnet_1;
                elsif input = '0' then
                    tilstand <= vent;
                end if;
                count <= 0;

            when funnet_1 =>

                if input = '1' then
                    if count = 1000 then
                    tilstand <= Ligger_hoegt;
                    count <= 0;
                    elsif count < 1000 then
                        count <= count + 1;
                        tilstand <= funnet_1;
                    end if; 
                elsif input = '0' then
                    tilstand <= vent;
                    count <= 0;
                end if;
                

            when ligger_hoegt =>
                if input = '1' then
                    tilstand <= Ligger_hoegt;
                elsif input = '0' then
                    tilstand <= Til_null;
                end if;
                count <= 0;
                
            when til_null =>
                if input = '1' then
                    tilstand <= Ligger_hoegt;
                    count <= 0;
                elsif input = '0' then
                   
                    if count = 1000 then
                    tilstand <= vent;
                    count <= 0;
                    elsif count < 1000 then
                        count <= count + 1;
                        tilstand <= til_null;
                    end if;
                end if;
                
        end case;
    end if;
    end if;
    end process p_tilstandsmaskin;

    -- process for å sette utsignal
    p_passering : process(tilstand) is
    begin
    -- fyll ut

    case tilstand is
        when start =>
            passering <= '0';
        when vent =>
            passering <= '0';
        when funnet_1 =>
            passering <= '0';
        when ligger_hoegt =>
            passering <= '1';
        when til_null =>
            passering <= '1';
    end case;
    end process p_passering;

end architecture RTL;
