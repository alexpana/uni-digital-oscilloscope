library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cmp is
	port(
		x, y:		in std_logic_vector( 8 downto 0 );
		equal:	out std_logic;
		less:		out std_logic
	);
end cmp;

architecture Behavioral of cmp is

begin

	less <= '1' when x < y else '0';

	equal <= not( 
		(x(0) xor y(0)) or (x(1) xor y(1)) or (x(2) xor y(2)) or (x(3) xor y(3)) or
		(x(4) xor y(4)) or (x(5) xor y(5)) or (x(6) xor y(6)) or (x(7) xor y(7)) or 
		(x(8) xor y(8)));
end Behavioral;

