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

-- VENDOR "Altera"
-- PROGRAM "Quartus II"
-- VERSION "Version 9.1 Build 222 10/21/2009 SJ Full Version"

-- DATE "08/03/2018 09:55:15"

-- 
-- Device: Altera EP2C70F896C6 Package FBGA896
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	telemetry_link IS
    PORT (
	tx_master_clk : IN std_logic;
	reset : IN std_logic;
	data_in : IN std_logic;
	rx_master_clk : IN std_logic;
	transmitter_out : OUT std_logic_vector(5 DOWNTO 0);
	recieved_bfsk_signal : OUT std_logic_vector(5 DOWNTO 0);
	data_out : OUT std_logic
	);
END telemetry_link;

-- Design Ports Information
-- transmitter_out[0]	=>  Location: PIN_W27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- transmitter_out[1]	=>  Location: PIN_W25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- transmitter_out[2]	=>  Location: PIN_W23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- transmitter_out[3]	=>  Location: PIN_Y27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- transmitter_out[4]	=>  Location: PIN_Y24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- transmitter_out[5]	=>  Location: PIN_Y23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- recieved_bfsk_signal[0]	=>  Location: PIN_AJ6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- recieved_bfsk_signal[1]	=>  Location: PIN_AK5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- recieved_bfsk_signal[2]	=>  Location: PIN_AJ5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- recieved_bfsk_signal[3]	=>  Location: PIN_AJ4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- recieved_bfsk_signal[4]	=>  Location: PIN_AK3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- recieved_bfsk_signal[5]	=>  Location: PIN_AH4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- data_out	=>  Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- reset	=>  Location: PIN_L8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- tx_master_clk	=>  Location: PIN_AB25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- rx_master_clk	=>  Location: PIN_AB26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- data_in	=>  Location: PIN_AA23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default

ARCHITECTURE structure OF telemetry_link IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_tx_master_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_data_in : std_logic;
SIGNAL ww_rx_master_clk : std_logic;
SIGNAL ww_transmitter_out : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_recieved_bfsk_signal : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_data_out : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAA_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAA_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAA_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAB_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAA_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAB_bus\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \TELE_RX|RX_CLK_CKT|clk_2x~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|local_rst~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TELE_TX|CLK_DISTR|clk_128x~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TELE_TX|DIGITAL_PHASE_GEN|local_rst~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT1\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT2\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT6\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT8\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT9\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~0\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~1\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~2\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~3\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~4\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~5\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[0]~15_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[3]~21_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[5]~25_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[7]~29_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[10]~35_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[11]~37_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[12]~39_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~dataout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT1\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT4\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT10\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~0\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~1\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~2\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~3\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~4\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~5\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[2]~19_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[6]~27_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[8]~31_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[9]~33_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[13]~41_combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|clk_1x_buf~regout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux3~1_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux0~1_combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div7|q0~regout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div5|q0~regout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div4|q0~regout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div5|q0~regout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div3|q0~regout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div4|q0~regout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~1_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~1_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div2|q0~regout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div3|q0~regout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div1|q0~regout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div2|q0~regout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div1|q0~regout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div7|q0~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div5|q0~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div4|q0~0_combout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div5|q0~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div3|q0~0_combout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div4|q0~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div2|q0~0_combout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div3|q0~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div1|q0~0_combout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div2|q0~0_combout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div1|q0~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|clk_2x~clkctrl_outclk\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|y[13]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|y[12]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|y[10]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|y[9]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|y[8]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|y[7]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|y[6]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|y[5]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|y[4]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|y[3]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|y[2]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|y[0]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|clk_1x_buf~feeder_combout\ : std_logic;
SIGNAL \reset~combout\ : std_logic;
SIGNAL \tx_master_clk~combout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|clk_128x~combout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div7|q0~0_combout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div7|q0~regout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|clk_1x_buf~regout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|clk_1x~combout\ : std_logic;
SIGNAL \data_in~combout\ : std_logic;
SIGNAL \TELE_TX|MAC_ENC|din_buf~0_combout\ : std_logic;
SIGNAL \TELE_TX|MAC_ENC|din_buf~regout\ : std_logic;
SIGNAL \TELE_TX|MAC_ENC|mdo~0_combout\ : std_logic;
SIGNAL \TELE_TX|MAC_ENC|mdo~regout\ : std_logic;
SIGNAL \TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y[0]~0_combout\ : std_logic;
SIGNAL \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[0]~2_combout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div6|q0~0_combout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div6|q0~regout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|clk_2x_buf~feeder_combout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|clk_2x_buf~regout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|clk_2x~combout\ : std_logic;
SIGNAL \TELE_TX|DIGITAL_PHASE_GEN|delayed_clk_2x~regout\ : std_logic;
SIGNAL \TELE_TX|DIGITAL_PHASE_GEN|local_rst~0_combout\ : std_logic;
SIGNAL \TELE_TX|DIGITAL_PHASE_GEN|local_rst~0clkctrl_outclk\ : std_logic;
SIGNAL \TELE_TX|DIGITAL_PHASE_GEN|accumulator|z[1]~0_combout\ : std_logic;
SIGNAL \TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry[2]~0_combout\ : std_logic;
SIGNAL \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[2]~3_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux5~0_combout\ : std_logic;
SIGNAL \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[3]~0_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux5~1_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux5~2_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|amp_bits[0]~feeder_combout\ : std_logic;
SIGNAL \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[4]~4_combout\ : std_logic;
SIGNAL \TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry~1_combout\ : std_logic;
SIGNAL \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[5]~1_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux4~3_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux4~0_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux4~1_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux4~2_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux4~4_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux3~3_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux3~0_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux3~2_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux3~4_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|amp_bits[2]~feeder_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux2~0_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux2~1_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux2~2_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|amp_bits[3]~feeder_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux1~0_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux1~1_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux1~2_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux0~0_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|Mux0~2_combout\ : std_logic;
SIGNAL \TELE_TX|COS_ROM|amp_bits[5]~feeder_combout\ : std_logic;
SIGNAL \rx_master_clk~combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|clk_128x~combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[0]~2_combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div6|q0~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div6|q0~regout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|clk_2x_buf~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|clk_2x_buf~regout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|clk_2x~combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|delayed_clk_2x~regout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0clkctrl_outclk\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[1]~3_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y[0]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|accumulator|temp_carry~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[4]~5_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[3]~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[5]~1_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~2_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[2]~4_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~3_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~1_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~2_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~4_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~1_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~2_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~3_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~4_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~1_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~2_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~2_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~1_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~2_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~dataout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT1\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT2\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT3\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT4\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT5\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT6\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT7\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT8\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT9\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT10\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT11\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~0\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~1\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~2\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~3\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~4\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~5\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT10\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT7\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT5\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT4\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT3\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~dataout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[0]~16\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[1]~17_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|delayed_clk_2x~regout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|local_rst~combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|delayed_rst~regout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[1]~18\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[2]~19_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[2]~20\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[3]~22\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[4]~24\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[5]~26\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[6]~27_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[6]~28\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[7]~30\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[8]~31_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[8]~32\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[9]~33_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[9]~34\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[10]~36\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[11]~38\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[12]~40\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[13]~42\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[14]~43_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~1_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~2_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~1_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~2_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux3~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux3~1_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux2~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux2~1_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux1~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux1~1_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux0~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp[5]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[3]~_wirecell_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~dataout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT1\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT2\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT3\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT4\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT5\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT6\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT7\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT8\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT9\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT10\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT11\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~0\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~1\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~2\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~3\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~4\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~5\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT9\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT8\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT7\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT6\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT5\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT3\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT2\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[0]~15_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[0]~16\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[1]~17_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[1]~18\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[2]~20\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[3]~22\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[4]~23_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[4]~24\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[5]~26\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[6]~28\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[7]~30\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[8]~32\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[9]~34\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[10]~35_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[10]~36\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[11]~38\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[12]~40\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[13]~42\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[14]~43_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[13]~41_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|y[13]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[12]~39_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|y[12]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[11]~37_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|y[11]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|y[10]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|y[9]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|y[8]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[7]~29_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|y[7]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[5]~25_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|y[5]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum[4]~23_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc1|y[4]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum[3]~21_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|y[3]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|y[0]~feeder_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|dec_value[0]~1_cout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|dec_value[1]~3_cout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|dec_value[2]~5_cout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|dec_value[3]~7_cout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|dec_value[4]~9_cout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|dec_value[5]~11_cout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|dec_value[6]~13_cout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|dec_value[7]~15_cout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|dec_value[8]~17_cout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|dec_value[9]~19_cout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|dec_value[10]~21_cout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|dec_value[11]~23_cout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|dec_value[12]~25_cout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|dec_value[13]~27_cout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|dec_value[14]~28_combout\ : std_logic;
SIGNAL \TELE_RX|umanchester_decoder|mdi_buf2~0_combout\ : std_logic;
SIGNAL \TELE_RX|umanchester_decoder|mdi_buf2~regout\ : std_logic;
SIGNAL \TELE_RX|umanchester_decoder|mdi_buf~0_combout\ : std_logic;
SIGNAL \TELE_RX|umanchester_decoder|mdi_buf~regout\ : std_logic;
SIGNAL \TELE_RX|umanchester_decoder|dout~0_combout\ : std_logic;
SIGNAL \TELE_RX|RX_DEMOD|acc0|temp_sum\ : std_logic_vector(14 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|acc0|y\ : std_logic_vector(14 DOWNTO 0);
SIGNAL \TELE_TX|COS_ROM|amp_bits\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \TELE_TX|COS_ROM|temp_amp\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|acc1|y\ : std_logic_vector(14 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|acc1|temp_sum\ : std_logic_vector(14 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \TELE_RX|RX_CLK_CKT|div6|ALT_INV_q0~regout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div5|ALT_INV_q0~regout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div6|ALT_INV_q0~regout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div4|ALT_INV_q0~regout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div5|ALT_INV_q0~regout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div3|ALT_INV_q0~regout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div4|ALT_INV_q0~regout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div2|ALT_INV_q0~regout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div3|ALT_INV_q0~regout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|div1|ALT_INV_q0~regout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div2|ALT_INV_q0~regout\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|div1|ALT_INV_q0~regout\ : std_logic;
SIGNAL \ALT_INV_reset~combout\ : std_logic;
SIGNAL \ALT_INV_tx_master_clk~combout\ : std_logic;
SIGNAL \ALT_INV_rx_master_clk~combout\ : std_logic;
SIGNAL \TELE_RX|RX_CLK_CKT|ALT_INV_clk_128x~clkctrl_outclk\ : std_logic;
SIGNAL \TELE_TX|CLK_DISTR|ALT_INV_clk_128x~clkctrl_outclk\ : std_logic;

BEGIN

ww_tx_master_clk <= tx_master_clk;
ww_reset <= reset;
ww_data_in <= data_in;
ww_rx_master_clk <= rx_master_clk;
transmitter_out <= ww_transmitter_out;
recieved_bfsk_signal <= ww_recieved_bfsk_signal;
data_out <= ww_data_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAA_bus\ <= (\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT11\ & \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT10\ & 
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT9\ & \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT8\ & \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT7\ & 
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT6\ & \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT5\ & \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT4\ & 
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT3\ & \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT2\ & \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT1\ & 
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~dataout\ & \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~5\ & \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~4\ & \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~3\ & 
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~2\ & \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~1\ & \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~0\);

\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~0\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(0);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~1\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(1);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~2\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(2);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~3\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(3);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~4\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(4);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~5\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(5);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~dataout\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(6);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT1\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(7);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT2\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(8);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT3\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(9);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT4\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(10);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT5\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(11);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT6\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(12);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT7\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(13);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT8\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(14);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT9\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(15);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT10\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(16);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\(17);

\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAA_bus\ <= (\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT11\ & \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT10\ & 
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT9\ & \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT8\ & \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT7\ & 
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT6\ & \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT5\ & \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT4\ & 
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT3\ & \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT2\ & \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT1\ & 
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~dataout\ & \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~5\ & \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~4\ & \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~3\ & 
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~2\ & \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~1\ & \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~0\);

\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~0\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(0);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~1\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(1);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~2\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(2);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~3\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(3);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~4\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(4);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~5\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(5);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~dataout\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(6);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT1\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(7);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT2\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(8);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT3\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(9);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT4\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(10);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT5\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(11);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT6\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(12);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT7\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(13);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT8\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(14);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT9\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(15);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT10\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(16);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\(17);

\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAA_bus\ <= (\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp\(5) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp\(4) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp\(3) & 
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp\(2) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp\(1) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp\(0) & gnd & gnd & gnd);

\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAB_bus\ <= (\TELE_TX|COS_ROM|amp_bits\(5) & \TELE_TX|COS_ROM|amp_bits\(4) & \TELE_TX|COS_ROM|amp_bits\(3) & \TELE_TX|COS_ROM|amp_bits\(2) & \TELE_TX|COS_ROM|amp_bits\(1) & 
\TELE_TX|COS_ROM|amp_bits\(0) & gnd & gnd & gnd);

\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~0\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(0);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~1\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(1);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~2\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(2);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~3\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(3);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~4\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(4);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~5\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(5);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~dataout\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(6);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT1\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(7);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT2\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(8);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT3\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(9);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT4\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(10);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT5\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(11);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT6\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(12);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT7\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(13);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT8\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(14);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT9\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(15);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT10\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(16);
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1~DATAOUT11\ <= \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(17);

\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAA_bus\ <= (\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp\(5) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp\(4) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp\(3) & 
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp\(2) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp\(1) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp\(0) & gnd & gnd & gnd);

\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAB_bus\ <= (\TELE_TX|COS_ROM|amp_bits\(5) & \TELE_TX|COS_ROM|amp_bits\(4) & \TELE_TX|COS_ROM|amp_bits\(3) & \TELE_TX|COS_ROM|amp_bits\(2) & \TELE_TX|COS_ROM|amp_bits\(1) & 
\TELE_TX|COS_ROM|amp_bits\(0) & gnd & gnd & gnd);

\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~0\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(0);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~1\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(1);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~2\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(2);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~3\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(3);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~4\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(4);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~5\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(5);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~dataout\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(6);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT1\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(7);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT2\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(8);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT3\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(9);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT4\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(10);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT5\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(11);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT6\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(12);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT7\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(13);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT8\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(14);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT9\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(15);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT10\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(16);
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1~DATAOUT11\ <= \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\(17);

\TELE_RX|RX_CLK_CKT|clk_2x~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \TELE_RX|RX_CLK_CKT|clk_2x~combout\);

\TELE_RX|RX_DEMOD|local_rst~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \TELE_RX|RX_DEMOD|local_rst~combout\);

\TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \TELE_RX|RX_CLK_CKT|clk_128x~combout\);

\TELE_TX|CLK_DISTR|clk_128x~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \TELE_TX|CLK_DISTR|clk_128x~combout\);

\TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \TELE_RX|RX_DEMOD|acc1|delayed_rst~regout\);

\TELE_TX|DIGITAL_PHASE_GEN|local_rst~0clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \TELE_TX|DIGITAL_PHASE_GEN|local_rst~0_combout\);

