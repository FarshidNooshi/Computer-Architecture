
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity alu is
	port (
		a, b : in std_logic_vector(7 downto 0);
		opcode : in std_logic_vector(2 downto 0);
		result : out std_logic_vector(7 downto 0)
	);
end alu;

architecture Behavioral of alu is
component ripple_adder_8bit is
	port (
		a , b   : in std_logic_vector(7 downto 0);
		cin : in std_logic;
		sum : out std_logic_vector(7 downto 0);
		cout : buffer std_logic_vector(7 downto 0)
	);
end component ripple_adder_8bit;
signal sum, subtract, anding, oring, xoring , bnot: std_logic_vector(7 downto 0);
signal cout1, cout2 : std_logic_vector(7 downto 0);
begin
addition: ripple_adder_8bit port map (
	a => a, b => b, cin => '0', sum => sum, cout => cout1
);
---------------------------------------------------------------------------------
bnot <= not(b(7)) & not(b(6)) & not(b(5)) & not(b(4)) & not(b(3)) & not(b(2)) & not(b(1)) & not(b(0)); 
subtraction: ripple_adder_8bit port map (
	a => a, b => bnot, cin => '1', sum => subtract, cout => cout2	
);
---------------------------------------------------------------------------------
anding <= a and b;
oring <= a or b;
xoring <= a xor b;
--------------------------------------------------------------------------------
result <= sum when opcode = "000" else
			subtract when opcode = "001" else
			anding when opcode = "010" else
			oring when opcode = "011" else
			xoring when opcode = "100" ;
end Behavioral;

