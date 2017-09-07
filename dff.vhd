library ieee;
use ieee.std_logic_1164.all;


entity dff is
port(	d: in std_logic;
		clk: in std_logic;
		rst: in std_logic;
		
		q: out std_logic
);
end dff;

architecture behav of dff is
begin
	process (clk) is
	begin
		if rising_edge(clk) then
			q <= d and rst;
		end if;
	end process;
end behav;
