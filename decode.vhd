library ieee;
use ieee.std_logic_1164.all;

entity decodificador is
  port(X : in std_logic_vector(3 downto 0);
       en : in std_logic;
		 Q : out std_logic_vector(15 downto 0));
end decodificador;

architecture ckt of decodificador is

   signal aux_2 : std_logic_vector(15 downto 0);
	signal aux : std_logic_vector(7 downto 0);
	
	begin
	
	aux(0) <= not(X(0)) and not(X(1));
   aux(1) <= X(0) and not(X(1));
   aux(2) <= not(X(0)) and X(1);
   aux(3) <= X(0) and X(1);
	aux(4) <= not(X(2)) and not(X(3));
   aux(5) <= X(2) and not(X(3));
   aux(6) <= not(X(2)) and X(3);
   aux(7) <= X(2) and X(3);
	
	aux_2(0) <= en and aux(0) and aux(4);
	aux_2(1) <= en and aux(0) and aux(5);
	aux_2(2) <= en and aux(0) and aux(6);
	aux_2(3) <= en and aux(0) and aux(7);
	aux_2(4) <= en and aux(1) and aux(4);
	aux_2(5) <= en and aux(1) and aux(5);
	aux_2(6) <= en and aux(1) and aux(6);
	aux_2(7) <= en and aux(1) and aux(7);
	aux_2(8) <= en and aux(2) and aux(4);
	aux_2(9) <= en and aux(2) and aux(5);
	aux_2(10) <= en and aux(2) and aux(6);
	aux_2(11) <= en and aux(2) and aux(7);
	aux_2(12) <= en and aux(3) and aux(4);
	aux_2(13) <= en and aux(3) and aux(5);
	aux_2(14) <= en and aux(3) and aux(6);
	aux_2(15) <= en and aux(3) and aux(7);
	
	Q <= aux_2;
	
end ckt;