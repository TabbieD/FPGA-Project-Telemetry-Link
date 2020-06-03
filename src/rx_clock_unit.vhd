-- Clock unit for telemetry receiver
-- Active low rst is used in the design

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity rx_clock_unit is
	port 
		(	
			clk_in, reset : in std_logic;
			clk_1x, clk_2x, clk_128x : out STD_LOGIC
		);
		
end rx_clock_unit;

architecture Behav of rx_clock_unit is
	
	component T_ff is
		port( clk, rst	: in  std_logic;
				q	: out std_logic
			);			
	end component;
	signal q1, q2, q3, q4, q5, q6, q7: std_logic;
	signal clk_1x_buf: std_logic;
	signal clk_2x_buf: std_logic;

begin
	-- clock divison
	div1:T_ff port map(clk_in,reset, q1);
	div2:T_ff port map(q1, reset, q2);
	div3:T_ff port map(q2, reset, q3);
	div4:T_ff port map(q3, reset, q4);
	div5:T_ff port map(q4, reset, q5);
	div6:T_ff port map(q5, reset, q6);
	div7:T_ff port map(q6, reset, q7);
	
	-- synchronize the clock edges for clk_2x
	process(clk_in,reset)
	begin
		if reset='0' then 
			clk_2x_buf <= '0'; 
		elsif clk_in='1' and clk_in'event then
			clk_2x_buf <= q6;
		end if;
	end process;

	-- synchronize the clock edges for clk_1x
	process(clk_2x_buf,reset)
	begin
		if reset='0' then
			clk_1x_buf<='0';
		elsif clk_2x_buf='1' and clk_2x_buf'event then
			clk_1x_buf<=q7;
		end if;
	end process;
	
	-- output assignment
	clk_1x<='0' when reset='0' else clk_1x_buf;
	clk_2x<='0' when reset='0' else clk_2x_buf;
	clk_128x<='0' when reset='0' else clk_in;
	
end Behav;