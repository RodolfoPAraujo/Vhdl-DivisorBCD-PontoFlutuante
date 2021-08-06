LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY shiftr IS
	PORT (A:IN unsigned(10 DOWNTO 0);--posição do 1º '1'
	B:IN unsigned(15 DOWNTO 0);
	C:OUT unsigned(15 DOWNTO 0));
END ENTITY;

ARCHITECTURE comportamento OF shiftr IS
	TYPE intvect IS ARRAY (16 DOWNTO 0) OF unsigned(16 downto 0);
	SIGNAL AUX : INTVECT; 
	BEGIN
	AUX(16)(15 DOWNTO 0)<=B;
	AUX(16)(16)<='1';
	repticao: for i in 15 DOWNTO 0 generate
		AUX(i)<=(AUX(i+1) srl 1) WHEN i>=A ELSE aux(i+1);
		--AUX(i)(i)<='1' WHEN i=A;
	END GENERATE;
	C<=aux(0)(15 DOWNTO 0);


END ARCHITECTURE;