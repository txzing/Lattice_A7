create_clock -period 6.060 [get_ports PCLKX1_i]
#create_generated_clock -source [get_ports PCLKX1_i] -multiply_by 3 [get_ports PCLKX2_5_i]
#create_generated_clock -source [get_ports PCLKX1_i] -multiply_by 5 [get_ports PCLKX5_i]
create_clock -period 3.03 [get_ports PCLKX2_5_i]
create_clock -period 1.52 [get_ports PCLKX5_i]
