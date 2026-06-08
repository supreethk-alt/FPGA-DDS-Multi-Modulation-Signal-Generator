----------------------------------------------------------------------------
--- The following code convert the 256 sine wave descrete value to Analog Sine wave 
--- through MCP4921 and output sine wave data is available at j7 connector DAC OUT pin

----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity DAC is
	port(
		CLK: in std_logic; 		-- 50 Mhz External Clock
		SINE: in std_logic_vector (15 downto 0);
		SCK: out std_logic;     -- SPI Clock
		CS: out std_logic;		-- SPI Chip Select
		MOSI: out std_logic		-- SPI Master Out Salve In

	);
end DAC;

architecture behavioral of DAC is
signal SEND: std_logic:='1';
signal CLK2: std_logic;	-- 16.667 MHz Divided clock
--signal i : integer range 0 to 255:=0;
signal VALUE: std_logic_vector (15 downto 0);
--		type memory is array (0 to 255) of std_logic_vector(15 downto 0);
--		constant sine : memory := (
--			X"8000", X"8324", X"8647", X"896a", X"8c8b", X"8fab", X"92c7", X"95e1", 
--			X"98f8", X"9c0b", X"9f19", X"a223", X"a527", X"a826", X"ab1e", X"ae10", 
--			X"b0fb", X"b3de", X"b6b9", X"b98c", X"bc56", X"bf16", X"c1cd", X"c47a", 
--			X"c71c", X"c9b3", X"cc3f", X"cebf", X"d133", X"d39a", X"d5f4", X"d842", 
--			X"da81", X"dcb3", X"ded6", X"e0eb", X"e2f1", X"e4e7", X"e6ce", X"e8a5", 
--			X"ea6c", X"ec23", X"edc9", X"ef5e", X"f0e1", X"f254", X"f3b5", X"f503", 
--			X"f640", X"f76b", X"f883", X"f989", X"fa7c", X"fb5c", X"fc29", X"fce2", 
--			X"fd89", X"fe1c", X"fe9c", X"ff08", X"ff61", X"ffa6", X"ffd7", X"fff5", 
--			X"ffff", X"fff5", X"ffd7", X"ffa6", X"ff61", X"ff08", X"fe9c", X"fe1c", 
--			X"fd89", X"fce2", X"fc29", X"fb5c", X"fa7c", X"f989", X"f883", X"f76b", 
--			X"f640", X"f503", X"f3b5", X"f254", X"f0e1", X"ef5e", X"edc9", X"ec23", 
--			X"ea6c", X"e8a5", X"e6ce", X"e4e7", X"e2f1", X"e0eb", X"ded6", X"dcb3", 
--			X"da81", X"d842", X"d5f4", X"d39a", X"d133", X"cebf", X"cc3f", X"c9b3", 
--			X"c71c", X"c47a", X"c1cd", X"bf16", X"bc56", X"b98c", X"b6b9", X"b3de", 
--			X"b0fb", X"ae10", X"ab1e", X"a826", X"a527", X"a223", X"9f19", X"9c0b", 
--			X"98f8", X"95e1", X"92c7", X"8fab", X"8c8b", X"896a", X"8647", X"8324", 
--			X"8000", X"7cdb", X"79b8", X"7695", X"7374", X"7054", X"6d38", X"6a1e", 
--			X"6707", X"63f4", X"60e6", X"5ddc", X"5ad8", X"57d9", X"54e1", X"51ef", 
--			X"4f04", X"4c21", X"4946", X"4673", X"43a9", X"40e9", X"3e32", X"3b85", 
--			X"38e3", X"364c", X"33c0", X"3140", X"2ecc", X"2c65", X"2a0b", X"27bd", 
--			X"257e", X"234c", X"2129", X"1f14", X"1d0e", X"1b18", X"1931", X"175a", 
--			X"1593", X"13dc", X"1236", X"10a1", X"0f1e", X"0dab", X"0c4a", X"0afc", 
--			X"09bf", X"0894", X"077c", X"0676", X"0583", X"04a3", X"03d6", X"031d", 
--			X"0276", X"01e3", X"0163", X"00f7", X"009e", X"0059", X"0028", X"000a", 
--			X"0001", X"000a", X"0028", X"0059", X"009e", X"00f7", X"0163", X"01e3", 
--			X"0276", X"031d", X"03d6", X"04a3", X"0583", X"0676", X"077c", X"0894", 
--			X"09bf", X"0afc", X"0c4a", X"0dab", X"0f1e", X"10a1", X"1236", X"13dc", 
--			X"1593", X"175a", X"1931", X"1b18", X"1d0e", X"1f14", X"2129", X"234c", 
--			X"257e", X"27bd", X"2a0b", X"2c65", X"2ecc", X"3140", X"33c0", X"364c", 
--			X"38e3", X"3b85", X"3e32", X"40e9", X"43a9", X"4673", X"4946", X"4c21", 
--			X"4f04", X"51ef", X"54e1", X"57d9", X"5ad8", X"5ddc", X"60e6", X"63f4", 
--			X"6707", X"6a1e", X"6d38", X"7054", X"7374", X"7695", X"79b8", X"7cdb"
--		);


	signal SENDING : std_logic := '0';
	signal reg : std_logic_vector (15 downto 0);
	
	constant DELAY:integer := 3; -- 50 MHz / 3 == 16.667 MHz
	
	constant IGNORE:std_logic := '0'; -- 0:use, 1:ignore
	constant BUFFERED:std_logic := '0'; -- 0:unbuffered, 1:buffered
	constant GAIN:std_logic := '1'; -- 0:2X, 1:1X
	constant ACTIVE:std_logic := '1'; -- 0:shutdown, 1:active
	
begin


	clkDiv : entity work.ClockDivider(Behavioral) 
					generic map(DELAY => DELAY)
					port map (CLK, CLK2);		
	process(clk2)
	begin
	if(rising_edge(clk2)) then     
		VALUE <= SINE;
		
	end if;
	end process;
	
	process(CLK2, SEND) 
	
	variable counter : integer range 0 to 15 := 0;	
	
	begin
	
		if falling_edge(CLK2) then
		
			if SEND = '1' then	
				reg <= IGNORE & BUFFERED & GAIN & ACTIVE & VALUE(15 downto 4);
				counter := 0;	
				CS <= '0';
				SENDING <= '1';
				SEND <= '0';
				
			elsif SENDING = '1' then				
					reg <= reg(14 downto 0) & '0';
					
					if counter = 15 then		
						counter := 0;	
						CS <= '1';
						SENDING <= '0'; 
						SEND <= '1';
					else
						counter := counter + 1;	
					end if;
			end if;			
		end if;
		
	end process;
	
	SCK <= CLK2 AND SENDING;
	MOSI <= reg(15);
	
end behavioral;