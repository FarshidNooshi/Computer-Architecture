library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity 	ArrayMultiplier_Test is 

end entity ArrayMultiplier_Test;

architecture arch of ArrayMultiplier_Test is
signal  b , a : std_logic_vector(3 downto 0);
signal product : std_logic_vector(7 downto 0);
begin

DUT: entity work.ArrayMultiplier4bit port map(
	 b => b , product => product , a => a
);

b <= "1101";
a <= "1010";
end architecture arch;
