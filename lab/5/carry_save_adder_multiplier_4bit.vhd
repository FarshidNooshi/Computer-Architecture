library ieee;
use ieee.std_logic_1164.all;
--------------------------------------------------------------------------------------
entity carry_save_adder_multiplier_4bit is
  port (
	a, b :in std_logic_vector(3 downto 0);
	sum : out std_logic_vector(7 downto 0)
  ) ;
end entity ; -- carry_save_adder_multiplier_4bit

architecture gate_level of carry_save_adder_multiplier_4bit is
	signal single_bit_0, single_bit_1, single_bit_2, single_bit_3 : std_logic_vector(3 downto 0);
	signal wires_sum, wires_cout : std_logic_vector(30 downto 0);
	component half_adder is
		port (
			in0, in1 : in std_logic;
			sum, cout : out std_logic
		);
	end component half_adder;
	component full_adder is
		port (
			in0, in1 , cin: in std_logic;
			sum, cout : out std_logic
		);
	end component full_adder;
begin
	------------------------------------------------------------------------------
	single_bit_3(0) <= a(0) and b(3);
	single_bit_3(1) <= a(1) and b(3);
	single_bit_3(2) <= a(2) and b(3);
	single_bit_3(3) <= a(3) and b(3);

	single_bit_0(0) <= a(0) and b(0);
	single_bit_0(1) <= a(1) and b(0);
	single_bit_0(2) <= a(2) and b(0);
	single_bit_0(3) <= a(3) and b(0);
	------------------------------------------------------------------------------
	single_bit_1(0) <= a(0) and b(1);
	single_bit_1(1) <= a(1) and b(1);
	single_bit_1(2) <= a(2) and b(1);
	single_bit_1(3) <= a(3) and b(1);
	------------------------------------------------------------------------------
	single_bit_2(0) <= a(0) and b(2);
	single_bit_2(1) <= a(1) and b(2);
	single_bit_2(2) <= a(2) and b(2);
	single_bit_2(3) <= a(3) and b(2);
	-----------------------------------------------------------------------------
	
	------------------------------------------------------------------------------level 1
	half_adder10: half_adder port map (
		in0 => single_bit_2(1),in1 => single_bit_0(3), sum => wires_sum(2), cout => wires_cout(2)
	);
	half_adder11: half_adder port map (
		in0 => single_bit_1(1),in1 => single_bit_0(2), sum => wires_sum(1), cout => wires_cout(1)
	);
	half_adder12: half_adder port map (
		in0 => single_bit_1(0),in1 => single_bit_0(1), sum => wires_sum(0), cout => wires_cout(0)
	);
	-----------------------------------------------------------------------------level 2
	full_adder20: full_adder port map (
		in0 => single_bit_2(0), in1 => wires_cout(0), cin => wires_sum(1),    cout => wires_cout(3), sum =>  wires_sum(3)
	);
	full_adder21: full_adder port map (
		in0 => single_bit_2(1), in1 => wires_cout(1), cin => wires_sum(2),    cout => wires_cout(4), sum =>  wires_sum(4)
	);
	full_adder22: full_adder port map (
		in0 => single_bit_2(2), in1 => wires_cout(2), cin => single_bit_1(3), cout => wires_cout(5), sum =>  wires_sum(5)
	);
	------------------------------------------------------------------------------level 3
	full_adder30: full_adder port map (
		in0 => single_bit_3(0), cin => wires_cout(3), in1 =>wires_sum(4),   cout => wires_cout(6), sum => wires_sum(6) 
	);
	full_adder31: full_adder port map (
		in0 => single_bit_3(1), cin => wires_cout(4), in1 => wires_sum(5),  cout => wires_cout(7), sum => wires_sum(7)
 	);
	full_adder32: full_adder port map (
		in0 => single_bit_3(2),cin => wires_cout(5), in1 => single_bit_2(3),cout => wires_cout(8), sum => wires_sum(8)
	);
	------------------------------------------------------------------------------level 4
	half_adder40: half_adder port map (
		in0 => wires_cout(6) , in1 => wires_sum(7) ,  cout => wires_cout(9), sum => wires_sum(9)
	);
	full_adder41: full_adder port map (
		in0 => wires_cout(7), in1 => wires_sum(8) , cin => wires_cout(9), cout => wires_cout(10), sum => wires_sum(10)
	);
	full_adder42: full_adder port map (
		in0 => single_bit_3(3), in1 => wires_cout(8), cin => wires_cout(10), cout => wires_cout(11), sum => wires_sum(11)
	);
	------------------------------------------------------------------------------calculating sum
	sum(0) <= single_bit_0(0);
	sum(1) <= wires_sum(0);
	sum(2) <= wires_sum(3);
	sum(3) <= wires_sum(6);
	sum(4) <= wires_sum(9);
	sum(5) <= wires_sum(10);
	sum(6) <= wires_sum(11);
	sum(7) <= wires_cout(11);

end architecture gate_level;


















