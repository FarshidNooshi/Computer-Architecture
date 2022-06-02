Library IEEE;
USE IEEE.Std_logic_1164.all;

entity DFF is 
   port(
      q : out std_logic := '0';    
      clk :in std_logic;  
   sync_reset: in std_logic;  
      d :in  std_logic    
   );
end DFF;

architecture arch of DFF is
begin  
 
 process(clk,sync_reset)
 begin 
     if(sync_reset='1') then 
   q <= '0';
     elsif(falling_edge(clk)) then
   q <= d; 
  end if;      
 end process;  
end arch;