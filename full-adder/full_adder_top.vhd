library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder_top is
port(
a : in std_logic;
b : in std_logic;
carry_in : in std_logic;
sum : out std_logic;
carry_out : out std_logic;
);

end entity full_adder_top;

architecture struct of full_adder_top is 


   component half_adder is
   port(
       a : in std_logic;
       b : in std_logic;
       sum : out std_logic;
       carry_out : out std_logic;
   );
   end component half_adder;
	
	component o2_port is
    port(
        x : in std_logic;
        y : in std_logic;
        z : out std_logic;
    );
    end component or2_port;

	  signal sum1 : std_logic;
	  signal carry1 : std_logic;
	  signal carry2 : std_logic;
begin

   c_half_adder_1 : half_adder
	    port map(
		 a => a,
		 b => b,
		 sum => sum1,
		 carry_out => carry1,
		 );
		 
   c_half_adder_2 : half_adder
	    port map(
		 a => sum1,
		 b => carry_in,
		 sum => sum,
		 carry_out => carry2,
		 );
		 
   c_or2_port : half_adder
	    port map(
		 x => carry1,
		 y => carry2,
		 z => carry_out,
		 );

end architecture struct;