\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0_combout\);
\TELE_RX|RX_CLK_CKT|div6|ALT_INV_q0~regout\ <= NOT \TELE_RX|RX_CLK_CKT|div6|q0~regout\;
\TELE_RX|RX_CLK_CKT|div5|ALT_INV_q0~regout\ <= NOT \TELE_RX|RX_CLK_CKT|div5|q0~regout\;
\TELE_TX|CLK_DISTR|div6|ALT_INV_q0~regout\ <= NOT \TELE_TX|CLK_DISTR|div6|q0~regout\;
\TELE_RX|RX_CLK_CKT|div4|ALT_INV_q0~regout\ <= NOT \TELE_RX|RX_CLK_CKT|div4|q0~regout\;
\TELE_TX|CLK_DISTR|div5|ALT_INV_q0~regout\ <= NOT \TELE_TX|CLK_DISTR|div5|q0~regout\;
\TELE_RX|RX_CLK_CKT|div3|ALT_INV_q0~regout\ <= NOT \TELE_RX|RX_CLK_CKT|div3|q0~regout\;
\TELE_TX|CLK_DISTR|div4|ALT_INV_q0~regout\ <= NOT \TELE_TX|CLK_DISTR|div4|q0~regout\;
\TELE_RX|RX_CLK_CKT|div2|ALT_INV_q0~regout\ <= NOT \TELE_RX|RX_CLK_CKT|div2|q0~regout\;
\TELE_TX|CLK_DISTR|div3|ALT_INV_q0~regout\ <= NOT \TELE_TX|CLK_DISTR|div3|q0~regout\;
\TELE_RX|RX_CLK_CKT|div1|ALT_INV_q0~regout\ <= NOT \TELE_RX|RX_CLK_CKT|div1|q0~regout\;
\TELE_TX|CLK_DISTR|div2|ALT_INV_q0~regout\ <= NOT \TELE_TX|CLK_DISTR|div2|q0~regout\;
\TELE_TX|CLK_DISTR|div1|ALT_INV_q0~regout\ <= NOT \TELE_TX|CLK_DISTR|div1|q0~regout\;
\ALT_INV_reset~combout\ <= NOT \reset~combout\;
\ALT_INV_tx_master_clk~combout\ <= NOT \tx_master_clk~combout\;
\ALT_INV_rx_master_clk~combout\ <= NOT \rx_master_clk~combout\;
\TELE_RX|RX_CLK_CKT|ALT_INV_clk_128x~clkctrl_outclk\ <= NOT \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\;
\TELE_TX|CLK_DISTR|ALT_INV_clk_128x~clkctrl_outclk\ <= NOT \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\;

-- Location: LCFF_X45_Y30_N29
\TELE_RX|RX_DEMOD|acc0|temp_sum[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|temp_sum[13]~41_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|temp_sum\(13));

-- Location: LCFF_X47_Y30_N25
\TELE_RX|RX_DEMOD|acc1|temp_sum[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|temp_sum[12]~39_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|temp_sum\(12));

-- Location: LCFF_X47_Y30_N23
\TELE_RX|RX_DEMOD|acc1|temp_sum[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|temp_sum[11]~37_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|temp_sum\(11));

-- Location: LCFF_X47_Y30_N21
\TELE_RX|RX_DEMOD|acc1|temp_sum[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|temp_sum[10]~35_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|temp_sum\(10));

-- Location: LCFF_X45_Y30_N21
\TELE_RX|RX_DEMOD|acc0|temp_sum[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|temp_sum[9]~33_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|temp_sum\(9));

-- Location: LCFF_X45_Y30_N19
\TELE_RX|RX_DEMOD|acc0|temp_sum[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|temp_sum[8]~31_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|temp_sum\(8));

-- Location: LCFF_X47_Y30_N15
\TELE_RX|RX_DEMOD|acc1|temp_sum[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|temp_sum[7]~29_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|temp_sum\(7));

-- Location: LCFF_X45_Y30_N15
\TELE_RX|RX_DEMOD|acc0|temp_sum[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|temp_sum[6]~27_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|temp_sum\(6));

-- Location: LCFF_X47_Y30_N11
\TELE_RX|RX_DEMOD|acc1|temp_sum[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|temp_sum[5]~25_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|temp_sum\(5));

-- Location: LCFF_X47_Y30_N7
\TELE_RX|RX_DEMOD|acc1|temp_sum[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|temp_sum[3]~21_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|temp_sum\(3));

-- Location: LCFF_X45_Y30_N7
\TELE_RX|RX_DEMOD|acc0|temp_sum[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|temp_sum[2]~19_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|temp_sum\(2));

-- Location: LCFF_X47_Y30_N1
\TELE_RX|RX_DEMOD|acc1|temp_sum[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|temp_sum[0]~15_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|temp_sum\(0));

-- Location: DSPOUT_X46_Y30_N2
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2\ : cycloneii_mac_out
-- pragma translate_off
GENERIC MAP (
	dataa_width => 18,
	output_clock => "none")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAA_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2_DATAOUT_bus\);

-- Location: LCCOMB_X47_Y30_N0
\TELE_RX|RX_DEMOD|acc1|temp_sum[0]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[0]~15_combout\ = (\TELE_RX|RX_DEMOD|acc1|temp_sum\(0) & (\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~dataout\ $ (VCC))) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(0) & 
-- (\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~dataout\ & VCC))
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[0]~16\ = CARRY((\TELE_RX|RX_DEMOD|acc1|temp_sum\(0) & \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~dataout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|temp_sum\(0),
	datab => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~dataout\,
	datad => VCC,
	combout => \TELE_RX|RX_DEMOD|acc1|temp_sum[0]~15_combout\,
	cout => \TELE_RX|RX_DEMOD|acc1|temp_sum[0]~16\);

-- Location: LCCOMB_X47_Y30_N6
\TELE_RX|RX_DEMOD|acc1|temp_sum[3]~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[3]~21_combout\ = (\TELE_RX|RX_DEMOD|acc1|temp_sum\(3) & ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT3\ & (\TELE_RX|RX_DEMOD|acc1|temp_sum[2]~20\ & VCC)) # 
-- (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT3\ & (!\TELE_RX|RX_DEMOD|acc1|temp_sum[2]~20\)))) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(3) & ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT3\ & 
-- (!\TELE_RX|RX_DEMOD|acc1|temp_sum[2]~20\)) # (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT3\ & ((\TELE_RX|RX_DEMOD|acc1|temp_sum[2]~20\) # (GND)))))
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[3]~22\ = CARRY((\TELE_RX|RX_DEMOD|acc1|temp_sum\(3) & (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT3\ & !\TELE_RX|RX_DEMOD|acc1|temp_sum[2]~20\)) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(3) & 
-- ((!\TELE_RX|RX_DEMOD|acc1|temp_sum[2]~20\) # (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|temp_sum\(3),
	datab => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT3\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc1|temp_sum[2]~20\,
	combout => \TELE_RX|RX_DEMOD|acc1|temp_sum[3]~21_combout\,
	cout => \TELE_RX|RX_DEMOD|acc1|temp_sum[3]~22\);

-- Location: LCCOMB_X47_Y30_N10
\TELE_RX|RX_DEMOD|acc1|temp_sum[5]~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[5]~25_combout\ = (\TELE_RX|RX_DEMOD|acc1|temp_sum\(5) & ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT5\ & (\TELE_RX|RX_DEMOD|acc1|temp_sum[4]~24\ & VCC)) # 
-- (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT5\ & (!\TELE_RX|RX_DEMOD|acc1|temp_sum[4]~24\)))) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(5) & ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT5\ & 
-- (!\TELE_RX|RX_DEMOD|acc1|temp_sum[4]~24\)) # (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT5\ & ((\TELE_RX|RX_DEMOD|acc1|temp_sum[4]~24\) # (GND)))))
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[5]~26\ = CARRY((\TELE_RX|RX_DEMOD|acc1|temp_sum\(5) & (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT5\ & !\TELE_RX|RX_DEMOD|acc1|temp_sum[4]~24\)) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(5) & 
-- ((!\TELE_RX|RX_DEMOD|acc1|temp_sum[4]~24\) # (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|temp_sum\(5),
	datab => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT5\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc1|temp_sum[4]~24\,
	combout => \TELE_RX|RX_DEMOD|acc1|temp_sum[5]~25_combout\,
	cout => \TELE_RX|RX_DEMOD|acc1|temp_sum[5]~26\);

-- Location: LCCOMB_X47_Y30_N14
\TELE_RX|RX_DEMOD|acc1|temp_sum[7]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[7]~29_combout\ = (\TELE_RX|RX_DEMOD|acc1|temp_sum\(7) & ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT7\ & (\TELE_RX|RX_DEMOD|acc1|temp_sum[6]~28\ & VCC)) # 
-- (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT7\ & (!\TELE_RX|RX_DEMOD|acc1|temp_sum[6]~28\)))) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(7) & ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT7\ & 
-- (!\TELE_RX|RX_DEMOD|acc1|temp_sum[6]~28\)) # (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT7\ & ((\TELE_RX|RX_DEMOD|acc1|temp_sum[6]~28\) # (GND)))))
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[7]~30\ = CARRY((\TELE_RX|RX_DEMOD|acc1|temp_sum\(7) & (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT7\ & !\TELE_RX|RX_DEMOD|acc1|temp_sum[6]~28\)) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(7) & 
-- ((!\TELE_RX|RX_DEMOD|acc1|temp_sum[6]~28\) # (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|temp_sum\(7),
	datab => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT7\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc1|temp_sum[6]~28\,
	combout => \TELE_RX|RX_DEMOD|acc1|temp_sum[7]~29_combout\,
	cout => \TELE_RX|RX_DEMOD|acc1|temp_sum[7]~30\);

-- Location: LCCOMB_X47_Y30_N20
\TELE_RX|RX_DEMOD|acc1|temp_sum[10]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[10]~35_combout\ = ((\TELE_RX|RX_DEMOD|acc1|temp_sum\(10) $ (\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT10\ $ (!\TELE_RX|RX_DEMOD|acc1|temp_sum[9]~34\)))) # (GND)
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[10]~36\ = CARRY((\TELE_RX|RX_DEMOD|acc1|temp_sum\(10) & ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT10\) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum[9]~34\))) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(10) & 
-- (\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT10\ & !\TELE_RX|RX_DEMOD|acc1|temp_sum[9]~34\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|temp_sum\(10),
	datab => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT10\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc1|temp_sum[9]~34\,
	combout => \TELE_RX|RX_DEMOD|acc1|temp_sum[10]~35_combout\,
	cout => \TELE_RX|RX_DEMOD|acc1|temp_sum[10]~36\);

-- Location: LCCOMB_X47_Y30_N22
\TELE_RX|RX_DEMOD|acc1|temp_sum[11]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[11]~37_combout\ = (\TELE_RX|RX_DEMOD|acc1|temp_sum\(11) & ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\ & (\TELE_RX|RX_DEMOD|acc1|temp_sum[10]~36\ & VCC)) # 
-- (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\ & (!\TELE_RX|RX_DEMOD|acc1|temp_sum[10]~36\)))) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(11) & ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\ & 
-- (!\TELE_RX|RX_DEMOD|acc1|temp_sum[10]~36\)) # (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\ & ((\TELE_RX|RX_DEMOD|acc1|temp_sum[10]~36\) # (GND)))))
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[11]~38\ = CARRY((\TELE_RX|RX_DEMOD|acc1|temp_sum\(11) & (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\ & !\TELE_RX|RX_DEMOD|acc1|temp_sum[10]~36\)) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(11) & 
-- ((!\TELE_RX|RX_DEMOD|acc1|temp_sum[10]~36\) # (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|temp_sum\(11),
	datab => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc1|temp_sum[10]~36\,
	combout => \TELE_RX|RX_DEMOD|acc1|temp_sum[11]~37_combout\,
	cout => \TELE_RX|RX_DEMOD|acc1|temp_sum[11]~38\);

-- Location: LCCOMB_X47_Y30_N24
\TELE_RX|RX_DEMOD|acc1|temp_sum[12]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[12]~39_combout\ = ((\TELE_RX|RX_DEMOD|acc1|temp_sum\(12) $ (\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\ $ (!\TELE_RX|RX_DEMOD|acc1|temp_sum[11]~38\)))) # (GND)
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[12]~40\ = CARRY((\TELE_RX|RX_DEMOD|acc1|temp_sum\(12) & ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum[11]~38\))) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(12) & 
-- (\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\ & !\TELE_RX|RX_DEMOD|acc1|temp_sum[11]~38\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|temp_sum\(12),
	datab => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc1|temp_sum[11]~38\,
	combout => \TELE_RX|RX_DEMOD|acc1|temp_sum[12]~39_combout\,
	cout => \TELE_RX|RX_DEMOD|acc1|temp_sum[12]~40\);

-- Location: DSPOUT_X46_Y30_N3
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2\ : cycloneii_mac_out
-- pragma translate_off
GENERIC MAP (
	dataa_width => 18,
	output_clock => "none")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAA_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2_DATAOUT_bus\);

-- Location: LCCOMB_X45_Y30_N6
\TELE_RX|RX_DEMOD|acc0|temp_sum[2]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[2]~19_combout\ = ((\TELE_RX|RX_DEMOD|acc0|temp_sum\(2) $ (\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT2\ $ (!\TELE_RX|RX_DEMOD|acc0|temp_sum[1]~18\)))) # (GND)
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[2]~20\ = CARRY((\TELE_RX|RX_DEMOD|acc0|temp_sum\(2) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT2\) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum[1]~18\))) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(2) & 
-- (\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT2\ & !\TELE_RX|RX_DEMOD|acc0|temp_sum[1]~18\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|temp_sum\(2),
	datab => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT2\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc0|temp_sum[1]~18\,
	combout => \TELE_RX|RX_DEMOD|acc0|temp_sum[2]~19_combout\,
	cout => \TELE_RX|RX_DEMOD|acc0|temp_sum[2]~20\);

-- Location: LCCOMB_X45_Y30_N14
\TELE_RX|RX_DEMOD|acc0|temp_sum[6]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[6]~27_combout\ = ((\TELE_RX|RX_DEMOD|acc0|temp_sum\(6) $ (\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT6\ $ (!\TELE_RX|RX_DEMOD|acc0|temp_sum[5]~26\)))) # (GND)
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[6]~28\ = CARRY((\TELE_RX|RX_DEMOD|acc0|temp_sum\(6) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT6\) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum[5]~26\))) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(6) & 
-- (\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT6\ & !\TELE_RX|RX_DEMOD|acc0|temp_sum[5]~26\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|temp_sum\(6),
	datab => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT6\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc0|temp_sum[5]~26\,
	combout => \TELE_RX|RX_DEMOD|acc0|temp_sum[6]~27_combout\,
	cout => \TELE_RX|RX_DEMOD|acc0|temp_sum[6]~28\);

-- Location: LCCOMB_X45_Y30_N18
\TELE_RX|RX_DEMOD|acc0|temp_sum[8]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[8]~31_combout\ = ((\TELE_RX|RX_DEMOD|acc0|temp_sum\(8) $ (\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT8\ $ (!\TELE_RX|RX_DEMOD|acc0|temp_sum[7]~30\)))) # (GND)
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[8]~32\ = CARRY((\TELE_RX|RX_DEMOD|acc0|temp_sum\(8) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT8\) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum[7]~30\))) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(8) & 
-- (\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT8\ & !\TELE_RX|RX_DEMOD|acc0|temp_sum[7]~30\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|temp_sum\(8),
	datab => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT8\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc0|temp_sum[7]~30\,
	combout => \TELE_RX|RX_DEMOD|acc0|temp_sum[8]~31_combout\,
	cout => \TELE_RX|RX_DEMOD|acc0|temp_sum[8]~32\);

