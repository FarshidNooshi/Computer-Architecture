library ieee;
use ieee.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   
--use ieee.numeric_std.all; 
--D = 8bit so C = 3bit        W = 4bit
entity rom_code is
	generic(
	CONSTANT  w : integer := 4 ;
	CONSTANT  d : integer := 8 ;
	CONSTANT  c : integer := 3 

	);
	port (
		rd : in std_logic;
		clk : in std_logic ;
		reset : in std_logic ;
		addr : in std_logic_vector(c-1 downto 0);
		data : out std_logic_vector(w-1 downto 0)
	);
end entity rom_code;

architecture arch of rom_code is
type rom is array (0 to (d-1)) of std_logic_vector(w-1 downto 0);
signal mem_1 : rom;

begin
	
	CMB : process(clk, reset)

	begin
		for i in 0 to (d-1) loop
 
			mem_1(i) <= std_logic_vector(to_unsigned(i, mem_1(i)'length));
        end loop;
	
		 if (reset = '0') then
		
			data <= "0000";
		
		elsif (rising_edge(clk)) then
				if(rd = '1') then
					data <= mem_1(to_integer(unsigned(addr)));
				end if;
		end if;
		
	end process;
	
end architecture arch;