library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity 	tb_decoder2_to_4 is 

end entity tb_decoder2_to_4;

architecture arch of tb_decoder2_to_4 is
signal s0, s1 , s2, s3, i0, i1 : std_logic; 
begin
DUT: entity work.decoder2_to_4 port map(i0=>i0, s0=>s0, enable => '1', s1=>s1, s2=>s2, s3=>s3, i1=>i1);
i0 <= '0' , '1' after 50 ns , '0' after 150 ns;
i1 <= '0' ,  '1' after 100 ns;
end architecture arch;
