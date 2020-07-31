#set the current design
current_design bound_flasher

create_clock -name "clk" -add -period 1.2 -waveform {0.0 0.6} [get_ports clk]

set_input_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports flick]
set_input_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports rst_n]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports lamp ]

set_max_fanout 15.000 [current_design]

set_max_transition 1.2 [current_design]
