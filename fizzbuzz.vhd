library ieee;
use ieee.std_logic_1164.all;

entity fizzbuzz is
	port(	clk: in std_logic;
			rst: in std_logic;
			
			fizz: out std_logic;
			buzz: out std_logic;
			num: out std_logic;
			number: out std_logic_vector(7 downto 0)
	);
end fizzbuzz;

architecture behav of fizzbuzz is
	
	component counter8
	port( clk, rst: in std_logic; q: out std_logic_vector(7 downto 0));
	end component;
	
	component fizzer
	port( i: in std_logic_vector(7 downto 0); o: out std_logic);
	end component;
	
	component buzzer
	port( i: in std_logic_vector(7 downto 0); o: out std_logic);
	end component;
	
	component mux2
	port( a, b, s: in std_logic; q: out std_logic);
	end component;
	
	component mux8
	port( a, b: in std_logic_vector(7 downto 0); s: in std_logic; y: out std_logic_vector(7 downto 0));
	end component;
	
	component dff
	port( d, clk, rst: in std_logic; q: out std_logic);
	end component;
	
	component comparator8
	port(a, b: in std_logic_vector(7 downto 0); o: out std_logic);
	end component;
	
	signal count: std_logic_vector(7 downto 0);
	signal fizzout, buzzout: std_logic;
	signal ishundred: std_logic;
	signal disabled: std_logic;
	signal dffin: std_logic;
	signal numsig: std_logic;
	signal fizzsig: std_logic;
	signal buzzsig: std_logic;
	
begin
	
	dffin <= disabled or ishundred;
	numsig <=  not (fizzsig or buzzsig or disabled);
	num <= numsig;
	fizz <= fizzsig;
	buzz <= buzzsig;
	
	disabler: dff port map(dffin, clk, rst, disabled);
	cntr: counter8 port map(clk, rst, count);
	fizzer_0: fizzer port map(count, fizzout);
	buzzer_0: buzzer port map(count, buzzout);
	numblanker: mux8 port map("00000000", count, numsig, number);
	fizzmux: mux2 port map(fizzout, '0', disabled, fizzsig);
	buzzmux: mux2 port map(buzzout, '0', disabled, buzzsig);
	comp: comparator8 port map(count, "01100100", ishundred);
	
end behav;
	