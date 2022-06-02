library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_dff is
end tb_dff;


architecture arch of tb_dff is

    signal d , sync_reset , q : std_logic;
    signal clk : std_logic := '1';

begin
    DUT: entity work.DFF port map(d=>d , clk => clk , sync_reset => sync_reset , q=>q);
    d <= '0' , '1' after 5 ns ;
    sync_reset <= '0' , '1' after 10  ns;
	clk <= not clk after 5 ns;
end arch ; -- arch