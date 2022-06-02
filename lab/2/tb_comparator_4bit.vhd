library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_comparator_4bit is
end entity tb_comparator_4bit;

architecture arch3 of tb_comparator_4bit is 
signal a , b : std_logic_vector(3 downto 0);
signal a_lt_b , a_eq_b , a_gt_b : std_logic;

begin
DUT: entity work.cmp_4_bit port map (a=>a , b=>b  , a_eq_b => a_eq_b , a_gt_b => a_gt_b , a_lt_b => a_lt_b);
a <= "1000" , "0010" after 50 ns , "1100" after 100 ns;
b <= "1000";

end architecture arch3;
