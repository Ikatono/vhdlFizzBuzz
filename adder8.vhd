library ieee;
use ieee.std_logic_1164.all;


entity adder8 is
port(	a: in std_logic_vector(7 downto 0);
		b: in std_logic_vector(7 downto 0);
		cin: in std_logic;
		
		s: out std_logic_vector(7 downto 0);
		cout: out std_logic
);
end adder8;

architecture behav of adder8 is

	signal c: std_logic_vector(8 downto 0);
	component fulladder
	port(a, b, cin: in std_logic;
		 s, cout: out std_logic);
	end component;

begin
	
	c(0) <= cin;
	
	ADDERGEN:
	for i in 7 downto 0 generate
		fulladderx: fulladder port map
			(a(i), b(i), c(i), s(i), c(i+1));
	end generate ADDERGEN;
	
	cout <= c(8);
end;
