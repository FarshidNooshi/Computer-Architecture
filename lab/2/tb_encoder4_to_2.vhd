library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity 	tb_encoder4_to_2 is
end entity tb_encoder4_to_2;

architecture arch of tb_encoder4_to_2 is
signal s0 , s1, i0 ,i1 ,i2 ,i3 : std_logic;
begin
	DUT: entity work.encoder4_to_2 port map(s0=>s0, s1=>s1, i0=>i0, i1=>i1, i2=>i2, i3=>i3);
	
	i0 <= '1' , '1' after 50 ns , '0' after 100 ns;
	i1 <= '0' , '1' after 100 ns, '0' after 150 ns;
	i2 <= '0' , '1' after 150 ns, '0' after 200 ns;
	i3 <= '0' , '1' after 200 ns;
	
end architecture arch;