-- Location: LCCOMB_X45_Y30_N20
\TELE_RX|RX_DEMOD|acc0|temp_sum[9]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[9]~33_combout\ = (\TELE_RX|RX_DEMOD|acc0|temp_sum\(9) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT9\ & (\TELE_RX|RX_DEMOD|acc0|temp_sum[8]~32\ & VCC)) # 
-- (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT9\ & (!\TELE_RX|RX_DEMOD|acc0|temp_sum[8]~32\)))) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(9) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT9\ & 
-- (!\TELE_RX|RX_DEMOD|acc0|temp_sum[8]~32\)) # (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT9\ & ((\TELE_RX|RX_DEMOD|acc0|temp_sum[8]~32\) # (GND)))))
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[9]~34\ = CARRY((\TELE_RX|RX_DEMOD|acc0|temp_sum\(9) & (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT9\ & !\TELE_RX|RX_DEMOD|acc0|temp_sum[8]~32\)) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(9) & 
-- ((!\TELE_RX|RX_DEMOD|acc0|temp_sum[8]~32\) # (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT9\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|temp_sum\(9),
	datab => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT9\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc0|temp_sum[8]~32\,
	combout => \TELE_RX|RX_DEMOD|acc0|temp_sum[9]~33_combout\,
	cout => \TELE_RX|RX_DEMOD|acc0|temp_sum[9]~34\);

-- Location: LCCOMB_X45_Y30_N28
\TELE_RX|RX_DEMOD|acc0|temp_sum[13]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[13]~41_combout\ = (\TELE_RX|RX_DEMOD|acc0|temp_sum\(13) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\ & (\TELE_RX|RX_DEMOD|acc0|temp_sum[12]~40\ & VCC)) # 
-- (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\ & (!\TELE_RX|RX_DEMOD|acc0|temp_sum[12]~40\)))) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(13) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\ & 
-- (!\TELE_RX|RX_DEMOD|acc0|temp_sum[12]~40\)) # (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\ & ((\TELE_RX|RX_DEMOD|acc0|temp_sum[12]~40\) # (GND)))))
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[13]~42\ = CARRY((\TELE_RX|RX_DEMOD|acc0|temp_sum\(13) & (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\ & !\TELE_RX|RX_DEMOD|acc0|temp_sum[12]~40\)) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(13) & 
-- ((!\TELE_RX|RX_DEMOD|acc0|temp_sum[12]~40\) # (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|temp_sum\(13),
	datab => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc0|temp_sum[12]~40\,
	combout => \TELE_RX|RX_DEMOD|acc0|temp_sum[13]~41_combout\,
	cout => \TELE_RX|RX_DEMOD|acc0|temp_sum[13]~42\);

-- Location: LCFF_X48_Y30_N3
\TELE_RX|RX_DEMOD|acc0|y[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|y[13]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|y\(13));

-- Location: LCFF_X47_Y31_N21
\TELE_RX|RX_DEMOD|acc1|y[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|y[12]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|y\(12));

-- Location: LCFF_X47_Y31_N31
\TELE_RX|RX_DEMOD|acc1|y[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	sdata => \TELE_RX|RX_DEMOD|acc1|temp_sum\(11),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|y\(11));

-- Location: LCFF_X47_Y31_N1
\TELE_RX|RX_DEMOD|acc1|y[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|y[10]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|y\(10));

-- Location: LCFF_X48_Y30_N25
\TELE_RX|RX_DEMOD|acc0|y[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|y[9]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|y\(9));

-- Location: LCFF_X48_Y30_N27
\TELE_RX|RX_DEMOD|acc0|y[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|y[8]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|y\(8));

-- Location: LCFF_X47_Y31_N15
\TELE_RX|RX_DEMOD|acc1|y[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|y[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|y\(7));

-- Location: LCFF_X48_Y30_N15
\TELE_RX|RX_DEMOD|acc0|y[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|y[6]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|y\(6));

-- Location: LCFF_X47_Y31_N11
\TELE_RX|RX_DEMOD|acc1|y[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|y[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|y\(5));

-- Location: LCFF_X48_Y30_N19
\TELE_RX|RX_DEMOD|acc0|y[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|y[4]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|y\(4));

-- Location: LCFF_X47_Y30_N31
\TELE_RX|RX_DEMOD|acc1|y[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|y[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|y\(3));

-- Location: LCFF_X48_Y30_N23
\TELE_RX|RX_DEMOD|acc0|y[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|y[2]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|y\(2));

-- Location: LCFF_X47_Y31_N23
\TELE_RX|RX_DEMOD|acc1|y[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	sdata => \TELE_RX|RX_DEMOD|acc1|temp_sum\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|y\(1));

-- Location: LCFF_X47_Y31_N9
\TELE_RX|RX_DEMOD|acc1|y[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|y[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|y\(0));

-- Location: LCFF_X74_Y16_N13
\TELE_RX|RX_CLK_CKT|clk_1x_buf\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_2x_buf~regout\,
	datain => \TELE_RX|RX_CLK_CKT|clk_1x_buf~feeder_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_CLK_CKT|clk_1x_buf~regout\);

-- Location: LCCOMB_X47_Y29_N12
\TELE_TX|COS_ROM|Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux3~1_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3)) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1)))) # 
-- (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) $ (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1)))))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & 
-- (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0) $ (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001001011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1),
	combout => \TELE_TX|COS_ROM|Mux3~1_combout\);

-- Location: LCCOMB_X44_Y29_N16
\TELE_TX|COS_ROM|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux0~1_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & ((!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5)))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & 
-- (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0))))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1)))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0) & 
-- (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1),
	combout => \TELE_TX|COS_ROM|Mux0~1_combout\);

-- Location: LCFF_X75_Y16_N31
\TELE_RX|RX_CLK_CKT|div7|q0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|div6|ALT_INV_q0~regout\,
	datain => \TELE_RX|RX_CLK_CKT|div7|q0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_CLK_CKT|div7|q0~regout\);

-- Location: LCFF_X76_Y16_N5
\TELE_RX|RX_CLK_CKT|div5|q0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|div4|ALT_INV_q0~regout\,
	datain => \TELE_RX|RX_CLK_CKT|div5|q0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_CLK_CKT|div5|q0~regout\);

-- Location: LCFF_X75_Y15_N1
\TELE_RX|RX_CLK_CKT|div4|q0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|div3|ALT_INV_q0~regout\,
	datain => \TELE_RX|RX_CLK_CKT|div4|q0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_CLK_CKT|div4|q0~regout\);

-- Location: LCFF_X40_Y19_N1
\TELE_TX|CLK_DISTR|div5|q0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|div4|ALT_INV_q0~regout\,
	datain => \TELE_TX|CLK_DISTR|div5|q0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|CLK_DISTR|div5|q0~regout\);

-- Location: LCFF_X75_Y15_N5
\TELE_RX|RX_CLK_CKT|div3|q0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|div2|ALT_INV_q0~regout\,
	datain => \TELE_RX|RX_CLK_CKT|div3|q0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_CLK_CKT|div3|q0~regout\);

-- Location: LCFF_X62_Y19_N7
\TELE_TX|CLK_DISTR|div4|q0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|div3|ALT_INV_q0~regout\,
	datain => \TELE_TX|CLK_DISTR|div4|q0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|CLK_DISTR|div4|q0~regout\);

-- Location: LCCOMB_X42_Y30_N12
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~1_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) $ 
-- (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0)) # (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4)))))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101110101101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~1_combout\);

-- Location: LCCOMB_X42_Y30_N14
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~0_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & !\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4)))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) $ (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~0_combout\);

-- Location: LCCOMB_X42_Y30_N2
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~1_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3))))) # 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3)) # 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~1_combout\);

-- Location: LCCOMB_X44_Y30_N16
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~0_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) $ 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) $ (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2))))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & ((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2)))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110011010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~0_combout\);

-- Location: LCFF_X76_Y15_N31
\TELE_RX|RX_CLK_CKT|div2|q0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|div1|ALT_INV_q0~regout\,
	datain => \TELE_RX|RX_CLK_CKT|div2|q0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_CLK_CKT|div2|q0~regout\);

-- Location: LCFF_X62_Y19_N1
\TELE_TX|CLK_DISTR|div3|q0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|div2|ALT_INV_q0~regout\,
	datain => \TELE_TX|CLK_DISTR|div3|q0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|CLK_DISTR|div3|q0~regout\);

-- Location: LCFF_X76_Y15_N1
\TELE_RX|RX_CLK_CKT|div1|q0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_rx_master_clk~combout\,
	datain => \TELE_RX|RX_CLK_CKT|div1|q0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_CLK_CKT|div1|q0~regout\);

-- Location: LCFF_X63_Y19_N31
\TELE_TX|CLK_DISTR|div2|q0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|div1|ALT_INV_q0~regout\,
	datain => \TELE_TX|CLK_DISTR|div2|q0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|CLK_DISTR|div2|q0~regout\);

-- Location: LCFF_X63_Y19_N1
\TELE_TX|CLK_DISTR|div1|q0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_tx_master_clk~combout\,
	datain => \TELE_TX|CLK_DISTR|div1|q0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|CLK_DISTR|div1|q0~regout\);

-- Location: LCCOMB_X75_Y16_N30
\TELE_RX|RX_CLK_CKT|div7|q0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_CLK_CKT|div7|q0~0_combout\ = !\TELE_RX|RX_CLK_CKT|div7|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_RX|RX_CLK_CKT|div7|q0~regout\,
	combout => \TELE_RX|RX_CLK_CKT|div7|q0~0_combout\);

-- Location: LCCOMB_X76_Y16_N4
\TELE_RX|RX_CLK_CKT|div5|q0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_CLK_CKT|div5|q0~0_combout\ = !\TELE_RX|RX_CLK_CKT|div5|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_RX|RX_CLK_CKT|div5|q0~regout\,
	combout => \TELE_RX|RX_CLK_CKT|div5|q0~0_combout\);

-- Location: LCCOMB_X75_Y15_N0
\TELE_RX|RX_CLK_CKT|div4|q0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_CLK_CKT|div4|q0~0_combout\ = !\TELE_RX|RX_CLK_CKT|div4|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_RX|RX_CLK_CKT|div4|q0~regout\,
	combout => \TELE_RX|RX_CLK_CKT|div4|q0~0_combout\);

-- Location: LCCOMB_X40_Y19_N0
\TELE_TX|CLK_DISTR|div5|q0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|CLK_DISTR|div5|q0~0_combout\ = !\TELE_TX|CLK_DISTR|div5|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_TX|CLK_DISTR|div5|q0~regout\,
	combout => \TELE_TX|CLK_DISTR|div5|q0~0_combout\);

-- Location: LCCOMB_X75_Y15_N4
\TELE_RX|RX_CLK_CKT|div3|q0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_CLK_CKT|div3|q0~0_combout\ = !\TELE_RX|RX_CLK_CKT|div3|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_RX|RX_CLK_CKT|div3|q0~regout\,
	combout => \TELE_RX|RX_CLK_CKT|div3|q0~0_combout\);

-- Location: LCCOMB_X62_Y19_N6
\TELE_TX|CLK_DISTR|div4|q0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|CLK_DISTR|div4|q0~0_combout\ = !\TELE_TX|CLK_DISTR|div4|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_TX|CLK_DISTR|div4|q0~regout\,
	combout => \TELE_TX|CLK_DISTR|div4|q0~0_combout\);

-- Location: LCCOMB_X76_Y15_N30
\TELE_RX|RX_CLK_CKT|div2|q0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_CLK_CKT|div2|q0~0_combout\ = !\TELE_RX|RX_CLK_CKT|div2|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_RX|RX_CLK_CKT|div2|q0~regout\,
	combout => \TELE_RX|RX_CLK_CKT|div2|q0~0_combout\);

-- Location: LCCOMB_X62_Y19_N0
\TELE_TX|CLK_DISTR|div3|q0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|CLK_DISTR|div3|q0~0_combout\ = !\TELE_TX|CLK_DISTR|div3|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_TX|CLK_DISTR|div3|q0~regout\,
	combout => \TELE_TX|CLK_DISTR|div3|q0~0_combout\);

-- Location: LCCOMB_X76_Y15_N0
\TELE_RX|RX_CLK_CKT|div1|q0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_CLK_CKT|div1|q0~0_combout\ = !\TELE_RX|RX_CLK_CKT|div1|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_RX|RX_CLK_CKT|div1|q0~regout\,
	combout => \TELE_RX|RX_CLK_CKT|div1|q0~0_combout\);

-- Location: LCCOMB_X63_Y19_N30
\TELE_TX|CLK_DISTR|div2|q0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|CLK_DISTR|div2|q0~0_combout\ = !\TELE_TX|CLK_DISTR|div2|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_TX|CLK_DISTR|div2|q0~regout\,
	combout => \TELE_TX|CLK_DISTR|div2|q0~0_combout\);

-- Location: LCCOMB_X63_Y19_N0
\TELE_TX|CLK_DISTR|div1|q0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|CLK_DISTR|div1|q0~0_combout\ = !\TELE_TX|CLK_DISTR|div1|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_TX|CLK_DISTR|div1|q0~regout\,
	combout => \TELE_TX|CLK_DISTR|div1|q0~0_combout\);

-- Location: CLKCTRL_G5
\TELE_RX|RX_CLK_CKT|clk_2x~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \TELE_RX|RX_CLK_CKT|clk_2x~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \TELE_RX|RX_CLK_CKT|clk_2x~clkctrl_outclk\);

-- Location: CLKCTRL_G4
\TELE_RX|RX_DEMOD|local_rst~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\);

-- Location: LCCOMB_X48_Y30_N2
\TELE_RX|RX_DEMOD|acc0|y[13]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|y[13]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc0|temp_sum\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc0|temp_sum\(13),
	combout => \TELE_RX|RX_DEMOD|acc0|y[13]~feeder_combout\);

-- Location: LCCOMB_X47_Y31_N20
\TELE_RX|RX_DEMOD|acc1|y[12]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|y[12]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc1|temp_sum\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc1|temp_sum\(12),
	combout => \TELE_RX|RX_DEMOD|acc1|y[12]~feeder_combout\);

-- Location: LCCOMB_X47_Y31_N0
\TELE_RX|RX_DEMOD|acc1|y[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|y[10]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc1|temp_sum\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc1|temp_sum\(10),
	combout => \TELE_RX|RX_DEMOD|acc1|y[10]~feeder_combout\);

-- Location: LCCOMB_X48_Y30_N24
\TELE_RX|RX_DEMOD|acc0|y[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|y[9]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc0|temp_sum\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc0|temp_sum\(9),
	combout => \TELE_RX|RX_DEMOD|acc0|y[9]~feeder_combout\);

-- Location: LCCOMB_X48_Y30_N26
\TELE_RX|RX_DEMOD|acc0|y[8]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|y[8]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc0|temp_sum\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc0|temp_sum\(8),
	combout => \TELE_RX|RX_DEMOD|acc0|y[8]~feeder_combout\);

-- Location: LCCOMB_X47_Y31_N14
\TELE_RX|RX_DEMOD|acc1|y[7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|y[7]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc1|temp_sum\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc1|temp_sum\(7),
	combout => \TELE_RX|RX_DEMOD|acc1|y[7]~feeder_combout\);

-- Location: LCCOMB_X48_Y30_N14
\TELE_RX|RX_DEMOD|acc0|y[6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|y[6]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc0|temp_sum\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc0|temp_sum\(6),
	combout => \TELE_RX|RX_DEMOD|acc0|y[6]~feeder_combout\);

-- Location: LCCOMB_X47_Y31_N10
\TELE_RX|RX_DEMOD|acc1|y[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|y[5]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc1|temp_sum\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc1|temp_sum\(5),
	combout => \TELE_RX|RX_DEMOD|acc1|y[5]~feeder_combout\);

-- Location: LCCOMB_X48_Y30_N18
\TELE_RX|RX_DEMOD|acc0|y[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|y[4]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc0|temp_sum\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc0|temp_sum\(4),
	combout => \TELE_RX|RX_DEMOD|acc0|y[4]~feeder_combout\);

-- Location: LCCOMB_X47_Y30_N30
\TELE_RX|RX_DEMOD|acc1|y[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|y[3]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc1|temp_sum\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc1|temp_sum\(3),
	combout => \TELE_RX|RX_DEMOD|acc1|y[3]~feeder_combout\);

-- Location: LCCOMB_X48_Y30_N22
\TELE_RX|RX_DEMOD|acc0|y[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|y[2]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc0|temp_sum\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc0|temp_sum\(2),
	combout => \TELE_RX|RX_DEMOD|acc0|y[2]~feeder_combout\);

-- Location: LCCOMB_X47_Y31_N8
\TELE_RX|RX_DEMOD|acc1|y[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|y[0]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc1|temp_sum\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc1|temp_sum\(0),
	combout => \TELE_RX|RX_DEMOD|acc1|y[0]~feeder_combout\);

-- Location: LCCOMB_X74_Y16_N12
\TELE_RX|RX_CLK_CKT|clk_1x_buf~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_CLK_CKT|clk_1x_buf~feeder_combout\ = \TELE_RX|RX_CLK_CKT|div7|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_CLK_CKT|div7|q0~regout\,
	combout => \TELE_RX|RX_CLK_CKT|clk_1x_buf~feeder_combout\);

-- Location: PIN_L8,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reset,
	combout => \reset~combout\);

-- Location: PIN_AB25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\tx_master_clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_tx_master_clk,
	combout => \tx_master_clk~combout\);

-- Location: LCCOMB_X40_Y19_N22
\TELE_TX|CLK_DISTR|clk_128x\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|CLK_DISTR|clk_128x~combout\ = LCELL((\reset~combout\ & \tx_master_clk~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~combout\,
	datad => \tx_master_clk~combout\,
	combout => \TELE_TX|CLK_DISTR|clk_128x~combout\);

-- Location: CLKCTRL_G15
\TELE_TX|CLK_DISTR|clk_128x~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\);

-- Location: LCCOMB_X39_Y19_N14
\TELE_TX|CLK_DISTR|div7|q0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|CLK_DISTR|div7|q0~0_combout\ = !\TELE_TX|CLK_DISTR|div7|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_TX|CLK_DISTR|div7|q0~regout\,
	combout => \TELE_TX|CLK_DISTR|div7|q0~0_combout\);

