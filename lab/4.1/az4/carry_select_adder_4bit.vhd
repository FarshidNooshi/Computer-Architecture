library ieee;
use ieee.std_logic_1164.all;

entity carry_select_adder_4bit is
	port (
		a , b : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		cout , sum : buffer std_logic_vector(3 downto 0) 
	);
end entity carry_select_adder_4bit;

architecture arch of carry_select_adder_4bit is
	component full_adder is
	port(
		a , b, cin : in std_logic;
		sum : out std_logic;
		cout : buffer std_logic
	);
	end component full_adder;
	signal all_sums ,  all_couts : std_logic_vector(7 downto 0);
begin
	instance40: full_adder port map (
		a => a(0) , b => b(0) , cin => '0' , sum => all_sums(0), cout => all_couts(0) 
	);
	instance41: full_adder port map (
		a => a(0) , b => b(0) , cin => '1' , sum => all_sums(1), cout => all_couts(1) 
	);
---------------------------------------------------------------------------------
	instance00: full_adder port map (
		a => a(1) , b => b(1) , cin => '0' , sum => all_sums(2), cout => all_couts(2) 
	);
	instance01: full_adder port map (
		a => a(1) , b => b(1) , cin => '1' , sum => all_sums(3), cout => all_couts(3) 
	);
---------------------------------------------------------------------------------
	instance20: full_adder port map (
		a => a(2) , b => b(2) , cin => '0' , sum => all_sums(4), cout => all_couts(4) 
	);
	instance21: full_adder port map (
		a => a(2) , b => b(2) , cin => '1' , sum => all_sums(5), cout => all_couts(5) 
	);
----------------------------------------------------------------------------------
	instance30: full_adder port map (
		a => a(3) , b => b(3) , cin => '0' , sum => all_sums(6), cout => all_couts(6) 
	);
	instance31: full_adder port map (
		a => a(3) , b => b(3) , cin => '1' , sum => all_sums(7), cout => all_couts(7) 
	); 
-----------------------------------------------------------------------------using gate level mux
	cout(0) <= ( (not cin ) and	all_couts(0)) or ( cin and all_couts(1) );
	sum(0) <= ( (not cin ) and	all_sums(0)) or ( cin and all_sums(1) );
	------------------------------------------------------------------------------
	cout(1) <= ( (not cout(0) ) and	all_couts(2)) or ( cout(0) and all_couts(3) );
	sum(1) <= ( (not cout(0) ) and	all_sums(2)) or ( cout(0) and all_sums(3) );
	------------------------------------------------------------------------------
	cout(2) <= ( (not cout(1) ) and	all_couts(4)) or ( cout(1) and all_couts(5) );
	sum(2) <= ( (not cout(1) ) and	all_sums(4)) or ( cout(1) and all_sums(5) );
	------------------------------------------------------------------------------
	cout(3) <= ( (not cout(2) ) and	all_couts(6)) or ( cout(2) and all_couts(7) );
	sum(3) <= ( (not cout(2) ) and	all_sums(6)) or ( cout(2) and all_sums(7) );
	
end architecture arch;







