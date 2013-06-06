library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sample_mem is
	port(
		clk: 		in std_logic;
		
		we:		in std_logic;
		addr:		in std_logic_vector(8 downto 0);

		dataIn:	in std_logic_vector(8 downto 0);
		dataOut:	out std_logic_vector(8 downto 0)
	);
end sample_mem;

architecture Behavioral of sample_mem is

begin

	-- Liniar sample simulation
	process (clk)
	begin
		if rising_edge(clk) then
			dataOut <= "011111111";
		end if;
	end process;
	
end Behavioral;

