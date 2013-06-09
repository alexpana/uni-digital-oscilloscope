--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:18:25 06/07/2013
-- Design Name:   
-- Module Name:   E:/SEM2/SSC/project-repo/uni-digital-oscilloscope/testproj/ttr/osc/testSampler.vhd
-- Project Name:  osc
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sampler
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
 
ENTITY testSampler IS
END testSampler;
 
ARCHITECTURE behavior OF testSampler IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sampler
    PORT(
         clk : IN  std_logic;
         sampleValid : IN  std_logic;
         sample : IN  std_logic_vector(7 downto 0);
         freq : IN  std_logic_vector(15 downto 0);
         addr : IN  std_logic_vector(8 downto 0);
         data : OUT  std_logic_vector(7 downto 0);
         reqSample : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal sampleValid : std_logic := '0';
   signal sample : std_logic_vector(7 downto 0) := (others => '0');
   signal freq : std_logic_vector(15 downto 0) := (others => '0');
   signal addr : std_logic_vector(8 downto 0) := (others => '0');

 	--Outputs
   signal data : std_logic_vector(7 downto 0);
   signal reqSample : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sampler PORT MAP (
          clk => clk,
          sampleValid => sampleValid,
          sample => sample,
          freq => freq,
          addr => addr,
          data => data,
          reqSample => reqSample
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

      -- insert stimulus here 

      wait;
   end process;

END;