-- Location: LCFF_X39_Y19_N15
\TELE_TX|CLK_DISTR|div7|q0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|div6|ALT_INV_q0~regout\,
	datain => \TELE_TX|CLK_DISTR|div7|q0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|CLK_DISTR|div7|q0~regout\);

-- Location: LCFF_X38_Y19_N1
\TELE_TX|CLK_DISTR|clk_1x_buf\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_2x_buf~regout\,
	sdata => \TELE_TX|CLK_DISTR|div7|q0~regout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|CLK_DISTR|clk_1x_buf~regout\);

-- Location: LCCOMB_X38_Y19_N0
\TELE_TX|CLK_DISTR|clk_1x\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|CLK_DISTR|clk_1x~combout\ = LCELL((\TELE_TX|CLK_DISTR|clk_1x_buf~regout\) # (!\reset~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_TX|CLK_DISTR|clk_1x_buf~regout\,
	datad => \reset~combout\,
	combout => \TELE_TX|CLK_DISTR|clk_1x~combout\);

-- Location: PIN_AA23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\data_in~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_data_in,
	combout => \data_in~combout\);

-- Location: LCCOMB_X38_Y19_N6
\TELE_TX|MAC_ENC|din_buf~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|MAC_ENC|din_buf~0_combout\ = !\data_in~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \data_in~combout\,
	combout => \TELE_TX|MAC_ENC|din_buf~0_combout\);

-- Location: LCFF_X38_Y19_N7
\TELE_TX|MAC_ENC|din_buf\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_1x~combout\,
	datain => \TELE_TX|MAC_ENC|din_buf~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|MAC_ENC|din_buf~regout\);

-- Location: LCCOMB_X44_Y29_N20
\TELE_TX|MAC_ENC|mdo~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|MAC_ENC|mdo~0_combout\ = \TELE_TX|CLK_DISTR|clk_1x~combout\ $ (\TELE_TX|MAC_ENC|din_buf~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_TX|CLK_DISTR|clk_1x~combout\,
	datad => \TELE_TX|MAC_ENC|din_buf~regout\,
	combout => \TELE_TX|MAC_ENC|mdo~0_combout\);

-- Location: LCFF_X44_Y29_N21
\TELE_TX|MAC_ENC|mdo\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_2x~combout\,
	datain => \TELE_TX|MAC_ENC|mdo~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|MAC_ENC|mdo~regout\);

-- Location: LCCOMB_X44_Y29_N12
\TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y[0]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y[0]~0_combout\ = !\TELE_TX|MAC_ENC|mdo~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_TX|MAC_ENC|mdo~regout\,
	combout => \TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y[0]~0_combout\);

-- Location: LCFF_X44_Y29_N13
\TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y[0]~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y\(0));

-- Location: LCCOMB_X45_Y29_N22
\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[0]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[0]~2_combout\ = \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0) $ (\TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y\(0),
	combout => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[0]~2_combout\);

-- Location: LCCOMB_X40_Y19_N30
\TELE_TX|CLK_DISTR|div6|q0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|CLK_DISTR|div6|q0~0_combout\ = !\TELE_TX|CLK_DISTR|div6|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_TX|CLK_DISTR|div6|q0~regout\,
	combout => \TELE_TX|CLK_DISTR|div6|q0~0_combout\);

-- Location: LCFF_X40_Y19_N31
\TELE_TX|CLK_DISTR|div6|q0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|div5|ALT_INV_q0~regout\,
	datain => \TELE_TX|CLK_DISTR|div6|q0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|CLK_DISTR|div6|q0~regout\);

-- Location: LCCOMB_X39_Y19_N30
\TELE_TX|CLK_DISTR|clk_2x_buf~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|CLK_DISTR|clk_2x_buf~feeder_combout\ = \TELE_TX|CLK_DISTR|div6|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_TX|CLK_DISTR|div6|q0~regout\,
	combout => \TELE_TX|CLK_DISTR|clk_2x_buf~feeder_combout\);

-- Location: LCFF_X39_Y19_N31
\TELE_TX|CLK_DISTR|clk_2x_buf\ : cycloneii_lcell_ff
PORT MAP (
	clk => \tx_master_clk~combout\,
	datain => \TELE_TX|CLK_DISTR|clk_2x_buf~feeder_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|CLK_DISTR|clk_2x_buf~regout\);

-- Location: LCCOMB_X44_Y29_N4
\TELE_TX|CLK_DISTR|clk_2x\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|CLK_DISTR|clk_2x~combout\ = LCELL((\TELE_TX|CLK_DISTR|clk_2x_buf~regout\ & \reset~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \TELE_TX|CLK_DISTR|clk_2x_buf~regout\,
	datac => \reset~combout\,
	combout => \TELE_TX|CLK_DISTR|clk_2x~combout\);

-- Location: LCFF_X44_Y29_N5
\TELE_TX|DIGITAL_PHASE_GEN|delayed_clk_2x\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|CLK_DISTR|clk_2x~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|DIGITAL_PHASE_GEN|delayed_clk_2x~regout\);

-- Location: LCCOMB_X44_Y29_N0
\TELE_TX|DIGITAL_PHASE_GEN|local_rst~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|DIGITAL_PHASE_GEN|local_rst~0_combout\ = (!\TELE_TX|DIGITAL_PHASE_GEN|delayed_clk_2x~regout\ & \TELE_TX|CLK_DISTR|clk_2x~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_TX|DIGITAL_PHASE_GEN|delayed_clk_2x~regout\,
	datad => \TELE_TX|CLK_DISTR|clk_2x~combout\,
	combout => \TELE_TX|DIGITAL_PHASE_GEN|local_rst~0_combout\);

-- Location: CLKCTRL_G9
\TELE_TX|DIGITAL_PHASE_GEN|local_rst~0clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \TELE_TX|DIGITAL_PHASE_GEN|local_rst~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \TELE_TX|DIGITAL_PHASE_GEN|local_rst~0clkctrl_outclk\);

-- Location: LCFF_X45_Y29_N23
\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[0]~2_combout\,
	aclr => \TELE_TX|DIGITAL_PHASE_GEN|local_rst~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0));

-- Location: LCFF_X44_Y29_N27
\TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\,
	sdata => \TELE_TX|MAC_ENC|mdo~regout\,
	aclr => \ALT_INV_reset~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y\(1));

-- Location: LCCOMB_X45_Y29_N8
\TELE_TX|DIGITAL_PHASE_GEN|accumulator|z[1]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|DIGITAL_PHASE_GEN|accumulator|z[1]~0_combout\ = \TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y\(1) $ (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) $ (((\TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y\(0) & \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y\(0),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y\(1),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	combout => \TELE_TX|DIGITAL_PHASE_GEN|accumulator|z[1]~0_combout\);

-- Location: LCFF_X45_Y29_N9
\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|DIGITAL_PHASE_GEN|accumulator|z[1]~0_combout\,
	aclr => \TELE_TX|DIGITAL_PHASE_GEN|local_rst~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1));

-- Location: LCCOMB_X44_Y29_N26
\TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry[2]~0_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y\(1) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1)) # ((\TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y\(0) & 
-- \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0))))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y\(1) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y\(0) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0) & \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y\(0),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_inc_reg|y\(1),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1),
	combout => \TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry[2]~0_combout\);

-- Location: LCCOMB_X45_Y29_N10
\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[2]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[2]~3_combout\ = \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) $ (\TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry[2]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry[2]~0_combout\,
	combout => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[2]~3_combout\);

-- Location: LCFF_X45_Y29_N11
\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[2]~3_combout\,
	aclr => \TELE_TX|DIGITAL_PHASE_GEN|local_rst~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2));

-- Location: LCCOMB_X44_Y29_N14
\TELE_TX|COS_ROM|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux5~0_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & 
-- ((!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0)))))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) $ (((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4)) # (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000100111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1),
	combout => \TELE_TX|COS_ROM|Mux5~0_combout\);

-- Location: LCCOMB_X45_Y29_N12
\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[3]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[3]~0_combout\ = \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) $ (((\TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry[2]~0_combout\ & \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry[2]~0_combout\,
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	combout => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[3]~0_combout\);

-- Location: LCFF_X45_Y29_N13
\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[3]~0_combout\,
	aclr => \TELE_TX|DIGITAL_PHASE_GEN|local_rst~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3));

-- Location: LCCOMB_X44_Y29_N10
\TELE_TX|COS_ROM|Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux5~1_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) $ (((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4)) # (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0)))))) # 
-- (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0)))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1),
	combout => \TELE_TX|COS_ROM|Mux5~1_combout\);

-- Location: LCCOMB_X44_Y29_N8
\TELE_TX|COS_ROM|Mux5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux5~2_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5) $ (((!\TELE_TX|COS_ROM|Mux5~1_combout\))))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & 
-- ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5) & (\TELE_TX|COS_ROM|Mux5~0_combout\ & !\TELE_TX|COS_ROM|Mux5~1_combout\)) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5) & (!\TELE_TX|COS_ROM|Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000101011001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5),
	datab => \TELE_TX|COS_ROM|Mux5~0_combout\,
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3),
	datad => \TELE_TX|COS_ROM|Mux5~1_combout\,
	combout => \TELE_TX|COS_ROM|Mux5~2_combout\);

-- Location: LCFF_X44_Y29_N9
\TELE_TX|COS_ROM|temp_amp[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|COS_ROM|Mux5~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|COS_ROM|temp_amp\(0));

-- Location: LCCOMB_X47_Y29_N0
\TELE_TX|COS_ROM|amp_bits[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|amp_bits[0]~feeder_combout\ = \TELE_TX|COS_ROM|temp_amp\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_TX|COS_ROM|temp_amp\(0),
	combout => \TELE_TX|COS_ROM|amp_bits[0]~feeder_combout\);

-- Location: LCFF_X47_Y29_N1
\TELE_TX|COS_ROM|amp_bits[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|ALT_INV_clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|COS_ROM|amp_bits[0]~feeder_combout\,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|COS_ROM|amp_bits\(0));

-- Location: LCCOMB_X45_Y29_N20
\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[4]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[4]~4_combout\ = \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) $ (((\TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry[2]~0_combout\ & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & 
-- \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry[2]~0_combout\,
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	combout => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[4]~4_combout\);

-- Location: LCFF_X45_Y29_N21
\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[4]~4_combout\,
	aclr => \TELE_TX|DIGITAL_PHASE_GEN|local_rst~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4));

-- Location: LCCOMB_X47_Y29_N14
\TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry~1_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & 
-- \TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry[2]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry[2]~0_combout\,
	combout => \TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry~1_combout\);

-- Location: LCCOMB_X48_Y29_N24
\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[5]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[5]~1_combout\ = \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5) $ (\TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|accumulator|temp_carry~1_combout\,
	combout => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[5]~1_combout\);

-- Location: LCFF_X48_Y29_N25
\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y[5]~1_combout\,
	aclr => \TELE_TX|DIGITAL_PHASE_GEN|local_rst~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5));

-- Location: LCCOMB_X47_Y29_N16
\TELE_TX|COS_ROM|Mux4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux4~3_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & 
-- ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0)))))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) $ (((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & !\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	combout => \TELE_TX|COS_ROM|Mux4~3_combout\);

-- Location: LCCOMB_X44_Y29_N30
\TELE_TX|COS_ROM|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux4~0_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & ((!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1)))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & 
-- (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0))))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0) $ (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1),
	combout => \TELE_TX|COS_ROM|Mux4~0_combout\);

-- Location: LCCOMB_X44_Y29_N24
\TELE_TX|COS_ROM|Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux4~1_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & !\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1))) # 
-- (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1))))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) $ 
-- ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001011010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1),
	combout => \TELE_TX|COS_ROM|Mux4~1_combout\);

-- Location: LCCOMB_X47_Y29_N30
\TELE_TX|COS_ROM|Mux4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux4~2_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5) & (\TELE_TX|COS_ROM|Mux4~0_combout\))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & 
-- (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5) $ (((!\TELE_TX|COS_ROM|Mux4~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010000110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5),
	datac => \TELE_TX|COS_ROM|Mux4~0_combout\,
	datad => \TELE_TX|COS_ROM|Mux4~1_combout\,
	combout => \TELE_TX|COS_ROM|Mux4~2_combout\);

-- Location: LCCOMB_X47_Y29_N24
\TELE_TX|COS_ROM|Mux4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux4~4_combout\ = (\TELE_TX|COS_ROM|Mux4~2_combout\) # ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5) & \TELE_TX|COS_ROM|Mux4~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5),
	datac => \TELE_TX|COS_ROM|Mux4~3_combout\,
	datad => \TELE_TX|COS_ROM|Mux4~2_combout\,
	combout => \TELE_TX|COS_ROM|Mux4~4_combout\);

-- Location: LCFF_X47_Y29_N25
\TELE_TX|COS_ROM|temp_amp[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|COS_ROM|Mux4~4_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|COS_ROM|temp_amp\(1));

-- Location: LCFF_X47_Y29_N3
\TELE_TX|COS_ROM|amp_bits[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|ALT_INV_clk_128x~clkctrl_outclk\,
	sdata => \TELE_TX|COS_ROM|temp_amp\(1),
	sload => VCC,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|COS_ROM|amp_bits\(1));

-- Location: LCCOMB_X47_Y29_N8
\TELE_TX|COS_ROM|Mux3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux3~3_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3)) # ((!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0))))) # 
-- (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & !\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & 
-- (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001010110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	combout => \TELE_TX|COS_ROM|Mux3~3_combout\);

-- Location: LCCOMB_X47_Y29_N10
\TELE_TX|COS_ROM|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux3~0_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1)) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0))))) # 
-- (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1)))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1),
	combout => \TELE_TX|COS_ROM|Mux3~0_combout\);

-- Location: LCCOMB_X47_Y29_N6
\TELE_TX|COS_ROM|Mux3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux3~2_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & (((!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5) & \TELE_TX|COS_ROM|Mux3~0_combout\)))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & (\TELE_TX|COS_ROM|Mux3~1_combout\ $ 
-- ((!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100100001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|COS_ROM|Mux3~1_combout\,
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4),
	datad => \TELE_TX|COS_ROM|Mux3~0_combout\,
	combout => \TELE_TX|COS_ROM|Mux3~2_combout\);

-- Location: LCCOMB_X47_Y29_N18
\TELE_TX|COS_ROM|Mux3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux3~4_combout\ = (\TELE_TX|COS_ROM|Mux3~2_combout\) # ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5) & \TELE_TX|COS_ROM|Mux3~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5),
	datac => \TELE_TX|COS_ROM|Mux3~3_combout\,
	datad => \TELE_TX|COS_ROM|Mux3~2_combout\,
	combout => \TELE_TX|COS_ROM|Mux3~4_combout\);

-- Location: LCFF_X47_Y29_N19
\TELE_TX|COS_ROM|temp_amp[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|COS_ROM|Mux3~4_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|COS_ROM|temp_amp\(2));

-- Location: LCCOMB_X47_Y29_N28
\TELE_TX|COS_ROM|amp_bits[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|amp_bits[2]~feeder_combout\ = \TELE_TX|COS_ROM|temp_amp\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_TX|COS_ROM|temp_amp\(2),
	combout => \TELE_TX|COS_ROM|amp_bits[2]~feeder_combout\);

-- Location: LCFF_X47_Y29_N29
\TELE_TX|COS_ROM|amp_bits[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|ALT_INV_clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|COS_ROM|amp_bits[2]~feeder_combout\,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|COS_ROM|amp_bits\(2));

-- Location: LCCOMB_X44_Y29_N28
\TELE_TX|COS_ROM|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux2~0_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0) & !\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2)))) # 
-- (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) $ (((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1),
	combout => \TELE_TX|COS_ROM|Mux2~0_combout\);

-- Location: LCCOMB_X44_Y29_N6
\TELE_TX|COS_ROM|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux2~1_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) $ (((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2)) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0)))))) # 
-- (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1),
	combout => \TELE_TX|COS_ROM|Mux2~1_combout\);

