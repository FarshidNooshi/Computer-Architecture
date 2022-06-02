
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity cmp_bit is
port(
	a , b , gt ,eq ,lt: in std_logic;
	a_gt_b , a_lt_b , a_eq_b : out std_logic
);
end entity cmp_bit;

architecture arch1 of cmp_bit is
begin
a_gt_b <= ((not(a xor b))and (gt)) or ((a xor b)and(a and (not b)));
a_lt_b <= ((not(a xor b))and(lt)) or (b and (not a));
a_eq_b <= (not(a xor b))and(eq);

end architecture arch1;





















library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity comparator_1bit is
port(
	a , b , gt ,eq ,lt: in std_logic;
	a_gt_b , a_lt_b , a_eq_b : out std_logic
);
end entity comparator_1bit;

architecture arch of comparator_1bit is
begin
a_gt_b <= ((a xor b)and (gt)) or ((not(a xor b))and(a and (not b)));
a_lt_b <= ((a xor b)and(lt)) or ((not(a xor b))and(b and (not a)));
a_eq_b <= ((a xor b)and(eq)) or ((not(a xor b))and('0'));

end architecture arch;