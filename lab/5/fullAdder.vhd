library ieee;
use ieee.std_logic_1164.all;
entity full_adder is
	port (
		a , b , cin  : in std_logic;
		sum : out std_logic;
		cout: buffer std_logic
	);
end entity full_adder;

------------------------------------------------------------------------------------------
architecture boolean of full_adder is
begin
	sum <= a xor b xor cin;
	cout <= ( a and b) or (a and cin) or (b and cin);
end architecture boolean;
