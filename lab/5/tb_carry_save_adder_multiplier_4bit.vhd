library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity 	tb_carry_save_adder_multiplier_4bit is 

end entity tb_carry_save_adder_multiplier_4bit;

architecture arch of tb_carry_save_adder_multiplier_4bit is
signal  b , a : std_logic_vector(3 downto 0);
signal sum : std_logic_vector(7 downto 0);
begin

DUT: entity work.carry_save_adder_multiplier_4bit port map(
	 b => b , sum => sum , a => a
);

b <= "1001";
a <= "1000";
end architecture arch;
