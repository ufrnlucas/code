library ieee;
use ieee.std_logic_1164.all;

entity bancoderegistradores is
    port (addr_wr, addr_rd_1, addr_rd_2 : in std_logic_vector(3 downto 0);
	       w_data : in std_logic_vector(7 downto 0);
	       wr, rd_1, rd_2, clk, clr : in std_logic;
			 r_data_1, r_data_2 : out std_logic_vector(7 downto 0));
end bancoderegistradores;

architecture ckt of bancoderegistradores is

component decodificador is
  port(X : in std_logic_vector(3 downto 0);
       en : in std_logic;
		 Q : out std_logic_vector(15 downto 0));
end component;

component Registrador8bits is
  port (X : in  std_logic_vector (7 downto 0);
        ld, clr, clk : in std_logic;
        Q : out std_logic_vector (7 downto 0));
end component;

component multiplexador is
  port(X, en : in std_logic_vector(15 downto 0);
		 Q : out std_logic);
end component;

signal add_out_w, add_out_r_1, add_out_r_2 : std_logic_vector(15 downto 0);
signal q0, q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15 : std_logic_vector(7 downto 0);


begin

    decodificar_wr : decodificador port map(X=>addr_wr,en=>wr,Q=>add_out_w);
	 decodificar_rd_1 : decodificador port map(X=>addr_rd_1,en=>rd_1,Q=>add_out_r_1);
	 decodificar_rd_2 : decodificador port map(X=>addr_rd_2,en=>rd_2,Q=>add_out_r_2);
	 
	 reg0 : Registrador8bits port map(X=>w_data,ld=>add_out_w(0),clr=>clr,clk=>clk,Q=>q0);
	 reg1 : Registrador8bits port map(X=>w_data,ld=>add_out_w(1),clr=>clr,clk=>clk,Q=>q1);
	 reg2 : Registrador8bits port map(X=>w_data,ld=>add_out_w(2),clr=>clr,clk=>clk,Q=>q2);
	 reg3 : Registrador8bits port map(X=>w_data,ld=>add_out_w(3),clr=>clr,clk=>clk,Q=>q3);
	 reg4 : Registrador8bits port map(X=>w_data,ld=>add_out_w(4),clr=>clr,clk=>clk,Q=>q4);
	 reg5 : Registrador8bits port map(X=>w_data,ld=>add_out_w(5),clr=>clr,clk=>clk,Q=>q5);
	 reg6 : Registrador8bits port map(X=>w_data,ld=>add_out_w(6),clr=>clr,clk=>clk,Q=>q6);
	 reg7 : Registrador8bits port map(X=>w_data,ld=>add_out_w(7),clr=>clr,clk=>clk,Q=>q7);
	 reg8 : Registrador8bits port map(X=>w_data,ld=>add_out_w(8),clr=>clr,clk=>clk,Q=>q8);
	 reg9 : Registrador8bits port map(X=>w_data,ld=>add_out_w(9),clr=>clr,clk=>clk,Q=>q9);
	 reg10 : Registrador8bits port map(X=>w_data,ld=>add_out_w(10),clr=>clr,clk=>clk,Q=>q10);
	 reg11 : Registrador8bits port map(X=>w_data,ld=>add_out_w(11),clr=>clr,clk=>clk,Q=>q11);
	 reg12 : Registrador8bits port map(X=>w_data,ld=>add_out_w(12),clr=>clr,clk=>clk,Q=>q12);
	 reg13 : Registrador8bits port map(X=>w_data,ld=>add_out_w(13),clr=>clr,clk=>clk,Q=>q13);
	 reg14 : Registrador8bits port map(X=>w_data,ld=>add_out_w(14),clr=>clr,clk=>clk,Q=>q14);
	 reg15 : Registrador8bits port map(X=>w_data,ld=>add_out_w(15),clr=>clr,clk=>clk,Q=>q15);
	 
	 r1_0 : multiplexador port map(x(0)=>q0(0),x(1)=>q1(0),x(2)=>q2(0),x(3)=>q3(0),x(4)=>q4(0),x(5)=>q4(0),x(6)=>q6(0),x(7)=>q7(0),
	                               x(8)=>q8(0),x(9)=>q9(0),x(10)=>q10(0),x(11)=>q11(0),x(12)=>q12(0),x(13)=>q13(0),x(14)=>q14(0),x(15)=>q15(0),
											 en=>add_out_r_1,Q=>r_data_1(0));
    r1_1 : multiplexador port map(x(0)=>q0(1),x(1)=>q1(1),x(2)=>q2(1),x(3)=>q3(1),x(4)=>q4(1),x(5)=>q4(1),x(6)=>q6(1),x(7)=>q7(1),
	                               x(8)=>q8(1),x(9)=>q9(1),x(10)=>q10(1),x(11)=>q11(1),x(12)=>q12(1),x(13)=>q13(1),x(14)=>q14(1),x(15)=>q15(1),
											 en=>add_out_r_1,Q=>r_data_1(1));
	 r1_2 : multiplexador port map(x(0)=>q0(2),x(1)=>q1(2),x(2)=>q2(2),x(3)=>q3(2),x(4)=>q4(2),x(5)=>q4(2),x(6)=>q6(2),x(7)=>q7(2),
	                               x(8)=>q8(2),x(9)=>q9(2),x(10)=>q10(2),x(11)=>q11(2),x(12)=>q12(2),x(13)=>q13(2),x(14)=>q14(2),x(15)=>q15(2),
											 en=>add_out_r_1,Q=>r_data_1(2));
	 r1_3 : multiplexador port map(x(0)=>q0(3),x(1)=>q1(3),x(2)=>q2(3),x(3)=>q3(3),x(4)=>q4(3),x(5)=>q4(3),x(6)=>q6(3),x(7)=>q7(3),
	                               x(8)=>q8(3),x(9)=>q9(3),x(10)=>q10(3),x(11)=>q11(3),x(12)=>q12(3),x(13)=>q13(3),x(14)=>q14(3),x(15)=>q15(3),
											 en=>add_out_r_1,Q=>r_data_1(3));
	 r1_4 : multiplexador port map(x(0)=>q0(4),x(1)=>q1(4),x(2)=>q2(4),x(3)=>q3(4),x(4)=>q4(4),x(5)=>q4(4),x(6)=>q6(4),x(7)=>q7(4),
	                               x(8)=>q8(4),x(9)=>q9(4),x(10)=>q10(4),x(11)=>q11(4),x(12)=>q12(4),x(13)=>q13(4),x(14)=>q14(4),x(15)=>q15(4),
											 en=>add_out_r_1,Q=>r_data_1(4));
	 r1_5 : multiplexador port map(x(0)=>q0(5),x(1)=>q1(5),x(2)=>q2(5),x(3)=>q3(5),x(4)=>q4(5),x(5)=>q4(5),x(6)=>q6(5),x(7)=>q7(5),
	                               x(8)=>q8(5),x(9)=>q9(5),x(10)=>q10(5),x(11)=>q11(5),x(12)=>q12(5),x(13)=>q13(5),x(14)=>q14(5),x(15)=>q15(5),
											 en=>add_out_r_1,Q=>r_data_1(5));
	 r1_6 : multiplexador port map(x(0)=>q0(6),x(1)=>q1(6),x(2)=>q2(6),x(3)=>q3(6),x(4)=>q4(6),x(5)=>q4(6),x(6)=>q6(6),x(7)=>q7(6),
	                               x(8)=>q8(6),x(9)=>q9(6),x(10)=>q10(6),x(11)=>q11(6),x(12)=>q12(6),x(13)=>q13(6),x(14)=>q14(6),x(15)=>q15(6),
											 en=>add_out_r_1,Q=>r_data_1(6));
	 r1_7 : multiplexador port map(x(0)=>q0(7),x(1)=>q1(7),x(2)=>q2(7),x(3)=>q3(7),x(4)=>q4(7),x(5)=>q4(7),x(6)=>q6(7),x(7)=>q7(7),
	                               x(8)=>q8(7),x(9)=>q9(7),x(10)=>q10(7),x(11)=>q11(7),x(12)=>q12(7),x(13)=>q13(7),x(14)=>q14(7),x(15)=>q15(7),
											 en=>add_out_r_1,Q=>r_data_1(7));
	
	 mux0 : multiplexador port map(x(0)=>q0(0),x(1)=>q1(0),x(2)=>q2(0),x(3)=>q3(0),x(4)=>q4(0),x(5)=>q4(0),x(6)=>q6(0),x(7)=>q7(0),
	                               x(8)=>q8(0),x(9)=>q9(0),x(10)=>q10(0),x(11)=>q11(0),x(12)=>q12(0),x(13)=>q13(0),x(14)=>q14(0),x(15)=>q15(0),
											 en=>add_out_r_2,Q=>r_data_2(0));
    mux1 : multiplexador port map(x(0)=>q0(1),x(1)=>q1(1),x(2)=>q2(1),x(3)=>q3(1),x(4)=>q4(1),x(5)=>q4(1),x(6)=>q6(1),x(7)=>q7(1),
	                               x(8)=>q8(1),x(9)=>q9(1),x(10)=>q10(1),x(11)=>q11(1),x(12)=>q12(1),x(13)=>q13(1),x(14)=>q14(1),x(15)=>q15(1),
											 en=>add_out_r_2,Q=>r_data_2(1));
	 mux2 : multiplexador port map(x(0)=>q0(2),x(1)=>q1(2),x(2)=>q2(2),x(3)=>q3(2),x(4)=>q4(2),x(5)=>q4(2),x(6)=>q6(2),x(7)=>q7(2),
	                               x(8)=>q8(2),x(9)=>q9(2),x(10)=>q10(2),x(11)=>q11(2),x(12)=>q12(2),x(13)=>q13(2),x(14)=>q14(2),x(15)=>q15(2),
											 en=>add_out_r_2,Q=>r_data_2(2));
	 mux3 : multiplexador port map(x(0)=>q0(3),x(1)=>q1(3),x(2)=>q2(3),x(3)=>q3(3),x(4)=>q4(3),x(5)=>q4(3),x(6)=>q6(3),x(7)=>q7(3),
	                               x(8)=>q8(3),x(9)=>q9(3),x(10)=>q10(3),x(11)=>q11(3),x(12)=>q12(3),x(13)=>q13(3),x(14)=>q14(3),x(15)=>q15(3),
											 en=>add_out_r_2,Q=>r_data_2(3));
	 mux4 : multiplexador port map(x(0)=>q0(4),x(1)=>q1(4),x(2)=>q2(4),x(3)=>q3(4),x(4)=>q4(4),x(5)=>q4(4),x(6)=>q6(4),x(7)=>q7(4),
	                               x(8)=>q8(4),x(9)=>q9(4),x(10)=>q10(4),x(11)=>q11(4),x(12)=>q12(4),x(13)=>q13(4),x(14)=>q14(4),x(15)=>q15(4),
											 en=>add_out_r_2,Q=>r_data_2(4));
	 mux5 : multiplexador port map(x(0)=>q0(5),x(1)=>q1(5),x(2)=>q2(5),x(3)=>q3(5),x(4)=>q4(5),x(5)=>q4(5),x(6)=>q6(5),x(7)=>q7(5),
	                               x(8)=>q8(5),x(9)=>q9(5),x(10)=>q10(5),x(11)=>q11(5),x(12)=>q12(5),x(13)=>q13(5),x(14)=>q14(5),x(15)=>q15(5),
											 en=>add_out_r_2,Q=>r_data_2(5));
	 mux6 : multiplexador port map(x(0)=>q0(6),x(1)=>q1(6),x(2)=>q2(6),x(3)=>q3(6),x(4)=>q4(6),x(5)=>q4(6),x(6)=>q6(6),x(7)=>q7(6),
	                               x(8)=>q8(6),x(9)=>q9(6),x(10)=>q10(6),x(11)=>q11(6),x(12)=>q12(6),x(13)=>q13(6),x(14)=>q14(6),x(15)=>q15(6),
											 en=>add_out_r_2,Q=>r_data_2(6));
	 mux7 : multiplexador port map(x(0)=>q0(7),x(1)=>q1(7),x(2)=>q2(7),x(3)=>q3(7),x(4)=>q4(7),x(5)=>q4(7),x(6)=>q6(7),x(7)=>q7(7),
	                               x(8)=>q8(7),x(9)=>q9(7),x(10)=>q10(7),x(11)=>q11(7),x(12)=>q12(7),x(13)=>q13(7),x(14)=>q14(7),x(15)=>q15(7),
											 en=>add_out_r_2,Q=>r_data_2(7));
											 
end ckt;
											 
	
	
											 
	 





