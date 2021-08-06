LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY BCD0 IS
	PORT(A:IN unsigned(15 DOWNTO 0);
		O:OUT unsigned(15 DOWNTO 0));
END ENTITY;

ARCHITECTURE comportamento OF BCD0 IS
	TYPE intvect IS ARRAY (8 DOWNTO 0) OF unsigned(15 downto 0);
	SIGNAL s1,s2:intvect ;
	signal aux3:unsigned(7 downto 0); 
	
	BEGIN
	aux3<=A(15 DOWNTO 12)*10 + A(11 DOWNTO 8);
	O(15 DOWNTO 8)<=aux3;
		
	s2(0)(7 DOWNTO 0)<=A(7 DOWNTO 4)*10 +A(3 DOWNTO 0);
	repeticao: FOR i in 0 to 7 generate
			s1(i)<=s2(i)(7 downto 0)*2;
			o(7-i)<= '1'	when s1(i)>=100 else '0';
			s2(i+1)<= (s1(i)-100) when s1(i)>=100 else  s1(i);
	END generate;
	
END ARCHITECTURE;

