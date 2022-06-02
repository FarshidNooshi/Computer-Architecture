library ieee;
use ieee.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   


entity tb_cam_code is
end tb_cam_code;

architecture arch of tb_cam_code is

signal clk, wr, rd : std_logic := '0';
signal reset : std_logic := '0';
signal data : std_logic_vector(3 downto 0) := "1110"; 
signal match : std_logic;

begin
    DUT: entity work.cam_code port map
	 (clk => clk , wr => wr, rd => rd, match => match, data => data, reset => reset);
    clk <= not clk after 5ns;
	 reset <= '0', '1' after 50 ns;
	 data <= "0010" after 300 ns, "1010" after 400 ns;
    rd <= '1', '0' after 100 ns, '1' after 450 ns;
    wr <= '0', '1' after 200 ns, '0' after 450 ns;

end arch ; 