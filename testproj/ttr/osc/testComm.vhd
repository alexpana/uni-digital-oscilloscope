--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   03:47:18 06/07/2013
-- Design Name:   
-- Module Name:   E:/SEM2/SSC/project-repo/uni-digital-oscilloscope/testproj/ttr/osc/testComm.vhd
-- Project Name:  osc
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comm
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY testComm IS
END testComm;
 
ARCHITECTURE behavior OF testComm IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comm
    PORT(
         reqSample : IN  std_logic;
         clk : IN  std_logic;
         rbit : IN  std_logic;
         rbitValid : IN  std_logic;
         startBit : OUT  std_logic;
         reqBit : OUT  std_logic;
			sampleValid : OUT STD_LOGIC;
         sample : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reqSample : std_logic := '0';
   signal clk : std_logic := '0';
   signal rbit : std_logic := '0';
   signal rbitValid : std_logic := '0';

 	--Outputs
   signal startBit : std_logic;
   signal reqBit : std_logic;
   signal sample : std_logic_vector(7 downto 0);
	signal sampleValid : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	
	
	
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comm PORT MAP (
          reqSample => reqSample,
          clk => clk,
          rbit => rbit,
          rbitValid => rbitValid,
          startBit => startBit,
          reqBit => reqBit,
			 sampleValid => sampleValid,
          sample => sample
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		
		
		reqSample <= '1';
		wait for clk_period * 4;
		wait for clk_period * 290;
		
	
		

      -- insert stimulus here 

      wait;
   end process;
	
	
	
	
	sim_process: process
		variable x : std_logic := '0';
	begin			
		for i in 0 to 10 * 8 loop
			rbit <= x;
			x := x xor '1';
			rbitValid <= '1';
			wait for clk_period;
			rbitValid <= '0';		
			wait for clk_period * 290;
				
			if i mod 8 = 0 then
				x := not x;
			end if;
		end loop;
		wait;
	end process;
END;
