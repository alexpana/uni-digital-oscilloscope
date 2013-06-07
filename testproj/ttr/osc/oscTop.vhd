----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    07:20:51 06/07/2013 
-- Design Name: 
-- Module Name:    oscTop - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity oscTop is
	port ( 		sw : in  STD_LOGIC_VECTOR (7 downto 0);
					btn : in  STD_LOGIC_VECTOR (3 downto 0);
					clk : in  STD_LOGIC;
					led : out  STD_LOGIC_VECTOR (7 downto 0);
					an : out  STD_LOGIC_VECTOR (3 downto 0);
					cat : out  STD_LOGIC_VECTOR (6 downto 0);
					dp : out  STD_LOGIC
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
           reqSample : out  STD_LOGIC);
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
	
		
begin

	freq <= "0000" & sw & "0000";
	
	
	cerebot_comm : comm port map (
			reqSample => reqSample,
			clk => clk,
			rbit => rbit,
			rbitValid => rbitValid,
			startBit => startBit,
			reqBit => reqBit,
			sampleValid => sampleValid,
			sample => sample );
			
	fpga_sampler : sampler port map (
			clk => clk,
			sampleValid => sampleValid,
			sample => sample,
			freq => freq,
			addr => addr,
			data => data,
			reqSample => reqSample
		);
		
		
	myrand : randgen port map (
		startBit => startBit,
	   reqBit => reqBit,
	   rbit => rbit,
	   rbitValid => rbitValid,
		clk => clk
	);
	
	addr <= "000000010";
			
	led <= data;
	an <= (others => '0');
	cat <= (others => '0');
	dp <= '0';
end Behavioral;

