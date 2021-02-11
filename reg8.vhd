library ieee;
use ieee.std_logic_1164.all;


entity Registrador8bits is
  port (X : in  std_logic_vector (7 downto 0);
        ld, clr, clk : in std_logic;
        Q : out std_logic_vector (7 downto 0));
end Registrador8bits;



architecture ckt of Registrador8bits is



  component ffd is

    port (clk,D,P,C : in  std_logic;

                  q : out std_logic);

  end component;

  

  signal mux, aux : std_logic_vector(7 downto 0);

  

  begin


   mux(7) <= (X(7) and ld) or (aux(7) and not(ld));

   mux(6) <= (X(6) and ld) or (aux(6) and not(ld));

   mux(5) <= (X(5) and ld) or (aux(5) and not(ld));

   mux(4) <= (X(4) and ld) or (aux(4) and not(ld));

   mux(3) <= (X(3) and ld) or (aux(3) and not(ld));

   mux(2) <= (X(2) and ld) or (aux(2) and not(ld));

   mux(1) <= (X(1) and ld) or (aux(1) and not(ld));

   mux(0) <= (X(0) and ld) or (aux(0) and not(ld));

      

   ffd7 : ffd port map (clk => clk, D => mux(7), P => '1', C => clr, q => aux(7));

   ffd6 : ffd port map (clk => clk, D => mux(6), P => '1', C => clr, q => aux(6));

   ffd5 : ffd port map (clk => clk, D => mux(5), P => '1', C => clr, q => aux(5));

   ffd4 : ffd port map (clk => clk, D => mux(4), P => '1', C => clr, q => aux(4));

   ffd3 : ffd port map (clk => clk, D => mux(3), P => '1', C => clr, q => aux(3));

   ffd2 : ffd port map (clk => clk, D => mux(2), P => '1', C => clr, q => aux(2));

   ffd1 : ffd port map (clk => clk, D => mux(1), P => '1', C => clr, q => aux(1));

   ffd0 : ffd port map (clk => clk, D => mux(0), P => '1', C => clr, q => aux(0));

        

   Q(7) <= aux(7);

   Q(6) <= aux(6);

   Q(5) <= aux(5);

   Q(4) <= aux(4);

   Q(3) <= aux(3);

   Q(2) <= aux(2);

   Q(1) <= aux(1);

   Q(0) <= aux(0);

     

end ckt;