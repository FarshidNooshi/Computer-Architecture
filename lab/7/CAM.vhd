library ieee;
use ieee.all;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;   
--use ieee.numeric_std.all; 
--D = 8bit so C = 3bit        W = 4bit
entity cam_code is
	generic(
	CONSTANT  w : integer := 4 ;
	CONSTANT  d : integer := 8 ;
	CONSTANT  c : integer := 3 

	);
	port (
		wr, rd : in std_logic ;
		clk : in std_logic ;
		reset : in std_logic ;
		data : in std_logic_vector(w-1 downto 0);
		match : out std_logic
	);
end entity cam_code;

architecture arch of cam_code is
type cam is array (0 to (d-1)) of std_logic_vector(0 to w);
signal mem_1 : cam := ("00000", "00000","00000","00000","00000","00000","00000","00000");

begin

	CMB : process(clk, reset)
	
		variable temporary : std_logic := '0';
		variable item : std_logic_vector(0 to w);
		
	begin
		item := (data & '1');
		temporary := '0';
		 if (reset = '0') then
		
			for i in 0 to (d-1) loop
	 
				mem_1(i) <= std_logic_vector(to_unsigned(0, mem_1(i)'length));
			end loop;
		  
			match <= '0';
		elsif (rising_edge(clk)) then
			if (wr = '1') then
				for i in 0 to (d - 1) loop 
						if (mem_1(i) = item) then
							temporary := '1';
						end if;
				end loop;
				match <= temporary;
				if (temporary = '0') then 
					a1: for i in 0 to (d - 1) loop
						exit a1 when temporary = '1';
						if (mem_1(i)(w) = '0') then
								mem_1(i) <= item;
								temporary := '1';
						end if;
					end loop;
				end if;
			elsif (rd = '1') then
				match <= '0';
				for i in 0 to (d - 1) loop 
			 			if (mem_1(i) = item) then
							match <= '1';
						end if;
				end loop;
			end if;
		end if;
		
	end process;
	
end architecture arch;