library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity MealyMachine is
port(
		i0, clk: in std_logic;
		o0: out std_logic
	);
end entity MealyMachine;


architecture arch of MealyMachine is

	type state_t is (s0, s1, s11, s110, s1101);
	signal state : state_t := s0;
	signal next_state : state_t := s0;

begin
	CMB : process(state , i0)
		begin
		case state is
			when s0 =>
				if(i0 = '1') then
					o0 <= '0';
					next_state <= s1;
				else
					o0 <= '0';
					next_state <= state;
				end if;
			when s1 =>
				if(i0 = '1') then
					o0 <= '0';
					next_state <= s11;
				else
					o0 <= '0';
					next_state <= s0;
				end if;
			when s11 => 
				if (i0 = '1') then 
					o0 <= '0';
					next_state <= state;
				else 
					o0 <= '0';
					next_state <= s110;
				end if;
			when s110 =>
				if(i0 = '1') then
					next_state <= s1101;
					o0 <= '1';					
				else
					next_state <= s0;
					o0 <= '0';
				end if;
			when s1101 =>
				if(i0 = '1') then
					next_state <= s11;
					o0 <= '0';					
				else 
					next_state <= s0;
					o0 <= '0';
				end if;
			
			when others=>
				o0 <= '0';
				next_state <= s0;
		end case;
	end process;
	REG : process(clk)
	begin
		if(clk'event and clk = '1') then
			state <= next_state;
		end if;
	end process;

end architecture arch; 
