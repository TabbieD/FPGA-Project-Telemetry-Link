--- Manchester decoder
-- Active low reset is used in the design
-- Two clocks are used

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity manchester_decoder is
	Port ( 
		dout : out STD_LOGIC;
		clk_2x : in STD_LOGIC;
		clk_1x : in STD_LOGIC;
		mdi : in STD_LOGIC;
		reset : in STD_LOGIC
		);
end manchester_decoder;

architecture behave of manchester_decoder is
	signal mdi_buf:std_logic;
	signal mdi_buf2:std_logic;

begin

	process(clk_2x,reset)
	begin
		if reset='0' then
			mdi_buf<='1';
			mdi_buf2<='0';
		elsif clk_2x='1' and clk_2x'event then
			mdi_buf<= mdi;
			mdi_buf2<= not mdi xor clk_1x;
		end if;
	end process;
	process(mdi_buf,mdi_buf2,reset,clk_1x)
	begin
		if reset='0' then
			dout<='0';
		else
			dout<=(mdi_buf xnor mdi_buf2) or mdi_buf2;
		end if;
	end process;
	
end behave;