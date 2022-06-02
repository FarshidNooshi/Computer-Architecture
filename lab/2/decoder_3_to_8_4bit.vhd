library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity decoder_3_to_8_4bit is
port(
		i0, i1, i2: in std_logic_vector(3 downto 0);
		s0, s1, s2, s3, s4, s5, s6, s7 : out std_logic_vector(3 downto 0)
	);
end entity decoder_3_to_8_4bit;


architecture arch of decoder_3_to_8_4bit is

component decoder_3_to_8 is
port(
		i0, i1, i2: in std_logic;
		s0, s1, s2, s3, s4, s5, s6, s7 : out std_logic
	);
end component decoder_3_to_8;
begin
instance1: decoder_3_to_8 port map(i0 => i0(0) , i1 => i1(0), i2 => i2(0), s0 => s0(0), s1 => s1(0), s2 => s2(0), s3 => s3(0), s4 => s4(0), s5 => s5(0), s6 => s6(0), s7 => s7(0));
instance2: decoder_3_to_8 port map(i0 => i0(1) , i1 => i1(1), i2 => i2(1), s0 => s0(1), s1 => s1(1), s2 => s2(1), s3 => s3(1), s4 => s4(1), s5 => s5(1), s6 => s6(1), s7 => s7(1));
instance3: decoder_3_to_8 port map(i0 => i1(2) , i1 => i1(2), i2 => i2(2), s0 => s0(2), s1 => s1(2), s2 => s2(2), s3 => s3(2), s4 => s4(2), s5 => s5(2), s6 => s6(2), s7 => s7(2));
instance4: decoder_3_to_8 port map(i0 => i2(3) , i1 => i1(3), i2 => i2(3), s0 => s0(3), s1 => s1(3), s2 => s2(3), s3 => s3(3), s4 => s4(3), s5 => s5(3), s6 => s6(3), s7 => s7(3));

end architecture arch; 
