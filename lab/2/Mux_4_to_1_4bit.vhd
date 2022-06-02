library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity mux_4_to_1_4bit is
port(
	i0 ,i1, i2, i3: in std_logic_vector(3 downto 0);
	sel0 , sel1: in std_logic;
	output : out std_logic_vector(3 downto 0)
);
end entity mux_4_to_1_4bit;


architecture arch of mux_4_to_1_4bit is

signal out1 , out2 : std_logic;
component mux_4_to_1 is
port(
	i0 ,i1, i2, i3 , sel0 , sel1:in std_logic;
	output : out std_logic
);
end component mux_4_to_1;
begin
instance1: mux_4_to_1 port map(i0 => i0(0) , i1 => i0(1), i2 => i0(2), i3 => i0(3), sel0 => sel0, sel1 => sel1, output => output(0));
instance2: mux_4_to_1 port map(i0 => i1(0) , i1 => i1(1), i2 => i1(2), i3 => i1(3), sel0 => sel0, sel1 => sel1, output => output(1));
instance3: mux_4_to_1 port map(i0 => i2(0) , i1 => i2(1), i2 => i2(2), i3 => i2(3), sel0 => sel0, sel1 => sel1, output => output(2));
instance4: mux_4_to_1 port map(i0 => i3(0) , i1 => i3(1), i2 => i3(2), i3 => i3(3), sel0 => sel0, sel1 => sel1, output => output(3));

end architecture arch; 
