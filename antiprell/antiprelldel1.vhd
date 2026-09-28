library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity antiprell is
    port(
        clk : in std_logic;
        reset_clk : in std_logic;
        input : in std_logic;
        passering : out std_logic
    );
end entity antiprell;

architecture RTL of antiprell is
    type tilstand_type is (start, vent, funnet_1, ligger_hoegt, til_null);
    signal tilstand : tilstand_type;
begin
    p_tilstandmaskin : process(clk) is

    begin
        if rising_edge(clk) then
            if reset_clk = '0' then
                tilstand <= start;

        case tilstand is
            when start =>
                tilstand <= vent;
            when vent =>
                if input = '1' then
                    tilstand <= funnet_1;
                else
                    tilstand <= vent;
                end if;
            when funnet_1 =>
                if input = '1' then
                    tilstand <= ligger_hoegt;
                else
                    tilstand <= vent;
                end if;
            when ligger_hoegt =>
                if input = '1' then
                    tilstand <= ligger_hoegt;
                else 
                    tilstand <= til_null;
                end if;
            when til_null =>
                if input = '1' then
                    tilstand <= ligger_hoegt;
                else
                    tilstand <= vent;
                end if;
        end case;
    end if;
end if;
end process;

p_passering : process(tilstand) is
begin
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
