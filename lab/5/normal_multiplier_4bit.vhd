library ieee;
use ieee.std_logic_1164.all;
--------------------------------------------------------------------------------------
entity normal_multiplier_4bit is
  port (
	a, b :in std_logic_vector(3 downto 0);
	sum : out std_logic_vector(7 downto 0)
  ) ;
end entity ; -- normal_multiplier_4bit

architecture gate_level of normal_multiplier_4bit is
	signal single_bit_0, single_bit_1, single_bit_2 , single_bit_3  : std_logic_vector(3 downto 0);
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
	single_bit_3(0) <= a(0) and b(3);
	single_bit_3(1) <= a(1) and b(3);
	single_bit_3(2) <= a(2) and b(3);
	single_bit_3(3) <= a(3) and b(3);
	------------------------------------------------------------------------------level 1
	half_adder00: half_adder port map (
		in0 => single_bit_1(0) , in1 => single_bit_0(1), cout => wires_cout(0) , sum => wires_sum(0)
	);
	full_adder01: full_adder port map (
		in0 => single_bit_1(1)	, in1 =>single_bit_0(2),cin => wires_cout(0), cout => wires_cout(1) , sum => wires_sum(1)
	);
	full_adder02: full_adder port map (
		in0 => single_bit_1(2) , in1 => single_bit_0(3),cin => wires_cout(1), cout => wires_cout(2), sum => wires_sum(2)
	);
	half_adder03: half_adder port map (
		in0 => single_bit_1(3) ,in1 =>  wires_cout(2), cout => wires_cout(3), sum => wires_sum(3)
	);
	------------------------------------------------------------------------------level 2
	half_adder10: half_adder port map (
		in0 => single_bit_2(0) , in1 => wires_sum(1) , cout => wires_cout(4) , sum => wires_sum(4)
	);
	full_adder11: full_adder port map (
		in0 => single_bit_2(1)	, in1 =>wires_sum(2) ,cin => wires_cout(4), cout => wires_cout(5) , sum => wires_sum(5)
	);
	full_adder12: full_adder port map (
		in0 => single_bit_2(2) , in1 => wires_sum(3) ,cin => wires_cout(5), cout => wires_cout(6), sum => wires_sum(6)
	);
	full_adder13: full_adder port map (
		in0 => single_bit_2(3) ,in1 => wires_cout(3),cin => wires_cout(6), cout => wires_cout(7), sum => wires_sum(7)
	);
	------------------------------------------------------------------------------level 3
	half_adder20: half_adder port map (
		in0 => single_bit_3(0) , in1 => wires_sum(5) , cout => wires_cout(8) , sum => wires_sum(8)
	);
	full_adder21: full_adder port map (
		in0 => single_bit_3(1)	, in1 =>wires_sum(6) ,cin => wires_cout(8), cout => wires_cout(9) , sum => wires_sum(9)
	);
	full_adder22: full_adder port map (
		in0 => single_bit_3(2) , in1 => wires_sum(7) ,cin => wires_cout(9), cout => wires_cout(10), sum => wires_sum(10)
	);
	full_adder23: full_adder port map (
		in0 => single_bit_3(3) ,in1 => wires_cout(7),cin => wires_cout(10), cout => wires_cout(11), sum => wires_sum(11)
	);
	------------------------------------------------------------------------------calculating sum
	sum(0) <= single_bit_0(0);
	sum(1) <= wires_sum(0);
	sum(2) <= wires_sum(4);
	sum(3) <= wires_sum(8);
	sum(4) <= wires_sum(9);
	sum(5) <= wires_sum(10);
	sum(6) <= wires_sum(11);
	sum(7) <= wires_cout(11);


end architecture gate_level;









