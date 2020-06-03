-- Top Level Module Telemetry Transmitter (Manchester Encoder and BFSK Mod)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity telemetry_tx is
	Port 
	( 
		reset : in STD_LOGIC;
		master_clk : in STD_LOGIC;
		data_in : in STD_LOGIC;
		bfsk_mod_out : out STD_LOGIC_VECTOR (5 downto 0)
	);
end telemetry_tx;

architecture arc_tx of telemetry_tx is

	component bfsk_mod_ctrl is
		port(manch_enc_data: in std_logic;
		phase_inc_value:out std_logic_vector(5 downto 0));
	end component;
	component manchester_encoder is
		Port ( clk_1x, clk_2x, din, reset	: in  std_logic;
		-- Output ports
		mdo	: out std_logic);
	end component;
	component clock_unit is
		Port (clk_in	: in  std_logic;
		reset	: in  std_logic;

		-- Output ports
		clk_1x, clk_2x, clk_128x	: out std_logic);
	end component;
	component phase_acc is
		Port ( clk,reset : in STD_LOGIC;
		clk_2x : in STD_LOGIC;
		phase_inc_word : in STD_LOGIC_VECTOR (5 downto 0);
		phase_out : out STD_LOGIC_VECTOR (5 downto 0));
	end component;
	component LUT_cos is
		Port ( clk,reset : in STD_LOGIC;
		phase_bits : in STD_LOGIC_VECTOR (5 downto 0);
		amp_bits : out STD_LOGIC_VECTOR (5 downto 0));
	end component;
	signal clk_1x,clk_2x,clk_128x: std_logic;
	signal mdo:std_logic;
	signal phase_inc_word:std_logic_vector(5 downto 0);
	signal phase_out,amp_bits:std_logic_vector(5 downto 0);
	
begin

	CLK_DISTR: clock_unit port map(master_clk,reset,clk_1x,clk_2x,clk_128x);
	MAC_ENC: manchester_encoder port map(clk_1x,clk_2x,data_in,reset,mdo);
	MOD_CNTRL:bfsk_mod_ctrl port map(mdo,phase_inc_word);
	DIGITAL_PHASE_GEN:phase_acc port map(clk_128x,reset,clk_2x,phase_inc_word,phase_out);
	COS_ROM: LUT_cos port map(clk_128x,reset,phase_out,amp_bits);
	bfsk_mod_out <= amp_bits;
	
end arc_tx;
