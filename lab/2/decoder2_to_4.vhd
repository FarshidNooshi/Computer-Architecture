
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity decoder2_to_4 is 
	port(
		i0, i1, enable : in std_logic;
		s0, s1, s2, s3 : out std_logic
	);
end entity decoder2_to_4;

architecture arch_decoder of decoder2_to_4 is

begin
	s0 <= (not i0) and (not i1) and enable;
	s1 <= ( i0) and (not i1) and enable;
	s2 <= (not i0) and ( i1) and enable;
	s3 <= ( i0) and ( i1) and enable;
	
end architecture arch_decoder;