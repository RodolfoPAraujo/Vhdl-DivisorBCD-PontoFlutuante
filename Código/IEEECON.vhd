LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY IEEECON IS
	PORT(A:IN unsigned(15 DOWNTO 0);
	O:OUT unsigned(63 DOWNTO 0));
	
END ENTITY;

ARCHITECTURE comportamento OF IEEECON IS
	--	component concatenar IS
	--		PORT(A:IN unsigned(15 DOWNTO 0);
	--			B:in integer;
	--			O:OUT unsigned(15 DOWNTO 0));
	--	END component;
    TYPE intvect IS ARRAY (16 DOWNTO 0) OF integer;
    
    TYPE unsgvect IS ARRAY (16 DOWNTO 0) OF unsigned(15 downto 0);
    SIGNAL AUX : UNSGVECT; 
    signal exp: intvect;
    signal expo : integer;
    signal aux3 : unsigned(10 downto 0);
    begin
   	exp(16) <= 16;
	repeticao:FOR i in 15 downto 0 generate
		EXP(i)<= i WHEN A(i)='1'AND EXP(i+1) = 16	else exp(i+1);
	end generate;
	expo<=1023+(exp(0)-8);
	aux3<=to_unsigned(expo,11);
	O(62 downto 52)<= aux3 when exp(0)< 16 else "00000000000" ;
	
	AUX(16)<= A;
	repeticao1:	FOR i in 15 downto 0 generate
		aux(i)<= aux(i+1)(14 downto 0 )&'0' when i>=EXP(0) ELSE aux(i+1);
		end generate;
	o(51 DOWNTO 36)<= aux(0);
	
	
	

	
	

END ARCHITECTURE;



