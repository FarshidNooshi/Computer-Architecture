library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity mux_4_to_1 is
port(
	i0 ,i1, i2, i3 , sel0 , sel1:in std_logic;
	output : out std_logic
);
end entity mux_4_to_1;


architecture arch of mux_4_to_1 is

signal out1 , out2 : std_logic;
component mux_2_to_1 is
Port(
	i0 , i1 ,sel :in std_logic;
	output: out std_logic
);
end component mux_2_to_1;
begin
instance1: mux_2_to_1 port map(i0 => i0 , i1=>i1 , sel=>sel0 , output => out1);
instance2: mux_2_to_1 port map(i0=>i2 , i1=>i3 , sel=>sel0 , output => out2);
instance3: mux_2_to_1 port map(i0 => out1 , i1 => out2 , sel => sel1 , output => output);
end architecture arch; 
