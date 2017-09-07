library ieee;
use ieee.std_logic_1164.all;

entity adder8_tb is
end adder8_tb;

architecture behav of adder8_tb is
	
	component adder8
		port(	a, b: in std_logic_vector(7 downto 0); cin: in std_logic;
			 	s: out std_logic_vector(7 downto 0); cout: out std_logic);
 	end component;
 	
 	signal a, b, s: std_logic_vector(7 downto 0);
 	signal cin, cout: std_logic;
 	
 begin
 	
 	uut: adder8 port map(a, b, cin, s, cout);
 	
 	process
 	begin
 		
 		a <= "01010101";
 		b <= "00001111";
 		cin <= '0';
 		wait for 1 ns;
 		
 		a <= "11110000";
 		b <= "00001111";
 		cin <= '1';
 		wait for 1 ns;
 		
 		a <= "00110000";
 		b <= "10000110";
 		cin <= '0';
 		wait for 1 ns;
 		
 		a <= "00000001";
 		b <= "00000001";
 		cin <= '1';
 		wait for 1 ns;
 		
 		a <= "11111111";
 		b <= "00000100";
 		cin <= '1';
 		wait for 1 ns;
 		
 		a <= "11111111";
 		b <= "00000101";
 		cin <= '0';
 		wait for 1 ns;
 		
 		assert false report "end of test" severity failure;
 		
 	end process;
end behav; 