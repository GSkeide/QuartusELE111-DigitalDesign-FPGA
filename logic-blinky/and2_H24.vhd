LIBRARY ieee;
USE ieee.std_logic_1164.all;
 
 
 ENTITY and2_H24 IS
    PORT(
        SW: in std_logic_vector(2 downto 0);
        LEDR :OUT std_logic_vector(0 downto 0));     
END and2_H24;
    
Architecture behavior OF and2_H24 IS
SIGNAL  x,y,z,lys : std_logic ;
begin
	x <= SW(0);
	y <= SW(1);
	z <= sw(2);
	LEDR(0) <= lys;
     lys <= (x and y) or z;
END;