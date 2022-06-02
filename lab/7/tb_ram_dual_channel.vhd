library ieee;
use ieee.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   


entity tb_ram_dual_channel is
end tb_ram_dual_channel;

architecture arch of tb_ram_dual_channel is

signal clk, wr, rd : std_logic := '0';
signal reset : std_logic := '0';
signal addr : std_logic_vector(2 downto 0);
signal read_data, write_data : std_logic_vector(3 downto 0) := "1001"; 

begin
    DUT: entity work.ram_dual_channel port map(clk => clk , wr => wr, rd => rd, addr => addr, read_data => read_data,
        write_data => write_data, reset => reset);
    clk <= not clk after 5ns;
    addr <= "101", "001" after 70 ns;
	 reset <= '1' after 10 ns, '0' after 50 ns, '1' after 80 ns;
	 write_data <= "0101" after 50 ns;
    rd <= '1', '0' after 100 ns;
    wr <= '0', '1' after 200 ns;

end arch ; -- arch