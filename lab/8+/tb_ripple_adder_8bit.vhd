library ieee;
use ieee.std_logic_1164.all;

entity tb_ripple_adder_8bit is
	
end entity tb_ripple_adder_8bit;

architecture tb_arch of tb_ripple_adder_8bit is
signal a , b , sum , cout :  std_logic_vector(7 downto 0);
signal cin : std_logic;
begin
	DUT: entity work.ripple_adder_8bit port map (
		a => a , b => b , sum => sum , cout => cout , cin => cin
	);
	cin <= '0' , '1' after 50 ns;
	a <= "00000001" , "00000110" after 10 ns ; 
	b <= "00001000" , "00000101" after 20 ns ; 
end architecture tb_arch; 