--- Top level module Telemetry receiver (Manchester decoder and BFSK Demod)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity telemetry_rx is
	Port ( 	dout : out STD_LOGIC; -------FSK modulated output
			input_signal : in STD_LOGIC_VECTOR (5 downto 0); ----- modulated signal input
			master_clk : in STD_LOGIC;--- clock input
			reset : in STD_LOGIC
		); --- Reset (active high)
end telemetry_rx;

architecture arc_telemetry_rx of telemetry_rx is
	component rx_clock_unit is
		port(
			clk_in, reset : in std_logic;
			clk_1x, clk_2x, clk_128x : out STD_LOGIC);
	end component;
	component bfsk_demod is
		Port ( clk,reset : in STD_LOGIC;
		bfsk_signal_in : in STD_LOGIC_VECTOR (5 downto 0);
		demod_data_out : out STD_LOGIC;
		clk_2x : in STD_LOGIC);
	end component;
	component manchester_decoder is
		Port ( dout : out STD_LOGIC;
		clk_2x : in STD_LOGIC;
		clk_1x : in STD_LOGIC;
		mdi : in STD_LOGIC;
		reset : in STD_LOGIC);
	end component;
	signal clk_1x:std_logic;
	signal clk_2x:std_logic;
	signal clk_128x:std_logic;
	signal mdi: std_logic;
	signal dataout:std_logic;
	
begin
	RX_CLK_CKT:rx_clock_unit port map(master_clk,reset,clk_1x,clk_2x,clk_128x);
	RX_DEMOD:bfsk_demod port map(clk_128x,reset,input_signal,mdi,clk_2x);
	umanchester_decoder:manchester_decoder port map(dataout,clk_2x,clk_1x,mdi,reset);
	dout<=dataout;
	
end arc_telemetry_rx;