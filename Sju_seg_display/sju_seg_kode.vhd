library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sju_seg_kode is
    port(
        c : in std_logic_vector(2 downto 0);
        sju_seg_kode : out std_logic_vector(6 downto 0)
    );
end entity sju_seg_kode;

architecture behav of sju_seg_kode is
    
begin
    with c select
    sju_seg_kode <= "0001001" when "000", -- H
    "0001000" when "001",
    "1110001" when "010",
    "1110001" when "011",
    "1000000" when "100",
    "1111111" when others;

    

end architecture behav;
