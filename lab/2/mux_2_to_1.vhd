library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity mux_2_to_1 is
port(
	i0 , i1 ,sel :in std_logic;
	output: out std_logic
);
end entity mux_2_to_1;

architecture arch of mux_2_to_1 is
begin
output <= (i0 and (not sel)) or (i1 and sel);
end architecture arch;
