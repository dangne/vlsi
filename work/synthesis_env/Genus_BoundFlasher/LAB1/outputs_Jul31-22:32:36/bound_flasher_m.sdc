# ####################################################################

#  Created by Genus(TM) Synthesis Solution 19.13-s073_1 on Fri Jul 31 22:32:53 +07 2020

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design bound_flasher

create_clock -name "clk" -period 1.2 -waveform {0.0 0.6} [get_ports clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports flick]
set_input_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports rst_n]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[15]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[14]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[13]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[12]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[11]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[10]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[9]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[8]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[7]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports {lamp[0]}]
set_max_fanout 15.000 [current_design]
set_max_transition 1.2 [current_design]
