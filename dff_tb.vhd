library ieee;
use ieee.std_logic_1164.all;

entity dff_tb is
end dff_tb;

architecture behav of dff_tb is
	
	component dff
		port( d, clk, rst: in std_logic; q: out std_logic);
	end component;
	
	signal d: std_logic := '1';
	signal clk, rst: std_logic := '1';
	signal q: std_logic;
	
begin
	
	clk <= not clk after 500 ps;
	uut: dff port map(d, clk, rst, q);
	
	process
	begin
		wait for 3 ns;
		rst <= '0';
		wait for 3 ns;
		rst <= '1';
		wait for 2 ns;
		d <= '0';
		wait for 2 ns;
		d <= '1';
		wait for 2 ns;
		d <= '0';
		wait for 2 ns;
		assert false report "end of test" severity failure;
	end process;
end behav;
