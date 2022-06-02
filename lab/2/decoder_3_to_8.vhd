library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity decoder_3_to_8 is
port(
		i0, i1, i2: in std_logic;
		s0, s1, s2, s3, s4, s5, s6, s7 : out std_logic
	);
end entity decoder_3_to_8;


architecture arch of decoder_3_to_8 is

signal mid_enable : std_logic;

component decoder2_to_4 is
	port(
		i0, i1, enable : in std_logic;
		s0, s1, s2, s3 : out std_logic
	);

end component decoder2_to_4;
begin
	mid_enable <= not(i2);
	instance0: decoder2_to_4 port map(i0 => i0, i1 => i1, enable => mid_enable, s0 => s0, s1 => s1, s2 => s2, s3 => s3);
	instance1: decoder2_to_4 port map(i0 => i0, i1 => i1, enable => i2, s0 => s4, s1 => s5, s2 => s6, s3 => s7);
end architecture arch; 
