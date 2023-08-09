library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use std.textio.all;

entity testbench is
end entity;

architecture tb of testbench is

component brent_kung_adder is
port (A, B: in std_logic_vector(31 downto 0);
cin : in std_logic;
sum : out std_logic_vector(31 downto 0);
Cout: out std_logic);
end component;

signal tb_a, tb_b : std_logic_vector(31 downto 0);
signal tb_cin : std_logic;
signal tb_cout : std_logic;
signal tb_s : std_logic_vector(31 downto 0);

begin

f1 : brent_kung_adder port map(tb_a, tb_b, tb_cin, tb_s, tb_cout);

process
file text_tb : text open read_mode is "C:\Users\Raginee\Downloads\test_data.txt";
variable text_line : line;
variable x, y, z : std_logic_vector(31 downto 0);
variable a, b : std_logic;
variable ok : boolean;

begin

while not endfile(text_tb) loop
readline(text_tb, text_line);

if text_line.all'length = 0 or text_line.all(1) = '#' then
next;
end if;

read(text_line, x, ok);
tb_a <= x;

read(text_line, y, ok);
tb_b <= y;

read(text_line, a, ok);
tb_cin <= a;

read(text_line, z, ok);
read(text_line, b, ok);

wait for 1000ns;
assert(tb_s = z) report "Mismatch" severity failure;
assert(tb_cout = b) report "Mismatch" severity failure;

end loop;

report "Successfully checked all values" severity note;
wait;
end process;
end architecture;