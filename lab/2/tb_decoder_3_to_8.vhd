library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity 	tb_decoder_3_to_8 is 

end entity tb_decoder_3_to_8;

architecture arch4 of tb_decoder_3_to_8 is
signal s0, s1 , s2, s3, s4, s5, s6, s7, i0, i1, i2 : std_logic; 
begin
DUT: entity work.decoder_3_to_8 port map(i0 => i0, i1 => i1, i2 => i2, s0=>s0, s1=>s1, s2=>s2, s3=>s3, s4 => s4, s5 => s5, s6 => s6, s7 => s7);
i0 <= '1', '0' after 50 ns, '1' after 100 ns;
i1 <= '1', '0' after 50 ns, '1' after 100 ns;
i2 <= '1', '0' after 50 ns, '1' after 100 ns;
end architecture arch4;
