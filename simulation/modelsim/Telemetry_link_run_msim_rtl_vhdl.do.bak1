transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/My_Projects/Telemetry/phase_acc.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/pipo_nbit.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/adder_nbit.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/lut_cos.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/rx_clock_unit.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/bfsk_demod.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/rx_carrier_gen.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/multiply.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/accumulate.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/decision_dev.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/manchester_decoder.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/telemetry_tx.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/telemetry_rx.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/Telemetry_link.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/clock_unit.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/t_ff.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/manchester_encoder.vhd}
vcom -93 -work work {C:/My_Projects/Telemetry/bfsk_mod_ctrl.vhd}

vcom -93 -work work {C:/My_Projects/Telemetry/simulation/modelsim/telemetry_link.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L cycloneii -L rtl_work -L work -voptargs="+acc" tb_telementry_link

add wave *
view structure
view signals
run -all
