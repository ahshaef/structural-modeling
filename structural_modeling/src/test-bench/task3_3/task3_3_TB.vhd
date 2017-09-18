library ieee;
use ieee.std_logic_1164.all;

entity task3_3_tb is
end task3_3_tb;

architecture TB_ARCHITECTURE of task3_3_tb is
	component task3_3
	port(
		X : in STD_LOGIC;
		Y : in STD_LOGIC;
		Z : in STD_LOGIC;
		F : out STD_LOGIC );
	end component;

	signal X : STD_LOGIC := '0';
	signal Y : STD_LOGIC := '0';
	signal Z : STD_LOGIC := '0';
	
	signal F_1 : STD_LOGIC;
	signal F_2 : std_logic;
	
	signal error : std_logic; 
	
	constant clock_period : time := 10 ns;
begin
	behavioral : task3_3
		port map (
			X => X,
			Y => Y,
			Z => Z,
			F => F_1
		);	  

	structural : task3_3
		port map (
			X => X,
			Y => Y,
			Z => Z,
			F => F_2
		);
	
	X <= not X after clock_period;
	Y <= not Y after clock_period * 2;
	Z <= not Z after clock_period * 4;
		
	error <= F_1 xor F_2;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_task3_3 of task3_3_tb is
	for TB_ARCHITECTURE
		for behavioral : task3_3
			use entity work.task3_3(beh);
		end for;
		for structural : task3_3
			use entity work.task3_3(struct);
		end for;
	end for;
end TESTBENCH_FOR_task3_3;

