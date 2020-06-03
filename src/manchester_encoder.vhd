-- Manchester encoder with two clocks and using active low reset

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity manchester_encoder is
	port
	(
		-- Input ports
		clk_1x, clk_2x, din, reset	: in  std_logic;
		-- Output ports
		mdo	: out std_logic
	);
end manchester_encoder;
-- Library Clause(s) (optional)
-- Use Clause(s) (optional)

architecture b of manchester_encoder is

	signal din_buf: std_logic;

begin
	--sample the input with1 1x clock
	process(clk_1x, reset) is 
		-- Declaration(s) 
	begin 
		if(reset = '0') then
			-- Asynchronous Sequential Statement(s) 
			din_buf <= '0';
		elsif(rising_edge(clk_1x)) then
			-- Synchronous Sequential Statement(s)
			din_buf <= not din;
		end if;
	end process; 
	
	--manchester encoding
	process(clk_2x, reset) is 
		-- Declaration(s) 
	begin 
		if(reset = '0') then
			-- Asynchronous Sequential Statement(s) 
			mdo <= '0';
		elsif(rising_edge(clk_2x)) then
			-- Synchronous Sequential Statement(s)
			mdo <= din_buf xor clk_1x;
		end if;
	end process; 

	
end b;


