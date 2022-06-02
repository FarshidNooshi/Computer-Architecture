library ieee;
use ieee.std_logic_1164.all;

entity  tb_carry_select_adder_4bit is
	
end entity tb_carry_select_adder_4bit;


architecture tb_arch of tb_carry_select_adder_4bit is
signal a , b , sum , cout :  std_logic_vector(3 downto 0);
signal cin : std_logic;
begin
	DUT: entity work.carry_select_adder_4bit port map (
		a => a , b => b , sum => sum , cout => cout , cin => cin
	);
	cin <= '0' , '1' after 50 ns;
	a <= "0001" , "0110" after 10 ns ;
	b <= "1000" , "0001" after 20 ns ;
end architecture tb_arch;