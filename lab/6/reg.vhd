library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;    

entity reg is
	port (
		parallel_in : in std_logic_vector(3 downto 0);
		l_r : in std_logic_vector(1 downto 0);
		load ,  reset, clk: in std_logic;
		reg_out : buffer std_logic_vector(3 downto 0)
	);
end entity reg;

architecture behavioral of reg is


begin
	CMB : process( clk )
	variable v_Count : std_logic := '0';
	
	begin
		if (rising_edge(clk)) then 
			if (reset = '0') then
				reg_out <= "0000";
			elsif load = '1' then
				reg_out <= parallel_in;
			elsif (l_r = "00") then
			
			elsif (l_r = "10") then
				reg_out <= std_logic_vector(shift_left(unsigned(reg_out), 1));
			elsif (l_r = "01") then
				 reg_out <= std_logic_vector(shift_right(signed(reg_out), 1));
			elsif (l_r = "11") then
				reg_out <= std_logic_vector(shift_right(unsigned(reg_out), 1));
			end if;
		end if;

		end process ; -- CMB
		end architecture behavioral;

