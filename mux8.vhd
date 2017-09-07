library ieee;
use ieee.std_logic_1164.all;


entity mux8 is
port(	a: in std_logic_vector(7 downto 0);
		b: in std_logic_vector(7 downto 0);
		s: in std_logic;
		
		y: out std_logic_vector(7 downto 0)
);
end mux8;

architecture behav of mux8 is
begin
	y(7) <= (a(7) and not s) or (b(7) and s);
	y(6) <= (a(6) and not s) or (b(6) and s);
	y(5) <= (a(5) and not s) or (b(5) and s);
	y(4) <= (a(4) and not s) or (b(4) and s);
	y(3) <= (a(3) and not s) or (b(3) and s);
	y(2) <= (a(2) and not s) or (b(2) and s);
	y(1) <= (a(1) and not s) or (b(1) and s);
	y(0) <= (a(0) and not s) or (b(0) and s);
end;
 