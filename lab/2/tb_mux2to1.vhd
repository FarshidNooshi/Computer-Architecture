library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_mux2to1 is
end entity tb_mux2to1;

architecture arch of tb_mux2to1 is
 signal i0 , i1 , sel , output : std_logic;
begin
	DUT: entity work.mux_2_to_1 port map(i0 => i0 , i1 => i1 , sel => sel , output => output);
	sel <= '0' , '1' after 200 ns;
	i0 <= '0'  , '1' after 50 ns , '0' after 150 ns;
	i1 <= '0' , '1' after 100 ns;
end architecture arch;
