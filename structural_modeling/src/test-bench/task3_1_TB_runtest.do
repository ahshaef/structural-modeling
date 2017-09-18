SetActiveLib -work
comp -include "$dsn\src\task3_1.vhd" 
comp -include "$dsn\src\test-bench\task3_1_TB.vhd" 
asim +access +r TESTBENCH_FOR_task3_1 
list 
list -noreg G_L
list -noreg A
list -noreg B
list -noreg Y0_1
list -noreg Y1_1
list -noreg Y2_1
list -noreg Y3_1	   

list -noreg error
run 1 us
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\test-bench\task3_1_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_task3_1 