-- Location: LCCOMB_X44_Y29_N18
\TELE_TX|COS_ROM|Mux2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux2~2_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5) & (!\TELE_TX|COS_ROM|Mux2~0_combout\ & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3)) # (\TELE_TX|COS_ROM|Mux2~1_combout\)))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5) & 
-- ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & (\TELE_TX|COS_ROM|Mux2~0_combout\)) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & ((!\TELE_TX|COS_ROM|Mux2~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110001001100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5),
	datab => \TELE_TX|COS_ROM|Mux2~0_combout\,
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3),
	datad => \TELE_TX|COS_ROM|Mux2~1_combout\,
	combout => \TELE_TX|COS_ROM|Mux2~2_combout\);

-- Location: LCFF_X44_Y29_N19
\TELE_TX|COS_ROM|temp_amp[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|COS_ROM|Mux2~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|COS_ROM|temp_amp\(3));

-- Location: LCCOMB_X45_Y29_N24
\TELE_TX|COS_ROM|amp_bits[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|amp_bits[3]~feeder_combout\ = \TELE_TX|COS_ROM|temp_amp\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_TX|COS_ROM|temp_amp\(3),
	combout => \TELE_TX|COS_ROM|amp_bits[3]~feeder_combout\);

-- Location: LCFF_X45_Y29_N25
\TELE_TX|COS_ROM|amp_bits[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|ALT_INV_clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|COS_ROM|amp_bits[3]~feeder_combout\,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|COS_ROM|amp_bits\(3));

-- Location: LCCOMB_X47_Y29_N26
\TELE_TX|COS_ROM|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux1~0_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2)) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0))))) # 
-- (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3) & \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001100000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	combout => \TELE_TX|COS_ROM|Mux1~0_combout\);

-- Location: LCCOMB_X47_Y29_N20
\TELE_TX|COS_ROM|Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux1~1_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & (((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3))))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & 
-- ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3)) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	combout => \TELE_TX|COS_ROM|Mux1~1_combout\);

-- Location: LCCOMB_X47_Y29_N4
\TELE_TX|COS_ROM|Mux1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux1~2_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & (\TELE_TX|COS_ROM|Mux1~0_combout\ $ (\TELE_TX|COS_ROM|Mux1~1_combout\ $ (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5))))) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & 
-- ((\TELE_TX|COS_ROM|Mux1~1_combout\ & (!\TELE_TX|COS_ROM|Mux1~0_combout\ & \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5))) # (!\TELE_TX|COS_ROM|Mux1~1_combout\ & ((!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100010000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1),
	datab => \TELE_TX|COS_ROM|Mux1~0_combout\,
	datac => \TELE_TX|COS_ROM|Mux1~1_combout\,
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5),
	combout => \TELE_TX|COS_ROM|Mux1~2_combout\);

-- Location: LCFF_X47_Y29_N5
\TELE_TX|COS_ROM|temp_amp[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|COS_ROM|Mux1~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|COS_ROM|temp_amp\(4));

-- Location: LCFF_X47_Y29_N23
\TELE_TX|COS_ROM|amp_bits[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|ALT_INV_clk_128x~clkctrl_outclk\,
	sdata => \TELE_TX|COS_ROM|temp_amp\(4),
	sload => VCC,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|COS_ROM|amp_bits\(4));

-- Location: LCCOMB_X44_Y29_N22
\TELE_TX|COS_ROM|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux0~0_combout\ = (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0) $ (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5))))) # 
-- (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0) & (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5) $ (\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(4),
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(0),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(5),
	datad => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(1),
	combout => \TELE_TX|COS_ROM|Mux0~0_combout\);

-- Location: LCCOMB_X44_Y29_N2
\TELE_TX|COS_ROM|Mux0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|Mux0~2_combout\ = (\TELE_TX|COS_ROM|Mux0~0_combout\ & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & (!\TELE_TX|COS_ROM|Mux0~1_combout\)) # (!\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2) & ((\TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3)))))) # 
-- (!\TELE_TX|COS_ROM|Mux0~0_combout\ & (\TELE_TX|COS_ROM|Mux0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_TX|COS_ROM|Mux0~1_combout\,
	datab => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(2),
	datac => \TELE_TX|DIGITAL_PHASE_GEN|phase_reg|y\(3),
	datad => \TELE_TX|COS_ROM|Mux0~0_combout\,
	combout => \TELE_TX|COS_ROM|Mux0~2_combout\);

-- Location: LCFF_X44_Y29_N3
\TELE_TX|COS_ROM|temp_amp[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|COS_ROM|Mux0~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|COS_ROM|temp_amp\(5));

-- Location: LCCOMB_X45_Y29_N18
\TELE_TX|COS_ROM|amp_bits[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_TX|COS_ROM|amp_bits[5]~feeder_combout\ = \TELE_TX|COS_ROM|temp_amp\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_TX|COS_ROM|temp_amp\(5),
	combout => \TELE_TX|COS_ROM|amp_bits[5]~feeder_combout\);

-- Location: LCFF_X45_Y29_N19
\TELE_TX|COS_ROM|amp_bits[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_TX|CLK_DISTR|ALT_INV_clk_128x~clkctrl_outclk\,
	datain => \TELE_TX|COS_ROM|amp_bits[5]~feeder_combout\,
	ena => \reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_TX|COS_ROM|amp_bits\(5));

-- Location: PIN_AB26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\rx_master_clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_rx_master_clk,
	combout => \rx_master_clk~combout\);

-- Location: LCCOMB_X76_Y16_N22
\TELE_RX|RX_CLK_CKT|clk_128x\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_CLK_CKT|clk_128x~combout\ = LCELL((\reset~combout\ & \rx_master_clk~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~combout\,
	datad => \rx_master_clk~combout\,
	combout => \TELE_RX|RX_CLK_CKT|clk_128x~combout\);

-- Location: CLKCTRL_G6
\TELE_RX|RX_CLK_CKT|clk_128x~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\);

-- Location: LCCOMB_X42_Y30_N26
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[0]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[0]~2_combout\ = \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y\(0) $ (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y\(0),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[0]~2_combout\);

-- Location: LCCOMB_X76_Y16_N30
\TELE_RX|RX_CLK_CKT|div6|q0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_CLK_CKT|div6|q0~0_combout\ = !\TELE_RX|RX_CLK_CKT|div6|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_RX|RX_CLK_CKT|div6|q0~regout\,
	combout => \TELE_RX|RX_CLK_CKT|div6|q0~0_combout\);

-- Location: LCFF_X76_Y16_N31
\TELE_RX|RX_CLK_CKT|div6|q0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|div5|ALT_INV_q0~regout\,
	datain => \TELE_RX|RX_CLK_CKT|div6|q0~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_CLK_CKT|div6|q0~regout\);

-- Location: LCCOMB_X75_Y16_N14
\TELE_RX|RX_CLK_CKT|clk_2x_buf~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_CLK_CKT|clk_2x_buf~feeder_combout\ = \TELE_RX|RX_CLK_CKT|div6|q0~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_CLK_CKT|div6|q0~regout\,
	combout => \TELE_RX|RX_CLK_CKT|clk_2x_buf~feeder_combout\);

-- Location: LCFF_X75_Y16_N15
\TELE_RX|RX_CLK_CKT|clk_2x_buf\ : cycloneii_lcell_ff
PORT MAP (
	clk => \rx_master_clk~combout\,
	datain => \TELE_RX|RX_CLK_CKT|clk_2x_buf~feeder_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_CLK_CKT|clk_2x_buf~regout\);

-- Location: LCCOMB_X76_Y20_N14
\TELE_RX|RX_CLK_CKT|clk_2x\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_CLK_CKT|clk_2x~combout\ = LCELL((\reset~combout\ & \TELE_RX|RX_CLK_CKT|clk_2x_buf~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \reset~combout\,
	datad => \TELE_RX|RX_CLK_CKT|clk_2x_buf~regout\,
	combout => \TELE_RX|RX_CLK_CKT|clk_2x~combout\);

-- Location: LCFF_X94_Y26_N1
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|delayed_clk_2x\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	sdata => \TELE_RX|RX_CLK_CKT|clk_2x~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|delayed_clk_2x~regout\);

-- Location: LCCOMB_X94_Y26_N0
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0_combout\ = (\TELE_RX|RX_CLK_CKT|clk_2x~combout\ & !\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|delayed_clk_2x~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \TELE_RX|RX_CLK_CKT|clk_2x~combout\,
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|delayed_clk_2x~regout\,
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0_combout\);

-- Location: CLKCTRL_G7
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0clkctrl_outclk\);

-- Location: LCFF_X42_Y30_N27
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[0]~2_combout\,
	aclr => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0));

-- Location: LCCOMB_X42_Y30_N28
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[1]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[1]~3_combout\ = \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) $ (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y\(0) & 
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y\(0),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[1]~3_combout\);

-- Location: LCFF_X42_Y30_N29
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[1]~3_combout\,
	aclr => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1));

-- Location: LCCOMB_X42_Y30_N20
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y[0]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y[0]~feeder_combout\);

-- Location: LCFF_X42_Y30_N21
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y[0]~feeder_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y\(0));

-- Location: LCCOMB_X42_Y30_N22
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|accumulator|temp_carry~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|accumulator|temp_carry~0_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y\(0) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y\(0),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|accumulator|temp_carry~0_combout\);

-- Location: LCCOMB_X42_Y30_N0
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[4]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[4]~5_combout\ = \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) $ (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & 
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|accumulator|temp_carry~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|accumulator|temp_carry~0_combout\,
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[4]~5_combout\);

-- Location: LCFF_X42_Y30_N1
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[4]~5_combout\,
	aclr => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4));

-- Location: LCCOMB_X42_Y30_N18
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~0_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4)))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0))))) # 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) $ (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0)) # 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011100010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~0_combout\);

-- Location: LCCOMB_X42_Y30_N24
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[3]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[3]~0_combout\ = \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) $ (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|accumulator|temp_carry~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|accumulator|temp_carry~0_combout\,
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[3]~0_combout\);

-- Location: LCFF_X42_Y30_N25
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[3]~0_combout\,
	aclr => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3));

-- Location: LCCOMB_X43_Y30_N20
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[5]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[5]~1_combout\ = \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5) $ (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|accumulator|temp_carry~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|accumulator|temp_carry~0_combout\,
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[5]~1_combout\);

-- Location: LCFF_X43_Y30_N21
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[5]~1_combout\,
	aclr => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5));

-- Location: LCCOMB_X43_Y30_N0
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~2_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~1_combout\ $ 
-- (((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5)))))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~0_combout\ & 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~1_combout\ & \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~0_combout\ & 
-- ((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~1_combout\,
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~0_combout\,
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~2_combout\);

-- Location: LCFF_X43_Y30_N1
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux5~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp\(0));

-- Location: LCCOMB_X42_Y30_N6
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[2]~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[2]~4_combout\ = \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) $ (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y\(0) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_inc_reg|y\(0),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[2]~4_combout\);

-- Location: LCFF_X42_Y30_N7
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[2]~4_combout\,
	aclr => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|local_rst~0clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2));

-- Location: LCCOMB_X43_Y30_N28
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~3_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0)))))) # 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) $ (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- !\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~3_combout\);

-- Location: LCCOMB_X43_Y30_N8
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~1_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & !\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2))))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) $ (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010010001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~1_combout\);

-- Location: LCCOMB_X43_Y30_N30
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~0_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & ((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0)))))) # 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) $ 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010010001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~0_combout\);

-- Location: LCCOMB_X43_Y30_N26
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~2_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~0_combout\)))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5) $ 
-- ((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100100001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~1_combout\,
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~0_combout\,
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~2_combout\);

-- Location: LCCOMB_X43_Y30_N18
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~4_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~2_combout\) # ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~3_combout\ & \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~3_combout\,
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~2_combout\,
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~4_combout\);

-- Location: LCFF_X43_Y30_N19
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux4~4_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp\(1));

-- Location: LCCOMB_X44_Y30_N30
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~1_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2)) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1)))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) $ (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2)))))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) $ (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~1_combout\);

-- Location: LCCOMB_X44_Y30_N4
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~0_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- !\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2))))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1)) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2)))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~0_combout\);

-- Location: LCCOMB_X43_Y30_N14
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~2_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~0_combout\)))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5) $ 
-- ((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100100001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~1_combout\,
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~0_combout\,
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~2_combout\);

-- Location: LCCOMB_X43_Y30_N24
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~3_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2))) # 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1)))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & !\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001010100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~3_combout\);

-- Location: LCCOMB_X43_Y30_N12
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~4_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~2_combout\) # ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~3_combout\ & \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~2_combout\,
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~3_combout\,
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~4_combout\);

-- Location: LCFF_X43_Y30_N13
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux3~4_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp\(2));

-- Location: LCCOMB_X42_Y30_N16
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~1_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) $ (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4))))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2)) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~1_combout\);

-- Location: LCCOMB_X43_Y30_N6
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~2_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~0_combout\ & (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3)) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~1_combout\)))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~0_combout\ & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5) $ (((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~1_combout\ & !\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~0_combout\,
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~1_combout\,
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~2_combout\);

-- Location: LCFF_X43_Y30_N7
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux2~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp\(3));

-- Location: LCCOMB_X43_Y30_N10
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~0_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2)) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0))))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~0_combout\);

-- Location: LCCOMB_X43_Y30_N16
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~2_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~1_combout\ & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5) & 
-- ((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~0_combout\))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~0_combout\)))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~1_combout\ & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5) $ 
-- (((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~0_combout\) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100110100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~1_combout\,
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~0_combout\,
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~2_combout\);

-- Location: LCFF_X43_Y30_N17
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux1~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp\(4));

-- Location: LCCOMB_X43_Y30_N4
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~0_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0)))))) # 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1)))) # 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~0_combout\);

-- Location: LCCOMB_X43_Y30_N22
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~1_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5) $ (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0))))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5) $ (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(5),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~1_combout\);

-- Location: LCCOMB_X43_Y30_N2
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~2_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~1_combout\ & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & 
-- ((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~0_combout\))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3))))) # 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~1_combout\ & (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~0_combout\,
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~1_combout\,
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~2_combout\);

-- Location: LCFF_X43_Y30_N3
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|Mux0~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom1|temp_amp\(5));

-- Location: DSPMULT_X46_Y30_N0
\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1\ : cycloneii_mac_mult
-- pragma translate_off
GENERIC MAP (
	dataa_clock => "0",
	dataa_width => 9,
	datab_clock => "none",
	datab_width => 9,
	signa_clock => "none",
	signb_clock => "none")
-- pragma translate_on
PORT MAP (
	signa => VCC,
	signb => VCC,
	clk => \TELE_RX|RX_CLK_CKT|ALT_INV_clk_128x~clkctrl_outclk\,
	aclr => GND,
	ena => \reset~combout\,
	dataa => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAA_bus\,
	datab => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAB_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_mult1_DATAOUT_bus\);

