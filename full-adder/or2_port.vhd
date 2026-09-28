library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity o2_port is
    port(
        x: in std_logic;
        y : in std_logic;
        z : out std_logic;
    );
    end entity or2_port;

    architecture RTL of or2_port is

    begin
    < <= x or y;
    end architecture RTL;