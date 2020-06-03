-- This is phase to amplitude converter implemented using LUT for generating cos wave

library ieee;
use ieee.std_logic_1164.all;

entity lut_cos is
	port 
	( 	
		clk,reset 	: in std_logic;
		phase_bits  : in std_logic_vector(5 downto 0);
		amp_bits	: out std_logic_vector(5 downto 0)	
	);
	
end lut_cos;

architecture arc_lut of lut_cos is

begin

	process(reset,clk)
	variable temp_amp:std_logic_vector(5 downto 0);
	begin
		if reset='0' then
			temp_amp:=(others=>'0');
		elsif rising_edge(clk) then
			case phase_bits is
				when "000000"=>temp_amp:="011111";
				when "000001"=>temp_amp:="011110";
				when "000010"=>temp_amp:="011110";
				when "000011"=>temp_amp:="011101";
				when "000100"=>temp_amp:="011100";
				when "000101"=>temp_amp:="011011";
				when "000110"=>temp_amp:="011001";
				when "000111"=>temp_amp:="010111";
				when "001000"=>temp_amp:="010101";
				when "001001"=>temp_amp:="010011";
				when "001010"=>temp_amp:="010001";
				when "001011"=>temp_amp:="101110";
				when "001100"=>temp_amp:="001011";
				when "001101"=>temp_amp:="001000";
				when "001110"=>temp_amp:="000110";
				when "001111"=>temp_amp:="000011";
				when "010000"=>temp_amp:="000000";
				when "010001"=>temp_amp:="111100";
				when "010010"=>temp_amp:="111001";
				when "010011"=>temp_amp:="110111";
				when "010100"=>temp_amp:="110100";
				when "010101"=>temp_amp:="110001";
				when "010110"=>temp_amp:="101110";
				when "010111"=>temp_amp:="101100";
				when "011000"=>temp_amp:="101010";
				when "011001"=>temp_amp:="101000";
				when "011010"=>temp_amp:="100110";
				when "011011"=>temp_amp:="100100";
				when "011100"=>temp_amp:="100011";
				when "011101"=>temp_amp:="100010";
				when "011110"=>temp_amp:="100001";
				when "011111"=>temp_amp:="100001";
				when "100000"=>temp_amp:="100000";
				when "100001"=>temp_amp:="000001";
				when "100010"=>temp_amp:="100001";
				when "100011"=>temp_amp:="100010";
				when "100100"=>temp_amp:="100011";
				when "100101"=>temp_amp:="100100";
				when "100110"=>temp_amp:="100110";
				when "100111"=>temp_amp:="101000";
				when "101000"=>temp_amp:="101010";
				when "101001"=>temp_amp:="101100";
				when "101010"=>temp_amp:="101110";
				when "101011"=>temp_amp:="110001";
				when "101100"=>temp_amp:="110100";
				when "101101"=>temp_amp:="110111";
				when "101110"=>temp_amp:="111001";
				when "101111"=>temp_amp:="111100";
				when "110000"=>temp_amp:="000000";
				when "110010"=>temp_amp:="000110";
				when "110011"=>temp_amp:="001000";
				when "110100"=>temp_amp:="001011";
				when "110101"=>temp_amp:="001110";
				when "110110"=>temp_amp:="010001";
				when "110111"=>temp_amp:="010011";
				when "111000"=>temp_amp:="010101";
				when "111001"=>temp_amp:="110111";
				when "111010"=>temp_amp:="011001";
				when "111011"=>temp_amp:="011011";
				when "111100"=>temp_amp:="011100";
				when "111101"=>temp_amp:="011101";
				when "111110"=>temp_amp:="011110";
				when "111111"=>temp_amp:="011110";
				when others=> temp_amp:="000000";
			end case;
		end if;
		
		if reset = '0' then
		elsif falling_edge(clk) then
			amp_bits <= temp_amp;
		end if;
		
	end process;

end arc_lut;