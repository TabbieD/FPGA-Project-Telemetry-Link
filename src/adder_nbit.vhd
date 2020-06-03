-- Generic adder used in phase accumulator

library ieee;
use ieee.std_logic_1164.all;

entity adder_nbit is
	port 
	( 
		a, b : in std_logic_vector(5 downto 0);
		z 	 : out std_logic_vector(5 downto 0)
	);
end adder_nbit;

architecture arc_add of adder_nbit is

	signal temp_carry : std_logic_vector(6 downto 0);

begin
	temp_carry(0)<='0';
	f1:for i in a'low to a'high generate
		z(i)<=a(i) xor b(i)xor temp_carry(i);
		temp_carry(i+1)<=(a(i)and b(i))or(a(i)and temp_carry(i))or(b(i)and temp_carry(i));
	end generate;
	
end arc_add;