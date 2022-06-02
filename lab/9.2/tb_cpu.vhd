----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;
--these are some set of instructions which were meant to 
--be used in testbench during code developement,
-- by setting the value to the signal ir_test which was 
--once an input signal in the cpu component
--
------add"0010001100100111";
------sub"0011000101101001";
------load"0100110000000000";
------store"0101010100000000";
------ror"0110011111000010"
------rol"0111101101010010";
------and"1000101000011000";
------xor"1001111010011101"
------or "1010001010011111" 
------not "1011011010011000"
------shl"1110000111100010";
------shr"1111001000110010";
entity tb_cpu is
  
end entity tb_cpu;

architecture arch of tb_cpu is

    signal clk , rst: std_logic := '0';
begin
 --the line below can be used to manually set the instruction
 --but some other changes may require to make it work properly
 -- ir_test <= "0011000101101001";
  
	--setting a value to pc ,this line has een left when testing the program and
		-- and giving the inputs directly from the test bench to the cpu, the code
	--soon can be edited to make pc an input to the cpu and directly change the 
	--value via testbench.
    --pc  <= "0000", "0010" after 10 ns;
	 clk <= not clk after 5 ns; 
    DUT: entity work.cpu port map (
	 
    clk => clk, rst => rst--, pc => pc ir_test = ir_test
  );


end architecture ; -- arch