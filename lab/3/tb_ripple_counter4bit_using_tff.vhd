
library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity tb_ripple_counter4bit_using_tff is
end entity tb_ripple_counter4bit_using_tff;

architecture arch of tb_ripple_counter4bit_using_tff is

    signal  const1  , reset : std_logic;    
    signal digits :  std_logic_vector(3 downto 0);
	signal clk : std_logic := '1';
begin
const1 <= '1';
DUT: entity work.ripple_counter4bit_using_tff port map(reset => reset ,clk=>clk , 
	 input_const_1=>const1 , digits => digits);
clk <= not clk after 5 ns;
reset <= '0' , '1' after 200 ns;
end arch ;         