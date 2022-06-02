
library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity tb_tff is
end entity tb_tff;


architecture arch of tb_tff is

    	signal reset , t   : std_logic;
	signal clk : std_logic := '1';
	signal q : std_logic := '1';

begin
    DUT: entity work.TFF port map(q => q , clk => clk , reset => reset , t=>t);
    clk <= not clk after 5 ns;
    t <= '1' , '0' after 10 ns , '1' after 20 ns;
    reset <= '0' , '1' after 30 ns; 
end arch ; -- arch