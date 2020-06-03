--decision device used in BFSK demodulator

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity decision_dev is
	Port 
		( x : in signed (14 downto 0);
		  out_bit : out STD_LOGIC
		 );
end decision_dev;

architecture arc_decision of decision_dev is

begin
	process(x)
	begin
		if x(x'left)='1' then
		 out_bit<='1';
		else
		 out_bit<='0';
		end if;
	end process;
	
end arc_decision;