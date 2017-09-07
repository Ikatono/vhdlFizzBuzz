library ieee;
use ieee.std_logic_1164.all;

entity counter8 is
port(	clk: in std_logic;
		rst: in std_logic;
		
		q: out std_logic_vector(7 downto 0)
);
end counter8;

architecture behav of counter8 is
	
	signal crnt: std_logic_vector(7 downto 0);
	--signal iter: std_logic_vector(7 downto 0);
	signal nex: std_logic_vector(7 downto 0);
	
	component dff
	port(	d, clk, rst: in std_logic;
			q: out std_logic);
	end component;
	
	component adder8
	port(	a, b: in std_logic_vector(7 downto 0);
			cin: in std_logic;
			s: out std_logic_vector(7 downto 0);
			cout: out std_logic);
	end component;
	
	--component mux8
	--port(	a, b: in std_logic_vector(7 downto 0);
	--		s: in std_logic;
	--		y: out std_logic_vector(7 downto 0));
	--end component;
begin

	--resetter: mux8 port map(00000000, iter, rst, nex);
	iterator: adder8 port map(crnt, "00000000", '1', nex, open);
	
	q <= crnt;
	 
	DFFGEN:
	for i in 7 downto 0 generate
		dffx: dff port map
			(nex(i), clk, rst, crnt(i));
	end generate DFFGEN;
end;