-- Location: LCCOMB_X47_Y30_N2
\TELE_RX|RX_DEMOD|acc1|temp_sum[1]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[1]~17_combout\ = (\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT1\ & ((\TELE_RX|RX_DEMOD|acc1|temp_sum\(1) & (\TELE_RX|RX_DEMOD|acc1|temp_sum[0]~16\ & VCC)) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(1) & 
-- (!\TELE_RX|RX_DEMOD|acc1|temp_sum[0]~16\)))) # (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT1\ & ((\TELE_RX|RX_DEMOD|acc1|temp_sum\(1) & (!\TELE_RX|RX_DEMOD|acc1|temp_sum[0]~16\)) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(1) & 
-- ((\TELE_RX|RX_DEMOD|acc1|temp_sum[0]~16\) # (GND)))))
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[1]~18\ = CARRY((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT1\ & (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(1) & !\TELE_RX|RX_DEMOD|acc1|temp_sum[0]~16\)) # 
-- (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT1\ & ((!\TELE_RX|RX_DEMOD|acc1|temp_sum[0]~16\) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT1\,
	datab => \TELE_RX|RX_DEMOD|acc1|temp_sum\(1),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc1|temp_sum[0]~16\,
	combout => \TELE_RX|RX_DEMOD|acc1|temp_sum[1]~17_combout\,
	cout => \TELE_RX|RX_DEMOD|acc1|temp_sum[1]~18\);

-- Location: LCFF_X76_Y20_N13
\TELE_RX|RX_DEMOD|delayed_clk_2x\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~combout\,
	sdata => \TELE_RX|RX_CLK_CKT|clk_2x~combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|delayed_clk_2x~regout\);

-- Location: LCCOMB_X76_Y20_N22
\TELE_RX|RX_DEMOD|local_rst\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|local_rst~combout\ = LCELL((\TELE_RX|RX_CLK_CKT|clk_2x~combout\ & !\TELE_RX|RX_DEMOD|delayed_clk_2x~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_RX|RX_CLK_CKT|clk_2x~combout\,
	datad => \TELE_RX|RX_DEMOD|delayed_clk_2x~regout\,
	combout => \TELE_RX|RX_DEMOD|local_rst~combout\);

-- Location: LCFF_X76_Y20_N23
\TELE_RX|RX_DEMOD|acc1|delayed_rst\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|ALT_INV_clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|local_rst~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|delayed_rst~regout\);

-- Location: CLKCTRL_G12
\TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\);

-- Location: LCFF_X47_Y30_N3
\TELE_RX|RX_DEMOD|acc1|temp_sum[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|temp_sum[1]~17_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|temp_sum\(1));

-- Location: LCCOMB_X47_Y30_N4
\TELE_RX|RX_DEMOD|acc1|temp_sum[2]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[2]~19_combout\ = ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT2\ $ (\TELE_RX|RX_DEMOD|acc1|temp_sum\(2) $ (!\TELE_RX|RX_DEMOD|acc1|temp_sum[1]~18\)))) # (GND)
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[2]~20\ = CARRY((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT2\ & ((\TELE_RX|RX_DEMOD|acc1|temp_sum\(2)) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum[1]~18\))) # 
-- (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT2\ & (\TELE_RX|RX_DEMOD|acc1|temp_sum\(2) & !\TELE_RX|RX_DEMOD|acc1|temp_sum[1]~18\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT2\,
	datab => \TELE_RX|RX_DEMOD|acc1|temp_sum\(2),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc1|temp_sum[1]~18\,
	combout => \TELE_RX|RX_DEMOD|acc1|temp_sum[2]~19_combout\,
	cout => \TELE_RX|RX_DEMOD|acc1|temp_sum[2]~20\);

-- Location: LCFF_X47_Y30_N5
\TELE_RX|RX_DEMOD|acc1|temp_sum[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|temp_sum[2]~19_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|temp_sum\(2));

-- Location: LCCOMB_X47_Y30_N8
\TELE_RX|RX_DEMOD|acc1|temp_sum[4]~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[4]~23_combout\ = ((\TELE_RX|RX_DEMOD|acc1|temp_sum\(4) $ (\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT4\ $ (!\TELE_RX|RX_DEMOD|acc1|temp_sum[3]~22\)))) # (GND)
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[4]~24\ = CARRY((\TELE_RX|RX_DEMOD|acc1|temp_sum\(4) & ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT4\) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum[3]~22\))) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(4) & 
-- (\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT4\ & !\TELE_RX|RX_DEMOD|acc1|temp_sum[3]~22\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|temp_sum\(4),
	datab => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT4\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc1|temp_sum[3]~22\,
	combout => \TELE_RX|RX_DEMOD|acc1|temp_sum[4]~23_combout\,
	cout => \TELE_RX|RX_DEMOD|acc1|temp_sum[4]~24\);

-- Location: LCCOMB_X47_Y30_N12
\TELE_RX|RX_DEMOD|acc1|temp_sum[6]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[6]~27_combout\ = ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT6\ $ (\TELE_RX|RX_DEMOD|acc1|temp_sum\(6) $ (!\TELE_RX|RX_DEMOD|acc1|temp_sum[5]~26\)))) # (GND)
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[6]~28\ = CARRY((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT6\ & ((\TELE_RX|RX_DEMOD|acc1|temp_sum\(6)) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum[5]~26\))) # 
-- (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT6\ & (\TELE_RX|RX_DEMOD|acc1|temp_sum\(6) & !\TELE_RX|RX_DEMOD|acc1|temp_sum[5]~26\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT6\,
	datab => \TELE_RX|RX_DEMOD|acc1|temp_sum\(6),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc1|temp_sum[5]~26\,
	combout => \TELE_RX|RX_DEMOD|acc1|temp_sum[6]~27_combout\,
	cout => \TELE_RX|RX_DEMOD|acc1|temp_sum[6]~28\);

-- Location: LCFF_X47_Y30_N13
\TELE_RX|RX_DEMOD|acc1|temp_sum[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|temp_sum[6]~27_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|temp_sum\(6));

-- Location: LCCOMB_X47_Y30_N16
\TELE_RX|RX_DEMOD|acc1|temp_sum[8]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[8]~31_combout\ = ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT8\ $ (\TELE_RX|RX_DEMOD|acc1|temp_sum\(8) $ (!\TELE_RX|RX_DEMOD|acc1|temp_sum[7]~30\)))) # (GND)
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[8]~32\ = CARRY((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT8\ & ((\TELE_RX|RX_DEMOD|acc1|temp_sum\(8)) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum[7]~30\))) # 
-- (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT8\ & (\TELE_RX|RX_DEMOD|acc1|temp_sum\(8) & !\TELE_RX|RX_DEMOD|acc1|temp_sum[7]~30\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT8\,
	datab => \TELE_RX|RX_DEMOD|acc1|temp_sum\(8),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc1|temp_sum[7]~30\,
	combout => \TELE_RX|RX_DEMOD|acc1|temp_sum[8]~31_combout\,
	cout => \TELE_RX|RX_DEMOD|acc1|temp_sum[8]~32\);

-- Location: LCFF_X47_Y30_N17
\TELE_RX|RX_DEMOD|acc1|temp_sum[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|temp_sum[8]~31_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|temp_sum\(8));

-- Location: LCCOMB_X47_Y30_N18
\TELE_RX|RX_DEMOD|acc1|temp_sum[9]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[9]~33_combout\ = (\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT9\ & ((\TELE_RX|RX_DEMOD|acc1|temp_sum\(9) & (\TELE_RX|RX_DEMOD|acc1|temp_sum[8]~32\ & VCC)) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(9) & 
-- (!\TELE_RX|RX_DEMOD|acc1|temp_sum[8]~32\)))) # (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT9\ & ((\TELE_RX|RX_DEMOD|acc1|temp_sum\(9) & (!\TELE_RX|RX_DEMOD|acc1|temp_sum[8]~32\)) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(9) & 
-- ((\TELE_RX|RX_DEMOD|acc1|temp_sum[8]~32\) # (GND)))))
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[9]~34\ = CARRY((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT9\ & (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(9) & !\TELE_RX|RX_DEMOD|acc1|temp_sum[8]~32\)) # 
-- (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT9\ & ((!\TELE_RX|RX_DEMOD|acc1|temp_sum[8]~32\) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT9\,
	datab => \TELE_RX|RX_DEMOD|acc1|temp_sum\(9),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc1|temp_sum[8]~32\,
	combout => \TELE_RX|RX_DEMOD|acc1|temp_sum[9]~33_combout\,
	cout => \TELE_RX|RX_DEMOD|acc1|temp_sum[9]~34\);

-- Location: LCFF_X47_Y30_N19
\TELE_RX|RX_DEMOD|acc1|temp_sum[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|temp_sum[9]~33_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|temp_sum\(9));

-- Location: LCCOMB_X47_Y30_N26
\TELE_RX|RX_DEMOD|acc1|temp_sum[13]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[13]~41_combout\ = (\TELE_RX|RX_DEMOD|acc1|temp_sum\(13) & ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\ & (\TELE_RX|RX_DEMOD|acc1|temp_sum[12]~40\ & VCC)) # 
-- (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\ & (!\TELE_RX|RX_DEMOD|acc1|temp_sum[12]~40\)))) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(13) & ((\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\ & 
-- (!\TELE_RX|RX_DEMOD|acc1|temp_sum[12]~40\)) # (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\ & ((\TELE_RX|RX_DEMOD|acc1|temp_sum[12]~40\) # (GND)))))
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[13]~42\ = CARRY((\TELE_RX|RX_DEMOD|acc1|temp_sum\(13) & (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\ & !\TELE_RX|RX_DEMOD|acc1|temp_sum[12]~40\)) # (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(13) & 
-- ((!\TELE_RX|RX_DEMOD|acc1|temp_sum[12]~40\) # (!\TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|temp_sum\(13),
	datab => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc1|temp_sum[12]~40\,
	combout => \TELE_RX|RX_DEMOD|acc1|temp_sum[13]~41_combout\,
	cout => \TELE_RX|RX_DEMOD|acc1|temp_sum[13]~42\);

-- Location: LCCOMB_X47_Y30_N28
\TELE_RX|RX_DEMOD|acc1|temp_sum[14]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|temp_sum[14]~43_combout\ = \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\ $ (\TELE_RX|RX_DEMOD|acc1|temp_sum[13]~42\ $ (!\TELE_RX|RX_DEMOD|acc1|temp_sum\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TELE_RX|RX_DEMOD|mul1|Mult0|auto_generated|mac_out2~DATAOUT11\,
	datad => \TELE_RX|RX_DEMOD|acc1|temp_sum\(14),
	cin => \TELE_RX|RX_DEMOD|acc1|temp_sum[13]~42\,
	combout => \TELE_RX|RX_DEMOD|acc1|temp_sum[14]~43_combout\);

-- Location: LCFF_X47_Y30_N29
\TELE_RX|RX_DEMOD|acc1|temp_sum[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|temp_sum[14]~43_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|temp_sum\(14));

-- Location: LCFF_X47_Y31_N17
\TELE_RX|RX_DEMOD|acc1|y[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	sdata => \TELE_RX|RX_DEMOD|acc1|temp_sum\(14),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|y\(14));

-- Location: LCCOMB_X44_Y30_N2
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~1_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) $ 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) $ (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2))))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & ((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2)))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110011010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~1_combout\);

-- Location: LCCOMB_X44_Y30_N18
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~2_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~0_combout\)) # 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & ((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001110100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~0_combout\,
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~1_combout\,
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~2_combout\);

-- Location: LCFF_X44_Y30_N19
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux5~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp\(0));

-- Location: LCCOMB_X44_Y30_N14
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~1_combout\ = \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) $ (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & 
-- ((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1)) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0)))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001101111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~1_combout\);

-- Location: LCCOMB_X44_Y30_N28
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~0_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) $ 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) $ (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2))))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & ((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2)))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~0_combout\);

-- Location: LCCOMB_X44_Y30_N20
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~2_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~0_combout\))) # 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~1_combout\,
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~0_combout\,
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~2_combout\);

-- Location: LCFF_X44_Y30_N21
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux4~2_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp\(1));

-- Location: LCCOMB_X44_Y30_N6
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux3~0_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) $ 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) $ (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2))))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & ((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2)))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100111010011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux3~0_combout\);

-- Location: LCCOMB_X44_Y30_N22
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux3~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux3~1_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux3~0_combout\ & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2)) # (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0))))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & 
-- (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux3~0_combout\,
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux3~1_combout\);

-- Location: LCFF_X44_Y30_N23
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux3~1_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp\(2));

-- Location: LCCOMB_X44_Y30_N12
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux2~0_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & (((!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2))))) # 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) $ (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1)) # 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux2~0_combout\);

-- Location: LCCOMB_X44_Y30_N8
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux2~1_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux2~0_combout\ & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2)) # (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1))))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & 
-- (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux2~0_combout\,
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux2~1_combout\);

-- Location: LCFF_X44_Y30_N9
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux2~1_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp\(3));

-- Location: LCCOMB_X44_Y30_N10
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux1~0_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) & 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0)) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3))))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1) $ (((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0)) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux1~0_combout\);

-- Location: LCCOMB_X44_Y30_N26
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux1~1_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & 
-- (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4))) # (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux1~0_combout\))))) # 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux1~0_combout\))) # 
-- (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & (!\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011110000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux1~0_combout\,
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux1~1_combout\);

-- Location: LCFF_X44_Y30_N27
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux1~1_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp\(4));

-- Location: LCCOMB_X44_Y30_N0
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux0~0_combout\ = (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3) & ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0)) # 
-- ((\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1)) # (\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(0),
	datab => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(1),
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(2),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux0~0_combout\);

-- Location: LCCOMB_X44_Y30_N24
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp[5]~feeder_combout\ = \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|Mux0~0_combout\,
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp[5]~feeder_combout\);

-- Location: LCCOMB_X42_Y30_N8
\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[3]~_wirecell\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[3]~_wirecell_combout\ = !\TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(3),
	combout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[3]~_wirecell_combout\);

-- Location: LCFF_X44_Y30_N25
\TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp[5]~feeder_combout\,
	sdata => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y[3]~_wirecell_combout\,
	aclr => \ALT_INV_reset~combout\,
	sload => \TELE_RX|RX_DEMOD|accumulator_rx_lo|digital_phase_gen1|phase_reg|y\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|accumulator_rx_lo|cos_rom0|temp_amp\(5));

-- Location: DSPMULT_X46_Y30_N1
\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1\ : cycloneii_mac_mult
-- pragma translate_off
GENERIC MAP (
	dataa_clock => "0",
	dataa_width => 9,
	datab_clock => "none",
	datab_width => 9,
	signa_clock => "none",
	signb_clock => "none")
-- pragma translate_on
PORT MAP (
	signa => VCC,
	signb => VCC,
	clk => \TELE_RX|RX_CLK_CKT|ALT_INV_clk_128x~clkctrl_outclk\,
	aclr => GND,
	ena => \reset~combout\,
	dataa => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAA_bus\,
	datab => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAB_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	dataout => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_mult1_DATAOUT_bus\);

