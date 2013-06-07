library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity vga_ctrl is
    Port ( 
		-- 50 HZ Clock
		clk:			in STD_LOGIC;
	 
		-- VGA Sync Output
		HSYNC:		out STD_LOGIC;
		VSYNC:		out STD_LOGIC;

		CE:			out STD_LOGIC;

		-- VGA Color Output
		X, Y:			out std_logic_vector(9 downto 0)
	);

end vga_ctrl;

architecture Behavioral of vga_ctrl is

-- Pixel Clock
signal clk25Hz:	STD_LOGIC;
signal hcounter:	STD_LOGIC_VECTOR(9 downto 0);
signal vcounter:	STD_LOGIC_VECTOR(9 downto 0);

begin

	X <= hcounter;
	Y <= vcounter;

	-- Frequency Divider
	process (clk)
	begin
		if rising_edge(clk) then

			if clk25Hz = '1' then
			
				-- increase the hcounter
				if hcounter = 799 then
					hcounter <= ( others => '0' );
					-- increase the vcounter 
					if vcounter = 524 then
						vcounter <= ( others => '0' );
					else
						vcounter <= vcounter + 1;
					end if;
				else
					hcounter <= hcounter + 1;
				end if;			
			end if;

			clk25Hz <= not clk25Hz;
		end if;
	end process;

	process (vcounter, hcounter)
	begin
			if vcounter >= 490 and vcounter < 492 then
			  VSYNC <= '0';
			else 
			  VSYNC <= '1';
			end if;

			if hcounter >= 656 and hcounter < 752 then
				HSYNC <= '0';
			else
				HSYNC <= '1';
			end if;
	end process;

	process (hcounter, vcounter)
	begin
		if hcounter < 640 and vcounter < 480 then
			CE <= '1';
		else
			CE <= '0';
		end if;
	end process;
	
end Behavioral;

