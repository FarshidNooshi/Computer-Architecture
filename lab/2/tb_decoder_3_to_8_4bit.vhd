library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity tb_decoder_3_to_8_4bit is 

end entity tb_decoder_3_to_8_4bit;


architecture arch3 of tb_decoder_3_to_8_4bit is 
signal i0 ,i1, i2, s0, s1, s2, s3, s4, s5, s6, s7 : std_logic_vector(3 downto 0);

begin
DUT: entity work.decoder_3_to_8_4bit port map (i0=>i0 ,i1=>i1, i2=>i2, s0 => s0, s1 => s1, s2 => s2, s3 => s3, s4 => s4, s5 => s5, s6 => s6, s7 => s7);
i1 <= "0101"; i2 <= "0101";
i0 <= "1010"; 


end architecture arch3;