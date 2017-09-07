library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity fizzer_tb is
end fizzer_tb;

architecture behav of fizzer_tb is

	component fizzer
		port( i: in std_logic_vector(7 downto 0); o: out std_logic);
	end component;

	signal counter: integer := 1;
	signal asvector: std_logic_vector(7 downto 0);
	signal outpt: std_logic;
	
begin
	
	asvector <= std_logic_vector(to_unsigned(counter, 8));
	fizzer_0: fizzer port map (asvector, outpt);
	
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
