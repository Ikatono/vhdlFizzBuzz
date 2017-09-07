library ieee;
use ieee.std_logic_1164.all;

entity buzzer is
port(	i: in std_logic_vector(7 downto 0);
		o: out std_logic
);
end buzzer;

--reduced with Quine-McCluskey
--inputs outside 1-100 are don't-cares
architecture behav of buzzer is
	signal A, B, C, D, E, F, G: std_logic;
	signal T: std_logic_vector(19 downto 0);
begin
	A <= i(0);
	B <= i(1);
	C <= i(2);
	D <= i(3);
	E <= i(4);
	F <= i(5);
	G <= i(6);
	
	o <= T(0) or T(1) or T(2) or T(3) or T(4) or T(5) or T(6) or T(7) or T(8) or T(9) or T(10) or T(11) or T(12) or T(13) or T(14) or T(15) or T(16) or T(17) or T(18) or T(19);
	
	T(0) <= A and not B and C and not D and not E and not F and not G;
	T(1) <= not A and B and not C and D and not E and not F and not G;
	T(2) <= A and B and C and D and not E and not F and not G;
	T(3) <= not A and not B and C and not D and E and not F and not G;
	T(4) <= A and not B and not C and D and E and not F and not G;
	T(5) <= not A and B and C and D and E and not F and not G;
	T(6) <= A and B and not C and not D and not E and F and not G;
	T(7) <= not A and not B and not C and D and not E and F;
	T(8) <= A and not B and C and D and not E and F;
	T(9) <= not A and B and not C and not D and E and F;
	T(10) <= A and B and C and not D and E and F;
	T(11) <= not A and not B and C and D and E and F;
	T(12) <= A and not B and not C and not D and not E and not F and G;
	T(13) <= not A and B and C and not D and not E and G;
	T(14) <= A and B and not C and D and not E and G;
	T(15) <= not A and not B and not C and not D and E and G;
	T(16) <= A and not B and C and not D and E and G;
	T(17) <= not A and B and not C and D and E and G;
	T(18) <= A and B and C and D and E and G;
	T(19) <= C and F and G;
	
end behav;
