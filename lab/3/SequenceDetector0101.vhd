library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity SequenceDetector0101 is
port(
		i0, clk: in std_logic;
		o0: out std_logic_vector(0 to 1)
	);
end entity SequenceDetector0101;


architecture arch of SequenceDetector0101 is
	component DFF is
		port(
		  q : out std_logic;    
		  clk :in std_logic;  
	   sync_reset: in std_logic;  
		  d :in  std_logic    
	   );
	end component DFF;
	signal vector: std_logic_vector(3 downto 0) := "0000";
	signal constant0: std_logic := '0';
begin
	
	
	instance1 : DFF port map(d => i0, clk => clk, sync_reset => constant0, q => vector(0));
	instance2 : DFF port map(d => vector(0), clk => clk, sync_reset => constant0, q => vector(1));
	instance3 : DFF port map(d => vector(1), clk => clk, sync_reset => constant0, q => vector(2));
	instance4 : DFF port map(d => vector(2), clk => clk, sync_reset => constant0, q => vector(3));
	
	o0(0) <= '1' when vector = "0101" else '0';
	o0(1) <= '1' when vector = "0110" else '0';
end architecture arch; 
