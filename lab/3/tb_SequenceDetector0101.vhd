library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity tb_SequenceDetector0101 is 

end entity tb_SequenceDetector0101;


architecture arch3 of tb_SequenceDetector0101 is 
signal i0 : std_logic;
signal clk : std_logic := '0';
signal o0 : std_logic_vector(0 to 1);
begin
DUT: entity work.SequenceDetector0101 port map (i0 => i0 ,clk => clk, o0 => o0);
	i0 <= '0', '1' after 140 ns, '0' after 240 ns, '1' after 340 ns, '1' after 440 ns, '0' after 540 ns;
	clk <= not(clk) after 50 ns;	

end architecture arch3;

