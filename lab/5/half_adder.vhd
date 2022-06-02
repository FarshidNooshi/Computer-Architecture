library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
  port (
	in0, in1 : in std_logic;
	sum, cout : out std_logic
  ) ;
end entity ; -- half_adder

architecture gate_level of half_adder is

begin
	cout <= in0 and in1;
	sum <= in0 xor in1;
end architecture gate_level;