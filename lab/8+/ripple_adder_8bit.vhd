library ieee;
use ieee.std_logic_1164.all;
entity ripple_adder_8bit is
	port (
		a , b   : in std_logic_vector(7 downto 0);
		cin : in std_logic;
		sum : out std_logic_vector(7 downto 0);
		cout : buffer std_logic_vector(7 downto 0)
	);
end entity ripple_adder_8bit;


architecture arch of ripple_adder_8bit is

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
	-----------------------------------------------------------------------------
	instance5: full_adder port map (
		a => a(4) , b => b(4) , cin => cout(3) , sum => sum(4) , cout => cout(4)
	);
	instance6: full_adder port map (
		a => a(5) , b => b(5) , cin => cout(4) , sum => sum(5) , cout => cout(5)
	);
	instance7: full_adder port map (
		a => a(6) , b => b(6) , cin => cout(5) , sum => sum(6) , cout => cout(6)
	);
	instance8: full_adder port map (
		a => a(7) , b => b(7) , cin => cout(6) , sum => sum(7) , cout => cout(7)
	);
end architecture arch;
