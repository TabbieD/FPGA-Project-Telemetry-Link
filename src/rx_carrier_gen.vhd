-- two carriers generating circuit for receiver

library ieee;
use ieee.std_logic_1164.all;

entity rx_carrier_gen is
	Port ( reset,clk : in STD_LOGIC;
		   clk_2x : STD_LOGIC;
		   symbol_0_carrier : out STD_LOGIC_VECTOR (5 downto 0);
		   symbol_1_carrier : out STD_LOGIC_VECTOR (5 downto 0)
		  );
end rx_carrier_gen;

architecture Behave of rx_carrier_gen is
	component phase_acc
		Port ( clk,reset : in STD_LOGIC;
				clk_2x : in STD_LOGIC;
				phase_inc_word : in STD_LOGIC_VECTOR (5 downto 0);
				phase_out : out STD_LOGIC_VECTOR (5 downto 0));
	end component;
	component lut_cos
		Port ( clk,reset : in STD_LOGIC;
			phase_bits : in STD_LOGIC_VECTOR (5 downto 0);
			amp_bits : out STD_LOGIC_VECTOR (5 downto 0));
	end component;
	signal phase_inc_word0:std_logic_vector(5 downto 0);
	signal phase_inc_word1:std_logic_vector(5 downto 0);
	signal phase_word0:std_logic_vector(5 downto 0);
	signal phase_word1:std_logic_vector(5 downto 0);

begin
	phase_inc_word0<=(1=>'1',others=>'0');
	phase_inc_word1<=(0=>'1',others=>'0');
	digital_phase_gen0:phase_acc port map(clk,reset,clk_2x,phase_inc_word0,phase_word0);
	digital_phase_gen1:phase_acc port map(clk,reset,clk_2x,phase_inc_word1,phase_word1);
	cos_rom0:lut_cos port map(clk,reset,phase_word0,symbol_0_carrier);
	cos_rom1:lut_cos port map(clk,reset,phase_word1,symbol_1_carrier);
	
end Behave;