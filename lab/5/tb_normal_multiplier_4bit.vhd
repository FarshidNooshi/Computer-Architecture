library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity 	tb_normal_multiplier_4bit is 

end entity tb_normal_multiplier_4bit;

architecture arch of tb_normal_multiplier_4bit is
signal a, b : std_logic_vector(3 downto 0);
signal sum : std_logic_vector(7 downto 0);
begin
a <= "1010";
b <= "1001";
DUT: entity work.normal_multiplier_4bit port map(
	a => a , b => b , sum => sum
);

end architecture arch;
