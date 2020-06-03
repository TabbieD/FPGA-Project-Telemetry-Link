-- Telemetry Link Consisting of Telemetry Transmitter and Receiver

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity telemetry_link is
	port(	-- iput ports
			tx_master_clk	: in std_logic;
			reset			: in std_logic; ----- active low signal
			data_in 		: in std_logic; 
			rx_master_clk	: in std_logic;
			--output ports
			transmitter_out			: out std_logic_vector(5 downto 0);--- transmitter output BFSK signal
			recieved_bfsk_signal	: out std_logic_vector(5 downto 0); --- received BFSK signal at telemetry receiver
			data_out				: out std_logic
		);---- telemetry receiver output
end telemetry_link;

architecture Behavioral of telemetry_link is

	component telemetry_tx is
		Port ( reset : in STD_LOGIC;
		master_clk : in STD_LOGIC;
		data_in : in STD_LOGIC;
		bfsk_mod_out : out STD_LOGIC_VECTOR (5 downto 0));
	end component;
	
	component telemetry_rx is
		port(dout:out std_logic;
		input_signal:in std_logic_vector(5 downto 0); --- modulated signal input
		master_clk:in std_logic; --- clock input
		reset:in std_logic); --- Reset signal
	end component;
	
	signal bfsk_mod_out:std_logic_vector(5 downto 0);
	signal channel_out:std_logic_vector(5 downto 0);
	
begin

	channel_out<=bfsk_mod_out;
	recieved_bfsk_signal <= channel_out;
	transmitter_out <= bfsk_mod_out;
	
	TELE_TX:telemetry_tx port map(reset,tx_master_clk,data_in,bfsk_mod_out);
	TELE_RX:telemetry_rx port map(data_out,channel_out,rx_master_clk,reset);
	
end Behavioral;