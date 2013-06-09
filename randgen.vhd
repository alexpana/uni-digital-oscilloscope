----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:10:36 06/07/2013 
-- Design Name: 
-- Module Name:    randgen - Behavioral 
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

entity randgen is
    Port ( startBit : in  STD_LOGIC;
           reqBit : in  STD_LOGIC;
           rbit : out  STD_LOGIC;
           rbitValid : out  STD_LOGIC;
           clk : in  STD_LOGIC);
end randgen;

architecture Behavioral of randgen is

	type StateType is (Idle, Delay, Delay1, Delay2, Delay3);	
	signal currentState, nextState : StateType;
	
	signal count : std_logic_vector(4 downto 0);	
	signal countIsZero : std_logic;
	signal countMinusOne : std_logic_vector(4 downto 0);	
	signal selCount : std_logic_vector(1 downto 0);
	signal nextCount : std_logic_vector(4 downto 0);

begin

	countIsZero <= not ( count(4) or count(3) or
								count(2) or count(1) or count(0));

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



	process(clk)
		variable randTemp : std_logic_vector(15 downto 0):=(15 => '1',others => '0');
		variable temp : std_logic := '0';
	begin
		if(rising_edge(clk)) then
			temp := randTemp(15) xor randTemp(14);
			randTemp(15 downto 1) := randTemp(14 downto 0);
			randTemp(0) := temp;
		end if;
		rbit <= randTemp(5);
	end process;

	

	process (reqBit, currentState, countIsZero)
	begin
		case currentState is
			when Idle =>
				rbitValid <= '1';
				selCount <= "00";
				if reqBit = '1' then
					nextState <= Delay;
				else 
					nextState <= Idle;
				end if;
			when Delay =>
				selCount <= "01";
				rbitValid <= '0';
				nextState <= Delay1;
				
			when Delay1 =>
				selCount <= "10";
				rbitValid <= '0';
				
				if countIsZero = '0' then
					nextState <= Delay1;
				else
					nextState <= Delay2;
				end if;			
			
			when Delay2	=>
				selCount <= "00";
				rbitValid <= '0';
				nextState <= Delay3;
			
			when Delay3 =>
				selCount <= "00";
				rbitValid <= '0';
				nextState <= Idle;
			
			when others =>
				selCount <= "00";
				rbitValid <= '0';
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

