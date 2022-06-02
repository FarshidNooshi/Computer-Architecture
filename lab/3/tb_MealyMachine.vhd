library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity tb_MealyMachine is 

end entity tb_MealyMachine;


architecture arch3 of tb_MealyMachine is 
signal i0, o0 : std_logic;
signal clk : std_logic := '0';
begin
DUT: entity work.MealyMachine port map (i0 => i0 ,clk => clk, o0 => o0);
	i0 <= '0', '1' after 40ns, '1' after 140ns, '0' after 240ns, '1' after 340ns;

	clk <= not(clk) after 50ns;

end architecture arch3;
