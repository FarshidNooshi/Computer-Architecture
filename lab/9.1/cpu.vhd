----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.ALL;

entity cpu is
	
	port (

		clk : in std_logic;
		rst : in std_logic
		--these input signals were meant to test the program nothing inportant :)
		--pc : in std_logic_vector(3 downto 0)
		--ir_test : in std_logic_vector(15 downto 0)
		--mem_inst : instruction_memory
	);
end cpu;

architecture Behavioral of cpu is
--declaring 2 types one for register and one for memory and then
--making an instance from those types.memory initialization has 
--been done directly after declaration.
--first indices of the memory are some instruction each holding 2
--word space e.g index  0 and 1 together form a subtraction instruction.
--some other instructions have been declared after subtraction.
--'val' signal is the value to increment pc at each cycle, because each
--instruction holds 2 memory address, 'val' needs to be initialized to '2'
--it can soon be changed when the user changes the size ofeach instruction
type memory_type is array (15 downto 0) of std_logic_vector(7 downto 0);
type register_type is array (15 downto 0) of std_logic_vector(7 downto 0);
--initializing registers which is 16 * 8
signal registers : register_type:= ("00010000", "00001111", "00001110", "00001101", "00001100", "00001011", "00001010", "00001001",
									"00001000", "00000111", "00000110", "00000101", "00000100", "00000011", "00000010", "00000001");
					
--initializing memory which is 16 * 8				
signal memory : memory_type := ("00010001", "00100010", "10001000", "00010000", "00011100", "00100001", "10000000", "01100000",
								"00100110", "11000000", "01110010", "01100100","10011000" ,"10110110","01101001" ,"00110001");

signal IR: std_logic_vector(15 downto 0);
signal AR, DR : std_logic_vector(7 downto 0);
signal AC : std_logic_vector(8 downto 0);
signal opcode : std_logic_vector(3 downto 0);
signal temporary : integer := 0;

signal rs : integer;
signal rt : integer;
signal rd : integer;
signal vector : bit_vector(7 downto 0);
signal pc : std_logic_vector(3 downto 0) := "0000";--the value of pc is initialized here, it can be changed by changing the pc value
signal val : std_logic_vector(3 downto 0) := "0010";--the value to increment the pc after a cycle
begin
	temporary <= to_integer(unsigned(pc));
	IR <= memory(temporary) & memory(temporary + 1);
	opcode <= IR(15 downto 12);
	rd <= to_integer(unsigned(IR(3 downto 0)));
	rt <= to_integer(unsigned(IR(7 downto 4)));
	rs <= to_integer(unsigned(IR(11 downto 8)));

	
	CUT: process(clk, rst)
		variable index1, index2, index3: integer;

		variable op1, op2 : std_logic_vector(8 downto 0);
		variable result : std_logic_vector(8 downto 0);
		begin

			if (rst = '1') then

			elsif (rising_edge(clk)) then

				if (opcode = "0000") then
					
					if (registers(rs) = "00000000") then
						pc <= IR(7 downto 4);
					end if;
					
				elsif (opcode = "0001") then
					if (registers(rs) /= "00000000") then 
						pc <= IR(7 downto 4);
					end if;
				elsif (opcode = "0010") then--add
					index3 := to_integer(unsigned(IR(11 downto 8)));--dst
					index1 := to_integer(unsigned(IR(7 downto 4)));--src1
					index2 := to_integer(unsigned(IR(3 downto 0)));--src2
					op1 :='0' & registers(index1);

					op2 :='0' & registers(index2);
					if (op1(7) = '1') then
						op1(8) := '1';
					end if;
					if (op2(7) = '1') then
						op2(8) := '1';
					end if;
					
					result := std_logic_vector(signed(op1) + signed(op2));
					registers(index3) <= result(7 downto 0);
					AC <= result;

				elsif (opcode = "0011") then --sub
					index3 := to_integer(unsigned(IR(11 downto 8)));--dst
					index1 := to_integer(unsigned(IR(7 downto 4)));--src1
					index2 := to_integer(unsigned(IR(3 downto 0)));--src2
					op1 :='0' & registers(index1);

					op2 :='0' & registers(index2);
					if (op1(7) = '1') then
						op1(8) := '1';
					end if;
					if (op2(7) = '1') then
						op2(8) := '1';
					end if;
					
					result := std_logic_vector(signed(op1) - signed(op2));
					
					registers(index3) <= result(7 downto 0);
					AC <= result;
					
				elsif (opcode = "0100") then--load
					registers(rs) <= memory(rt);
				elsif (opcode = "0101") then--store
					memory(rt) <= registers(rs);
				elsif (opcode = "0110") then--ror
					registers(rs) <= registers(rt)(rd - 1 downto 0) & registers(rt)(7 downto rd);--2
				elsif (opcode = "0111") then--rol
					registers(rs) <= registers(rt)(7 - rd downto 0) & registers(rt)(7 downto 7 - rd + 1);--2
				elsif (opcode = "1000") then------and 
					index3 := to_integer(unsigned(IR(11 downto 8)));--dst
					index1 := to_integer(unsigned(IR(7 downto 4)));--src1
					index2 := to_integer(unsigned(IR(3 downto 0)));--src2
					op1 :='0' & registers(index1);
					op2 :='0' & registers(index2);
					result := op1 and op2;
					registers(index3) <= result(7 downto 0);
				elsif (opcode = "1001") then--------xor
					index3 := to_integer(unsigned(IR(11 downto 8)));--dst
					index1 := to_integer(unsigned(IR(7 downto 4)));--src1
					index2 := to_integer(unsigned(IR(3 downto 0)));--src2
					op1 :='0' & registers(index1);
					op2 :='0' & registers(index2);
					result := op1 xor op2;
					registers(index3) <= result(7 downto 0);
				elsif (opcode = "1010") then------or
					index3 := to_integer(unsigned(IR(11 downto 8)));--dst
					index1 := to_integer(unsigned(IR(7 downto 4)));--src1
					index2 := to_integer(unsigned(IR(3 downto 0)));--src2
					op1 :='0' & registers(index1);
					op2 :='0' & registers(index2);
					result := op1 or op2;
					registers(index3) <= result(7 downto 0);
				elsif (opcode = "1011") then------not
					index3 := to_integer(unsigned(IR(11 downto 8)));--dst
					index1 := to_integer(unsigned(IR(7 downto 4)));--src1
				
					op1 :='0' & registers(index1);
				
					result := not op1;
					registers(index3) <= result(7 downto 0);
				elsif (opcode = "1100") then
				elsif (opcode = "1101") then

				elsif (opcode = "1110") then
					registers(rs) <= std_logic_vector(shift_left(unsigned(registers(rt)), rd));
				elsif (opcode = "1111") then
					registers(rs) <= std_logic_vector(shift_right(unsigned(registers(rt)), rd));

				end if;

			pc <= std_logic_vector(unsigned(pc) + unsigned(val));--finding the address of the next instruction

			end if;
			
		end process;


end Behavioral;








