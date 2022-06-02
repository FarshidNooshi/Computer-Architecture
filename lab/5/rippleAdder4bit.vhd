library ieee;
use ieee.std_logic_1164.all;
entity ripple_adder_4bit is
	port (
		a , b   : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		sum : out std_logic_vector(3 downto 0);
		cout : out std_logic
	);
end entity ripple_adder_4bit;


architecture arch of ripple_adder_4bit is

	component full_adder is
		port(
			in0, in1 , cin: in std_logic;
			sum, cout : out std_logic
		);
	end component full_adder;
	signal c : std_logic_vector(3 downto 0);
begin
	instance1: full_adder port map (
		in0 => a(0) , in1 => b(0) , cin => cin 	   , sum => sum(0) , cout => c(0)
	);

	instance2: full_adder port map (
		in0 => a(1) , in1 => b(1) , cin => c(0) , sum => sum(1) , cout => c(1)	
	);
	
	instance3: full_adder port map (
		in0 => a(2) , in1 => b(2) , cin => c(1) , sum => sum(2) , cout => c(2)
	);
	instance4: full_adder port map (
		in0 => a(3) , in1 => b(3) , cin => c(2) , sum => sum(3) , cout => c(3)
	);
	
	cout <= c(3);
	
end architecture arch;
