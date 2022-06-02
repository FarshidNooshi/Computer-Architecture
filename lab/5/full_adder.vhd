
library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
  port (
	in0, in1 , cin: in std_logic;
	sum, cout : out std_logic
  ) ;
end entity ; -- half_adder

architecture gate_level of full_adder is

begin
	cout <= (in0 and in1) or  (cin and in1) or (in0 and cin) ;
	sum <= in0 xor in1 xor cin;
end architecture gate_level;