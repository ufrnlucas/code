library ieee;
use ieee.std_logic_1164.all;

entity multiplexador is
  port(X, en : in std_logic_vector(15 downto 0);
		 Q : out std_logic);
end multiplexador;

architecture ckt of multiplexador is

  begin
  
  Q <= (X(0) and en(0)) or (X(1) and en(1)) or (X(2) and en(2)) or (X(3) and en(3)) or (X(4) and en(4)) or (X(5) and en(5)) 
    or (X(6) and en(6)) or (X(7) and en(7)) or (X(8) and en(8)) or (X(9) and en(9)) or (X(10) and en(10)) or (X(11) and en(11)) 
	 or (X(12) and en(12)) or (X(13) and en(13)) or (X(14) and en(14)) or (X(15) and en(15));
	 
end ckt;