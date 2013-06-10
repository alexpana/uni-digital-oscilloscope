--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:21:15 06/09/2013
-- Design Name:   
-- Module Name:   E:/SEM2/SSC/project-repo/uni-digital-oscilloscope/oscTopTest.vhd
-- Project Name:  oscilloscope
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
 
ENTITY oscTopTest IS
END oscTopTest;
 
ARCHITECTURE behavior OF oscTopTest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT oscTop
    PORT(
         sw : IN  std_logic_vector(7 downto 0);
         clk : IN  std_logic;
         HSYNC : OUT  std_logic;
         VSYNC : OUT  std_logic;
         OutRed : OUT  std_logic;
         OutGreen : OUT  std_logic;
         OutBlue : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal sw : std_logic_vector(7 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal HSYNC : std_logic;
   signal VSYNC : std_logic;
   signal OutRed : std_logic;
   signal OutGreen : std_logic;
   signal OutBlue : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: oscTop PORT MAP (
          sw => sw,
          clk => clk,
          HSYNC => HSYNC,
          VSYNC => VSYNC,
          OutRed => OutRed,
          OutGreen => OutGreen,
          OutBlue => OutBlue
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
		
		sw <= (others => '1');
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
