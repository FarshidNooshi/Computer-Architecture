library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_comparator_1bit is
end entity tb_comparator_1bit;

architecture arch of tb_comparator_1bit is 
signal a , b , eq , gt , lt , a_lt_b , a_eq_b , a_gt_b : std_logic;

begin
DUT: entity work.cmp_bit port map (a=>a , b=>b , eq=>eq
 , gt => gt ,lt => lt , a_eq_b => a_eq_b , a_gt_b => a_gt_b , a_lt_b => a_lt_b);
eq <= '1';
lt <= '0';
gt <= '0';
a  <= '1','0' after 50 ns ,'1' after 150 ns;
b  <= '1', '0' after 100 ns;

end architecture arch;