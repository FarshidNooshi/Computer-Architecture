
library IEEE;
use IEEE.STD_LOGIC_1164.all;



entity ripple_counter4bit_using_tff is
  port (
    reset , clk : in std_logic ;
    input_const_1 : in std_logic := '1' ;
    digits : buffer std_logic_vector(3 downto 0)
  ) ;
end ripple_counter4bit_using_tff;


architecture arch of ripple_counter4bit_using_tff is

    component TFF is 
    port(
        clk : in std_logic;
        reset : in std_logic;
        t : in std_logic;
        q : buffer std_logic
    );
    end component TFF;


begin
    tff_inst_1: TFF port map (clk => clk , reset => reset ,t => input_const_1 ,q=>digits(0)); 
    tff_inst_2: TFF port map ( clk => digits(0) , reset => reset ,t =>input_const_1 ,q=>digits(1));
    tff_inst_3: TFF port map (clk => digits(1)  , reset => reset ,t =>input_const_1 ,q=>digits(2));
    tff_inst_4: TFF port map ( clk => digits(2)  , reset => reset ,t =>input_const_1 ,q=>digits(3));
end arch ; -- arch