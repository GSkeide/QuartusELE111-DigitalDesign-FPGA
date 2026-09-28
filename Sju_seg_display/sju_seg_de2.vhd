library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sju_seg_de2 is
    port(
        SW : in std_logic_vector(17 downto 0);
        HEX0 : out std_logic_vector(6 downto 0)
    );
end entity sju_seg_de2;

architecture struct of sju_seg_de2 is
        component sju_seg_kode is
    port(
        c : in std_logic_vector(2 downto 0);
        sju_seg_kode : out std_logic_vector(6 downto 0)
    );
    end component sju_seg_kode;
begin
sju_seg_kode_inst : component sju_seg_kode
    port map(
        c            => SW(2 downto 0),
        sju_seg_kode => HEX0(6 donwto 0)
    );

end architecture struct;