-- Location: LCCOMB_X45_Y30_N2
\TELE_RX|RX_DEMOD|acc0|temp_sum[0]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[0]~15_combout\ = (\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~dataout\ & (\TELE_RX|RX_DEMOD|acc0|temp_sum\(0) $ (VCC))) # (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~dataout\ & 
-- (\TELE_RX|RX_DEMOD|acc0|temp_sum\(0) & VCC))
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[0]~16\ = CARRY((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~dataout\ & \TELE_RX|RX_DEMOD|acc0|temp_sum\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~dataout\,
	datab => \TELE_RX|RX_DEMOD|acc0|temp_sum\(0),
	datad => VCC,
	combout => \TELE_RX|RX_DEMOD|acc0|temp_sum[0]~15_combout\,
	cout => \TELE_RX|RX_DEMOD|acc0|temp_sum[0]~16\);

-- Location: LCFF_X45_Y30_N3
\TELE_RX|RX_DEMOD|acc0|temp_sum[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|temp_sum[0]~15_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|temp_sum\(0));

-- Location: LCCOMB_X45_Y30_N4
\TELE_RX|RX_DEMOD|acc0|temp_sum[1]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[1]~17_combout\ = (\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT1\ & ((\TELE_RX|RX_DEMOD|acc0|temp_sum\(1) & (\TELE_RX|RX_DEMOD|acc0|temp_sum[0]~16\ & VCC)) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(1) & 
-- (!\TELE_RX|RX_DEMOD|acc0|temp_sum[0]~16\)))) # (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT1\ & ((\TELE_RX|RX_DEMOD|acc0|temp_sum\(1) & (!\TELE_RX|RX_DEMOD|acc0|temp_sum[0]~16\)) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(1) & 
-- ((\TELE_RX|RX_DEMOD|acc0|temp_sum[0]~16\) # (GND)))))
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[1]~18\ = CARRY((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT1\ & (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(1) & !\TELE_RX|RX_DEMOD|acc0|temp_sum[0]~16\)) # 
-- (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT1\ & ((!\TELE_RX|RX_DEMOD|acc0|temp_sum[0]~16\) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT1\,
	datab => \TELE_RX|RX_DEMOD|acc0|temp_sum\(1),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc0|temp_sum[0]~16\,
	combout => \TELE_RX|RX_DEMOD|acc0|temp_sum[1]~17_combout\,
	cout => \TELE_RX|RX_DEMOD|acc0|temp_sum[1]~18\);

-- Location: LCFF_X45_Y30_N5
\TELE_RX|RX_DEMOD|acc0|temp_sum[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|temp_sum[1]~17_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|temp_sum\(1));

-- Location: LCCOMB_X45_Y30_N8
\TELE_RX|RX_DEMOD|acc0|temp_sum[3]~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[3]~21_combout\ = (\TELE_RX|RX_DEMOD|acc0|temp_sum\(3) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT3\ & (\TELE_RX|RX_DEMOD|acc0|temp_sum[2]~20\ & VCC)) # 
-- (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT3\ & (!\TELE_RX|RX_DEMOD|acc0|temp_sum[2]~20\)))) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(3) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT3\ & 
-- (!\TELE_RX|RX_DEMOD|acc0|temp_sum[2]~20\)) # (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT3\ & ((\TELE_RX|RX_DEMOD|acc0|temp_sum[2]~20\) # (GND)))))
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[3]~22\ = CARRY((\TELE_RX|RX_DEMOD|acc0|temp_sum\(3) & (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT3\ & !\TELE_RX|RX_DEMOD|acc0|temp_sum[2]~20\)) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(3) & 
-- ((!\TELE_RX|RX_DEMOD|acc0|temp_sum[2]~20\) # (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT3\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|temp_sum\(3),
	datab => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT3\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc0|temp_sum[2]~20\,
	combout => \TELE_RX|RX_DEMOD|acc0|temp_sum[3]~21_combout\,
	cout => \TELE_RX|RX_DEMOD|acc0|temp_sum[3]~22\);

-- Location: LCCOMB_X45_Y30_N10
\TELE_RX|RX_DEMOD|acc0|temp_sum[4]~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[4]~23_combout\ = ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT4\ $ (\TELE_RX|RX_DEMOD|acc0|temp_sum\(4) $ (!\TELE_RX|RX_DEMOD|acc0|temp_sum[3]~22\)))) # (GND)
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[4]~24\ = CARRY((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT4\ & ((\TELE_RX|RX_DEMOD|acc0|temp_sum\(4)) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum[3]~22\))) # 
-- (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT4\ & (\TELE_RX|RX_DEMOD|acc0|temp_sum\(4) & !\TELE_RX|RX_DEMOD|acc0|temp_sum[3]~22\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT4\,
	datab => \TELE_RX|RX_DEMOD|acc0|temp_sum\(4),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc0|temp_sum[3]~22\,
	combout => \TELE_RX|RX_DEMOD|acc0|temp_sum[4]~23_combout\,
	cout => \TELE_RX|RX_DEMOD|acc0|temp_sum[4]~24\);

-- Location: LCFF_X45_Y30_N11
\TELE_RX|RX_DEMOD|acc0|temp_sum[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|temp_sum[4]~23_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|temp_sum\(4));

-- Location: LCCOMB_X45_Y30_N12
\TELE_RX|RX_DEMOD|acc0|temp_sum[5]~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[5]~25_combout\ = (\TELE_RX|RX_DEMOD|acc0|temp_sum\(5) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT5\ & (\TELE_RX|RX_DEMOD|acc0|temp_sum[4]~24\ & VCC)) # 
-- (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT5\ & (!\TELE_RX|RX_DEMOD|acc0|temp_sum[4]~24\)))) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(5) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT5\ & 
-- (!\TELE_RX|RX_DEMOD|acc0|temp_sum[4]~24\)) # (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT5\ & ((\TELE_RX|RX_DEMOD|acc0|temp_sum[4]~24\) # (GND)))))
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[5]~26\ = CARRY((\TELE_RX|RX_DEMOD|acc0|temp_sum\(5) & (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT5\ & !\TELE_RX|RX_DEMOD|acc0|temp_sum[4]~24\)) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(5) & 
-- ((!\TELE_RX|RX_DEMOD|acc0|temp_sum[4]~24\) # (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT5\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|temp_sum\(5),
	datab => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT5\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc0|temp_sum[4]~24\,
	combout => \TELE_RX|RX_DEMOD|acc0|temp_sum[5]~25_combout\,
	cout => \TELE_RX|RX_DEMOD|acc0|temp_sum[5]~26\);

-- Location: LCCOMB_X45_Y30_N16
\TELE_RX|RX_DEMOD|acc0|temp_sum[7]~29\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[7]~29_combout\ = (\TELE_RX|RX_DEMOD|acc0|temp_sum\(7) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT7\ & (\TELE_RX|RX_DEMOD|acc0|temp_sum[6]~28\ & VCC)) # 
-- (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT7\ & (!\TELE_RX|RX_DEMOD|acc0|temp_sum[6]~28\)))) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(7) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT7\ & 
-- (!\TELE_RX|RX_DEMOD|acc0|temp_sum[6]~28\)) # (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT7\ & ((\TELE_RX|RX_DEMOD|acc0|temp_sum[6]~28\) # (GND)))))
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[7]~30\ = CARRY((\TELE_RX|RX_DEMOD|acc0|temp_sum\(7) & (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT7\ & !\TELE_RX|RX_DEMOD|acc0|temp_sum[6]~28\)) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(7) & 
-- ((!\TELE_RX|RX_DEMOD|acc0|temp_sum[6]~28\) # (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|temp_sum\(7),
	datab => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT7\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc0|temp_sum[6]~28\,
	combout => \TELE_RX|RX_DEMOD|acc0|temp_sum[7]~29_combout\,
	cout => \TELE_RX|RX_DEMOD|acc0|temp_sum[7]~30\);

-- Location: LCCOMB_X45_Y30_N22
\TELE_RX|RX_DEMOD|acc0|temp_sum[10]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[10]~35_combout\ = ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT10\ $ (\TELE_RX|RX_DEMOD|acc0|temp_sum\(10) $ (!\TELE_RX|RX_DEMOD|acc0|temp_sum[9]~34\)))) # (GND)
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[10]~36\ = CARRY((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT10\ & ((\TELE_RX|RX_DEMOD|acc0|temp_sum\(10)) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum[9]~34\))) # 
-- (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT10\ & (\TELE_RX|RX_DEMOD|acc0|temp_sum\(10) & !\TELE_RX|RX_DEMOD|acc0|temp_sum[9]~34\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT10\,
	datab => \TELE_RX|RX_DEMOD|acc0|temp_sum\(10),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc0|temp_sum[9]~34\,
	combout => \TELE_RX|RX_DEMOD|acc0|temp_sum[10]~35_combout\,
	cout => \TELE_RX|RX_DEMOD|acc0|temp_sum[10]~36\);

-- Location: LCFF_X45_Y30_N23
\TELE_RX|RX_DEMOD|acc0|temp_sum[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|temp_sum[10]~35_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|temp_sum\(10));

-- Location: LCCOMB_X45_Y30_N24
\TELE_RX|RX_DEMOD|acc0|temp_sum[11]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[11]~37_combout\ = (\TELE_RX|RX_DEMOD|acc0|temp_sum\(11) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\ & (\TELE_RX|RX_DEMOD|acc0|temp_sum[10]~36\ & VCC)) # 
-- (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\ & (!\TELE_RX|RX_DEMOD|acc0|temp_sum[10]~36\)))) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(11) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\ & 
-- (!\TELE_RX|RX_DEMOD|acc0|temp_sum[10]~36\)) # (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\ & ((\TELE_RX|RX_DEMOD|acc0|temp_sum[10]~36\) # (GND)))))
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[11]~38\ = CARRY((\TELE_RX|RX_DEMOD|acc0|temp_sum\(11) & (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\ & !\TELE_RX|RX_DEMOD|acc0|temp_sum[10]~36\)) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(11) & 
-- ((!\TELE_RX|RX_DEMOD|acc0|temp_sum[10]~36\) # (!\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|temp_sum\(11),
	datab => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc0|temp_sum[10]~36\,
	combout => \TELE_RX|RX_DEMOD|acc0|temp_sum[11]~37_combout\,
	cout => \TELE_RX|RX_DEMOD|acc0|temp_sum[11]~38\);

-- Location: LCCOMB_X45_Y30_N26
\TELE_RX|RX_DEMOD|acc0|temp_sum[12]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[12]~39_combout\ = ((\TELE_RX|RX_DEMOD|acc0|temp_sum\(12) $ (\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\ $ (!\TELE_RX|RX_DEMOD|acc0|temp_sum[11]~38\)))) # (GND)
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[12]~40\ = CARRY((\TELE_RX|RX_DEMOD|acc0|temp_sum\(12) & ((\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum[11]~38\))) # (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(12) & 
-- (\TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\ & !\TELE_RX|RX_DEMOD|acc0|temp_sum[11]~38\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|temp_sum\(12),
	datab => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\,
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|acc0|temp_sum[11]~38\,
	combout => \TELE_RX|RX_DEMOD|acc0|temp_sum[12]~39_combout\,
	cout => \TELE_RX|RX_DEMOD|acc0|temp_sum[12]~40\);

-- Location: LCCOMB_X45_Y30_N30
\TELE_RX|RX_DEMOD|acc0|temp_sum[14]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|temp_sum[14]~43_combout\ = \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\ $ (\TELE_RX|RX_DEMOD|acc0|temp_sum[13]~42\ $ (!\TELE_RX|RX_DEMOD|acc0|temp_sum\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TELE_RX|RX_DEMOD|mul0|Mult0|auto_generated|mac_out2~DATAOUT11\,
	datad => \TELE_RX|RX_DEMOD|acc0|temp_sum\(14),
	cin => \TELE_RX|RX_DEMOD|acc0|temp_sum[13]~42\,
	combout => \TELE_RX|RX_DEMOD|acc0|temp_sum[14]~43_combout\);

-- Location: LCFF_X45_Y30_N31
\TELE_RX|RX_DEMOD|acc0|temp_sum[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|temp_sum[14]~43_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|temp_sum\(14));

-- Location: LCFF_X48_Y30_N17
\TELE_RX|RX_DEMOD|acc0|y[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	sdata => \TELE_RX|RX_DEMOD|acc0|temp_sum\(14),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|y\(14));

-- Location: LCFF_X47_Y30_N27
\TELE_RX|RX_DEMOD|acc1|temp_sum[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|temp_sum[13]~41_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|temp_sum\(13));

-- Location: LCCOMB_X47_Y31_N26
\TELE_RX|RX_DEMOD|acc1|y[13]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|y[13]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc1|temp_sum\(13)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc1|temp_sum\(13),
	combout => \TELE_RX|RX_DEMOD|acc1|y[13]~feeder_combout\);

-- Location: LCFF_X47_Y31_N27
\TELE_RX|RX_DEMOD|acc1|y[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|y[13]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|y\(13));

-- Location: LCFF_X45_Y30_N27
\TELE_RX|RX_DEMOD|acc0|temp_sum[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|temp_sum[12]~39_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|temp_sum\(12));

-- Location: LCCOMB_X48_Y30_N28
\TELE_RX|RX_DEMOD|acc0|y[12]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|y[12]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc0|temp_sum\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc0|temp_sum\(12),
	combout => \TELE_RX|RX_DEMOD|acc0|y[12]~feeder_combout\);

-- Location: LCFF_X48_Y30_N29
\TELE_RX|RX_DEMOD|acc0|y[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|y[12]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|y\(12));

-- Location: LCFF_X45_Y30_N25
\TELE_RX|RX_DEMOD|acc0|temp_sum[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|temp_sum[11]~37_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|temp_sum\(11));

-- Location: LCCOMB_X48_Y30_N30
\TELE_RX|RX_DEMOD|acc0|y[11]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|y[11]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc0|temp_sum\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc0|temp_sum\(11),
	combout => \TELE_RX|RX_DEMOD|acc0|y[11]~feeder_combout\);

-- Location: LCFF_X48_Y30_N31
\TELE_RX|RX_DEMOD|acc0|y[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|y[11]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|y\(11));

-- Location: LCCOMB_X45_Y30_N0
\TELE_RX|RX_DEMOD|acc0|y[10]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|y[10]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc0|temp_sum\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc0|temp_sum\(10),
	combout => \TELE_RX|RX_DEMOD|acc0|y[10]~feeder_combout\);

-- Location: LCFF_X45_Y30_N1
\TELE_RX|RX_DEMOD|acc0|y[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|y[10]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|y\(10));

-- Location: LCCOMB_X47_Y31_N18
\TELE_RX|RX_DEMOD|acc1|y[9]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|y[9]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc1|temp_sum\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc1|temp_sum\(9),
	combout => \TELE_RX|RX_DEMOD|acc1|y[9]~feeder_combout\);

-- Location: LCFF_X47_Y31_N19
\TELE_RX|RX_DEMOD|acc1|y[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|y[9]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|y\(9));

-- Location: LCCOMB_X47_Y31_N4
\TELE_RX|RX_DEMOD|acc1|y[8]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|y[8]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc1|temp_sum\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc1|temp_sum\(8),
	combout => \TELE_RX|RX_DEMOD|acc1|y[8]~feeder_combout\);

-- Location: LCFF_X47_Y31_N5
\TELE_RX|RX_DEMOD|acc1|y[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|y[8]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|y\(8));

-- Location: LCFF_X45_Y30_N17
\TELE_RX|RX_DEMOD|acc0|temp_sum[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|temp_sum[7]~29_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|temp_sum\(7));

-- Location: LCCOMB_X48_Y30_N4
\TELE_RX|RX_DEMOD|acc0|y[7]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|y[7]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc0|temp_sum\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc0|temp_sum\(7),
	combout => \TELE_RX|RX_DEMOD|acc0|y[7]~feeder_combout\);

-- Location: LCFF_X48_Y30_N5
\TELE_RX|RX_DEMOD|acc0|y[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|y[7]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|y\(7));

-- Location: LCFF_X47_Y31_N25
\TELE_RX|RX_DEMOD|acc1|y[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	sdata => \TELE_RX|RX_DEMOD|acc1|temp_sum\(6),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|y\(6));

-- Location: LCFF_X45_Y30_N13
\TELE_RX|RX_DEMOD|acc0|temp_sum[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|temp_sum[5]~25_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|temp_sum\(5));

-- Location: LCCOMB_X48_Y30_N8
\TELE_RX|RX_DEMOD|acc0|y[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|y[5]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc0|temp_sum\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc0|temp_sum\(5),
	combout => \TELE_RX|RX_DEMOD|acc0|y[5]~feeder_combout\);

-- Location: LCFF_X48_Y30_N9
\TELE_RX|RX_DEMOD|acc0|y[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|y[5]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|y\(5));

-- Location: LCFF_X47_Y30_N9
\TELE_RX|RX_DEMOD|acc1|temp_sum[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|temp_sum[4]~23_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|temp_sum\(4));

-- Location: LCCOMB_X48_Y31_N30
\TELE_RX|RX_DEMOD|acc1|y[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc1|y[4]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc1|temp_sum\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc1|temp_sum\(4),
	combout => \TELE_RX|RX_DEMOD|acc1|y[4]~feeder_combout\);

-- Location: LCFF_X48_Y31_N31
\TELE_RX|RX_DEMOD|acc1|y[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc1|y[4]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|y\(4));

-- Location: LCFF_X45_Y30_N9
\TELE_RX|RX_DEMOD|acc0|temp_sum[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_128x~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|temp_sum[3]~21_combout\,
	aclr => \TELE_RX|RX_DEMOD|acc1|delayed_rst~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|temp_sum\(3));

-- Location: LCCOMB_X48_Y30_N20
\TELE_RX|RX_DEMOD|acc0|y[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|y[3]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc0|temp_sum\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc0|temp_sum\(3),
	combout => \TELE_RX|RX_DEMOD|acc0|y[3]~feeder_combout\);

-- Location: LCFF_X48_Y30_N21
\TELE_RX|RX_DEMOD|acc0|y[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|y[3]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|y\(3));

-- Location: LCFF_X47_Y31_N13
\TELE_RX|RX_DEMOD|acc1|y[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	sdata => \TELE_RX|RX_DEMOD|acc1|temp_sum\(2),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc1|y\(2));

-- Location: LCFF_X48_Y30_N1
\TELE_RX|RX_DEMOD|acc0|y[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	sdata => \TELE_RX|RX_DEMOD|acc0|temp_sum\(1),
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|y\(1));

-- Location: LCCOMB_X48_Y30_N10
\TELE_RX|RX_DEMOD|acc0|y[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|acc0|y[0]~feeder_combout\ = \TELE_RX|RX_DEMOD|acc0|temp_sum\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|acc0|temp_sum\(0),
	combout => \TELE_RX|RX_DEMOD|acc0|y[0]~feeder_combout\);

-- Location: LCFF_X48_Y30_N11
\TELE_RX|RX_DEMOD|acc0|y[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_DEMOD|local_rst~clkctrl_outclk\,
	datain => \TELE_RX|RX_DEMOD|acc0|y[0]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|RX_DEMOD|acc0|y\(0));

