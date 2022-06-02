library ieee;
use ieee.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   
--use ieee.numeric_std.all; 
--D = 8bit so C = 3bit        W = 4bit




entity ram_dual_channel is
	generic(
		CONSTANT  w : integer := 4 ;
		CONSTANT  d : integer := 8 ;
		CONSTANT  c : integer := 3 

	);
	port (
		wr, rd : in std_logic ;
		clk : in std_logic ;
		reset : in std_logic ;
		addr : in std_logic_vector(c-1 downto 0);
		write_data : in std_logic_vector(w-1 downto 0);
		read_data : out std_logic_vector(w-1 downto 0)
		--w : in std_logic_vector()
	);
end entity ram_dual_channel;

architecture arch of ram_dual_channel is
type ram is array (0 to (d-1)) of std_logic_vector(w-1 downto 0);
signal mem_1 : ram;
begin
	CMB : process(clk, reset)
	begin
		if (reset = '0') then
		
            for i in 0 to (d-1) loop
            
                mem_1(i) <= std_logic_vector(to_unsigned(i, mem_1(i)'length));
            end loop;
		elsif (rising_edge(clk)) then
			if (wr = '1') then
				mem_1(to_integer(unsigned(addr))) <= write_data;
			elsif (rd = '1') then
				read_data <= mem_1(to_integer(unsigned(addr)));
			end if;
		end if;
		--if(not(read_data = write_data)) then
		--	write_data <= read_data;
		--end if;
	end process;
	
end architecture arch;