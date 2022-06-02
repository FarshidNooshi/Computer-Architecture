library ieee;
use ieee.std_logic_1164.all;

entity carry_look_ahead_adder_4bit is
	port (
		a , b : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		sum   : out std_logic_vector(3 downto 0);
		carry : buffer std_logic_vector(3 downto 0)
	);
end entity carry_look_ahead_adder_4bit;


architecture arch of carry_look_ahead_adder_4bit is
	component full_adder is
		port (
		a , b , cin  : in std_logic;
		sum : out std_logic;
		cout: buffer std_logic
	);
	end component full_adder;
	signal p , g , demo: std_logic_vector(3 downto 0);
begin
	g(0) <= a(0) and b(0);  p(0) <= a(0) or b(0);
	g(1) <= a(1) and b(1);	p(1) <= a(1) or b(1);
	g(2) <= a(2) and b(2);	p(2) <= a(2) or b(2);
	g(3) <= a(3) and b(3);	p(3) <= a(3) or b(3);

	--carry(0) <= g(0) or (cin and p(0));
	--carry(1) <= g(1) or (g(0) and p(1)) or (cin and p(0) and p(1));
	--carry(2) <= g(1) or (g(0) and p(1)) or (cin and p(0) and p(1));
	--carry(3) <= g(2) or (g(1) and p(2))  or (g(0) and p(1) and p(2) ) or (cin and p(0) and p(1) and p(2) );
	
	carry(0) <= g(0) or (cin and p(0));
	carry(1) <= g(1) or (g(0) and p(1)) or (cin and p(0) and p(1));
	carry(2) <= g(2) or (g(1) and p(2)) or  ( p(2) and g(0) and p(1) )or (cin and p(0) and p(1) and p(2));
   	carry(3) <= g(3) or (g(2) and p(3)) or (g(1) and p(2) and p(3)) or (g(0) and p(3) and p(2) and p(1)) or (cin and p(3)
   	 and p(2) and p(1) and p(0));
    
    sum(0) <= cin xor a(0) xor b(0);
    sum(1) <= carry(0) xor a(1) xor b(1);
    sum(2) <= carry(1) xor a(2) xor b(2);
    sum(3) <= carry(2) xor a(3) xor b(3);
	--instance1: full_adder port map (
	--	a => a(0) , b => b(0) , cin => cin 	   , sum => sum(0) , cout => demo(0)
	--);

	--instance2: full_adder port map (
	--	a => a(0) , b => b(0) , cin => carry(0) , sum => sum(1) , cout => demo(1)	
	--);
	
	--instance3: full_adder port map (
	--	a => a(0) , b => b(0) , cin => carry(1) , sum => sum(2) , cout => demo(2)
	--);
	--instance4: full_adder port map (
	--	a => a(0) , b => b(0) , cin => carry(2) , sum => sum(3) , cout => carry(3)
	--);
end architecture arch;


