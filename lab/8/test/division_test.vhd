library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_division is
  
end entity ;

architecture test of tb_division is

	signal clk : std_logic := '1';
	signal b : std_logic_vector(3 downto 0):= "0011";
	signal a_q  : std_logic_vector(7 downto 0);
	signal o : std_logic;
begin
DUT2 : entity work.division port map (
	clk => clk, b => b, a_q => a_q, o => o
);
clk <= not clk after 5 ns;
end architecture ; -- test 