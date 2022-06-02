----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;

entity cpu is
	
	port (

		clk : in std_logic;
		rst : in std_logic
		
	);
end cpu;

architecture Behavioral of cpu is
	type register_type is array (15 downto 0) of std_logic_vector(15 downto 0);
	signal registers : register_type:= ("0001000000000000", "0000111100000000", "0000111000000000", "0000110100000000",
										 "0000110000000000", "0000101100000000", "0000101000000000", "0000100100000000",
									"0000100000001111", "0000011100001111", "0000011011110000", "0000010100001111", "0000011111110000", "0000001111111111", 
									"0000001011111111",
									"0000000100000111");
	type memory_type is array (15 downto 0) of std_logic_vector(15 downto 0);
	signal ram : memory_type:= ("0001000000000000", "0000111100000000", "0000111000000000", "0000110100000000",
										"0000110000000000", "0000101100000000", "0000101000000000", "0000100100000000",
									"0000100000001111", "0000011100001111", "0000011011110000", "0000010100001111", "0000010011110000", "0000001100001111", 
									"0000001011110000",
								"0000000100000000");
	type rom_type is array (7 downto 0) of std_logic_vector(15 downto 0);
	signal rom : rom_type:= ("0111110000000000", "0110110000000000","0101110000000000", "0100110000000000",
											"0011001000010000", "0010001000010000", "0001001100100001", "0000001100100001");

signal IR: std_logic_vector(15 downto 0);
signal  DR : std_logic_vector(15 downto 0);
signal AC : std_logic_vector(15 downto 0) :="0000000001110001";
signal AR : std_logic_vector(3 downto 0);
signal reg0 , reg1, reg2, reg3: std_logic_vector(3 downto 0);
signal opcode : std_logic_vector(3 downto 0);
signal control : std_logic_vector(3 downto 0) := "0000";
signal temporary , hold1, hold2, hold3: integer := 0;

signal rs : integer := 0;
signal rt : integer := 0;
signal rd : integer := 0;
signal vector : bit_vector(7 downto 0);
signal pc : std_logic_vector(3 downto 0) := "0000";--the value of pc is initialized here, it can be changed by changing the pc value------------------------------------------------
signal val : std_logic_vector(3 downto 0) := "0010";--the value to increment the pc after a cycle
signal addr : std_logic_vector(3 downto 0);
begin
	temporary <= to_integer(unsigned(pc));
	IR <= rom(temporary);
	opcode <= IR(15 downto 12);
	rd <= to_integer(unsigned(IR(3 downto 0)));
	rt <= to_integer(unsigned(IR(7 downto 4)));
	rs <= to_integer(unsigned(IR(11 downto 8)));
	addr <= IR(3 downto 0);
	reg1 <= IR(7 downto 4);
	reg2 <= IR(11 downto 8);
	hold1 <= to_integer(unsigned(addr));
	hold2 <= to_integer(unsigned(reg1));
	hold3 <= to_integer(unsigned(reg2));
	
	
	CUT: process(clk, rst)
		variable index1, index2, index3: integer := 0;
		variable AC_VAR, DR_VAR : std_logic_vector(15 downto 0);
		variable AC_int : integer;
		variable op1, op2 : std_logic_vector(15 downto 0);
		variable result : std_logic_vector(15 downto 0) := "0000000000000000";
		begin

			if (rst = '1') then

			elsif (rising_edge(clk)) then

				if (opcode = "0000") then--add
					if(control = "0000") then
						AC <= registers(hold2);
						DR <= ram(hold1);
						control <= "0001";
					elsif(control = "0001") then
						AC_VAR := AC;
						DR_VAR := DR;
						registers(hold3) <= std_logic_vector(signed(AC_VAR) + signed(DR_VAR));
						-- registers(hold3) <= result;
						control <= "0000";
						pc <= std_logic_vector(unsigned(pc) + unsigned(val));
					end if;
					
					
				elsif (opcode = "0001") then--sub
					if(control = "0000") then
						AC <= registers(hold2);
						DR <= ram(hold1);
						control <= "0001";
					elsif(control = "0001") then
						AC_VAR := AC;
						DR_VAR := DR;
						registers(hold3) <= std_logic_vector(signed(AC_VAR) - signed(DR_VAR));
						-- registers(hold3) <= result;
						control <= "0000";
						pc <= std_logic_vector(unsigned(pc) + unsigned(val));

					end if;
				
				elsif (opcode = "0010") then--not
						if (control = "0000") then
							AC <= registers(hold2);
							control <= "0001";
						elsif (control = "0001") then
							AC <= not AC;
							control <= "0010";
						elsif (control = "0010") then
							registers(hold3) <= AC;	
							control <= "0000";
							pc <= std_logic_vector(unsigned(pc) + unsigned(val));

						end if ;
						

				elsif (opcode = "0011") then --and
						if (control = "0000") then
							AC <= registers(hold2);
							DR <= registers(hold1);
							control <= "0001";
						elsif (control = "0001") then
							AC <= AC and DR;
							control <= "0010";
						elsif (control = "0010") then
							registers(hold3) <= AC;
							control <= "0000";
							pc <= std_logic_vector(unsigned(pc) + unsigned(val));
						end if ;
						
						
				elsif (opcode = "0100") then--or
					if(control = "0000") then
						AR <= IR(11 downto 8);
						addr <= IR(7 downto 4);
						control <= "0001";
					elsif(control = "0001") then
						DR <= registers(to_integer(unsigned(AR)));
						control <= "0010";
					elsif(control = "0010") then 
						result := DR or AC;
						AC <= result;
						registers(to_integer(unsigned(addr))) <= AC;
						control <= "0000";
						pc <= std_logic_vector(unsigned(pc) + unsigned(val));
					end if;
				elsif (opcode = "0101") then--SHR
					if(control = "0000") then
						AC_VAR := AC;
						DR <= AC_VAR;
						AR <= IR(11 downto 8);
						control <= "0001";
					elsif(control = "0001") then
						result := std_logic_vector(shift_right(unsigned(DR), 1));
						AC <= result;
						registers(to_integer(unsigned(AR))) <= AC;
						control <= "0000";
						pc <= std_logic_vector(unsigned(pc) + unsigned(val));
					end if;				 	
				elsif (opcode = "0110") then--SLL
					if(control = "0000") then
						AC_VAR := AC;
						AR <= IR(11 downto 8);
						DR <= AC_VAR;
						control <= "0001";
					elsif(control = "0001") then
						result := std_logic_vector(shift_left(unsigned(DR), 1));
						AC <= result;
						registers(to_integer(unsigned(AR))) <= AC;
						control <= "0000";
						pc <= std_logic_vector(unsigned(pc) + unsigned(val));
					end if;				 	
				elsif (opcode = "0111") then--SAL
					if(control = "0000") then
						AC_VAR := AC;
						AR <= IR(11 downto 8);
						DR <= AC_VAR;
						control <= "0001";
					elsif(control = "0001") then
						result := std_logic_vector(shift_left(unsigned(DR), 1));
						AC <= result;
						registers(to_integer(unsigned(AR))) <= AC;
						control <= "0000";
						pc <= std_logic_vector(unsigned(pc) + unsigned(val));

					end if;
					
				end if;	

			end if;
			
		end process;

end Behavioral;