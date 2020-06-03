-- This module accumulates the incoming value
-- This module performs the job of integrates

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity accumulate is
	Port 
	( 	reset,clk : in STD_LOGIC;
		a : in signed (11 downto 0); --------- active high rst (symbol timing)
		y : out signed (14 downto 0)
	);
end accumulate;

architecture arc_acccum of accumulate is
	
	signal delayed_rst:std_logic;
	signal temp_sum:signed (14 downto 0);
begin
	process(clk) --D flipflop (used to delay the timing recovery signal by one clock unit)
	begin
		if clk'event and clk='0' then
			delayed_rst<=reset;
		end if; 
	end process;
	process(delayed_rst,clk)
	-- 2's complement extended a (12 bit extended to 15 bit)
	variable a_ext: signed (14 downto 0):=(others=>'0');
	begin
		if delayed_rst='1' then
			temp_sum <= (others=>'0');
		elsif clk'event and clk='1' then
			a_ext :=(a(a'left)) & (a(a'left)) & (a(a'left)) & a;
			temp_sum <= (temp_sum) + (a_ext);
		end if;
	end process;
	process(reset)
	begin
		if reset'event and reset='1' then --on rising edge of rst (symbol timing )the integrated value is dumped
			y<= temp_sum;
		end if;
	end process;
	
end arc_acccum;