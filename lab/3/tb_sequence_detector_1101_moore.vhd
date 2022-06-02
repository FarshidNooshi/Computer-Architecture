
library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tb_sequence_detector_1101_moore  is
end tb_sequence_detector_1101_moore;

architecture arch of tb_sequence_detector_1101_moore is
    -- type state_t is (a, b, c, d, e);
    -- signal state : state_t := s0; 
    signal inp : std_logic;
    signal clk : std_logic := '0';
    signal outp : std_logic;
begin
DUT: entity work.sequence_detector_1101_moore port map (outp => outp , inp => inp , clk => clk);
clk <= not clk after 10 ns;
inp <= '1' , '1' after 5 ns , '0' after 10 ns , '1' after 15 ns , '1' after 20 ns , '0' after 50 ns  , '1' after 80 ns ;  
end arch ; -- arch
