library ieee;
use ieee.std_logic_1164.all;

entity counter8_tb is
end counter8_tb;

architecture behav of counter8_tb is
	
	component counter8
		port( clk, rst: in std_logic; q: out std_logic_vector(7 downto 0));
	end component;
	
	signal clk, rst: std_logic := '1';
	signal outpt: std_logic_vector(7 downto 0);

begin
	
	clk <= not clk after 500 ps;
	
	uut: counter8 port map(clk, rst, outpt);
	
	process
	begin
		rst <= '0';
		wait for 3 ns;
		rst <= '1';
		wait for 300 ns;
		assert false report "end of test" severity failure;
	end process;
end behav;
