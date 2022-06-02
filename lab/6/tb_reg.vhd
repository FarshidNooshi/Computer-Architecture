library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_reg is
end entity tb_reg;

architecture arch of tb_reg is 

	signal parallel_in : std_logic_vector(3 downto 0);
	signal l_r : std_logic_vector(1 downto 0);
	signal load ,  reset, clk: std_logic := '1';
	signal reg_out : std_logic_vector(3 downto 0);

begin
DUT: entity work.reg port map (parallel_in=>parallel_in , l_r=>l_r , load=>load, 
											reg_out => reg_out , clk => clk , reset => reset);
											
		clk <= not clk after 5ns;
		parallel_in <= "1111";
		load <= '0' after 25 ns;
		reset <= '0' after 100 ns;
		l_r <= "11", "10" after 35 ns, "01" after 55 ns, "00" after 75 ns;
end architecture arch;