-- simple T flip flop

library ieee;
use ieee.std_logic_1164.all;

entity T_ff is
	port
	(
		-- Input ports
		clk, rst	: in  std_logic;
		-- Output ports
		q	: out std_logic
	);
end T_ff;

-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture b of T_ff is

	-- Declarations (optional)
	signal q0	: std_logic;

begin

	process(clk, rst) is 
	begin 
		if(rst = '0') then
			-- Asynchronous Sequential Statement(s) 
			q0 <= '0';
		elsif(falling_edge(clk)) then
			-- Synchronous Sequential Statement(s)
			q0 <= not q0;
		end if;
	end process; 
	
	q <= q0;
end b;
