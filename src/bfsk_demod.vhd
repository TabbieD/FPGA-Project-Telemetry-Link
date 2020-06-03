-- BFSK Demodulator

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity bfsk_demod is
	Port ( 
			clk, reset, clk_2x : in STD_LOGIC;
			bfsk_signal_in : in STD_LOGIC_VECTOR (5 downto 0);
			demod_data_out : out STD_LOGIC
	);
	
end bfsk_demod;

architecture arc_bfsk of bfsk_demod is
	component rx_carrier_gen is
		Port ( 
				reset,clk : in STD_LOGIC;
				clk_2x : STD_LOGIC;
				symbol_0_carrier : out STD_LOGIC_VECTOR (5 downto 0);
				symbol_1_carrier : out STD_LOGIC_VECTOR (5 downto 0));
	end component;
	component multiply is
		port(a,b:in signed(5 downto 0);
			 y :out signed(11 downto 0));
	end component;
	component accumulate is
		port(reset,clk:in std_logic;
			 a:in signed(11 downto 0);
			 y :out signed(14 downto 0));
	end component;
	component decision_dev is
		port(x:in signed(14 downto 0);
			 out_bit :out std_logic);
	end component;
	signal symbol_0_carrier, symbol_1_carrier: std_logic_vector(5 downto 0);
	signal ch_0_mul_out, ch_1_mul_out: signed(11 downto 0);
	signal ch_0_acc_out, ch_1_acc_out: signed(14 downto 0);
	signal dec_value: signed(14 downto 0); -- decision value
	signal local_rst, delayed_clk_2x: std_logic; 
	
begin

	process(clk)
	begin
		if rising_edge(clk) then
			delayed_clk_2x<= clk_2x;
		end if;
	end process;

	local_rst<=(clk_2x and(not delayed_clk_2x)); -- active high pulse which will be used in
	accumulator_rx_lo:rx_carrier_gen port map(reset, clk, clk_2x, symbol_0_carrier, symbol_1_carrier);
	mul0: multiply port map(signed(symbol_0_carrier),signed(bfsk_signal_in),ch_0_mul_out);
	mul1: multiply port map(signed(symbol_1_carrier),signed(bfsk_signal_in),ch_1_mul_out);
	acc0: accumulate port map(local_rst,clk,ch_0_mul_out,ch_0_acc_out);
	acc1: accumulate port map(local_rst,clk,ch_1_mul_out,ch_1_acc_out);
	dec_value<= ch_0_acc_out-ch_1_acc_out;
	dec_dev:decision_dev port map(dec_value,demod_data_out);

end arc_bfsk;