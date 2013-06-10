----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    06:16:57 06/07/2013 
-- Design Name: 
-- Module Name:    sampler - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sampler is
    Port ( clk : in STD_LOGIC;
			  sampleValid : in  STD_LOGIC;
           sample : in  STD_LOGIC_VECTOR (7 downto 0);
           freq : in  STD_LOGIC_VECTOR (15 downto 0);
           addr : in  STD_LOGIC_VECTOR (8 downto 0);
           data : out  STD_LOGIC_VECTOR (7 downto 0);
           reqSample : out  STD_LOGIC;
			  workMode : in STD_LOGIC);
end sampler;

architecture Behavioral of sampler is
	type ramType is array (511 downto 0) of std_logic_vector (7 downto 0);
   signal ramMemory: ramType;
	
	signal we : std_logic;
		
	type StateType is (Idle, ChangeDetected, StartConversion, WaitUntilTheEndOfConversion, Sleep, EndSleep);
	
	signal currentState, nextState : StateType;
	
	signal diffSignal : std_logic;
	
	
	signal sweeper : std_logic_vector(8 downto 0);
	signal nextSweeper : std_logic_vector(8 downto 0);
	signal sweeperPlusOne : std_logic_vector(8 downto 0);
	signal selSweeper : std_logic_vector(1 downto 0);
	signal sweeperIs511 : std_logic;
	
	
	
	signal freqsw : std_logic_vector(15 downto 0);
	signal nextFreqsw : std_logic_vector(15 downto 0);
	signal freqswPlusOne : std_logic_vector(15 downto 0);
	signal selFreqsw : std_logic_vector(1 downto 0);
	
	signal prevFreq : std_logic_vector (15 downto 0) := (others => '0');
	
begin


	---------------------------
	with selSweeper select
		nextSweeper <=  (others => '0') when "00",
							 (others => '1') when "01",
							 sweeperPlusOne when "10",
							 sweeper when others;
						  
	process (clk)
	begin
		if  rising_edge(clk) then
			sweeper <= nextSweeper;
		end if;
	end process;
	
	
	
	sweeperPlusOne <= sweeper + 1;	
	---------------------------
	
	
	---------------------------
	with selFreqsw select
		nextFreqsw <=  (others => '0') when "00",
							 (others => '1') when "01",
							 freqswPlusOne when "10",
							 freqsw when others;
						  
	process (clk)
	begin
		if  rising_edge(clk) then
			freqsw <= nextFreqsw;
		end if;
	end process;	
	
	
	freqswPlusOne <= freqsw + 1;	
	---------------------------



	process (clk)
	begin
		if rising_edge(clk) then
			if we = '1' then
				ramMemory(conv_integer(sweeper)) <= sample;
			end if;
		end if;
	end process;
	
	data <= ramMemory(conv_integer(addr));
	
	
	
	process (sweeper)
		variable z : std_logic;
	begin
		z := '1';
		for i in sweeper'range loop
			z := z and sweeper(i);
		end loop;
		sweeperIs511 <= z;
	end process;
	
	
	process (clk)
	begin
		if rising_edge(clk) then
			prevFreq <= freq;
		end if;
	end process;
	
	
	process (prevFreq, freq)
	begin
		if prevFreq = freq then
			diffSignal <= '0';
		else
			diffSignal <= '1';
		end if;
	end process;
	
	
	
	process (currentState, diffSignal, sweeperIs511, sampleValid, freqsw, freq)
	begin		
		case currentState is
			when Idle =>
				reqSample <= '0';
				selSweeper <= "01";
				selFreqsw <= "00";
				we <= '0';
				
				if diffSignal = '1' then
					nextState <= ChangeDetected;
				else
					nextState <= Idle;
				end if;
				
			when ChangeDetected =>
				
				reqSample <= '0';
				selSweeper <= "01";
				selFreqsw <= "00";
				we <= '0';
				
				nextState <= StartConversion;
			
			when StartConversion =>				
				reqSample <= '1';
				selSweeper <= "10";				
				selFreqsw <= "00";
				we <= '0';
				
				nextState <= WaitUntilTheEndOfConversion;
				
			when WaitUntilTheEndOfConversion =>				
				reqSample <= '0';
				selSweeper <= "11";
				selFreqsw <= "00";
				we <= '0';
				
				if sampleValid = '1' then
					nextState <= Sleep;
				else 
					nextState <= WaitUntilTheEndOfConversion;
				end if;
					
			when Sleep =>				
				selSweeper <= "11";
				selFreqsw <= "10";
				reqSample <= '0';				
				we <= '0';
				
				if freqsw = freq then
					nextState <= EndSleep;
				else
					nextState <= Sleep;
				end if;
				
			when EndSleep =>
				selSweeper <= "11";
				selFreqsw <= "00";
				reqSample <= '0';				
				we <= '1';
				
				if workMode = '1' then
					nextState <= StartConversion;
				elsif sweeperIs511 = '1' then
					nextState <= Idle;
				else
					nextState <= StartConversion;
				end if;
			when others =>				
				selSweeper <= "01";
				selFreqsw <= "00";
				reqSample <= '0';
				
				we <= '0';
				nextState <= Idle;
		end case;
	end process;
	
	process (clk)
	begin
		if rising_edge(clk) then
			currentState <= nextState;
		end if;
	end process;	
	
end Behavioral;

