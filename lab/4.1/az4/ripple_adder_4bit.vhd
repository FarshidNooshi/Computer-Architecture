library ieee;
use ieee.std_logic_1164.all;
entity ripple_adder_4bit is
	port (
		a , b   : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		sum : out std_logic_vector(3 downto 0);
		cout : buffer std_logic_vector(3 downto 0)
	);
end entity ripple_adder_4bit;


architecture arch of ripple_adder_4bit is

	component full_adder is
		port(
			a , b, cin : in std_logic;
			sum : out std_logic;
			cout : buffer std_logic
		);
	end component full_adder;

begin
	instance1: full_adder port map (
		a => a(0) , b => b(0) , cin => cin 	   , sum => sum(0) , cout => cout(0)
	);

	instance2: full_adder port map (
		a => a(1) , b => b(1) , cin => cout(0) , sum => sum(1) , cout => cout(1)	
	);
	
	instance3: full_adder port map (
		a => a(2) , b => b(2) , cin => cout(1) , sum => sum(2) , cout => cout(2)
	);
	instance4: full_adder port map (
		a => a(3) , b => b(3) , cin => cout(2) , sum => sum(3) , cout => cout(3)
	);
	
end architecture arch;
