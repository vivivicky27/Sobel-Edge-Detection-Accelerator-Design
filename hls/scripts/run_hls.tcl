# Vitis HLS automation script for Sobel accelerator

open_project sobel_hls_project
set_top sobel_accel

add_files ../src/sobel_accel.cpp
add_files ../include/sobel_accel.h
add_files -tb ../testbench/sobel_tb.cpp
add_files -tb ../testbench/tb_input_pixels.txt
add_files -tb ../testbench/tb_output_edge.txt

open_solution solution1 -flow_target vivado

set_part xc7z020clg400-1
create_clock -period 10 -name default

csim_design
csynth_design
# cosim_design
export_design -format ip_catalog

exit