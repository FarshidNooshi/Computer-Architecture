library ieee;
use ieee.std_logic_1164.all;
entity ArrayMultiplier4bit is
	port (
		a , b   : in std_logic_vector(3 downto 0);
		product : out std_logic_vector(7 downto 0)
	);
end entity ArrayMultiplier4bit;


architecture arch of ArrayMultiplier4bit is

	component ripple_adder_4bit is
		port (
		a , b   : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		sum : out std_logic_vector(3 downto 0);
		cout : out std_logic
	);
	end component ripple_adder_4bit;

	signal b0AndA, b1andA, b2AndA, b3AndA : std_logic_vector(3 downto 0);
	signal s0, s1, s2, s3, cout2 : std_logic_vector(3 downto 0);
begin
	b0AndA <= (b(0) & b(0) & b(0) & b(0)) and a;
	b1AndA <= (b(1) & b(1) & b(1) & b(1)) and a;
	b2AndA <= (b(2) & b(2) & b(2) & b(2)) and a;
	b3AndA <= (b(3) & b(3) & b(3) & b(3)) and a;

	product(0) <= b0AndA(0);
	instance1: ripple_adder_4bit port map (
		a => ('0' & b0AndA(3 downto 1)) , b => b1AndA , cin => '0', sum => s0, cout => cout2(0)
	);
	product(1) <= s0(0);
	instance2: ripple_adder_4bit port map (
		a => (cout2(0) & s0(3 downto 1)) , b => b2AndA , cin => '0', sum => s1, cout => cout2(1)
	);
	product(2) <= s1(0);
	instance3: ripple_adder_4bit port map (
		a => (cout2(1) & s1(3 downto 1)) , b => b3AndA , cin => '0', sum => s2, cout => cout2(2)
	);
	product(7 downto 3) <= cout2(2) & s2;
end architecture arch;
