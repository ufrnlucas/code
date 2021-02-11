library ieee;
use ieee.std_logic_1164.all;


entity ffd is

  port (clk,D,P,C : in  std_logic;

                q : out std_logic);

end ffd;



architecture ckt of ffd is

  

  signal qS : std_logic;

  

  begin 

    process(clk,P,C)

      begin

        if P = '0' then qS <= '1';

        elsif C = '0' then qS <= '0';

        elsif clk = '1' and clk'EVENT then qS <= D;

        end if;

    end process;

    q <= qS;

  

end ckt;