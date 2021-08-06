LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY divisor IS 
	PORT(A,B: IN unsigned(63 DOWNTO 0);
			C: OUT UNSIGNED(63 DOWNTO 0));
END ENTITY;

ARCHITECTURE comportamento OF divisor IS
--COMPONENT sub IS 
	--PORT(A,B: IN unsigned(16 DOWNTO 0);
		--C: OUT UNSIGNED(16 DOWNTO 0));
--END COMPONENT;
	TYPE MATUNSIGNED is ARRAY (16 DOWNTO 0) OF UNSIGNED (16 DOWNTO 0);
	SIGNAL AUX1,AUX2: MATUNSIGNED;
	SIGNAL AUXB,AUXC: UNSIGNED(16 DOWNTO 0);
   signal E : unsigned(10 downto 0) ;
	BEGIN
	AUX1(16)(15)<='1'WHEN  A(62 DOWNTO 52) /= 0;
	AUX1(16)(14 DOWNTO 0)<=A(51 DOWNTO 37);
	AUXB(15)<='1'WHEN  B(62 DOWNTO 52) /= 0;AUXB(14 DOWNTO 0)<=B(51 DOWNTO 37);
	
	repeticao: FOR i IN 15 DOWNTO 0 generate
		AUXC(i)<='1' WHEN AUX1(i+1)>=AUXB  ELSE '0';
	 AUX2(i)<=AUX1(i+1) - AUXB;--DIV: SUB PORT MAP(AUXC(i+1),auxb,aux2(i));
		AUX1(i)<=(AUX2(i) sll 1) WHEN AUX1(i+1)>=AUXB else 
			(AUX1(i+1) sll 1);
	END GENERATE; 
	C(51 downto 37)<= AUXC(14 DOWNTO 0) when auxc(15) = '1' else (auxc(13 downto 0)& '0');
	
	
   E <= (A(62 downto 52)-B(62 downto 52))-1 when auxc(15) = '0' else (A(62 downto 52)-B(62 downto 52));
	c(62 downto 52)<= (E+1023) when A(62 downto 52)/= 0 and B(62 downto 52)/= 0  else 
"11111111111" when B(62 downto 52) = 0 else
"00000000000"when A(62 downto 52) = 0	;

	
END ARCHITECTURE;

