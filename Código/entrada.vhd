LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY entrada IS
	PORT( A:IN unsigned(15 DOWNTO 0);
	B:IN unsigned(15 DOWNTO 0);
		OA:OUT unsigned(63 DOWNTO 0);
		OB : out UNSIGNED (63 DOWNTO 0));
END ENTITY;

ARCHITECTURE comportamento OF entrada IS
	component blocoConversor1 IS
	PORT(A:IN unsigned(15 DOWNTO 0);

		O:OUT unsigned(63 DOWNTO 0));
end component;

	BEGIN
	
	ENTRADA1: blocoConversor1 PORT MAP(A,OA);
	ENTRADA2: blocoConversor1 PORT MAP(B,OB);

		
END ARCHITECTURE;