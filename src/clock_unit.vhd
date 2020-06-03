-- Clock unit for Manchester unit
-- Active low reset and three clocks are used.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity clock_unit is
	port
	(
		-- Input ports
		clk_in	: in  std_logic;
		reset	: in  std_logic;

		-- Output ports
		clk_1x, clk_2x, clk_128x	: out std_logic
	);
end clock_unit;
-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture a of clock_unit is

	component T_ff 
		port
		(
			-- Input ports
			clk, rst	: in  std_logic;
			
			-- Output ports
			q	: out std_logic
		);
	end component;
	signal q1, q2, q3, q4, q5, q6, q7	: std_logic;
	signal clk_1x_buf, clk_2x_buf		: std_logic;
begin

	-- clock division
	div1: T_ff port map(clk_in, reset, q1);
	div2: T_ff port map(q1, reset, q2);
	div3: T_ff port map(q2, reset, q3);
	div4: T_ff port map(q3, reset, q4);
	div5: T_ff port map(q4, reset, q5);
	div6: T_ff port map(q5, reset, q6);
	div7: T_ff port map(q6, reset, q7);
	
	--synchronize the clock edges for clk_2x
	
	process(clk_in, reset) is 
	begin 
		if(reset = '0') then
			-- Asynchronous Sequential Statement(s)
			clk_2x_buf <= '0'; 
		elsif(rising_edge(clk_in)) then
			-- Synchronous Sequential Statement(s)
			clk_2x_buf <= q6;
		end if;
	end process; 

	-- synchronize the clock edges for clk_1x
	process(clk_2x_buf, reset) is 
	begin 
		if(reset = '0') then
			-- Asynchronous Sequential Statement(s)
			clk_1x_buf <= '0'; 
		elsif(rising_edge(clk_2x_buf)) then
			-- Synchronous Sequential Statement(s)
			clk_1x_buf <= q7;
		end if;
	end process; 
	
	-- output assignment
	clk_1x <= '1' when reset = '0' else clk_1x_buf;
	clk_2x <= '0' when reset = '0' else clk_2x_buf;
	clk_128x <= '0' when reset = '0' else clk_in;
	
	
end a;

