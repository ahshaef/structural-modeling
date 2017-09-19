library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity sum2_tb is
end sum2_tb;

architecture TB_ARCHITECTURE of sum2_tb is
	component sum2
	port(
		A : in STD_LOGIC_VECTOR(1 downto 0);
		B : in STD_LOGIC_VECTOR(1 downto 0);
		S : out STD_LOGIC_VECTOR(1 downto 0);
		C : out STD_LOGIC );
	end component;

	signal A : STD_LOGIC_VECTOR(1 downto 0);
	signal B : STD_LOGIC_VECTOR(1 downto 0);
	
	signal S_1 : STD_LOGIC_VECTOR(1 downto 0);
	signal C_1 : STD_LOGIC;
	
	signal S_2 : STD_LOGIC_VECTOR(1 downto 0);
	signal C_2 : STD_LOGIC;
	
	signal error : std_logic;
begin
	behavioral : sum2
		port map (
			A => A,
			B => B,
			S => S_1,
			C => C_1
		);	 
		
	structural : sum2
		port map (
			A => A,
			B => B,
			S => S_2,
			C => C_2
		);				
		
	error <= '0' when S_1 = S_2 else '1';
		
	stimulation:process
	begin
		for inA in 0 to 3 loop
			A <= std_logic_vector(to_unsigned(inA, A'length));
			for inB in 0 to 3 loop
				B <= std_logic_vector(to_unsigned(inB, B'length));				
				wait for 10 ns;
			end loop;
		end loop;
	end process;
end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_sum2 of sum2_tb is
	for TB_ARCHITECTURE
		for behavioral : sum2
			use entity work.sum2(beh);
		end for;
		for structural : sum2
			use entity work.sum2(struct);
		end for;
	end for;
end TESTBENCH_FOR_sum2;

