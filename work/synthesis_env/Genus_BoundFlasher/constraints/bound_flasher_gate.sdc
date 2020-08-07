#set the current design
current_design bound_flasher

create_clock -name "clk" -add -period 1.2 -waveform {0.0 0.6} [get_ports CLK]

set_input_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports FLICK]
set_input_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports RST]
set_output_delay -clock [get_clocks clk] -add_delay 0.6 [get_ports LED]

set_max_fanout 15.000 [current_design]

set_max_transition 1.2 [current_design]
