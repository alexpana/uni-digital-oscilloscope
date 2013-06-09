----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:06:11 06/07/2013 
-- Design Name: 
-- Module Name:    comm - Behavioral 
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

entity comm is
    Port ( reqSample : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rbit : in  STD_LOGIC;
           rbitValid : in  STD_LOGIC;
           startBit : out  STD_LOGIC;
           reqBit : out  STD_LOGIC;
			  sampleValid : out STD_LOGIC;
           sample : out  STD_LOGIC_VECTOR (7 downto 0));
end comm;

architecture Behavioral of comm is
	type StateType is (Idle, BeginSendStartBit, SendStartBit, BeginSendReqBit, SendReqBit, Waiting, BitValid, SampleEnd);
	
	signal currentState, nextState : StateType;

	signal count : std_logic_vector(6 downto 0);	
	signal countIsZero : std_logic;
	signal countMinusOne : std_logic_vector(6 downto 0);	
	signal selCount : std_logic_vector(1 downto 0);
	signal nextCount : std_logic_vector(6 downto 0);
	
	signal bitCount : std_logic_vector(3 downto 0);
	signal bitCountIsZero : std_logic;
	signal bitCountMinusOne : std_logic_vector(3 downto 0);
	signal selBitCount : std_logic_vector(1 downto 0);
	signal nextBitCount : std_logic_vector(3 downto 0);
	
	signal tmpShift : std_logic_vector(7 downto 0);
	signal shiftEnable : std_logic;
	
begin
	
	countIsZero <= not (count(6) or count(5) or count(4) or count(3) or
								count(2) or count(1) or count(0));
								
									
	bitCountIsZero <= not (bitCount(3) or bitCount(2) or bitCount(1) or bitCount(0));
								
								
	bitCountMinusOne <= bitCount - 1;
	countMinusOne <= count - 1;
---------------------------	
	with selCount select
		nextCount <=  (others => '0') when "00",
						  (others => '1') when "01",
						  countMinusOne when "10",
						  count when others;
						  
	process (clk)
	begin
		if  rising_edge(clk) then
			count <= nextCount;
		end if;
	end process;
	
---------------------------	
	with selBitCount select
		nextBitCount <=  (others => '0') when "00",
						  "0111" when "01",
						  bitCountMinusOne when "10",
						  bitCount when others;
						  
	process (clk)
	begin
		if  rising_edge(clk) then
			bitCount <= nextBitCount;
		end if;
	end process;
---------------------------


	
	-- Define a temporary signal that is of type std_logic_vector(<width>-1 downto 0).
	-- Where width is the number of bits to shift
	process (clk)
	begin
		if rising_edge(clk) then  
			if shiftEnable = '1' then 
				for i in 0 to 6 loop
					tmpShift(i+1) <= tmpShift(i);
				end loop;
				tmpShift(0) <= rbit; 
			end if; 
		end if;
	end process;
	
	sample <= tmpShift;
	
	
	process (currentState, reqSample, rbitValid, countIsZero, bitCountIsZero, count)
	begin		
		case currentState is
			when Idle =>
				sampleValid <= '0';
				startBit <= '0';
				reqBit <= '0';
				selCount <= "00";
				selBitCount <= "00";
				shiftEnable <= '0';
				
				if reqSample = '1' then
					nextState <= BeginSendStartBit;
				else 
					nextState <= Idle;
				end if;
			
			when BeginSendStartBit =>
				sampleValid <= '0';
				startBit <= '0';
				reqBit <= '0';
				selCount <= "01";
				selBitCount <= "01";
				shiftEnable <= '0';
				
				nextState <= SendStartBit;
				
			when SendStartBit =>
				sampleValid <= '0';
				startBit <= count(6);
				reqBit <= '0';
				selCount <= "10";
				selBitCount <= "11";
				shiftEnable <= '0';
				
				if countIsZero = '1' then
					nextState <= BeginSendReqBit;
				else
					nextState <= SendStartBit;						
				end if;
				
			when BeginSendReqBit =>
				sampleValid <= '0';
				startBit <= '0';
				reqBit <= '0';
				selCount <= "01";
				selBitCount <= "11";
				shiftEnable <= '0';
				
				nextState <= SendReqBit;
				
				
			when SendReqBit =>
				sampleValid <= '0';
				startBit <= '0';
				reqBit <= count(6);
				selCount <= "10";
				selBitCount <= "11";
				shiftEnable <= '0';
				
				if countIsZero = '1' then
					nextState <= Waiting;
				else
					nextState <= SendReqBit;
				end if;
				
			when Waiting =>
				
				sampleValid <= '0';
				startBit <= '0';
				reqBit <= '0';
				selCount <= "00";
				selBitCount <= "11";
				
				
				if rbitValid = '1' then
					nextState <= BitValid;
					shiftEnable <= '1';
				else
					nextState <= Waiting;
					shiftEnable <= '0';
				end if;
			
			when BitValid =>				
				sampleValid <= '0';
				startBit <= '0';
				reqBit <= '0';
				selCount <= "00";
				selBitCount <= "10";
				shiftEnable <= '0';
				if bitCountIsZero = '1' then
					nextState <= SampleEnd;
				else 
					nextState <= BeginSendReqBit;
				end if;
			
			when SampleEnd =>
				sampleValid <= '1';
				startBit <= '0';
				reqBit <= '0';
				selCount <= "00";
				selBitCount <= "10";
				shiftEnable <= '0';				
				nextState <= Idle;
				
			when others =>					
				sampleValid <= '0';
				shiftEnable <= '0';
				startBit <= '0';
				reqBit <= '0';
				selCount <= "00";
				selBitCount <= "00";									
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

