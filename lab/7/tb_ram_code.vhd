library ieee;
use ieee.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   


entity tb_ram_code is
end tb_ram_code;

architecture arch of tb_ram_code is

signal clk, wr, rd : std_logic := '0';
signal reset : std_logic ;
signal addr : std_logic_vector(2 downto 0);
signal data : std_logic_vector(3 downto 0); 

begin
    DUT: entity work.ram_code port map(clk => clk , wr => wr, rd => rd, addr => addr, data => data, reset => reset);
    clk <= not clk after 5ns;	
	--  process
	
	--	begin
	--	wait for 100 ns;
		--  data <= "1111";
		  	 
		  addr <= "101", "001" after 200 ns;
	rd <= '0', '1' after 100 ns;
		wr <= '1', '0' after 90 ns;
		reset <= '0' , '1' after 10 ns, '0' after 95 ns, '1' after 105 ns;
		
--	end process;
	

end arch ; -- arch