library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity sequence_detector_1101_moore is
  port (
    clk , inp : in std_logic; 
    outp : out std_logic
    -- currstate : out std_logic;
  ) ;
end sequence_detector_1101_moore;

architecture arch of sequence_detector_1101_moore is
    type state_t is (a, b, c, d, e);

    signal state : state_t := a; 
    signal next_state : state_t := a;
    
begin
    CMB : process( state , inp )
    begin
        case( state ) is
        
            when a =>
                if inp = '1' then
                    next_state <= b;
                    
                else
                    next_state <= a;    
                end if ;   
            when b =>
                if inp = '1' then
                    next_state <= c;
                else
                    next_state <= a;
                end if ;
            when c =>
                if inp = '1' then
                    next_state <= c;
                else
                    next_state <= d;
                end if ;
            when d =>
                if inp = '1' then
                    next_state <= e;
                else
                    next_state <= a;
                end if ;
            when e =>
                if inp = '1' then
                    next_state <= c;
                else
                    next_state <= a;
                end if ;
            when others =>
                next_state <= a;
        end case ;
    end process ; -- CMB
    REG : process( clk )
    begin
        if(clk'event and clk = '1') then
            state <= next_state;
            end if;
    end process ; -- REG
    outp <= '1' when state = e else
        '0';
end arch ; -- arch
