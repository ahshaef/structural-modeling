SetActiveLib -work
comp -include "$dsn\src\task4.vhd" 
comp -include "$dsn\src\test-bench\task4\sum2_TB.vhd" 
asim +access +r TESTBENCH_FOR_sum2 
list 
list -noreg A
list -noreg B
list -noreg S_1
list -noreg S_2
list -noreg C 

list -noreg error

run 150ns
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\test-bench\sum2_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_sum2 
