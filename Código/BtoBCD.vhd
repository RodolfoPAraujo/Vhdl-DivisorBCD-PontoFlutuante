LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY BtoBCD IS
	PORT (A:IN UNSIGNED(15 DOWNTO 0);
		B: OUT UNSIGNED(15 DOWNTO 0));
		
END ENTITY;

ARCHITECTURE comportamento OF  BtoBCD IS
	
	SIGNAL AUX1, AUX2:UNSIGNED(7 DOWNTO 0);
	signal aux3,aux4,aux5, SA,sb,sc,sd,se,sf,sg,sh ,S : UNSIGNED (13 DOWNTO 0);
	BEGIN
	AUX1<=A(15 DOWNTO 8) / 10;
	AUX2<=A(15 DOWNTO 8) REM 10;
	B(15 DOWNTO 12)<=AUX1(3 DOWNTO 0);B(11 DOWNTO 8)<=AUX2(3 DOWNTO 0);
	sa<= "01001110001000" when a(7) = '1' else "00000000000000";
	sb<= "00100111000100" when a(6) = '1' else "00000000000000";
	sc<= "00010011100010" when a(5) = '1' else "00000000000000";
	sd<= "00001001110001" when a(4) = '1' else "00000000000000";
	se<= "00000100111000" when a(3) = '1' else "00000000000000";
	sf<= "00000010011100" when a(2) = '1' else "00000000000000";
	sg<= "00000001001110" when a(1) = '1' else "00000000000000";
	sh<= "00000000100111" when a(0) = '1' else "00000000000000";
	s<=(sa+sb+sc+sd+se+sf+sg+sh);
	aux3<=s/1000;
	
	AUX4<= s REM 1000;
	aux5<=aux4/100;
	B(7 downto 4) <= aux3(3 downto 0 );
	
	B(3 downto 0) <= aux5(3 downto 0 );
	
	
END ARCHITECTURE;
