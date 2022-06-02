library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_alu is	
	
end entity tb_alu;	


architecture arch of tb_alu is

	signal a, b :  std_logic_vector(7 downto 0);
	signal	opcode :  std_logic_vector(2 downto 0);
	signal	result :  std_logic_vector(7 downto 0);

begin
DUT:  entity work.alu port map (
	a => a , b => b, opcode => opcode, result => result
);
a <= "01100001";
b <= "00100001";
opcode <= "000", "001" after 5 ns,"010" after 10 ns, "011" after 15 ns , "100" after 20 ns;
end architecture ; -- arch