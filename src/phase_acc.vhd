--Phase accumulator which consists of phase increment register
--And n bit adder phase register

library ieee;
use ieee.std_logic_1164.all;

entity phase_acc is
	port	
	( 	-- input ports.
		clk, reset, clk_2x	: in std_logic;
		phase_inc_word		: in std_logic_vector(5 downto 0);
		-- output ports.
		phase_out			: out std_logic_vector(5 downto 0)
	);
end phase_acc;

architecture a of phase_acc is

	component adder_nbit
		port
		( a, b	: in std_logic_vector(5 downto 0);
		  z		: out std_logic_vector(5 downto 0)
		);
	end component;
	component pipo_nbit
		port
		( clk, reset	: in std_logic;
		  x		: in std_logic_vector(5 downto 0);
		  y		: out std_logic_vector(5 downto 0)
		);
	end component;
	
	signal phase_inc_reg_output: std_logic_vector(5 downto 0);
	signal acc_output, phase_reg_out: std_logic_vector(5 downto 0);
	signal local_rst, delayed_clk_2x: std_logic;
begin

	process(clk)
	begin
	if rising_edge(clk) then
		delayed_clk_2x <= clk_2x;
	end if;
	end process;

	local_rst <= not(clk_2x and(not delayed_clk_2x));

	phase_inc_reg: pipo_nbit port map(clk, reset, phase_inc_word, phase_inc_reg_output);
	accumulator	 : adder_nbit port map(phase_inc_reg_output, phase_reg_out, acc_output);
	phase_reg	 : pipo_nbit port map(clk, local_rst, acc_output, phase_reg_out);
	phase_out <= phase_reg_out;

end a;