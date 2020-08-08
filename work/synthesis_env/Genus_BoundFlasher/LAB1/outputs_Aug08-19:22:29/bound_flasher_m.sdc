# ####################################################################

#  Created by Genus(TM) Synthesis Solution 19.13-s073_1 on Sat Aug 08 19:22:52 +07 2020

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design bound_flasher

create_clock -name "clk" -period 1.2 -waveform {0.0 0.6} [get_ports CLK]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports FLICK]
set_input_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports RST]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[15]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[14]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[13]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[12]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[11]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[10]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[9]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[8]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[7]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {LED[0]}]
set_max_fanout 15.000 [current_design]
set_max_transition 1.2 [current_design]
