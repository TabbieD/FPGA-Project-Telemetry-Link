-- BFSK modulation controller
library ieee;
use ieee.std_logic_1164.all;

entity bfsk_mod_ctrl is
	port
	(
		--Input port
		manch_enc_data	: in std_logic;
		--Output port
		phase_inc_value : out std_logic_vector(5 downto 0)
	);
end bfsk_mod_ctrl;

architecture a of bfsk_mod_ctrl is

begin
	phase_inc_value <= (0 => '1', others => '0') when manch_enc_data='0' else (1 => '1', others => '0');
	 
end a;