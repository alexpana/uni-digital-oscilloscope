library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity oscTop is
	port ( 		sw : in  STD_LOGIC_VECTOR (7 downto 0);
					clk : in  STD_LOGIC;
						-- Basys2 output vga
					
					HSYNC:		out STD_LOGIC;
					VSYNC:		out STD_LOGIC;
					OutRed: 		out STD_LOGIC_VECTOR(2 downto 0);
					OutGreen: 	out STD_LOGIC_VECTOR(2 downto 0);
					OutBlue: 	out STD_LOGIC_VECTOR(1 downto 0)
				);
end oscTop;

architecture Behavioral of oscTop is

	component sampler is
    Port ( clk : in STD_LOGIC;
			  sampleValid : in  STD_LOGIC;
           sample : in  STD_LOGIC_VECTOR (7 downto 0);
           freq : in  STD_LOGIC_VECTOR (15 downto 0);
           addr : in  STD_LOGIC_VECTOR (8 downto 0);
           data : out  STD_LOGIC_VECTOR (7 downto 0);
           reqSample : out  STD_LOGIC;
			  workMode : in STD_LOGIC);
	end component;
	
	
	component comm is
    Port ( reqSample : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rbit : in  STD_LOGIC;
           rbitValid : in  STD_LOGIC;
           startBit : out  STD_LOGIC;
           reqBit : out  STD_LOGIC;
			  sampleValid : out STD_LOGIC;
           sample : out  STD_LOGIC_VECTOR (7 downto 0));
	end component;
	
	
	component randgen is
    Port ( startBit : in  STD_LOGIC;
           reqBit : in  STD_LOGIC;
           rbit : out  STD_LOGIC;
           rbitValid : out  STD_LOGIC;
           clk : in  STD_LOGIC);
	end component;
	
	
	signal sample : std_logic_vector (7 downto 0);
	signal freq : std_logic_vector (15 downto 0);
	signal addr : std_logic_vector (8 downto 0);
	signal data : std_logic_vector (7 downto 0);
	signal sampleValid : std_logic;	
	signal reqSample : std_logic;
	
	signal rbit : std_logic;
	signal rbitValid : std_logic;
	signal startBit : std_logic;
	signal reqBit : std_logic;
	
	
	signal sx, sy, correctedSy:	std_logic_vector( 9 downto 0 );
	
	signal ssample: std_logic_vector( 8 downto 0 );
	signal sbuffer, last_sample: std_logic_vector( 8 downto 0 );
	signal en: std_logic_vector( 1 downto 0 );

	signal sel, cmp_eq_0, cmp_eq_1, cmp_less_0, cmp_less_1: std_logic;

	signal color1: std_logic_vector( 7 downto 0 );
	signal color2: std_logic_vector( 7 downto 0 );
	signal ce: std_logic;
	
	signal tmp : std_logic_vector(8 downto 0);
		
begin

	freq <= "0000" & sw(7 downto 1) & "00000";	
	
	
	cerebot_comm : comm port map (
			reqSample => reqSample,
			clk => clk,
			rbit => rbit,
			rbitValid => rbitValid,
			startBit => startBit,
			reqBit => reqBit,
			sampleValid => sampleValid,
			sample => sample );
			
	tmp <= '0' & sw;
			
	fpga_sampler : sampler port map (
			clk => clk,
			sampleValid => sampleValid,
			sample => sample,
			freq => freq,
			addr => sx(8 downto 0),
			data => ssample(7 downto 0),
			reqSample => reqSample,
			workMode => sw(0)
		);
		
		
	myrand : randgen port map (
		startBit => startBit,
	   reqBit => reqBit,
	   rbit => rbit,
	   rbitValid => rbitValid,
		clk => clk
	);
	
	
	C_VGA_CTRL: entity work.vga_ctrl
					port map( clk, HSYNC, VSYNC, ce, sx, sy );

	C_CMP1:		entity work.cmp
					port map( ssample, correctedSy(8 downto 0), cmp_eq_1, cmp_less_1 );
					
	C_CMP2:		entity work.cmp
					port map( last_sample, correctedSy(8 downto 0), cmp_eq_0, cmp_less_0 );
					
	C_MUX1:		entity work.mux2to1		
					generic map( 8 )
					port map( "00000000", "11111111", sel, color1 );
				
	C_MUX2:		entity work.mux2to1
					generic map( 8 )
					port map( "00000000", color1, ce, color2 );

	D1:			entity work.d_latch
					port map( ssample, clk, '1', '0', sbuffer );
	D2:			entity work.d_latch
					port map( sbuffer, clk, '1', '0', last_sample);

	sel <= cmp_eq_0 or ( cmp_less_1 and (not cmp_less_0) ) or ( cmp_less_0 and (not cmp_less_1) );
					
	OutRed <= color2( 7  downto 5);
	OutGreen <= color2( 4 downto 2);
	OutBlue <= color2( 1  downto 0);

	correctedSy <= 320 - sy;

end Behavioral;

