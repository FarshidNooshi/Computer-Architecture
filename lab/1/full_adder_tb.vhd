---------------------------------------------test bench

library ieee;
use ieee.std_logic_1164.all;
entity full_adder_tb is
end entity full_adder_tb;


architecture structure of full_adder_tb is

signal i0 , i1 , cin : std_logic;
signal s , cout : std_logic;
begin
DUT: entity work.full_adder port map(i0 => i0 , i1=>i1 , cin=>cin , cout=>cout , s=>s);
i0 <= '0' , '1' after 50 ns  , '0' after 200 ns ; 
i1<= '0' , '1' after 100 ns , '0' after 250 ns; 

cin <= '0' , '1' after 150 ns;

end architecture structure;



