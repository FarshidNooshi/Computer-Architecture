library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity cmp_4_bit is
port(
	a , b : in std_logic_vector(3 downto 0);
	a_gt_b , a_lt_b , a_eq_b : out std_logic
);
end entity cmp_4_bit;


architecture arch2 of cmp_4_bit is
component cmp_bit is
Port(
	a , b , gt ,eq ,lt: in std_logic;
	a_gt_b , a_lt_b , a_eq_b : out std_logic
);
end component cmp_bit; 

signal ins1 , ins2 , ins3: std_logic_vector (2 downto 0);

begin
instance1: cmp_bit port map(a => a(0) , b=>b(0) , gt => '0' , eq => '1' , lt => '0' , a_gt_b => ins1(0) ,
			a_eq_b => ins1(1) , a_lt_b => ins1(2));
instance2: cmp_bit port map(a => a(1) , b=>b(1) , gt => ins1(0) , eq => ins1(1) , lt => ins1(2) , a_gt_b => ins2(0) ,
			a_eq_b => ins2(1) , a_lt_b => ins2(2));
instance3: cmp_bit port map(a => a(2) , b=>b(2) , gt => ins2(0) , eq => ins2(1) , lt => ins2(2) , a_gt_b => ins3(0) ,
			a_eq_b => ins3(1) , a_lt_b => ins3(2));
instance4: cmp_bit port map(a => a(3) , b=>b(3) , gt => ins3(0) , eq => ins3(1) , lt => ins3(2) , a_gt_b => a_gt_b ,
			a_eq_b => a_eq_b , a_lt_b => a_lt_b);

end architecture arch2;
