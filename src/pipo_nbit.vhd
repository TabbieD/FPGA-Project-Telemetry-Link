-- Phase in phase out

library ieee;
use ieee.std_logic_1164.all;

entity pipo_nbit is
	port
	( -- input ports
		clk, reset	: in std_logic;
		x			: in std_logic_vector(5 downto 0);
	  -- output ports
		y			: out std_logic_vector(5 downto 0)
	);
end pipo_nbit;

architecture b of pipo_nbit is
begin
	process(clk, reset)
	begin
	if (reset = '0') then
		y <= (others => '0');
	elsif (clk'event and clk='1') then
		y <= x;
	end if;
	end process;
	
end b;
		