-- Location: LCCOMB_X48_Y31_N0
\TELE_RX|RX_DEMOD|dec_value[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|dec_value[0]~1_cout\ = CARRY((\TELE_RX|RX_DEMOD|acc0|y\(0)) # (!\TELE_RX|RX_DEMOD|acc1|y\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|y\(0),
	datab => \TELE_RX|RX_DEMOD|acc0|y\(0),
	datad => VCC,
	cout => \TELE_RX|RX_DEMOD|dec_value[0]~1_cout\);

-- Location: LCCOMB_X48_Y31_N2
\TELE_RX|RX_DEMOD|dec_value[1]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|dec_value[1]~3_cout\ = CARRY((\TELE_RX|RX_DEMOD|acc1|y\(1) & ((!\TELE_RX|RX_DEMOD|dec_value[0]~1_cout\) # (!\TELE_RX|RX_DEMOD|acc0|y\(1)))) # (!\TELE_RX|RX_DEMOD|acc1|y\(1) & (!\TELE_RX|RX_DEMOD|acc0|y\(1) & 
-- !\TELE_RX|RX_DEMOD|dec_value[0]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|y\(1),
	datab => \TELE_RX|RX_DEMOD|acc0|y\(1),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|dec_value[0]~1_cout\,
	cout => \TELE_RX|RX_DEMOD|dec_value[1]~3_cout\);

-- Location: LCCOMB_X48_Y31_N4
\TELE_RX|RX_DEMOD|dec_value[2]~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|dec_value[2]~5_cout\ = CARRY((\TELE_RX|RX_DEMOD|acc0|y\(2) & ((!\TELE_RX|RX_DEMOD|dec_value[1]~3_cout\) # (!\TELE_RX|RX_DEMOD|acc1|y\(2)))) # (!\TELE_RX|RX_DEMOD|acc0|y\(2) & (!\TELE_RX|RX_DEMOD|acc1|y\(2) & 
-- !\TELE_RX|RX_DEMOD|dec_value[1]~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|y\(2),
	datab => \TELE_RX|RX_DEMOD|acc1|y\(2),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|dec_value[1]~3_cout\,
	cout => \TELE_RX|RX_DEMOD|dec_value[2]~5_cout\);

-- Location: LCCOMB_X48_Y31_N6
\TELE_RX|RX_DEMOD|dec_value[3]~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|dec_value[3]~7_cout\ = CARRY((\TELE_RX|RX_DEMOD|acc1|y\(3) & ((!\TELE_RX|RX_DEMOD|dec_value[2]~5_cout\) # (!\TELE_RX|RX_DEMOD|acc0|y\(3)))) # (!\TELE_RX|RX_DEMOD|acc1|y\(3) & (!\TELE_RX|RX_DEMOD|acc0|y\(3) & 
-- !\TELE_RX|RX_DEMOD|dec_value[2]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|y\(3),
	datab => \TELE_RX|RX_DEMOD|acc0|y\(3),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|dec_value[2]~5_cout\,
	cout => \TELE_RX|RX_DEMOD|dec_value[3]~7_cout\);

-- Location: LCCOMB_X48_Y31_N8
\TELE_RX|RX_DEMOD|dec_value[4]~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|dec_value[4]~9_cout\ = CARRY((\TELE_RX|RX_DEMOD|acc0|y\(4) & ((!\TELE_RX|RX_DEMOD|dec_value[3]~7_cout\) # (!\TELE_RX|RX_DEMOD|acc1|y\(4)))) # (!\TELE_RX|RX_DEMOD|acc0|y\(4) & (!\TELE_RX|RX_DEMOD|acc1|y\(4) & 
-- !\TELE_RX|RX_DEMOD|dec_value[3]~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|y\(4),
	datab => \TELE_RX|RX_DEMOD|acc1|y\(4),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|dec_value[3]~7_cout\,
	cout => \TELE_RX|RX_DEMOD|dec_value[4]~9_cout\);

-- Location: LCCOMB_X48_Y31_N10
\TELE_RX|RX_DEMOD|dec_value[5]~11\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|dec_value[5]~11_cout\ = CARRY((\TELE_RX|RX_DEMOD|acc1|y\(5) & ((!\TELE_RX|RX_DEMOD|dec_value[4]~9_cout\) # (!\TELE_RX|RX_DEMOD|acc0|y\(5)))) # (!\TELE_RX|RX_DEMOD|acc1|y\(5) & (!\TELE_RX|RX_DEMOD|acc0|y\(5) & 
-- !\TELE_RX|RX_DEMOD|dec_value[4]~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|y\(5),
	datab => \TELE_RX|RX_DEMOD|acc0|y\(5),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|dec_value[4]~9_cout\,
	cout => \TELE_RX|RX_DEMOD|dec_value[5]~11_cout\);

-- Location: LCCOMB_X48_Y31_N12
\TELE_RX|RX_DEMOD|dec_value[6]~13\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|dec_value[6]~13_cout\ = CARRY((\TELE_RX|RX_DEMOD|acc0|y\(6) & ((!\TELE_RX|RX_DEMOD|dec_value[5]~11_cout\) # (!\TELE_RX|RX_DEMOD|acc1|y\(6)))) # (!\TELE_RX|RX_DEMOD|acc0|y\(6) & (!\TELE_RX|RX_DEMOD|acc1|y\(6) & 
-- !\TELE_RX|RX_DEMOD|dec_value[5]~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|y\(6),
	datab => \TELE_RX|RX_DEMOD|acc1|y\(6),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|dec_value[5]~11_cout\,
	cout => \TELE_RX|RX_DEMOD|dec_value[6]~13_cout\);

-- Location: LCCOMB_X48_Y31_N14
\TELE_RX|RX_DEMOD|dec_value[7]~15\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|dec_value[7]~15_cout\ = CARRY((\TELE_RX|RX_DEMOD|acc1|y\(7) & ((!\TELE_RX|RX_DEMOD|dec_value[6]~13_cout\) # (!\TELE_RX|RX_DEMOD|acc0|y\(7)))) # (!\TELE_RX|RX_DEMOD|acc1|y\(7) & (!\TELE_RX|RX_DEMOD|acc0|y\(7) & 
-- !\TELE_RX|RX_DEMOD|dec_value[6]~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|y\(7),
	datab => \TELE_RX|RX_DEMOD|acc0|y\(7),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|dec_value[6]~13_cout\,
	cout => \TELE_RX|RX_DEMOD|dec_value[7]~15_cout\);

-- Location: LCCOMB_X48_Y31_N16
\TELE_RX|RX_DEMOD|dec_value[8]~17\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|dec_value[8]~17_cout\ = CARRY((\TELE_RX|RX_DEMOD|acc0|y\(8) & ((!\TELE_RX|RX_DEMOD|dec_value[7]~15_cout\) # (!\TELE_RX|RX_DEMOD|acc1|y\(8)))) # (!\TELE_RX|RX_DEMOD|acc0|y\(8) & (!\TELE_RX|RX_DEMOD|acc1|y\(8) & 
-- !\TELE_RX|RX_DEMOD|dec_value[7]~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|y\(8),
	datab => \TELE_RX|RX_DEMOD|acc1|y\(8),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|dec_value[7]~15_cout\,
	cout => \TELE_RX|RX_DEMOD|dec_value[8]~17_cout\);

-- Location: LCCOMB_X48_Y31_N18
\TELE_RX|RX_DEMOD|dec_value[9]~19\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|dec_value[9]~19_cout\ = CARRY((\TELE_RX|RX_DEMOD|acc0|y\(9) & (\TELE_RX|RX_DEMOD|acc1|y\(9) & !\TELE_RX|RX_DEMOD|dec_value[8]~17_cout\)) # (!\TELE_RX|RX_DEMOD|acc0|y\(9) & ((\TELE_RX|RX_DEMOD|acc1|y\(9)) # 
-- (!\TELE_RX|RX_DEMOD|dec_value[8]~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|y\(9),
	datab => \TELE_RX|RX_DEMOD|acc1|y\(9),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|dec_value[8]~17_cout\,
	cout => \TELE_RX|RX_DEMOD|dec_value[9]~19_cout\);

-- Location: LCCOMB_X48_Y31_N20
\TELE_RX|RX_DEMOD|dec_value[10]~21\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|dec_value[10]~21_cout\ = CARRY((\TELE_RX|RX_DEMOD|acc1|y\(10) & (\TELE_RX|RX_DEMOD|acc0|y\(10) & !\TELE_RX|RX_DEMOD|dec_value[9]~19_cout\)) # (!\TELE_RX|RX_DEMOD|acc1|y\(10) & ((\TELE_RX|RX_DEMOD|acc0|y\(10)) # 
-- (!\TELE_RX|RX_DEMOD|dec_value[9]~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|y\(10),
	datab => \TELE_RX|RX_DEMOD|acc0|y\(10),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|dec_value[9]~19_cout\,
	cout => \TELE_RX|RX_DEMOD|dec_value[10]~21_cout\);

-- Location: LCCOMB_X48_Y31_N22
\TELE_RX|RX_DEMOD|dec_value[11]~23\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|dec_value[11]~23_cout\ = CARRY((\TELE_RX|RX_DEMOD|acc1|y\(11) & ((!\TELE_RX|RX_DEMOD|dec_value[10]~21_cout\) # (!\TELE_RX|RX_DEMOD|acc0|y\(11)))) # (!\TELE_RX|RX_DEMOD|acc1|y\(11) & (!\TELE_RX|RX_DEMOD|acc0|y\(11) & 
-- !\TELE_RX|RX_DEMOD|dec_value[10]~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|y\(11),
	datab => \TELE_RX|RX_DEMOD|acc0|y\(11),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|dec_value[10]~21_cout\,
	cout => \TELE_RX|RX_DEMOD|dec_value[11]~23_cout\);

-- Location: LCCOMB_X48_Y31_N24
\TELE_RX|RX_DEMOD|dec_value[12]~25\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|dec_value[12]~25_cout\ = CARRY((\TELE_RX|RX_DEMOD|acc1|y\(12) & (\TELE_RX|RX_DEMOD|acc0|y\(12) & !\TELE_RX|RX_DEMOD|dec_value[11]~23_cout\)) # (!\TELE_RX|RX_DEMOD|acc1|y\(12) & ((\TELE_RX|RX_DEMOD|acc0|y\(12)) # 
-- (!\TELE_RX|RX_DEMOD|dec_value[11]~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc1|y\(12),
	datab => \TELE_RX|RX_DEMOD|acc0|y\(12),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|dec_value[11]~23_cout\,
	cout => \TELE_RX|RX_DEMOD|dec_value[12]~25_cout\);

-- Location: LCCOMB_X48_Y31_N26
\TELE_RX|RX_DEMOD|dec_value[13]~27\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|dec_value[13]~27_cout\ = CARRY((\TELE_RX|RX_DEMOD|acc0|y\(13) & (\TELE_RX|RX_DEMOD|acc1|y\(13) & !\TELE_RX|RX_DEMOD|dec_value[12]~25_cout\)) # (!\TELE_RX|RX_DEMOD|acc0|y\(13) & ((\TELE_RX|RX_DEMOD|acc1|y\(13)) # 
-- (!\TELE_RX|RX_DEMOD|dec_value[12]~25_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_DEMOD|acc0|y\(13),
	datab => \TELE_RX|RX_DEMOD|acc1|y\(13),
	datad => VCC,
	cin => \TELE_RX|RX_DEMOD|dec_value[12]~25_cout\,
	cout => \TELE_RX|RX_DEMOD|dec_value[13]~27_cout\);

-- Location: LCCOMB_X48_Y31_N28
\TELE_RX|RX_DEMOD|dec_value[14]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|RX_DEMOD|dec_value[14]~28_combout\ = \TELE_RX|RX_DEMOD|acc1|y\(14) $ (\TELE_RX|RX_DEMOD|dec_value[13]~27_cout\ $ (\TELE_RX|RX_DEMOD|acc0|y\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TELE_RX|RX_DEMOD|acc1|y\(14),
	datad => \TELE_RX|RX_DEMOD|acc0|y\(14),
	cin => \TELE_RX|RX_DEMOD|dec_value[13]~27_cout\,
	combout => \TELE_RX|RX_DEMOD|dec_value[14]~28_combout\);

-- Location: LCCOMB_X74_Y16_N18
\TELE_RX|umanchester_decoder|mdi_buf2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|umanchester_decoder|mdi_buf2~0_combout\ = \TELE_RX|RX_CLK_CKT|clk_1x_buf~regout\ $ (!\TELE_RX|RX_DEMOD|dec_value[14]~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TELE_RX|RX_CLK_CKT|clk_1x_buf~regout\,
	datad => \TELE_RX|RX_DEMOD|dec_value[14]~28_combout\,
	combout => \TELE_RX|umanchester_decoder|mdi_buf2~0_combout\);

-- Location: LCFF_X74_Y16_N19
\TELE_RX|umanchester_decoder|mdi_buf2\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_2x~clkctrl_outclk\,
	datain => \TELE_RX|umanchester_decoder|mdi_buf2~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|umanchester_decoder|mdi_buf2~regout\);

-- Location: LCCOMB_X74_Y16_N8
\TELE_RX|umanchester_decoder|mdi_buf~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|umanchester_decoder|mdi_buf~0_combout\ = !\TELE_RX|RX_DEMOD|dec_value[14]~28_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \TELE_RX|RX_DEMOD|dec_value[14]~28_combout\,
	combout => \TELE_RX|umanchester_decoder|mdi_buf~0_combout\);

-- Location: LCFF_X74_Y16_N9
\TELE_RX|umanchester_decoder|mdi_buf\ : cycloneii_lcell_ff
PORT MAP (
	clk => \TELE_RX|RX_CLK_CKT|clk_2x~clkctrl_outclk\,
	datain => \TELE_RX|umanchester_decoder|mdi_buf~0_combout\,
	aclr => \ALT_INV_reset~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TELE_RX|umanchester_decoder|mdi_buf~regout\);

-- Location: LCCOMB_X76_Y16_N16
\TELE_RX|umanchester_decoder|dout~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TELE_RX|umanchester_decoder|dout~0_combout\ = (\reset~combout\ & ((\TELE_RX|umanchester_decoder|mdi_buf2~regout\) # (\TELE_RX|umanchester_decoder|mdi_buf~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \TELE_RX|umanchester_decoder|mdi_buf2~regout\,
	datac => \reset~combout\,
	datad => \TELE_RX|umanchester_decoder|mdi_buf~regout\,
	combout => \TELE_RX|umanchester_decoder|dout~0_combout\);

-- Location: PIN_W27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\transmitter_out[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \TELE_TX|COS_ROM|amp_bits\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_transmitter_out(0));

-- Location: PIN_W25,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\transmitter_out[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \TELE_TX|COS_ROM|amp_bits\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_transmitter_out(1));

-- Location: PIN_W23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\transmitter_out[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \TELE_TX|COS_ROM|amp_bits\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_transmitter_out(2));

-- Location: PIN_Y27,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\transmitter_out[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \TELE_TX|COS_ROM|amp_bits\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_transmitter_out(3));

-- Location: PIN_Y24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\transmitter_out[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \TELE_TX|COS_ROM|amp_bits\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_transmitter_out(4));

-- Location: PIN_Y23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\transmitter_out[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \TELE_TX|COS_ROM|amp_bits\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_transmitter_out(5));

-- Location: PIN_AJ6,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\recieved_bfsk_signal[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \TELE_TX|COS_ROM|amp_bits\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_recieved_bfsk_signal(0));

-- Location: PIN_AK5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\recieved_bfsk_signal[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \TELE_TX|COS_ROM|amp_bits\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_recieved_bfsk_signal(1));

-- Location: PIN_AJ5,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\recieved_bfsk_signal[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \TELE_TX|COS_ROM|amp_bits\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_recieved_bfsk_signal(2));

-- Location: PIN_AJ4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\recieved_bfsk_signal[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \TELE_TX|COS_ROM|amp_bits\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_recieved_bfsk_signal(3));

-- Location: PIN_AK3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\recieved_bfsk_signal[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \TELE_TX|COS_ROM|amp_bits\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_recieved_bfsk_signal(4));

-- Location: PIN_AH4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\recieved_bfsk_signal[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \TELE_TX|COS_ROM|amp_bits\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_recieved_bfsk_signal(5));

-- Location: PIN_AA24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\data_out~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \TELE_RX|umanchester_decoder|dout~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_data_out);
END structure;


