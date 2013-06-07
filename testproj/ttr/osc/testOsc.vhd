--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:01:31 06/07/2013
-- Design Name:   
-- Module Name:   E:/SEM2/SSC/project-repo/uni-digital-oscilloscope/testproj/ttr/osc/testOsc.vhd
-- Project Name:  osc
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: oscTop
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
 
ENTITY testOsc IS
END testOsc;
 
ARCHITECTURE behavior OF testOsc IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT oscTop
    PORT(
         sw : IN  std_logic_vector(7 downto 0);
         btn : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         led : OUT  std_logic_vector(7 downto 0);
         an : OUT  std_logic_vector(3 downto 0);
         cat : OUT  std_logic_vector(6 downto 0);
         dp : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sw : std_logic_vector(7 downto 0) := (others => '0');
   signal btn : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal led : std_logic_vector(7 downto 0);
   signal an : std_logic_vector(3 downto 0);
   signal cat : std_logic_vector(6 downto 0);
   signal dp : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: oscTop PORT MAP (
          sw => sw,
          btn => btn,
          clk => clk,
          led => led,
          an => an,
          cat => cat,
          dp => dp
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
		sw <= "10101010";

      -- insert stimulus here 

      wait;
   end process;

END;
