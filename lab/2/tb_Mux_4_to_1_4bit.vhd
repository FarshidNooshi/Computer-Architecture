library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity tb_mux_4_to_1_4bit is 

end entity tb_mux_4_to_1_4bit;


architecture arch5 of tb_mux_4_to_1_4bit is 
signal i0 ,i1, i2, i3, output : std_logic_vector(3 downto 0);
signal sel0, sel1 : std_logic;
begin
DUT: entity work.mux_4_to_1_4bit port map (i0=>i0 ,i1=>i1, i2=>i2, i3=>i3 ,sel0 =>sel0 ,sel1 =>sel1);
i1 <= "0101"; i2 <= "0101";
i0 <= "1010"; i3 <= "1010";
sel0 <= '0' , '1' after 50 ns , '0' after 150 ns , '1' after 250 ns  , '0' after 350 ns;
sel1 <= '0' , '1' after 100 ns , '0' after 200 ns , '1' after 300 ns;


end architecture arch5;