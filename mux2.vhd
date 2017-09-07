library ieee;
use ieee.std_logic_1164.all;

entity mux2 is
	port(	a: in std_logic;
			b: in std_logic;
			s: in std_logic;
			
			q: out std_logic
	);
end mux2;

architecture behav of mux2 is
begin
	q <= (a and not s) or (b and s);
end behav;
