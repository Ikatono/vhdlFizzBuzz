library ieee;
use ieee.std_logic_1164.all;

entity fizzer is
port(	i: in std_logic_vector(7 downto 0);
		o: out std_logic
);
end fizzer;

--reduced with Quine-McCluskey
--inputs outside 1-100 are don't-cares
architecture behav of fizzer is
	signal A, B, C, D, E, F, G: std_logic;
	signal T: std_logic_vector(32 downto 0);
begin
	A <= i(0);
	B <= i(1);
	C <= i(2);
	D <= i(3);
	E <= i(4);
	F <= i(5);
	G <= i(6);
	
	o <= T(0) or T(1) or T(2) or T(3) or T(4) or T(5) or T(6) or T(7) or T(8) or T(9) or T(10) or T(11) or T(12) or T(13) or T(14) or T(15) or T(16) or T(17) or T(18) or T(19) or T(20) or T(21) or T(22) or T(23) or T(24) or T(25) or T(26) or T(27) or T(28) or T(29) or T(30) or T(31) or T(32);
	
	T(0) <= A  and B and not C and not D and not E and not F and not G;
	T(1) <= not A  and B and C and not D and not E and not F and not G;
	T(2) <= A  and not B and not C and D and not E and not F and not G;
	T(3) <= not A  and not B and C and D and not E and not F and not G;
	T(4) <= A  and B and C and D and not E and not F and not G;
	T(5) <= not A  and B and not C and not D and E and not F and not G;
	T(6) <= A  and not B and C and not D and E and not F and not G;
	T(7) <= not A  and not B and not C and D and E and not F and not G;
	T(8) <= A  and B and not C and D and E and not F and not G;
	T(9) <= not A  and B and C and D and E and not F and not G;
	T(10) <= A  and not B and not C and not D and not E and F and not G;
	T(11) <= not A  and not B and C and not D and not E and F and not G;
	T(12) <= A  and B and C and not D and not E and F;
	T(13) <= not A  and B and not C and D and not E and F;
	T(14) <= A  and not B and C and D and not E and F;
	T(15) <= not A  and not B and not C and not D and E and F;
	T(16) <= A  and B and not C and not D and E and F;
	T(17) <= not A  and B and C and not D and E and F;
	T(18) <= A  and not B and not C and D and E and F;
	T(19) <= not A  and not B and C and D and E and F;
	T(20) <= A  and B and C and D and E and F;
	T(21) <= not A  and B and not C and not D and not E and not F and G;
	T(22) <= A  and not B and C and not D and not E and G;
	T(23) <= not A  and not B and not C and D and not E and G;
	T(24) <= A  and B and not C and D and not E and G;
	T(25) <= not A  and B and C and D and not E and G;
	T(26) <= A  and not B and not C and not D and E and G;
	T(27) <= not A  and not B and C and not D and E and G;
	T(28) <= A  and B and C and not D and E and G;
	T(29) <= not A  and B and not C and D and E and G;
	T(30) <= A  and not B and C and D and E and G;
	T(31) <= not A  and not B and not C and F and G;
	T(32) <= A  and B and F and G;
	
end behav;
