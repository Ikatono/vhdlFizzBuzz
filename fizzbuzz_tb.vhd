library ieee;
use ieee.std_logic_1164.all;

entity fizzbuzz_tb is
end fizzbuzz_tb;

architecture behav of fizzbuzz_tb is
	
	component fizzbuzz
		port( clk, rst: in std_logic; fizz, buzz, num: out std_logic; number: out std_logic_vector(7 downto 0));
	end component;
	
	--signal cnt: integer := 1;
	signal clk: std_logic := '1';
	signal rst: std_logic := '1';
	signal fizz, buzz, num: std_logic;
	signal number: std_logic_vector(7 downto 0);
	
begin
	
	clk <= not clk after 500 ps;
	
	fb: fizzbuzz port map(clk, rst, fizz, buzz, num, number);
	
	process
	begin
		rst <= '0';
		wait for 5500 ps;
		rst <= '1';
		wait for 110 ns;
		--wait;
		assert false report "end of test" severity failure;
	end process;
	
end behav;
