LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY Divisao_IEEE IS
	PORT( A:IN unsigned(15 DOWNTO 0);
	B:IN unsigned(15 DOWNTO 0);
		O:OUT unsigned(15 DOWNTO 0));
END ENTITY;
ARCHITECTURE comportamento OF Divisao_IEEE  IS
component entrada IS
	PORT( A:IN unsigned(15 DOWNTO 0);
	B:IN unsigned(15 DOWNTO 0);
		OA:OUT unsigned(63 DOWNTO 0);
		OB : out UNSIGNED (63 DOWNTO 0));
END component;
component divisor IS 
	PORT(A,B: IN unsigned(63 DOWNTO 0);
			C: OUT UNSIGNED(63 DOWNTO 0));
END component;
component IEEEtoBCD IS
	PORT(A:IN unsigned(63 downto 0);
		SBCD:OUT UNSIGNED(15 downto 0));
END component;
signal aux1, aux2,aux3 :UNSIGNED (63 DOWNTO 0);

	BEGIN
	
	ENTRADAS: entrada PORT MAP(A,B,aux1,aux2);
	div: divisor PORT MAP (aux1,aux2,aux3);
	saida :IEEEtoBCD port map (aux3,o);
	
	
END ARCHITECTURE;