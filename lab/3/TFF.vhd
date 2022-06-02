library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity TFF is 
    port(
        clk : in std_logic;
        reset : in std_logic;
        t : in std_logic;
        q : buffer std_logic := '1'
    );
end entity TFF;

architecture arch of TFF is

    begin
    tff_proc : process(clk, reset) begin
        if reset = '1' then
            q <= '0';
        elsif (falling_edge(clk)) then
            if t = '1' then
                q <= not q;
            end if;
        end if;
    end process;
end;
