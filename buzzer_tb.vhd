library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity buzzer_tb is
end buzzer_tb;

architecture behav of buzzer_tb is

	component buzzer
		port( i: in std_logic_vector(7 downto 0); o: out std_logic);
	end component;

	signal counter: integer := 1;
	signal asvector: std_logic_vector(7 downto 0);
	signal outpt: std_logic;
	
begin
	
	asvector <= std_logic_vector(to_unsigned(counter, 8));
	buzzer_0: buzzer port map (asvector, outpt);
	
	process
	begin
		while (counter <= 100) loop
			--report integer'image(counter);
			wait for 1 ns;
			counter <= counter + 1;
		end loop;
		--assert false report "end of test" severity failure;
		wait;
	end process;
end behav;
