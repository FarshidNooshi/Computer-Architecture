
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity 	encoder4_to_2 is
port(
	i0 , i1, i2, i3 : in  std_logic;
	s0, s1 : out std_logic
);
end entity encoder4_to_2;

architecture arch of encoder4_to_2 is
begin
	s0 <= i1 or i3;
	s1 <= i2 or i3;
end architecture arch;
 