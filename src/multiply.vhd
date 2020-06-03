--this module takes two signed numbers and multiples

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

entity multiply is
	Port 
	( 
		a,b : in signed(5 downto 0);
		y : out signed(11 downto 0)
	);
end multiply;

architecture Behavioral of multiply is

begin

	y <= a * b;

end Behavioral;