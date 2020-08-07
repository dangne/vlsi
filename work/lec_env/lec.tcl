# Set Log file name
set_log_file lec.log -replace

# Read libraries
read_library slow.lib -lib -revised

# Read RTL
read_design bound_flasher.v -verilog -golden

# Read Netlist
read_design bound_flasher_m.v -verilog -revised

# Mapping process
set_mapping_method -name only
set_system_mode lec
map_key_points

# Compare process
add_compared_points -all
compare
