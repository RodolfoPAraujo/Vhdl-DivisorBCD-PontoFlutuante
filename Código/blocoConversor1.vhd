LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY blocoConversor1 IS
	PORT(A:IN unsigned(15 DOWNTO 0);
	--	s:OUT std_logic_vector(15 DOWNTO 0);
		O:OUT unsigned(63 DOWNTO 0));
	--	m:out std_logic_vector(51 DOWNTO 0);
	--	e :out std_logic_vector(10 DOWNTO 0));
END ENTITY;

ARCHITECTURE comportamento OF blocoConversor1 IS
	component BCD0 IS
	PORT(A:IN unsigned(15 DOWNTO 0);
		O:OUT unsigned(15 DOWNTO 0));
	END component;
	COMPONENT IEEECON IS
		PORT(A:IN unsigned(15 DOWNTO 0);
		O:OUT unsigned(63 DOWNTO 0));
	END COMPONENT;
	SIGNAl aux1: unsigned(15 DOWNTO 0);
	signal aux2 : integer;
	signal aux3 : unsigned(63 DOWNTO 0);
	
	BEGIN
	
	bc1: BCD0 PORT MAP(A(15 DOWNTO 0),aux1(15 DOWNTO 0));
	BC2: ieeecon port map(aux1,aux3); 
 --	s<=aux1; 
--	m <=aux3(51 downto 0);
--	e <=aux3(62 downto 52);
	o<=aux3;
END ARCHITECTURE;

