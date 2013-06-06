library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity toplevel is
	port(
		-- Basys2 input clock
		clk: 			in std_logic;
		
		-- Basys2 output vga
		HSYNC:		out STD_LOGIC;
		VSYNC:		out STD_LOGIC;
		OutRed: 		out STD_LOGIC_VECTOR( 2 downto 0 );
		OutGreen: 	out STD_LOGIC_VECTOR( 2 downto 0 );
		OutBlue: 	out STD_LOGIC_VECTOR( 2 downto 1 )
	);
end toplevel;

architecture Behavioral of toplevel is
	signal sx, sy:	std_logic_vector( 9 downto 0 );
	signal ssample: std_logic_vector( 8 downto 0 );
	signal sel: std_logic;
	signal color1: std_logic_vector( 7 downto 0 );
	signal color2: std_logic_vector( 7 downto 0 );
	signal ce: std_logic;
begin

C_VGA_CTRL: entity work.vga_ctrl
				port map( clk, HSYNC, VSYNC, ce, sx, sy );

C_MEM:		entity work.sample_mem
				port map( clk, '0', sx(8 downto 0), "000000000", ssample );

C_CMP:		entity work.cmp
				port map( ssample, sy(8 downto 0), sel );

C_MUX1:		entity work.mux2to1		
				generic map( 8 )
				port map( "00000000", "11111111", sel, color1 );
				
C_MUX2:		entity work.mux2to1
				generic map( 8 )
				port map( "00000000", color1, ce, color2 );

OutRed <= color2( 7 downto 5 );
OutGreen <= color2( 4 downto 2 );
OutBlue <= color2( 1 downto 0 );

end Behavioral;