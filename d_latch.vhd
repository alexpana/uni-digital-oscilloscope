library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity d_latch is
	port(
		D:	in std_logic_vector( 8 downto 0 );
		clk,we, rst: in std_logic;
		Q: out std_logic_vector( 8 downto 0 )
	);
end d_latch;

architecture Behavioral of d_latch is
	signal S: std_logic_vector( 8 downto 0 );
begin

	process( clk )
	begin
		if rising_edge(clk) then
			if rst = '1' then
				S <= ( others => '0' );
			else
				if we = '1' then
					S <= D;
				end if;
			end if;
		end if;
	end process;

	Q <= S;

end Behavioral;

