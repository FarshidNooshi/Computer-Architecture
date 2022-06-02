library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity division is
port(
	clk   	: in std_logic;
  b          : in  std_logic_vector(3 downto 0);
  o 			: buffer std_logic := '0';
  a_q      : inout std_logic_vector(7 downto 0) := "00000111");
end division;

architecture arch of division is
	signal copy_2_copy : std_logic_vector(4 downto 0);
	signal en : std_logic_vector(2 downto 0);
	signal e : std_logic := '0';
	signal sc :  std_logic_vector(3 downto 0) := "0000";
	signal hold :  std_logic_vector(8 downto 0) := "000000000";
	signal checked : std_logic := '0';

begin
	DUT : process(clk) -------------------------------------------------------------------
		variable temp : std_logic := '0';
		variable copy : std_logic_vector(8 downto 0) := "000000000";
		variable copy_2 : std_logic_vector(4 downto 0) := "00000";
		variable temp2 : std_logic_vector(4 downto 0) := "00000";
		variable copy_2_int, temp_int : integer := 0;
		variable copy_for_overFlow : std_logic_vector(4 downto 0) := "00000";
		begin
		copy := temp & a_q;
		
		copy_for_overFlow := copy(8 downto 4);
		
		if (checked = '0') then 
			temp2 := '0' & not(b(3)) & not(b(2)) & not(b(1)) & not(b(0)); 
			copy_for_overFlow := copy_for_overFlow + temp2 + '1';
			if (copy_for_overFlow(4) = '1') then
				o <= '1';
			end if; 
			
			checked <= '1';
		end if;
		
		if (rising_edge(clk) and checked = '1' and o = '0') then
			if (sc /=  "00100") then
				
				copy := temp & a_q;
				copy := std_logic_vector(shift_left(unsigned(copy), 1));
				copy(0) := '0';
				copy_2 := copy(8 downto 4);
				if (copy(8) = '1') then
					temp2 := '0' & not(b(3)) & not(b(2)) & not(b(1)) & not(b(0)); 
					copy_2 := copy_2 + temp2 + '1';
					copy(8 downto 4) := copy_2;
					copy(0) := '1';
					en <= "001";
				
				elsif (copy(8) = '0') then
					temp2 := '0' & not(b(3)) & not(b(2)) & not(b(1)) & not(b(0)); 
					copy_2 := copy_2 + temp2 + '1';
					if (copy_2(4) = '1') then
						copy(8 downto 4) := copy_2(4 downto 0);
						copy(0) := '1';
						en <= "010";
					elsif(copy_2(4) = '0') then
						en <= "100";
						copy(0) := '0';
					end if;
				end if;
				a_q <= copy(7 downto 0);
				sc <= sc + 1;
				hold <= copy;
				copy_2_copy <= copy_2;
			end if;
		end if;

	end process;

end architecture ; -- arch