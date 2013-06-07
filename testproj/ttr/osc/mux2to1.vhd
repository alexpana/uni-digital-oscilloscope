library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux2to1 is
	generic (
		n: integer
	);
	port (
		i1, i2:		in std_logic_vector( n-1 downto 0 );
		s:				in std_logic;
		o:				out std_logic_vector( n-1 downto 0 )
	);
end mux2to1;

architecture Behavioral of mux2to1 is

begin
	o <= i1 when s = '0' else i2;
end Behavioral;

