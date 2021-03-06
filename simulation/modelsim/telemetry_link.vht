-- Copyright (C) 1991-2009 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "07/31/2018 01:04:17"
                                                            
-- Vhdl Test Bench template for design  :  telemetry_link
-- 
-- Simulation tool : ModelSim (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;                                

ENTITY telemetry_link_vhd_tst IS
END telemetry_link_vhd_tst;

ARCHITECTURE telemetry_link_arch OF telemetry_link_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL din : STD_LOGIC:='0';
SIGNAL data_out : STD_LOGIC;
SIGNAL recieved_bfsk_signal : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL reset : STD_LOGIC:='0';
--SIGNAL rx_master_clk : STD_LOGIC:='0';
SIGNAL transmitter_out : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL master_clk : STD_LOGIC:='0';
COMPONENT telemetry_link
	PORT (
	data_in : IN STD_LOGIC;
	data_out : OUT STD_LOGIC;
	recieved_bfsk_signal : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	reset : IN STD_LOGIC;
	rx_master_clk : IN STD_LOGIC;
	transmitter_out : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
	tx_master_clk : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : telemetry_link
	PORT MAP (
-- list connections between master ports and signals
	data_in => din,
	data_out => data_out,
	recieved_bfsk_signal => recieved_bfsk_signal,
	reset => reset,
	rx_master_clk => master_clk,
	transmitter_out => transmitter_out,
	tx_master_clk => master_clk
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once 
        master_clk <= '0';                     
		wait for 10 ns;
		master_clk <= '1';
		wait for 10 ns;
--WAIT;
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
        reset <= '1','0' after 10 ns,'1' after 40ns;wait for 1 ns;
--WAIT;                                                        
END PROCESS always; 

process
begin
din<='0';  wait for 100 ns;
din<='1';  wait for 100 ns;
--din<='1','0' after 2200 ns,'1' after 3800 ns,'0' after 5400 ns,'0' after 7000 ns;
--wait for 800 ns;
--Wait;
end process;                                         
END telemetry_link_arch;
